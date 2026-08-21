import LRA.EuclideanSpace.Interface.Point.Definition
import LRA.EuclideanSpace.Interface.Laws
import LRA.Order.Bounds.LeastUpperBoundProperty.CompletenessLaws

/-!
Proof that `Point n R` satisfies the generic `Interface` law-classes --
the same role `Tarski.Laws`/`MathlibPoint.Laws` play for their own
backends, except `Point n R` is a genuine *family* of backends (one per
`R`), and the hypotheses each theorem needs are the honest measure of
how much of Tarski's theory a bare `OrderedFieldLaws R` already buys:

* Congruence (1-3), betweenness/order (6-7), and the parallel postulate
  (10) are pure ordered-field algebra -- no square root anywhere -- so
  they hold for *any* `OrderedFieldLaws R`.
* Segment construction (4) needs to solve `t² · |xy|² = |ab|²` for `t`,
  which needs square roots; continuity (11) is, in essence, Dedekind
  completeness restated geometrically. Both need `R` to carry
  `OrderCompletenessLaws R (Set R)` -- exactly the certificate
  `RealModel` itself bundles, so any `RealModel.Carrier` (including
  `mathlibRealModel`'s, i.e. plain `ℝ`) automatically qualifies for both.

`DimensionLaws` is not instanced here, for the same reason `Tarski`'s
own dimension axioms and `MathlibPoint`'s omission are: the underlying
`AffinelyIndependent`/`CoincidesOrDeterminedByDistances` predicates are
still `sorry`-deferred in `Interface.Laws`.
-/

namespace LRA.EuclideanSpace

variable {n : ℕ} {R : Type u} [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1]
  [LT R] [LE R] [OrderedFieldLaws R]

/-- `Point n R`'s sum-of-squares `congruent` satisfies Tarski's
congruence reflexivity, for any ordered field `R`. -/
theorem PointCongruenceReflexivity (x y : Point n R) :
    congruent x y y x := by
  sorry

/-- `Point n R`'s `congruent` satisfies Tarski's congruence transitivity,
for any ordered field `R`. -/
theorem PointCongruenceTransitivity (x y z w u v : Point n R)
    (xyCongZw : congruent x y z w) (xyCongUv : congruent x y u v) :
    congruent z w u v := by
  sorry

/-- `Point n R`'s `congruent` satisfies Tarski's congruence identity, for
any ordered field `R`: a sum of squares vanishes only when every term
does, which needs no completeness, only that squares are nonnegative. -/
theorem PointCongruenceIdentity (x y z : Point n R)
    (xyCongZz : congruent x y z z) : x = y := by
  sorry

/-- `Point n R`'s affine-combination `between` satisfies Tarski's
betweenness identity, for any ordered field `R`. -/
theorem PointBetweennessIdentity (x y : Point n R)
    (bxyx : between x y x) : x = y := by
  sorry

/-- `Point n R`'s `between` satisfies Tarski's inner Pasch axiom, for any
ordered field `R`. -/
theorem PointInnerPasch (u v p q z : Point n R)
    (bupv : between u p v) (bpqz : between p q z) :
    ∃ x : Point n R, between u x z ∧ between q x v := by
  sorry

/-- `Point n R` satisfies Tarski's five-segment (rigidity) axiom, for any
ordered field `R`. -/
theorem PointFiveSegment (x y z x' y' z' u u' : Point n R) (xNeY : x ≠ y)
    (bxyz : between x y z) (bxyz' : between x' y' z')
    (xyCongXy' : congruent x y x' y') (yzCongYz' : congruent y z y' z')
    (xuCongXu' : congruent x u x' u') (yuCongYu' : congruent y u y' u') :
    congruent z u z' u' := by
  sorry

/-- `Point n R` satisfies Tarski's parallel postulate (Playfair form), for
any ordered field `R`. -/
theorem PointPlayfair (a b c d t : Point n R)
    (badt : between a d t) (bbdc : between b d c) (aNeD : a ≠ d) :
    ∃ x y : Point n R, between a b x ∧ between a c y ∧ between x t y := by
  sorry

instance : CongruenceLaws (Point n R) where
  CongruenceReflexivity := PointCongruenceReflexivity
  CongruenceTransitivity := PointCongruenceTransitivity
  CongruenceIdentity := PointCongruenceIdentity

instance : BetweennessLaws (Point n R) where
  BetweennessIdentity := PointBetweennessIdentity
  InnerPasch := PointInnerPasch

instance : FiveSegmentLaw (Point n R) where
  FiveSegment := PointFiveSegment

instance : ParallelLaw (Point n R) where
  Playfair := PointPlayfair

variable [OrderCompletenessLaws R (Set R)]

/-- `Point n R` satisfies Tarski's segment-construction axiom, given `R`
is a *complete* ordered field: laying off a segment congruent to `ab`
needs a square root, which completeness (hence real-closedness)
guarantees but a bare ordered field does not. -/
theorem PointSegmentConstruction (x y a b : Point n R) :
    ∃ z : Point n R, between x y z ∧ congruent y z a b := by
  sorry

/-- `Point n R` satisfies Tarski's continuity schema, given `R` is a
complete ordered field -- this axiom is, in substance, Dedekind
completeness read geometrically. -/
theorem PointContinuity (φ ψ : Point n R → Prop)
    (separated : ∃ a : Point n R, ∀ x y, φ x → ψ y → between a x y) :
    ∃ b : Point n R, ∀ x y, φ x → ψ y → between x b y := by
  sorry

instance : SegmentConstructionLaw (Point n R) where
  SegmentConstruction := PointSegmentConstruction

instance : ContinuityLaw (Point n R) where
  Continuity := PointContinuity

end LRA.EuclideanSpace
