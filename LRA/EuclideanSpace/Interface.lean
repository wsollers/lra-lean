import LRA.EuclideanSpace.Interface.Signature
import LRA.EuclideanSpace.Interface.ModelTheory
import LRA.EuclideanSpace.Interface.Relations
import LRA.EuclideanSpace.Interface.Laws

/-!
Aggregate import for the `Interface` concept: the generic,
backend-agnostic characterization of Euclidean space -- mirroring
`LRA.Set.Interface`'s role for `LRA.Set.ZFCSet`/`PredicateSet`. Two
complementary formalizations of the same generic vocabulary:

* Formal first-order model theory: `TarskiRelationSymbol` and
  `TarskiFirstOrderSignature` (the `L_geom` vocabulary) live in
  `Interface/Signature/Definition.lean`; `BuildTarskiModel` (registers
  any `Point` type as a formal `L_geom`-structure) lives in
  `Interface/ModelTheory/Model.lean`. Mirrors `AlgebraicStructures.
  OrderedField.Interface.Signature`/`.ModelTheory`.
* Typeclass-based laws: `Between`/`Congruent` (the capability
  typeclasses) live in `Interface/Relations.lean`; `CongruenceLaws`,
  `SegmentConstructionLaw`, `FiveSegmentLaw`, `BetweennessLaws`,
  `ParallelLaw`, `ContinuityLaw`, and `DimensionLaws` (Tarski's eleven
  axioms, restated generically) live in `Interface/Laws.lean`.

A concrete realization registers `Between`/`Congruent` instances for its
own `Point` type and proves it satisfies the law-classes -- see
`Tarski/Laws.lean` and `MathlibPoint/Laws.lean`.
-/
