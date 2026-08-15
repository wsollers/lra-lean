# LRA namespace architecture review

## Review metadata

| Item | Value |
|---|---|
| Revision | `39e1f7fbad7225cd059deb4cf44bd59d90b88a57` |
| Branch | `main` |
| Inventory | `9,106` compiled-environment rows |
| SHA-256 | `54016f4e8b285435104d5866a0c866ef772d566bdfbceb8cfa96c4323858ed51` |
| Generator | `scripts/DumpNamespaceEnvironment.lean` then `scripts/generate_namespace_inventory.py` |
| Source-only findings | `0` (parser candidates; see reconciliation note) |
| Exact duplicate names | `25` |
| Case-insensitive collisions | `28` |

## Final architecture

Durable public declarations use semantic owners below `LRA`: `Algebra`,
`Analysis` (`Bounds`, `MetricSpaces`, `MeasureTheory`, `FunctionalAnalysis`),
`Function`, `Identity`, `Interop.Mathlib`, `LinearAlgebra`, `Logic`,
`NumberSystems`, `Order`, `Relation`, `Set`, and `Topology`. Curricular module
paths remain under `LRA/Volume*`; they no longer determine declaration names.
`LRA.Internal` contains explicitly non-API orienting and scratch material.

Immediate-root environment counts: `Algebra` 2254, `Analysis` 1379, `Function` 96, `Identity` 81, `Internal` 74, `Interop` 25, `LinearAlgebra` 64, `Logic` 1423, `NumberSystems` 2091, `Order` 286, `Relation` 83, `Set` 1085, `Topology` 81.

## Evidence classification

- `authored`: 3,371
- `generated_companion`: 937
- `generated_constructor`: 431
- `generated_or_elaborated`: 3,153
- `generated_projection`: 824
- `generated_recursor`: 306
- `private_implementation`: 84

API status: `internal` 74, `private` 84, `public` 8,948.

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
- Generic function predicates are canonical; the Polish integer development no
  longer declares local duplicates.
- Sequence/convergence and construction-specific model-isomorphism declarations
  that merely share short names remain distinct because their types and domains
  differ.
- `LRA.Order.TotalOrder` is the sole retained intentional compatibility synonym,
  abbreviating `LRA.Order.LinearOrder`. No `Chain` abbreviation was introduced.
- `LRA.Internal.MathematicalSpaces` retains orienting-only mathematical-space
  material; scratch metric structures/examples are under `LRA.Internal`.

## Function foundations

`LRA.Function (Domain : Type u) (Codomain : Type v)` is the typed representation.
The foundational representation is a separate domain/codomain/graph triple plus
`IsSetTheoreticFunction`, whose fields enforce graph closure, total evaluation,
and unique values. Evaluation existence/uniqueness and triple extensionality are
provided.

There is exactly one typed-to-set representation theorem family,
`LRA.Function.typedFunctionGraphRepresentation`. It requires explicit backend
element and object types, ordered-pair and separation operations and laws,
domain/codomain encodings, encoding injectivity/coverage, an ambient pair set,
and graph-pair existence. It constructs a set-theoretic function and proves its
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
Case-insensitive collisions: `lra.identity.pureequalitylanguage`, `lra.internal.mathematicalspaces.mathematicalspacedefinition.hasstructure`, `lra.logic.firstorder.evaluateterm.eq_1`, `lra.logic.firstorder.evaluateterm.eq_2`, `lra.logic.firstorder.evaluateterm.eq_3`, `lra.logic.firstorder.evaluateterm.eq_def`, `lra.logic.firstorder.freevariables.eq_1`, `lra.logic.firstorder.freevariables.eq_2`, `lra.logic.firstorder.freevariables.eq_3`, `lra.logic.firstorder.freevariables.eq_4`, `lra.logic.firstorder.freevariables.eq_5`, `lra.logic.firstorder.freevariables.eq_def`, `lra.logic.firstorder.freevariablesinterm.eq_1`, `lra.logic.firstorder.freevariablesinterm.eq_2`, `lra.logic.firstorder.freevariablesinterm.eq_3`, `lra.logic.firstorder.freevariablesinterm.eq_def`, `lra.logic.firstorder.substitute.eq_1`, `lra.logic.firstorder.substitute.eq_2`, `lra.logic.firstorder.substitute.eq_3`, `lra.logic.firstorder.substitute.eq_4`, `lra.logic.firstorder.substitute.eq_5`, `lra.logic.firstorder.substitute.eq_def`, `lra.logic.firstorder.substituteinterm.eq_1`, `lra.logic.firstorder.substituteinterm.eq_2`, `lra.logic.firstorder.substituteinterm.eq_3`, `lra.logic.firstorder.substituteinterm.eq_def`, `lra.logic.updateassignment.congr_simp`, `lra.numbersystems.gaussianintegers.gaussianinteger.gaussianarithmeticringmodel`.
