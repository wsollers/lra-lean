import LRA.EuclideanSpace.MathlibPoint.Definition
import LRA.EuclideanSpace.MathlibPoint.Laws

/-!
Aggregate import for the `MathlibPoint` concept: the pragmatic backend
built directly from Mathlib's `EuclideanSpace ℝ (Fin n)`, mirroring
`LRA.Set.PredicateSet`'s role alongside `LRA.Set.ZFCSet`. `MathlibPoint`
itself and its `Between`/`Congruent` instances live in
`MathlibPoint/Definition.lean`; the (currently `sorry`-stubbed) proof
that it satisfies the generic `Interface` law-classes lives in
`MathlibPoint/Laws.lean`. `DimensionLaws` is not yet instanced here, for
the same reason `Tarski`'s own dimension axioms are vacuous: the
underlying `AffinelyIndependent`/`CoincidesOrDeterminedByDistances`
predicates are still `sorry`-deferred in `Interface.Laws`.
-/
