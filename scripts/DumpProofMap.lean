import Lean

/-!
Export a declaration-level dependency graph for the interactive proof map.

The compiled Lean environment is authoritative for declarations, modules,
direct constant references, and uses of `sorryAx`.  The exporter deliberately
separates references appearing in a declaration's type from references in its
value/proof term so the UI can distinguish statement dependencies from proof
dependencies.

Run from the repository root after building `LRA`:

    lake env lean --run scripts/DumpProofMap.lean

The default output is `build/proof-map.json`.  Pass `--output PATH` to choose a
different destination.
-/

open Lean

private structure Candidate where
  name : Name
  moduleName : Name
  info : ConstantInfo
  ordinal : Nat

private def isNumberedAuxiliary (value : String) : Bool :=
  let prefixes := ["eq_", "eqn_", "match_", "proof_", "below_", "unfold_"]
  prefixes.any fun item =>
    item.isPrefixOf value && !(value.drop item.length).isEmpty &&
      (value.drop item.length).all fun char => char.isDigit || char == '_'

private def generatedTailBlocklist : List String := [
  "injEq", "inj", "sizeOf_spec", "noConfusion", "noConfusionType",
  "below", "brecOn", "ndrec", "rec", "recOn", "casesOn", "below_1",
  "eq", "eq_def", "congr_simp", "ofNat_ctorIdx"
]

private def hasGeneratedTail (name : Name) : Bool :=
  match name with
  | .str _ tail =>
      generatedTailBlocklist.contains tail || tail.startsWith "_" ||
        isNumberedAuxiliary tail
  | _ => false

private def isGenerated (env : Environment) (name : Name) : Bool :=
  isPrivateName name || (env.getProjectionFnInfo? name).isSome ||
    hasGeneratedTail name || "_private".isPrefixOf name.toString

private def declarationKind? : ConstantInfo → Option String
  | .axiomInfo _ => some "axiom"
  | .defnInfo _ => some "definition"
  | .thmInfo _ => some "theorem"
  | .opaqueInfo _ => some "opaque"
  | .inductInfo _ => some "inductive"
  | .quotInfo _ => some "quotient"
  | .ctorInfo _ | .recInfo _ => none

private def usesSorry (info : ConstantInfo) : Bool :=
  match info.value? (allowOpaque := true) with
  | some value => (value.find? fun sub => sub.isConstOf `sorryAx).isSome
  | none => false

private def sourcePath (moduleName : Name) : String :=
  moduleName.toString.replace "." "/" ++ ".lean"

private def shortDoc (value : String) : String :=
  let clean := String.Slice.toString (((value.replace "\r" " ").replace "\n" " ").trimAscii)
  if clean.length <= 360 then clean
  else String.Slice.toString (clean.take 357) ++ "..."

private def dependencyArray
    (known : NameSet) (self : Name) (dependencies : NameSet) : Json := Id.run do
  let mut values : Array Json := #[]
  for dependency in dependencies do
    if dependency != self && known.contains dependency then
      values := values.push (toJson dependency.toString)
  return .arr values

private def candidateJson (env : Environment) (known : NameSet)
    (candidate : Candidate) : IO Json := do
  let typeDependencies := candidate.info.type.getUsedConstantsAsSet
  let valueDependencies := match candidate.info.value? (allowOpaque := true) with
    | some value => value.getUsedConstantsAsSet
    | none => {}
  let doc := (← findDocString? env candidate.name).map shortDoc |>.getD ""
  pure <| Json.mkObj [
    ("id", toJson candidate.name.toString),
    ("module", toJson candidate.moduleName.toString),
    ("source", toJson (sourcePath candidate.moduleName)),
    ("kind", toJson (declarationKind? candidate.info).get!),
    ("status", toJson (if usesSorry candidate.info then "pending" else "checked")),
    ("ordinal", toJson candidate.ordinal),
    ("doc", toJson doc),
    ("statementDependencies", dependencyArray known candidate.name typeDependencies),
    ("proofDependencies", dependencyArray known candidate.name valueDependencies)
  ]

private partial def parseOutputPath : List String → Option System.FilePath
  | [] => none
  | "--output" :: value :: _ => some value
  | _ :: rest => parseOutputPath rest

unsafe def main (args : List String) : IO Unit := do
  let outputPath := (parseOutputPath args).getD "build/proof-map.json"
  let env ← importModules #[{ module := `LRA }] {} (trustLevel := 0)
  let mut candidates : Array Candidate := #[]
  let mut known : NameSet := {}

  for h : moduleIndex in *...env.header.moduleNames.size do
    let moduleName := env.header.moduleNames[moduleIndex]
    let renderedModule := moduleName.toString
    if !(renderedModule == "LRA" || renderedModule.startsWith "LRA.") then
      continue
    let moduleData := env.header.moduleData[moduleIndex]!
    let mut ordinal := 0
    for h : constantIndex in *...moduleData.constNames.size do
      let name := moduleData.constNames[constantIndex]!
      let info := moduleData.constants[constantIndex]!
      if isGenerated env name || (declarationKind? info).isNone then
        continue
      candidates := candidates.push { name, moduleName, info, ordinal }
      known := known.insert name
      ordinal := ordinal + 1

  let mut nodes : Array Json := #[]
  let mut checkedCount := 0
  let mut pendingCount := 0
  let mut dependencyCount := 0
  for candidate in candidates do
    let node ← candidateJson env known candidate
    nodes := nodes.push node
    if usesSorry candidate.info then
      pendingCount := pendingCount + 1
    else
      checkedCount := checkedCount + 1
    for dependency in candidate.info.getUsedConstantsAsSet do
      if dependency != candidate.name && known.contains dependency then
        dependencyCount := dependencyCount + 1

  let document := Json.mkObj [
    ("schemaVersion", toJson 1),
    ("generator", toJson "scripts/DumpProofMap.lean"),
    ("summary", Json.mkObj [
      ("declarations", toJson nodes.size),
      ("dependencies", toJson dependencyCount),
      ("checked", toJson checkedCount),
      ("pending", toJson pendingCount)
    ]),
    ("nodes", .arr nodes)
  ]
  IO.FS.createDirAll (outputPath.parent.getD ".")
  IO.FS.writeFile outputPath (document.pretty ++ "\n")
  IO.println s!"wrote {nodes.size} declarations and {dependencyCount} dependencies to {outputPath}"

