# Interface / ModelTheory / UniversalAlgebra Standardization Inventory

This document is the working migration matrix for standardizing subject layout
around:

- `Interface/`
- `Interface/ModelTheory/`
- `Interface/UniversalAlgebra/`
- `Realizations/`
- `Interop/`

The governing standard is
[repository-architecture.md](/F:/repos/lra-lean/docs/architecture/repository-architecture.md:1).

## Success Gate

Each refactor chunk is considered successful only if:

1. `python scripts/validate_structure.py --path <target>`
   succeeds for the altered target.
2. A scoped Lean build for the altered component succeeds.
   Example: `lake build LRA.Analysis.MetricSpace` or another targeted build
   equivalent.
3. Only after both pass do we commit the chunk.

Whole-repo `lake build` is currently not a reliable gate because the tree has
pre-existing Lean failures outside this standardization work.

## Current Families

The survey found four main path families.

### Family A: Interface model theory using legacy names

These subjects already have interface-level model-theory folders, but they use
the older:

- `Model.lean`
- `Axioms.lean`
- `Satisfaction.lean`

shape instead of:

- `LStructure.lean`
- `Theory.lean`
- `Model.lean`

Representative paths:

- `LRA/AlgebraicStructures/*/Interface/ModelTheory/`
- `LRA/NumberSystems/PeanoSystem/Interface/ModelTheory/`
- `LRA/NumberSystems/IntegerStructure/Interface/ModelTheory/`
- `LRA/EuclideanSpace/Interface/ModelTheory/`

Migration target:

```text
Interface/
  ModelTheory/
    LStructure.lean
    Theory.lean
    Model.lean
```

Notes:

- `Axioms.lean` should fold into or rename toward `Theory.lean`.
- `Satisfaction.lean` should be reconsidered as either:
  - material incorporated into `Model.lean`, or
  - realization/backend proof material moved to `Realizations/`.
- `EuclideanSpace/Interface/ModelTheory/Structure.lean` should rename to
  `LStructure.lean`.

Priority: high.

### Family B: Top-level subject `Model/` folders

These subjects use:

```text
XXX/Model/
  LStructure.lean
  Theory.lean
  Model.lean
```

Representative paths:

- `LRA/Set/Model/`
- `LRA/Identity/Model/`
- `LRA/VolumeII/Arithmetic/Model/`

Assessment:

- `Set` and `Identity` are coherent internally, but they do not match the new
  preferred standard where model theory lives under `Interface/ModelTheory/`.
- `VolumeII/Arithmetic/Model/` is its own historical pattern and should be
  reviewed separately rather than mass-moved early.

Migration target:

- for active subject-level standardization work:
  move toward `Interface/ModelTheory/`;
- for historical or transitional subsystems:
  defer until the parent subject is actively being refactored.

Priority:

- `Set`: medium-high
- `Identity`: medium
- `VolumeII/Arithmetic`: deferred

### Family C: Legacy `Construction/ModelTheory`

These are the highest-risk naming collisions because they often mean
"concrete backend realization" rather than actual logical model theory.

Representative paths:

- `LRA/Analysis/MetricSpace/Construction/ModelTheory/`
- `LRA/Analysis/MeasureTheory/AlgebraOfSets/Construction/ModelTheory/`
- `LRA/Analysis/MeasureTheory/MeasureSpace/Construction/ModelTheory.lean`
- `LRA/Analysis/MeasureTheory/MeasurableSpace/Construction/ModelTheory.lean`
- `LRA/Analysis/NormedLinearSpace/Construction/ModelTheory.lean`
- `LRA/Analysis/InnerProductSpace/Construction/ModelTheory.lean`
- `LRA/Analysis/HilbertSpace/Construction/ModelTheory.lean`
- `LRA/Analysis/BanachSpace/Construction/ModelTheory.lean`
- `LRA/Topology/PointSetTopology/TopologicalSpace/Construction/ModelTheory.lean`
- `LRA/Algebra/LinearAlgebra/VectorSpace/Construction/ModelTheory.lean`

Migration target:

- if the file is backend satisfaction or implementation packaging:
  move to `Realizations/`
- if the file is genuine formal interface logic:
  move under `Interface/ModelTheory/`

Examples:

- `LRA/Analysis/MetricSpace/Construction/ModelTheory/EuclideanRn.lean`
  should move to something like
  `LRA/Analysis/MetricSpace/Realizations/Euclidean.lean`

Priority: highest.

### Family D: Local `Language` vs `Signature` naming split

These paths mix `Language.lean` and `Signature.lean` for closely related roles:

- `LRA/Analysis/MeasureTheory/AlgebraOfSets/Construction/ModelTheory/SetRings/`
- `LRA/Analysis/MeasureTheory/AlgebraOfSets/Construction/ModelTheory/SetAlgebras/`
- `LRA/Analysis/MeasureTheory/AlgebraOfSets/Construction/ModelTheory/BooleanAlgebras/`

Assessment:

- in some places `Language` is really the formal first-order symbol package;
- in others `Signature` is a source-facing operation bundle;
- the local distinction may be mathematically real, but the naming is not
  transparent enough for a structural standard.

Migration target:

- use `Signature` consistently for symbol/arity vocabulary;
- if a separate source-facing operation bundle is needed, document it clearly
  and place it under the appropriate contract layer;
- avoid parallel `Language` and `Signature` files in the same mini-subsystem
  unless both roles are explicitly justified.

Priority: high.

## Recommended Chunk Order

### Chunk 1: `MetricSpace`

Why first:

- already has a fresh design doc,
- already has a scoped validator pass,
- contains a clear legacy `Construction/ModelTheory` case,
- small enough to use as the first proving ground.

Target:

- standardize `Interface`, native model data, `Laws`, `Realizations`, `Interop`
- leave full `Interface/ModelTheory` optional unless immediately needed

Gate:

- `python scripts/validate_structure.py --path LRA/Analysis/MetricSpace --allow-legacy-construction-modeltheory`
  initially,
- then remove the legacy allowance when the realization move is complete

### Chunk 2: `EuclideanSpace.Interface`

Why second:

- has a real interface-level logical contract,
- currently uses `Structure.lean` where the new standard wants
  `LStructure.lean`,
- directly informs later analysis subjects.

Target:

- `Interface/ModelTheory/LStructure.lean`
- `Interface/ModelTheory/Theory.lean`
- `Interface/ModelTheory/Model.lean`

Gate:

- scoped validator on `LRA/EuclideanSpace/Interface`
- scoped Lean build once the existing pre-existing errors are addressed

### Chunk 3: `AlgebraicStructures` interface families

Why third:

- many subjects share the same old `Axioms/Satisfaction` pattern,
- a template-based refactor is possible once one or two exemplars are settled.

Suggested exemplar order:

1. `Semigroup`
2. `Monoid`
3. `Ring`
4. `Field`

Target:

- normalize interface-level model theory naming
- clarify what belongs in `Interface/UniversalAlgebra/`
- defer `Examples` and `Interop` population to separate subject tasks

### Chunk 4: `Set` and `Identity`

Why later:

- they are internally coherent already,
- but they currently encode the older top-level `Model/` pattern,
- moving them should wait until the interface-level pattern is settled in
  active subjects.

### Chunk 5: `MeasureTheory` and related analysis/topology subjects

Why last:

- these have the messiest overlap between construction, realization, and
  local model-theory naming,
- they will benefit from the earlier template decisions.

## Initial Priority Table

| Area | Current issue | Target | Priority |
|---|---|---|---|
| `Analysis/MetricSpace` | legacy `Construction/ModelTheory` | `Realizations/` plus interface-native structure | highest |
| `EuclideanSpace/Interface` | `Structure.lean`, split model-theory naming | `Interface/ModelTheory/{LStructure,Theory,Model}` | high |
| `AlgebraicStructures/*/Interface/ModelTheory` | old `Axioms/Satisfaction` shape | new interface model-theory triplet | high |
| `MeasureTheory/AlgebraOfSets/*/Construction/ModelTheory` | legacy location plus `Language/Signature` split | interface contract or realizations, clarified naming | high |
| `Set/Model` | old top-level model pattern | eventual move or explicit grandfathering | medium-high |
| `Identity/Model` | old top-level model pattern | eventual move or explicit grandfathering | medium |
| `VolumeII/Arithmetic/Model` | historical special case | separate review later | deferred |

## Immediate Next Move

The next concrete chunk should be:

1. build a path-by-path migration map for `LRA/Analysis/MetricSpace`
2. move or rename the legacy Euclidean realization out of
   `Construction/ModelTheory`
3. tighten the validator for that subject so the legacy allowance is no longer
   needed

That gives us one clean end-to-end proof that the standard is enforceable
before we scale it to the rest of the tree.
