import LRA.EuclideanSpace.Interface.Signature
import LRA.EuclideanSpace.Interface.ModelTheory
import LRA.EuclideanSpace.Interface.Relations
import LRA.EuclideanSpace.Interface.Laws
import LRA.EuclideanSpace.Interface.Point

/-!
Aggregate import for the `Interface` concept: the generic,
backend-agnostic characterization of Euclidean space -- mirroring
`LRA.Set.Interface`'s role for `LRA.Set.ZFCSet`/`PredicateSet`. Two
complementary formalizations of the same generic vocabulary, plus the
canonical concrete carrier both formalizations are checked against:

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
* `Interface/Point`: `Point n R`, an `n`-tuple over an *abstract* ordered
  field `R` -- not fixed to `ℝ`, uniformly instantiable at
  `mathlibRealModel`'s carrier or at any `RealModel` construction --
  together with the proof that it satisfies the law-classes above.
  Unlike `Tarski` (opaque, axiomatic) and `MathlibPoint` (fixed to
  Mathlib's own `ℝ`), `Point n R` is the concrete, coordinate-based
  family the generic model was missing a canonical carrier for.

A concrete realization registers `Between`/`Congruent` instances for its
own `Point` type and proves it satisfies the law-classes -- see
`Tarski/Laws.lean`, `MathlibPoint/Laws.lean`, and `Interface/Point/
Laws.lean`.
-/
