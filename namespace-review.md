# LRA namespace architecture review

## Review metadata

| Item | Value |
|---|---|
| Revision | `ff6d9925f308100d680e04852b8b143ebb8b40f6` |
| Branch | `main` |
| Inventory | `9,718` compiled-environment rows |
| SHA-256 | `848f69a1ccc1d552c261dec61ec15447f84a722c2ed4ea2264b12de8ab0032aa` |
| Generator | `scripts/DumpNamespaceEnvironment.lean` then `scripts/generate_namespace_inventory.py` |
| Source-only findings | `0` (parser candidates; see reconciliation note) |
| Exact duplicate names | `29` |
| Case-insensitive collisions | `32` |

## Final architecture

Durable public declarations use semantic owners below `LRA`: `Algebra`,
`Analysis` (`Bounds`, `MetricSpaces`, `MeasureTheory`, `FunctionalAnalysis`),
`Map`, `Identity`, `Interop.Mathlib`, `LinearAlgebra`, `Logic`,
`NumberSystems`, `Order`, `Relation`, `Set`, and `Topology`. Curricular module
paths remain under `LRA/Volume*`; they no longer determine declaration names.
`LRA.Internal` contains explicitly non-API orienting and scratch material.

Immediate-root environment counts: `Algebra` 119, `AlgebraicStructures` 531, `Analysis` 1388, `Identity` 81, `Internal` 78, `Interop` 25, `LinearAlgebra` 64, `Logic` 1423, `Map` 355, `NumberSystems` 2092, `Operation` 141, `Order` 527, `Relation` 100, `Set` 1111, `Topology` 81, `UniversalAlgebra` 1518.

## Evidence classification

- `generated_companion`: 956
- `generated_constructor`: 437
- `generated_or_elaborated`: 7,092
- `generated_projection`: 837
- `generated_recursor`: 312
- `private_implementation`: 84

API status: `internal` 78, `private` 84, `public` 9,556.

The generator loads the freshly built `LRA` aggregate with `Lean.importModules`,
iterates constants by defining module, and reconciles candidate authored names
against each module's source file. Compiler constructors, recursors, projections,
private declarations, other generated companions, authored declarations, and
internal declarations are classified separately. Source parsing is deliberately
conservative: unmatched parser candidates are evidence-review prompts rather
than fabricated inventory rows. Current unmatched candidates: `0`.

## Ownership decisions

- The nine real-analysis bound predicates have one owner each under
  `LRA.Analysis.Bounds`; derived extremal theorems remain below
  `LRA.Analysis.Bounds.Extremal`.
- `LRA.Order.Bounds` is the separate backend- and relation-generic theory.
- The Volume IV vector-space definition is the pedagogical owner; the duplicate
  Volume VI definition was removed while its extra linear-map declaration was kept.
- Generic map predicates are canonical; the Polish integer development no
  longer declares local duplicates.
- Sequence/convergence and construction-specific model-isomorphism declarations
  that merely share short names remain distinct because their types and domains
  differ.
- `LRA.Order.TotalOrder` is the sole retained intentional compatibility synonym,
  abbreviating `LRA.Order.LinearOrder`. No `Chain` abbreviation was introduced.
- `LRA.Internal.MathematicalSpaces` retains orienting-only mathematical-space
  material; scratch metric structures/examples are under `LRA.Internal`.

## Map and relation foundations

`LRA.Map.Typed.TypedMap (Domain : Type u) (Codomain : Type v)` is the typed
representation. The foundational set-theoretic representation is a separate
domain/codomain/graph triple plus `IsSetTheoreticMap`, whose clauses enforce
graph closure, total evaluation, and unique values. A parallel bundled
set-theoretic relation triple records graph typing without the function laws.
Evaluation existence/uniqueness and map extensionality are provided.

There is exactly one typed-to-set representation theorem family,
`LRA.Map.SetTheoretic.TypedMapGraphRepresentation`. It requires explicit backend
element and object types, ordered-pair and separation operations and laws,
domain/codomain encodings, encoding injectivity/coverage, an ambient pair set,
and graph-pair existence. It constructs a set-theoretic map and proves its
evaluation agrees with the typed map. There are no bridge coercions or automatic
instances.

## Pilot and imports

Obsolete Lean source under `LRA/Pilot` was deleted after review; its useful bounds
ideas were already covered by the durable generic and analysis theories. Semantic
routers are available for all durable roots, including the seven-router combined
smoke test in `test/LRA/SemanticImportsSmoke.lean`.

## Reproducibility and collision notes

The TSV is sorted by full name and emitted with LF line endings. Run the two
generator commands twice; byte-identical SHA-256 values are required. Exact
duplicates are impossible in a Lean environment and are checked again here.
Case-insensitive collisions: `lra.identity.pureequalitylanguage`, `lra.internal.mathematicalspaces.mathematicalspacedefinition.hasstructure`, `lra.logic.firstorder.evaluateterm.eq_1`, `lra.logic.firstorder.evaluateterm.eq_2`, `lra.logic.firstorder.evaluateterm.eq_3`, `lra.logic.firstorder.evaluateterm.eq_def`, `lra.logic.firstorder.freevariables.eq_1`, `lra.logic.firstorder.freevariables.eq_2`, `lra.logic.firstorder.freevariables.eq_3`, `lra.logic.firstorder.freevariables.eq_4`, `lra.logic.firstorder.freevariables.eq_5`, `lra.logic.firstorder.freevariables.eq_def`, `lra.logic.firstorder.freevariablesinterm.eq_1`, `lra.logic.firstorder.freevariablesinterm.eq_2`, `lra.logic.firstorder.freevariablesinterm.eq_3`, `lra.logic.firstorder.freevariablesinterm.eq_def`, `lra.logic.firstorder.substitute.eq_1`, `lra.logic.firstorder.substitute.eq_2`, `lra.logic.firstorder.substitute.eq_3`, `lra.logic.firstorder.substitute.eq_4`, `lra.logic.firstorder.substitute.eq_5`, `lra.logic.firstorder.substitute.eq_def`, `lra.logic.firstorder.substituteinterm.eq_1`, `lra.logic.firstorder.substituteinterm.eq_2`, `lra.logic.firstorder.substituteinterm.eq_3`, `lra.logic.firstorder.substituteinterm.eq_def`, `lra.logic.updateassignment.congr_simp`, `lra.numbersystems.gaussianintegers.gaussianinteger.gaussianarithmeticringmodel`, `lra.operation.binaryoperation`, `lra.operation.externalbinaryoperation`, `lra.operation.nullaryoperation`, `lra.operation.unaryoperation`.
