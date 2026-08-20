import Lean

/-!
Dump every compiled `theorem`/`lemma`-kind declaration under `LRA`, plus
every `Prop`-valued `instance` declaration (the repository's "laws" pattern:
`instance : AdditiveIdentityLaws R := ⟨…⟩` is a proof obligation exactly
like a `theorem`, just spelled with the `instance` keyword so it also
participates in typeclass search), to a TSV for
`scripts/generate_proofs_todo.py` to turn into per-folder `ProofsToDo.md`
checklists.

A **`kind`** column (`theorem` or `instance`) distinguishes the two on each
row, since `generate_proofs_todo.py`'s source scanner looks for different
keywords (and an anonymous `instance : C ... := …` has no name in source at
all — the Lean compiler synthesizes one — so it can never be matched to a
source declaration by name the way a `theorem`/`lemma` is; it still ends up
in the output, just placed at the end of its module's block, the same
fallback path already used for any TSV row source-scanning can't match).

This mirrors `scripts/DumpNamespaceEnvironment.lean`: import the whole `LRA`
aggregate, walk the compiled environment module-by-module, and treat the
compiled environment as ground truth rather than re-deriving anything from
source text. Four things only Lean can answer authoritatively are extracted
here, one column each:

* **`uses_sorry`** — a theorem is `Sorry` iff its compiled proof term
  contains an application of `sorryAx`, however deeply it is buried inside
  the tactic block. This cannot be spoofed by the word "sorry" appearing in
  a comment or string, unlike a naive text grep.
* **`pretty_type_uncurried`** — the theorem's type, with chained hypotheses
  uncurried into a single conjunction (`A → B → C` becomes `(A ∧ B) → C`)
  and then pretty-printed by Lean's own delaborator-based printer
  (`PrettyPrinter.ppExpr`, the same one behind `#check`/error-message
  output), so implicit arguments are resolved and notation (`∀`, `∃`, `∈`,
  `↔`, `∧`, `=`, `+`, `⊆`, …) renders exactly as Lean itself would display
  it. This is the "High-Level FOL" reading: symbolic, but custom predicates
  (like `BddAbove`) keep their names rather than being expanded. (A first
  real run used `Meta.ppExpr` here instead, which turned out to print `∀`
  and `∃` correctly — they are core binder forms, not notation — but left
  `And`/`Eq`/`Iff`/`Not` and every typeclass-based operator as raw function
  application (`Eq a b` instead of `a = b`); `PrettyPrinter.ppExpr` is the
  fix, see the confidence note below.)
* **`pretty_type_unfolded`** — the same, but with a curated allow-list of
  custom definitions (`unfoldAllowList` below) recursively delta-unfolded
  first, so e.g. `BddAbove S` becomes its actual `∃ M, ∀ x, x ∈ S → x ≤ M`
  body. Anything *not* on the allow-list (`Eq`, order relations,
  arithmetic, typeclass instances, …) is left alone on purpose — unfolding
  everything walks straight into primitive-recursor noise, not insight.
* **`unfold_status`** — `ok`, `error:<message>`, or empty (uncurry itself
  failed, unfold was never attempted). A visible signal for which rows to
  double check, since a definition missing from the allow-list fails
  *silently* into "left alone" rather than erroring, by design.

Before any of that, `isGenerated` filters out declarations Lean's own
compiler synthesized rather than the user: structure/class field
projections (`env.getProjectionFnInfo?`, catching `Prop`-valued "laws"
fields and `extends`-projections) and companion lemmas whose tail name is
on `generatedTailBlocklist` (`injEq`, `sizeOf_spec`, …). Without this, a
first real run against this repository found roughly 36% of dumped
`.thmInfo` declarations were this kind of noise, never matched by
`generate_proofs_todo.py`'s source scan and so dumped, unhelpfully, at the
end of every folder's `ProofsToDo.md` as an "unmatched" entry.

Everything else (source line numbers for in-file ordering, the intra-folder
import graph for module ordering, the raw declaration signature, and folder
scoping/exclusion) is derived from source text downstream in
`generate_proofs_todo.py`, which does not require a Lean toolchain to run
or to test.

Run from the repository root:

    lake env lean --run scripts/DumpProofsToDo.lean

Writes `build/proofs-todo-environment.tsv`.

## A note on confidence

Unlike the rest of this repository's tooling, none of this file has been
compile-tested by the assistant that wrote it — there was no `lake`/`lean`
toolchain reachable from that sandbox. Confidence is not uniform across the
file:

* `usesSorry`, `prettyType`, and the main dump loop are a close variant of
  `scripts/DumpNamespaceEnvironment.lean`, which already builds and runs in
  this repository — highest confidence.
* `uncurryHypotheses` was checked by hand against Lean's de Bruijn-index
  semantics (see its doc comment) and is believed correct, but every API
  name it calls (`withLocalDecl`, `mkForallFVars`, `mkAppM`, …) is still
  unverified by a compiler.
* `unfoldAllowed` is the highest-risk piece: a hand-written recursive
  `Expr` visitor, because `Lean.Meta.transform`'s exact signature was not
  recalled with enough confidence to use blind. If this file fails to
  compile, this is the first place to look; everything above it (uncurry,
  sorry-detection, plain pretty-printing) is more likely to be fine.
* `isGenerated` (`env.getProjectionFnInfo?`, the tail-name blocklist, the
  leading-underscore check, `isNumberedAuxiliary`, the `_private` prefix
  check) is low risk: `getProjectionFnInfo?` is already proven in
  `scripts/DumpNamespaceEnvironment.lean`, and the rest is plain
  `Name`/`String` matching with no unverified `Meta`/`Core` API calls.
* `Meta.ppExpr` is used for rendering with ordinary display options enabled.
  In this standalone runner, Lean may still expose some elaborated constants
  such as `Eq`, `And`, and `instHAdd.hAdd`; the source-side generator keeps
  the declaration signature separately for cases where exact surface syntax
  matters.
* `classifyDefn` intentionally uses `Meta.isProp` only. Lean's own
  `Meta.isInstance` asks whether a declaration is currently available to
  typeclass search; it is not a robust authored-`instance` detector for
  scoped instances or auxiliary declarations. In this repository, the only
  non-generated `Prop`-valued `.defnInfo` declarations under `LRA` are the
  "instance law" proof obligations this dump wants.
-/

open Lean

/-- Replace characters that would break TSV rows or line-oriented parsing. -/
private def clean (value : String) : String :=
  ((value.replace "\t" " ").replace "\r" " ").replace "\n" " "

/-- Does `e` contain a use of `sorryAx`, at any depth? -/
private def usesSorry (e : Expr) : Bool :=
  (e.find? fun sub => sub.isConstOf `sorryAx).isSome

/--
Recursively uncurries chained non-dependent implications into a single
conjunction of hypotheses: `A → B → C` becomes `(A ∧ B) → C`.

A hypothesis that a *later* hypothesis's type genuinely depends on (e.g.
`(h1 : P) (h2 : Q h1)`, rare but expressible in dependent type theory) is
deliberately left as a real dependent arrow rather than folded into `∧`,
because plain `And` cannot express that dependency; only a true `∀`/`Σ`
can. This is what `b.hasLooseBVars` distinguishes below: once every
*dependent* outer binder has already been opened via `withLocalDecl` and
substituted via `instantiate1`, everything left outside the current
non-dependent arrow chain is expressed with free variables, not de Bruijn
indices, so `collectPremises` can pull pieces out of the chain and hand
them to `mkAndChain`/`mkArrow` without any index-shifting bookkeeping — the
indices that would need shifting have already been eliminated by that
point.
-/
private partial def uncurryHypotheses (e : Expr) : MetaM Expr := do
  match e with
  | .forallE n d b bi =>
    if b.hasLooseBVars then
      Meta.withLocalDecl n bi d fun fvar => do
        let body' ← uncurryHypotheses (b.instantiate1 fvar)
        Meta.mkForallFVars #[fvar] body'
    else
      let (premises, conclusion) := collectPremises e
      let conclusion' ← uncurryHypotheses conclusion
      if premises.isEmpty then
        pure conclusion'
      else
        let combined ← mkAndChain premises
        -- `combined → conclusion'`, built directly rather than via a named
        -- `mkArrow` helper: two wrong guesses at that name (`mkArrow`,
        -- `Meta.mkArrow`) is enough guessing. A non-dependent arrow is
        -- exactly `.forallE _ combined conclusion' .default` with an
        -- anonymous, unused binder -- no helper needed, and `.forallE` is
        -- already proven to work in this file via the pattern matches
        -- elsewhere.
        pure (.forallE .anonymous combined conclusion' .default)
  | _ => pure e
where
  /-- Peels off a maximal run of *non-dependent* leading arrows from `expr`,
  returning their domains (the premises) and whatever is left (the
  conclusion — which may itself be a further, genuinely dependent `∀`, or
  another arrow chain if `expr` was not already a maximal run, though
  `uncurryHypotheses` only ever calls this at the start of one). Pure: no
  metavariable creation is needed just to walk the tree and read off `d`. -/
  collectPremises (expr : Expr) : List Expr × Expr :=
    match expr with
    | .forallE _ d b _ =>
      if !b.hasLooseBVars then
        let (rest, conclusion) := collectPremises b
        (d :: rest, conclusion)
      else
        ([], expr)
    | _ => ([], expr)
  mkAndChain : List Expr → MetaM Expr
    | [] => pure (mkConst ``True)
    | [p] => pure p
    | p :: ps => do
      let rest ← mkAndChain ps
      Meta.mkAppM ``And #[p, rest]

/--
Custom definitions this repository is comfortable expanding into their raw
`∀ ∃ ∧ ∨ ¬ =` form for the "Raw / Unfolded" predicate-logic column.
Deliberately small and specific to the pedagogically load-bearing
predicates in each subject rather than exhaustive — expanding *everything*
eventually walks down into `Eq`, `LE.le`, numeric literals, and typeclass
machinery, which is noise, not insight. Grow this list name by name as
particular theorems would benefit, rather than widening the rule that
drives it (see `unfoldAllowed`'s doc comment for why "unfold everything" is
not just unnecessary but actively worse).

Seeded here with the `LRA.Order.Bounds.*` vocabulary visible from
`LRA/Order/Bounds.lean`'s own import list; extend for other subjects as you
use this on them.
-/
def unfoldAllowList : List Name := [
  `LRA.Order.UpperBound, `LRA.Order.LowerBound,
  `LRA.Order.BoundedAbove, `LRA.Order.BoundedBelow, `LRA.Order.Bounded,
  `LRA.Order.Supremum, `LRA.Order.Infimum,
  `LRA.Order.GreatestElement, `LRA.Order.LeastElement,
  `LRA.Order.MaximalElement, `LRA.Order.MinimalElement,
  `LRA.Order.TopElement, `LRA.Order.BottomElement,
  `LRA.Order.LeastUpperBoundProperty, `LRA.Order.GreatestLowerBoundProperty
]

private def isAllowedToUnfold (n : Name) : Bool :=
  unfoldAllowList.contains n

/--
True iff `s` is `<prefix><digits>` for one of Lean's own numbered
auxiliary-declaration prefixes — `eq_1`, `eq_2`, … (equation lemmas
auto-generated for every pattern-matching `def`, confirmed by a real run
against this repository: 157 of them, e.g.
`LRA.Logic.Propositional.evaluate.eq_1`), `match_1`, `below_1`, and
similar. These are `.thmInfo` declarations (equation lemmas state an `Eq`,
so they compile as theorems, not defs) that `generatedTailBlocklist`'s
*exact*-match list cannot catch, since the numeric suffix is unbounded.
-/
private def isNumberedAuxiliary (s : String) : Bool :=
  let prefixes := ["eq_", "eqn_", "match_", "proof_", "below_", "unfold_"]
  prefixes.any fun p =>
    p.isPrefixOf s && !(s.drop p.length).isEmpty &&
      (s.drop p.length).all fun c => c.isDigit || c == '_'

/--
Exact-match blocklist of tail (last-component) names that Lean's own
compiler generates as plumbing alongside every `structure`/`inductive`,
never as something a user proves by hand: injectivity/no-confusion lemmas,
`sizeOf` bookkeeping, and the recursor family. Checked against ONLY the
final dot-separated component of a declaration's name (e.g. `injEq` out of
`LRA.Logic.ArityIndexedSymbols.mk.injEq`), not a substring match against
the full name, so a genuine user theorem that happens to end its namespace
path in one of these words is never at risk — only an exact tail match is
excluded.
-/
def generatedTailBlocklist : List String := [
  "injEq", "inj", "sizeOf_spec", "noConfusion", "noConfusionType",
  "below", "brecOn", "ndrec", "rec", "recOn", "casesOn", "below_1",
  "eq", "eq_def", "congr_simp", "ofNat_ctorIdx"
]

/--
Lean's own naming convention marks an internal, compiler-synthesized
declaration with a leading underscore on its final component -- `_proof_1`,
`_proof_2`, … (anonymous proof terms hoisted out of a structure instance's
inline field values, confirmed by a real run against this repository: e.g.
`LRA/AlgebraicStructures/OrderedRing/Interface/ModelTheory/Model.lean`
compiles several of these), `_example`, `_eqn_1`, and similar. No
user-authored `theorem`/`lemma`/`instance` in this repository's own style
starts a name with `_`, so this is a safe, general companion to the exact
`generatedTailBlocklist` match above rather than a risk of excluding real
work.
-/
private def hasGeneratedTail (n : Name) : Bool :=
  match n with
  | .str _ last =>
    generatedTailBlocklist.contains last || last.startsWith "_" || isNumberedAuxiliary last
  | _ => false

/--
True iff `name` is a declaration Lean's compiler synthesized as plumbing
rather than something the user wrote and proves by hand: (a) a
structure/class field-projection function (`env.getProjectionFnInfo?` is
the same proven API `scripts/DumpNamespaceEnvironment.lean` already uses
for this exact purpose in this repository), which catches `Prop`-valued
`class`/`class abbrev` "laws" fields and `extends`-projections
(`toAdditiveSemigroupLaws`, `AddZero`, …); (b) a companion lemma whose tail
name is on `generatedTailBlocklist` or matches `isNumberedAuxiliary`
(`injEq`, `sizeOf_spec`, `eq_1`, …); or (c) anything under the `_private`
root namespace, Lean's own well-established, name-mangling convention for
hygiene-generated wrappers around `match`/`let rec`/anonymous internal
definitions (confirmed by a real run against this repository, e.g.
`_private.LRA.Logic.Syntax.Propositional.Formula.0.LRA.Logic.Propositional.evaluate.match_1.eq_3`)
— a plain, purely string-based check with no `Meta`/`Core` API risk at all.
-/
private def isGenerated (env : Environment) (name : Name) : Bool :=
  (env.getProjectionFnInfo? name).isSome || hasGeneratedTail name ||
    "_private".isPrefixOf name.toString

/--
Classifies one `.defnInfo` declaration (`name`, with declared `type`)
independently along two axes, each reported as `some true`/`some false`, or
`none` if the underlying API call itself threw. The two checks are
deliberately kept independent (neither gates the other) rather than
composed into one boolean, after a first real run against this repository
gated `Meta.isProp` behind `Meta.isInstance` and got a suspicious "zero
instances found out of 2343 `.defnInfo` declarations, zero errors either
way" — meaning `Meta.isInstance` was confidently, silently wrong about
*something* (either its name/semantics were misremembered, or this
particular query against a freshly-`importModules`-loaded environment
doesn't see the instance-attribute extension the way elaboration-time code
does), with no way to tell why from a single collapsed boolean. Reporting
both independently, and capturing a row whenever `isProp` alone says
`true` (see `main`), decouples "is this worth a `ProofsToDo.md` entry" —
which only needs `Prop`-valued, i.e. `Meta.isProp` — from "is this
registered for typeclass search" — which is what `Meta.isInstance` (if it
is even doing what its name suggests) actually answers, and which this
repository's own convention of proving "laws" *only* via `instance`
declarations (never a bare `Prop`-valued `def`) makes redundant here in
practice: a `Prop`-valued `.defnInfo` under `LRA` is, by this repository's
own convention, an `instance` law, whether or not `Meta.isInstance` agrees.
-/
private def classifyDefn (env : Environment) (type : Expr) : IO (Option Bool) := do
  let ctx : Core.Context := { fileName := "DumpProofsToDo", fileMap := default }
  try
    let (r, _) ← ((Meta.isProp type).run' : CoreM Bool).toIO ctx { env := env }
    pure (some r)
  catch _ =>
    pure none

private def ppOptions (opts : Options) : Options :=
  let opts := pp.notation.set opts true
  let opts := pp.explicit.set opts false
  let opts := pp.universes.set opts false
  pp.fullNames.set opts false

private def pathToModuleName (rootPrefix extension : String) (path : System.FilePath) : Option Name :=
  let normalized := path.toString.replace "\\" "/"
  if !normalized.startsWith rootPrefix || !normalized.endsWith extension then
    none
  else
    let relative := normalized.replace rootPrefix ""
    let withoutExt := relative.take (relative.length - extension.length)
    some (withoutExt.replace "/" ".").toName

private def moduleSourceExists (moduleName : Name) : IO Bool := do
  let path : System.FilePath := moduleName.toString.replace "." "/" ++ ".lean"
  return ← path.pathExists

private def discoveredLraImports : IO (Array Import) := do
  let paths ← System.FilePath.walkDir ".lake/build/lib/lean/LRA"
  let mut modules : Array Name := #[]
  for path in paths do
    if path.toString.replace "\\" "/" |>.endsWith ".olean" then
      if let some moduleName := pathToModuleName ".lake/build/lib/lean/" ".olean" path then
        if ← moduleSourceExists moduleName then
          modules := modules.push moduleName
  let sortedModules := modules.qsort (fun a b => a.toString < b.toString)
  pure <| sortedModules.map fun module => { module := module }

/--
Recursively delta-unfolds every application of an allow-listed definition
anywhere inside `e`, repeating up to `fuel` times per position so an
unfolded definition that itself mentions another allow-listed definition
also gets expanded. Anything not on `unfoldAllowList` is left exactly as
written, but its *arguments* are still visited, since an allow-listed
predicate can appear nested inside a non-allow-listed one (e.g.
`And (IsUpperBound r A) Q`).

This exists instead of a one-line call to `Lean.Meta.transform` because
that combinator's exact signature in this Lean version was not recalled
with enough confidence to use without a compiler to check against; this is
a plain, hand-rolled structural recursion over `Expr` using only the more
basic building blocks (`getAppFn`, `getAppArgs`, `mkAppN`,
`unfoldDefinition?`, `withLocalDecl`) that are more likely to be
individually correct even if the overall shape needs adjustment once it
actually compiles.
-/
private partial def unfoldAllowed (fuel : Nat) (e : Expr) : MetaM Expr := do
  match fuel, e with
  | 0, _ => pure e
  | fuel + 1, .forallE n d b bi =>
    let d' ← unfoldAllowed (fuel + 1) d
    Meta.withLocalDecl n bi d' fun fvar => do
      let b' ← unfoldAllowed (fuel + 1) (b.instantiate1 fvar)
      Meta.mkForallFVars #[fvar] b'
  | fuel + 1, .lam n d b bi =>
    let d' ← unfoldAllowed (fuel + 1) d
    Meta.withLocalDecl n bi d' fun fvar => do
      let b' ← unfoldAllowed (fuel + 1) (b.instantiate1 fvar)
      Meta.mkLambdaFVars #[fvar] b'
  | fuel + 1, .mdata m inner =>
    let inner' ← unfoldAllowed (fuel + 1) inner
    pure (.mdata m inner')
  | fuel + 1, e =>
    if e.isApp then
      let fn := e.getAppFn
      let args := e.getAppArgs
      if let .const name _ := fn then
        if isAllowedToUnfold name then
          match ← Meta.unfoldDefinition? e with
          | some unfolded => unfoldAllowed fuel unfolded.headBeta
          | none =>
            let args' ← args.mapM (unfoldAllowed (fuel + 1))
            pure (mkAppN fn args')
        else
          let args' ← args.mapM (unfoldAllowed (fuel + 1))
          pure (mkAppN fn args')
      else
        let fn' ← unfoldAllowed (fuel + 1) fn
        let args' ← args.mapM (unfoldAllowed (fuel + 1))
        pure (mkAppN fn' args')
    else
      pure e

/--
Pretty-print `type` the way Lean itself would display it (resolving
notation such as `∀`, `∃`, `∈`, `↔`, `∧`, `∨`, `¬`). Falls back to the raw
`Expr` representation if elaborated pretty-printing fails for a particular
declaration, so one problematic declaration cannot take down the whole dump.
-/
private def prettyType (env : Environment) (type : Expr) : IO String := do
  let ctx : Core.Context := { fileName := "DumpProofsToDo", fileMap := default }
  let coreAct : CoreM Format := (withOptions ppOptions <| Meta.ppExpr type).run'
  try
    let (fmt, _) ← coreAct.toIO ctx { env := env }
    pure fmt.pretty
  catch _ =>
    pure (clean (toString type))

/-- The three FOL-related columns for one theorem: the plain elaborated
pretty-print (kept for reference/fallback), the uncurried "High-Level FOL"
pretty-print, the allow-listed "Raw/Unfolded FOL" pretty-print, and a
status string for the unfold step (see the module doc comment). Every step
is independently wrapped so one failing transformation degrades to a
fallback instead of losing the whole row. -/
private def computeFolRenderings (env : Environment) (type : Expr) :
    IO (String × String × String × String) := do
  let ctx : Core.Context := { fileName := "DumpProofsToDo", fileMap := default }
  let plain ← prettyType env type
  let act : CoreM (String × String × String) := (do
    let uncurried ← uncurryHypotheses type
    let uncurriedFmt ← withOptions ppOptions <| Meta.ppExpr uncurried
    let uncurriedStr := uncurriedFmt.pretty
    try
      let unfolded ← unfoldAllowed 6 type
      let unfoldedUncurried ← uncurryHypotheses unfolded
      let unfoldedFmt ← withOptions ppOptions <| Meta.ppExpr unfoldedUncurried
      pure (uncurriedStr, unfoldedFmt.pretty, "ok")
    catch _ =>
      -- Deliberately not trying to render the exception's message here:
      -- `Exception` has no `ToString` instance, and `MessageData`-based
      -- rendering needs another still-unverified API. Losing the exact
      -- reason is an acceptable trade for not risking a third guess; the
      -- uncurried column still succeeds and reports below either way.
      pure (uncurriedStr, uncurriedStr, "error:unavailable")
  ).run'
  try
    let ((uncurriedStr, unfoldedStr, status), _) ← act.toIO ctx { env := env }
    pure (plain, uncurriedStr, unfoldedStr, status)
  catch _ =>
    pure (plain, plain, plain, "error:unavailable")

unsafe def main : IO Unit := do
  let env ← importModules (← discoveredLraImports) {} (trustLevel := 0)
  let mut rows : Array String := #[]
  let mut theoremCount := 0
  let mut instanceCount := 0
  let mut defnInfoCount := 0
  let mut propTrueCount := 0
  let mut propFalseCount := 0
  let mut propErrorCount := 0
  for h : moduleIndex in *...env.header.moduleNames.size do
    let moduleName := env.header.moduleNames[moduleIndex]
    let renderedModule := moduleName.toString
    if renderedModule == "LRA" || renderedModule.startsWith "LRA." then
      let moduleData := env.header.moduleData[moduleIndex]!
      for h : constantIndex in *...moduleData.constNames.size do
        let name := moduleData.constNames[constantIndex]
        let info := moduleData.constants[constantIndex]!
        if isGenerated env name then
          continue
        if let .thmInfo thm := info then
          let sorryUsed := usesSorry thm.value
          let (_plain, uncurried, unfolded, status) ← computeFolRenderings env thm.type
          theoremCount := theoremCount + 1
          rows := rows.push <| String.intercalate "\t" [
            clean name.toString,
            clean renderedModule,
            "theorem",
            toString sorryUsed,
            clean uncurried,
            clean unfolded,
            status
          ]
        else if let .defnInfo defn := info then
          defnInfoCount := defnInfoCount + 1
          let isPropResult ← classifyDefn env defn.type
          match isPropResult with
          | none => propErrorCount := propErrorCount + 1
          | some false => propFalseCount := propFalseCount + 1
          | some true =>
            propTrueCount := propTrueCount + 1
            let sorryUsed := usesSorry defn.value
            let (_plain, uncurried, unfolded, status) ← computeFolRenderings env defn.type
            instanceCount := instanceCount + 1
            rows := rows.push <| String.intercalate "\t" [
              clean name.toString,
              clean renderedModule,
              "instance",
              toString sorryUsed,
              clean uncurried,
              clean unfolded,
              status
            ]
  IO.FS.createDirAll "build"
  IO.FS.writeFile "build/proofs-todo-environment.tsv" <|
    "fq_name\tmodule\tkind\tuses_sorry\tpretty_type_uncurried\tpretty_type_unfolded\tunfold_status\n" ++
      String.intercalate "\n" rows.toList ++ "\n"
  IO.println s!"wrote {rows.size} declarations ({theoremCount} theorem, {instanceCount} instance)"
  IO.println s!"defnInfo scanned (post-noise-filter): {defnInfoCount}"
  IO.println s!"  Meta.isProp:      true={propTrueCount} (captured as instance rows) false={propFalseCount} error={propErrorCount}"
