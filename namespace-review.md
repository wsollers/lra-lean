# LRA namespace architecture review

## Review metadata

| Item | Value |
|---|---|
| Revision | `47ff3346688d195786ec6ea8192230e8985f5726` |
| Branch | `claude/lra-namespace-simplify-4lyw5k` |
| Inventory | `10,372` compiled-environment rows |
| SHA-256 | `1cf4d2cbbf956c558ee0d9bc4cf61d183a714069b8aca9841da0f9ba689b3d12` |
| Generator | `scripts/DumpNamespaceEnvironment.lean` then `scripts/generate_namespace_inventory.py` |
| Source-only findings | `0` (parser candidates; see reconciliation note) |
| Exact duplicate names | `0` |
| Lazily re-materialized constants collapsed | `25` |
| Case-insensitive collisions | `1` |

## Final architecture

Durable public declarations use semantic owners directly below `LRA`:
`AlgebraicStructures`, `Analysis` (`Bounds`, `MetricSpaces`, `MeasureTheory`,
`FunctionalAnalysis`), `Function`, `Identity`, `Interop.Mathlib`,
`LinearAlgebra`, `Logic`, `NumberSystems`, `Operation`, `Order`, `Relation`,
`Set`, `Topology`, and `UniversalAlgebra`. Curricular module paths remain under
`LRA/Volume*`; they no longer determine declaration names. `LRA.Internal`
contains explicitly non-API orienting and scratch material.

`LRA.Identity` sits directly under `LRA` rather than under `LRA.Logic`, because
identity and equality are foundational rather than a branch of logic. There is
no `LRA.Number`, no `LRA.Space`, and no `LRA.Carrier`.

Immediate-root environment counts: `AlgebraicStructures` 1467, `Analysis` 1388, `Function` 348, `Identity` 81, `Internal` 197, `Interop` 33, `LinearAlgebra` 64, `Logic` 1398, `NumberSystems` 2671, `Operation` 200, `Order` 541, `Relation` 114, `Set` 1111, `Topology` 81, `UniversalAlgebra` 594.

## Evidence classification

- `authored`: 4,019
- `generated_companion`: 1,032
- `generated_constructor`: 474
- `generated_or_elaborated`: 3,509
- `generated_projection`: 906
- `generated_recursor`: 348
- `private_implementation`: 84

API status: `internal` 197, `private` 84, `public` 10,091.

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
- `LRA.Order.Bounds` is the separate backend- and relation-generic theory. Its
  definitions and theorems are relation-parametric; only its `Examples` and
  `FailureModes` modules instantiate the generic predicates at concrete
  Mathlib carriers, and only its `MathlibAdapters` and
  `Order/Interoperability/Mathlib` modules face Mathlib's order classes.
- The Volume IV vector-space definition is the pedagogical owner; the duplicate
  Volume VI definition was removed while its extra linear-map declaration was
  kept.
- Generic function predicates under `LRA.Function` are canonical. The Polish
  integer development declares no local `Injective`/`Surjective`/`Bijective`;
  its theorems state their conclusions with Lean's `Function.Injective`,
  `Function.Surjective`, and `Function.Bijective`.
- Sequence/convergence and construction-specific model-isomorphism declarations
  that merely share short names remain distinct because their types and domains
  differ. `LRA.Analysis.Sequences.Sequence` is `Nat -> X`, while the two real
  number construction sequences are indexed by a rational model's carrier;
  `LRA.Logic.FirstOrder.ModelIsomorphism` is signature-parametric, while the
  number-system isomorphisms carry explicit operation-preservation fields.
- `LRA.Order.TotalOrder` is the sole retained intentional compatibility synonym,
  abbreviating `LRA.Order.LinearOrder`. No `Chain` abbreviation was introduced;
  `LRA.Order.Chain` is a genuine definition of pairwise comparability.
- `LRA.Internal.MathematicalSpaces` retains orienting-only mathematical-space
  material, so no public `LRA.Space` root exists for it. Scratch metric
  structures and their example spaces are under `LRA.Internal`, not under the
  stable `LRA.Interop.Mathlib` names.
- `LRA.Internal.AbstractAlgebra` holds the Volume VI reference structures. Their
  own module documentation calls them orienting rather than a proof foundation,
  and `LRA.AlgebraicStructures` is the durable owner of named algebraic
  structures, so they are classified internal rather than kept as a second
  public algebra root.

## Function and relation foundations

`LRA.Function (Domain : Type u) (Codomain : Type v)` is the typed
representation, an abbreviation of `Domain -> Codomain` with independent domain
and codomain universes. The same name is the durable namespace for function
concepts, so `LRA.Function.Injective`, `LRA.Function.Graph`,
`LRA.Function.SetTheoretic`, and the rest live under the abbreviation.
`LRA.Function.Endofunction` is the single-type specialization.

The foundational set-theoretic representation is a separate
domain/codomain/graph triple, `SetTheoreticFunctionTriple`, plus the predicate
`IsSetTheoreticFunction`, whose three clauses enforce graph typing, total
evaluation, and unique values. `SetTheoreticFunction` bundles the triple with
that evidence in its `isFunction` field. A parallel bundled set-theoretic
relation triple records graph typing without the function laws. Evaluation
existence, evaluation uniqueness, and triple extensionality are provided.

There is exactly one typed-to-set representation theorem family,
`LRA.Function.SetTheoretic.TypedFunctionGraphRepresentation`. It requires
explicit backend element and object types, ordered-pair and separation
operations and laws, domain and codomain encodings, encoding injectivity and
coverage, an ambient pair set, and graph-pair existence. It constructs a
set-theoretic function and proves its evaluation agrees with the typed
function. Every set-existence, ordered-pair, and encoding assumption is an
explicit hypothesis: no Lean type is claimed to be a backend set. There are no
bridge coercions and no automatic instances.

## Pilot and imports

Obsolete Lean source under `LRA/Pilot` was deleted after review; its useful
bounds ideas were already covered by the durable generic and analysis theories.
The stale `LRA.VolumeIV.Topology` router was removed because its referenced
modules do not exist; general topology is routed through `LRA.Topology`.

Canonical semantic routers exist for every durable public root: `LRA.Function`,
`LRA.Identity`, `LRA.Logic`, `LRA.Set`, `LRA.Relation`, `LRA.Order`,
`LRA.Operation`, `LRA.UniversalAlgebra`, `LRA.AlgebraicStructures`,
`LRA.NumberSystems`, `LRA.LinearAlgebra`, `LRA.Topology`, `LRA.Interop.Mathlib`,
`LRA.Analysis`, and the four analysis subdomains. Routers import leaf modules
inside curricular volume directories, never a volume aggregate, so no import
cycle is introduced. `test/LRA/SemanticImportsSmoke.lean` imports the seven
required routers together, and `test/LRA/FunctionFoundationsSmoke.lean` is the
focused check for the function foundations.

## Reproducibility and collision notes

The TSV is sorted by full name and emitted with LF line endings. Run the two
generator commands twice; byte-identical SHA-256 values are required. Exact
duplicates are impossible in a Lean environment and are checked again here; the
`25` constants that Lean re-materialized in a second module are
collapsed to a single row whose `notes` field names the other module.

Case-insensitive collisions: `lra.identity.pureequalitylanguage`.

The single remaining collision is intentional and semantically distinct:
`LRA.Identity.PureEqualityLanguage` is a type abbreviation and
`LRA.Identity.pureEqualityLanguage` is the language value of that type, which is
Lean's standard type/term convention. Every other case-insensitive collision has
been removed: the earlier equation- and congruence-lemma collisions disappeared
with the re-materialization collapse above, the Gaussian arithmetic ring model
was renamed to `ActiveGaussianArithmeticRingModel` to separate it from the
carrier-generic `gaussianArithmeticRingModel`, and the internal mathematical
space's evidence field was renamed from `hasStructure` to `structureHolds` to
separate it from its `HasStructure` predicate field.

## Internal namespaces

`LRA.Internal` is the explicitly non-API root. It holds
`LRA.Internal.MathematicalSpaces` (orienting-only mathematical space reference
data), `LRA.Internal.AbstractAlgebra` (Volume VI orienting reference structures),
and `LRA.Internal.ScratchMetricSpace` with its scratch metric examples. Nothing
under `LRA.Internal` is part of the stable public API, and no public root exists
solely to host it.
