import LRA.EuclideanSpace.Interface.Relations
import LRA.EuclideanSpace.Interface.Laws

/-!
Aggregate import for the `Interface` concept: the generic,
backend-agnostic characterization of Euclidean space -- mirroring
`LRA.Set.Interface`'s role for `LRA.Set.ZFCSet`/`PredicateSet`. `Between`
and `Congruent` (the capability typeclasses) live in `Interface/
Relations.lean`; `CongruenceLaws`, `SegmentConstructionLaw`,
`FiveSegmentLaw`, `BetweennessLaws`, `ParallelLaw`, `ContinuityLaw`, and
`DimensionLaws` (Tarski's eleven axioms, restated generically) live in
`Interface/Laws.lean`. A concrete realization registers instances of
`Between`/`Congruent` for its own `Point` type and proves it satisfies
these classes -- see `Tarski/Laws.lean`.
-/
