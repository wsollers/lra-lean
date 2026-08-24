import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.Asymptotes.Definition

namespace LRA.Analysis.Limits

/--
`HorizontalAsymptoteIsObliqueWithZeroSlopeAtPosInfty` TODO

Predicate logic:

  (ℝ → ℝ ∧ HasHorizontalAsymptoteAtPosInfty f X L) → HasObliqueAsymptoteAtPosInfty f X 0 L

Predicate logic (unfolded):

  ∀ (f : Real → Real) (X : Real → Prop) (L : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x) L))) ε) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => instHSub.hSub (f x) (instHAdd.hAdd (instHMul.hMul 0 x) L)) x) 0) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub ((fun x => instHSub.hSub (f x) (instHAdd.hAdd (instHMul.hMul 0 x) L)) x) 0))) ε

Logical form (Lean):

```lean
theorem HorizontalAsymptoteIsObliqueWithZeroSlopeAtPosInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ)
    (h : HasHorizontalAsymptoteAtPosInfty f X L) :
    HasObliqueAsymptoteAtPosInfty f X 0 L
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem HorizontalAsymptoteIsObliqueWithZeroSlopeAtPosInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ)
    (h : HasHorizontalAsymptoteAtPosInfty f X L) :
    HasObliqueAsymptoteAtPosInfty f X 0 L := by
  sorry

/--
`HorizontalAsymptoteIsObliqueWithZeroSlopeAtNegInfty` TODO

Predicate logic:

  (ℝ → ℝ ∧ HasHorizontalAsymptoteAtNegInfty f X L) → HasObliqueAsymptoteAtNegInfty f X 0 L

Predicate logic (unfolded):

  ∀ (f : Real → Real) (X : Real → Prop) (L : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 x M → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x) L))) ε) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 x M → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => instHSub.hSub (f x) (instHAdd.hAdd (instHMul.hMul 0 x) L)) x) 0) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub ((fun x => instHSub.hSub (f x) (instHAdd.hAdd (instHMul.hMul 0 x) L)) x) 0))) ε

Logical form (Lean):

```lean
theorem HorizontalAsymptoteIsObliqueWithZeroSlopeAtNegInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ)
    (h : HasHorizontalAsymptoteAtNegInfty f X L) :
    HasObliqueAsymptoteAtNegInfty f X 0 L
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem HorizontalAsymptoteIsObliqueWithZeroSlopeAtNegInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ)
    (h : HasHorizontalAsymptoteAtNegInfty f X L) :
    HasObliqueAsymptoteAtNegInfty f X 0 L := by
  sorry

/--
`ObliqueAsymptoteIffSlopeAndInterceptLimits` TODO

Predicate logic:

  (ℝ → ℝ) → HasObliqueAsymptoteAtPosInfty f X m b ↔ TendsToInfty (fun x => f x / x) X m ∧ TendsToInfty (fun x => f x - m * x) X b

Predicate logic (unfolded):

  ∀ (f : Real → Real) (X : Real → Prop) (m b : Real), ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => instHSub.hSub (f x) (instHAdd.hAdd (instHMul.hMul m x) b)) x) 0) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub ((fun x => instHSub.hSub (f x) (instHAdd.hAdd (instHMul.hMul m x) b)) x) 0))) ε ↔ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => instHDiv.1 (f x) x) x) m) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun x => instHDiv.hDiv (f x) x) x) m))) ε ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => instHSub.1 (f x) (instHMul.hMul m x)) x) b) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun x => instHSub.hSub (f x) (instHMul.hMul m x)) x) b))) ε)

Logical form (Lean):

```lean
theorem ObliqueAsymptoteIffSlopeAndInterceptLimits (f : ℝ → ℝ) (X : Set ℝ) (m b : ℝ) :
    HasObliqueAsymptoteAtPosInfty f X m b ↔
      TendsToInfty (fun x => f x / x) X m ∧ TendsToInfty (fun x => f x - m * x) X b
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
theorem ObliqueAsymptoteIffSlopeAndInterceptLimits (f : ℝ → ℝ) (X : Set ℝ) (m b : ℝ) :
    HasObliqueAsymptoteAtPosInfty f X m b ↔
      TendsToInfty (fun x => f x / x) X m ∧ TendsToInfty (fun x => f x - m * x) X b := by
  sorry

/--
`ReciprocalHasHorizontalAndVerticalAsymptotes` TODO

Predicate logic:

  HasHorizontalAsymptoteAtPosInfty fun x ∈ ℝ => 1 / x {x : ℝ | x > 0} 0 ∧ HasHorizontalAsymptoteAtNegInfty fun x ∈ ℝ => 1 / x {x : ℝ | x < 0} 0 ∧ HasVerticalAsymptoteAt fun x ∈ ℝ => 1 / x {x : ℝ | x ≠ 0} 0

Predicate logic (unfolded):

  (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 (fun x => Real.instLT.1 0 x) x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => instHDiv.hDiv 1 x) x) 0) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub ((fun x => instHDiv.hDiv 1 x) x) 0))) ε ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 (fun x => Real.instLT.1 x Zero.toOfNat0.1) x → Real.instLT.1 x M → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => instHDiv.hDiv 1 x) x) 0) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub ((fun x => instHDiv.hDiv 1 x) x) 0))) ε ∧ Or (∀ (M : Real), Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 (fun x => x = 0 → False) x → Real.instLT.1 Zero.toOfNat0.1 x → Real.instLT.1 x (instHAdd.1 Zero.toOfNat0.1 δ) → Real.instLT.1 M ((fun x => instHDiv.1 One.toOfNat1.1 x) x))) (Or (∀ (M : Real), Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 (fun x => x = 0 → False) x → Real.instLT.1 (instHSub.1 Zero.toOfNat0.1 δ) x → Real.instLT.1 x Zero.toOfNat0.1 → Real.instLT.1 M ((fun x => instHDiv.1 One.toOfNat1.1 x) x))) (Or (∀ (M : Real), Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 (fun x => x = 0 → False) x → Real.instLT.1 Zero.toOfNat0.1 x → Real.instLT.1 x (instHAdd.1 Zero.toOfNat0.1 δ) → Real.instLT.1 ((fun x => instHDiv.1 One.toOfNat1.1 x) x) M)) (∀ (M : Real), Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 (fun x => x = 0 → False) x → Real.instLT.1 (instHSub.1 Zero.toOfNat0.1 δ) x → Real.instLT.1 x Zero.toOfNat0.1 → Real.instLT.1 ((fun x => instHDiv.1 One.toOfNat1.1 x) x) M))))))

Logical form (Lean):

```lean
theorem ReciprocalHasHorizontalAndVerticalAsymptotes :
    HasHorizontalAsymptoteAtPosInfty (fun x : ℝ => 1 / x) {x : ℝ | x > 0} 0 ∧
      HasHorizontalAsymptoteAtNegInfty (fun x : ℝ => 1 / x) {x : ℝ | x < 0} 0 ∧
      HasVerticalAsymptoteAt (fun x : ℝ => 1 / x) {x : ℝ | x ≠ 0} 0
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem ReciprocalHasHorizontalAndVerticalAsymptotes :
    HasHorizontalAsymptoteAtPosInfty (fun x : ℝ => 1 / x) {x : ℝ | x > 0} 0 ∧
      HasHorizontalAsymptoteAtNegInfty (fun x : ℝ => 1 / x) {x : ℝ | x < 0} 0 ∧
      HasVerticalAsymptoteAt (fun x : ℝ => 1 / x) {x : ℝ | x ≠ 0} 0 := by
  sorry

end LRA.Analysis.Limits
