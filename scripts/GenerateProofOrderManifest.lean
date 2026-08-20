import Lean

open Lean Lean.Meta

/-!
Phase 1 of the `ProofOrder.md` coverage audit
(`subject-architecture-prompt.md` §5.1). Walks the compiled `LRA`
environment -- the same `importModules`/`env.header.moduleData` traversal
`DumpNamespaceEnvironment.lean` already uses for the namespace inventory --
and, for every theorem/lemma owned by a tracked subject, records its name,
module, delaborated statement, `sorry`-status, and same-subject
dependencies. Phase 2 (the per-subject `ProofOrder.md` authoring pass)
treats this manifest as ground truth: it must not re-derive sorry-status or
dependencies from source.

Run after `lake build`:

    lake env lean --run scripts/GenerateProofOrderManifest.lean

Writes `build/proof-order-manifest.json`, a JSON object keyed by subject
name, each value an array of theorem records:

    { "name": ..., "module": ..., "statement": ...,
      "status": "COMPLETE" | "PENDING", "dependencies": [...] }

Unverified against the pinned toolchain: no Lean toolchain is available in
the environment this was authored in (see the ProofOrder-coverage-audit
task notes). The constant-walking half mirrors `DumpNamespaceEnvironment.lean`
verbatim in shape and should compile as-is; `runMeta`, `collectAxioms`'s
return type, and `Expr.getUsedConstants`'s exact name are the spots most
likely to need a fixup against the pinned `leanprover/lean4` release -- if
`lake build` reports a mismatch, it should be isolated to one of those
three definitions.
-/

/-- Map a fully-qualified module name to the subject that owns it, per
`subject-architecture-prompt.md` §1.1/§5.1. `NumberSystems` buckets one
level deeper, by system, matching that section's "owns one per system"
rule. `none` for anything outside a tracked subject: Volume aggregators
(presentation order, not ownership), `Interop`/`Pilot` (excluded from this
audit by explicit task scope), and `Internal` (non-API scratch material). -/
def ownerSubject (moduleName : Name) : Option String :=
  match moduleName.components.map Name.toString with
  | "LRA" :: "NumberSystems" :: system :: _ => some s!"NumberSystems/{system}"
  | "LRA" :: subject :: _ =>
    if subject.startsWith "Volume" || subject == "Interop" || subject == "Pilot"
        || subject == "Internal" then
      none
    else
      some subject
  | _ => none

/-- Run a `MetaM` computation against a plain `Environment`, outside any
elaboration context. Isolated here since it is the one piece of monad-
transformer plumbing this file needs that cannot be checked against the
`DumpNamespaceEnvironment.lean` precedent (that file never enters `MetaM`). -/
def runMeta (env : Environment) (x : MetaM α) : IO (Option α) := do
  let coreCtx : Core.Context := { fileName := "GenerateProofOrderManifest", fileMap := default }
  let coreState : Core.State := { env := env }
  match ← (x.run' {} {}).toIO' coreCtx coreState with
  | .ok a => pure (some a)
  | .error _ => pure none

/-- Whether `type`, after telescoping its leading `∀`-binders, has a `Prop`-
sorted conclusion -- the "is this actually asserting something" test from
the task spec, applied to any `def`/`abbrev` (theorems are always kept
regardless of this check). -/
def isPropStatement (env : Environment) (type : Expr) : IO Bool := do
  let result ← runMeta env (forallTelescopeReducing type fun _ concl => Meta.isProp concl)
  return result.getD false

/-- The delaborated, notation-resolved rendering of `type` -- "pretty-printed
via Lean's own delaborator", per the task spec, not a raw `Expr.toString`. -/
def delaboratedType (env : Environment) (type : Expr) : IO String := do
  let result ← runMeta env (do
    let fmt ← Meta.ppExpr type
    return fmt.pretty)
  return result.getD (toString type)

/-- `COMPLETE` unless the declaration's axiom closure includes `sorryAx`
(what a `sorry` placeholder compiles to) -- ground truth for the ledger's
status line, not inferred from doc comments or a textual scan for the word
`sorry` (a proof discharged through a `sorry`-containing helper elsewhere in
the same subject must show `PENDING` here exactly as it would from
`#print axioms`). Other standard axioms (`propext`, `Classical.choice`,
`Quot.sound`) are legitimate and do not mark a proof pending -- this repo
explicitly permits `Classical.choice` where a theorem documents that it
needs Choice. -/
def sorryStatus (env : Environment) (name : Name) : IO String := do
  let axioms ← collectAxioms env name
  return if axioms.contains `sorryAx then "PENDING" else "COMPLETE"

structure TheoremRecord where
  name : String
  module : String
  statement : String
  status : String
  dependencies : Array String
deriving Inhabited

def TheoremRecord.toJson (r : TheoremRecord) : Json :=
  Json.mkObj [
    ("name", Json.str r.name),
    ("module", Json.str r.module),
    ("statement", Json.str r.statement),
    ("status", Json.str r.status),
    ("dependencies", Json.arr (r.dependencies.map Json.str))
  ]

/-- Every constant name mentioned in `type` and (when present) `value`,
deduplicated. Dependency extraction reads both, per the task spec ("as
`Expr.const` references in its type or proof term"). -/
def usedConstants (info : ConstantInfo) : Array Name :=
  let fromType := info.type.getUsedConstants
  let fromValue := match info.value? with
    | some value => value.getUsedConstants
    | none => #[]
  (fromType ++ fromValue).foldl (init := (∅ : Std.HashSet Name)) (·.insert ·) |>.toArray

unsafe def main : IO Unit := do
  let env ← importModules #[{ module := `LRA }] {} (trustLevel := 0)

  -- Pass 1: index every constant's defining module, so a dependency's
  -- subject is resolved from *its own* module (per spec), not guessed from
  -- its namespace prefix (which can diverge from module path).
  let mut nameToModule : Std.HashMap Name Name := {}
  for h : moduleIndex in *...env.header.moduleNames.size do
    let moduleName := env.header.moduleNames[moduleIndex]
    let moduleData := env.header.moduleData[moduleIndex]!
    for h : constantIndex in *...moduleData.constNames.size do
      nameToModule := nameToModule.insert moduleData.constNames[constantIndex] moduleName

  -- Pass 2: filter to theorem/lemma (and Prop-valued def) declarations
  -- owned by a tracked subject, and build each one's record.
  let mut bySubject : Std.HashMap String (Array TheoremRecord) := {}
  for h : moduleIndex in *...env.header.moduleNames.size do
    let moduleName := env.header.moduleNames[moduleIndex]
    let some subject := ownerSubject moduleName | continue
    let moduleData := env.header.moduleData[moduleIndex]!
    for h : constantIndex in *...moduleData.constNames.size do
      let name := moduleData.constNames[constantIndex]
      let info := moduleData.constants[constantIndex]!
      if isPrivateName name then continue
      let keep ← match info with
        | .thmInfo _ => pure true
        | .defnInfo _ => isPropStatement env info.type
        | _ => pure false
      if !keep then continue
      let statement ← delaboratedType env info.type
      let status ← sorryStatus env name
      let dependencies := (usedConstants info).filterMap fun dep =>
        if dep == name then none
        else
          match nameToModule[dep]? with
          | some depModule => if ownerSubject depModule == some subject then some dep.toString else none
          | none => none
      let record : TheoremRecord := {
        name := name.toString, module := moduleName.toString,
        statement := statement, status := status,
        dependencies := dependencies.qsort (· < ·)
      }
      bySubject := bySubject.insert subject ((bySubject.getD subject #[]).push record)

  let obj := Json.mkObj (bySubject.toList.map fun (subject, records) =>
    (subject, Json.arr (records.map TheoremRecord.toJson)))
  IO.FS.createDirAll "build"
  IO.FS.writeFile "build/proof-order-manifest.json" obj.pretty
  IO.println s!"wrote build/proof-order-manifest.json ({bySubject.size} subjects)"
