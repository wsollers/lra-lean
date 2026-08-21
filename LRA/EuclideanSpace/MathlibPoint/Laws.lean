import LRA.EuclideanSpace.MathlibPoint.Definition
import LRA.EuclideanSpace.Interface.Laws

/-!
Proof that `MathlibPoint n` satisfies the generic `Interface` law-classes
-- the same role `LRA.Set.PredicateSet.Laws` plays for `PredicateSet`
against `LRA.Set.Interface`. Unlike `Tarski.Laws` (direct references to
axioms already stated in the right shape), every theorem here is real
classical geometry -- that `dist`-based congruence and affine-
combination betweenness on `EuclideanSpace ℝ (Fin n)` actually satisfy
Tarski's axioms -- stated and left `sorry`, per this repo's convention
of not completing proofs unless asked.
-/

namespace LRA.EuclideanSpace

variable {n : ℕ}

/-- `MathlibPoint n`'s `congruent` (equal Mathlib `dist`) satisfies
Tarski's congruence reflexivity. -/
theorem MathlibCongruenceReflexivity (x y : MathlibPoint n) :
    congruent x y y x := by
  sorry

/-- `MathlibPoint n`'s `congruent` satisfies Tarski's congruence
transitivity. -/
theorem MathlibCongruenceTransitivity (x y z w u v : MathlibPoint n)
    (xyCongZw : congruent x y z w) (xyCongUv : congruent x y u v) :
    congruent z w u v := by
  sorry

/-- `MathlibPoint n`'s `congruent` satisfies Tarski's congruence
identity. -/
theorem MathlibCongruenceIdentity (x y z : MathlibPoint n)
    (xyCongZz : congruent x y z z) : x = y := by
  sorry

/-- `MathlibPoint n`'s affine-combination `between` and `dist`-based
`congruent` together satisfy Tarski's segment-construction axiom. -/
theorem MathlibSegmentConstruction (x y a b : MathlibPoint n) :
    ∃ z : MathlibPoint n, between x y z ∧ congruent y z a b := by
  sorry

/-- `MathlibPoint n` satisfies Tarski's five-segment (rigidity) axiom. -/
theorem MathlibFiveSegment (x y z x' y' z' u u' : MathlibPoint n) (xNeY : x ≠ y)
    (bxyz : between x y z) (bxyz' : between x' y' z')
    (xyCongXy' : congruent x y x' y') (yzCongYz' : congruent y z y' z')
    (xuCongXu' : congruent x u x' u') (yuCongYu' : congruent y u y' u') :
    congruent z u z' u' := by
  sorry

/-- `MathlibPoint n`'s affine-combination `between` satisfies Tarski's
betweenness identity. -/
theorem MathlibBetweennessIdentity (x y : MathlibPoint n)
    (bxyx : between x y x) : x = y := by
  sorry

/-- `MathlibPoint n`'s affine-combination `between` satisfies Tarski's
inner Pasch axiom. -/
theorem MathlibInnerPasch (u v p q z : MathlibPoint n)
    (bupv : between u p v) (bpqz : between p q z) :
    ∃ x : MathlibPoint n, between u x z ∧ between q x v := by
  sorry

/-- `MathlibPoint n` satisfies Tarski's parallel postulate (Playfair
form). -/
theorem MathlibPlayfair (a b c d t : MathlibPoint n)
    (badt : between a d t) (bbdc : between b d c) (aNeD : a ≠ d) :
    ∃ x y : MathlibPoint n, between a b x ∧ between a c y ∧ between x t y := by
  sorry

/-- `MathlibPoint n` satisfies Tarski's continuity schema (in its
predicate-quantified form). -/
theorem MathlibContinuity (φ ψ : MathlibPoint n → Prop)
    (separated : ∃ a : MathlibPoint n, ∀ x y, φ x → ψ y → between a x y) :
    ∃ b : MathlibPoint n, ∀ x y, φ x → ψ y → between x b y := by
  sorry

instance : CongruenceLaws (MathlibPoint n) where
  CongruenceReflexivity := MathlibCongruenceReflexivity
  CongruenceTransitivity := MathlibCongruenceTransitivity
  CongruenceIdentity := MathlibCongruenceIdentity

instance : SegmentConstructionLaw (MathlibPoint n) where
  SegmentConstruction := MathlibSegmentConstruction

instance : FiveSegmentLaw (MathlibPoint n) where
  FiveSegment := MathlibFiveSegment

instance : BetweennessLaws (MathlibPoint n) where
  BetweennessIdentity := MathlibBetweennessIdentity
  InnerPasch := MathlibInnerPasch

instance : ParallelLaw (MathlibPoint n) where
  Playfair := MathlibPlayfair

instance : ContinuityLaw (MathlibPoint n) where
  Continuity := MathlibContinuity

end LRA.EuclideanSpace
