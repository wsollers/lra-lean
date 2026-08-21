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
  `Interface/Signature/Definition.lean`; the `L_geom`-structure
  constructor `BuildTarskiStructure`/`BuildTarskiModel`, Euclidean
  theories `TarskiTheory`, and the notion of a structure satisfying a
  theory live in `Interface/ModelTheory`. Mirrors
  `AlgebraicStructures.OrderedField.Interface.Signature`/`.ModelTheory`.
* Typeclass-based laws: `Between`/`Congruent` (the capability
  typeclasses) live in `Interface/Relations.lean`; `CongruenceLaws`,
  `SegmentConstructionLaw`, `FiveSegmentLaw`, `BetweennessLaws`,
  `ParallelLaw`, `ContinuityLaw`, and `DimensionLaws` (Tarski's eleven
  axioms, restated generically) live in `Interface/Laws.lean`.

The canonical concrete carrier both formalizations are checked
against -- an `n`-tuple over an arbitrary `RealModel` -- lives in
`LRA.EuclideanSpace.Model` (`Rn`/`EuclideanPoint`), not here: it
registers directly with `BuildTarskiModel` via `EuclideanTupleModel`
rather than duplicating the model-theoretic plumbing this folder
already owns.

A concrete realization registers `Between`/`Congruent` instances for its
own `Point` type and proves it satisfies the law-classes -- see
`Tarski/Laws.lean` and `MathlibPoint/Laws.lean`.
-/
