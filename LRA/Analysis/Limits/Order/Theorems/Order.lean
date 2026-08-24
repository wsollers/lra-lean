import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.Definition

namespace LRA.Analysis.Limits

variable {f g : ℝ → ℝ} {A : Set ℝ} {c Lf Lg L : ℝ}

/--
`TendstoOrderLe` TODO

Predicate logic:

  (∀ x ∈ A, f x ≤ g x) → Lf ≤ Lg

Predicate logic (unfolded):

  ∀ {f g : Real → Real} {A : Real → Prop} {c Lf Lg : Real}, (∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f x) (g x) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) Lf) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) Lf))) ε) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (g x) Lg) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (g x) Lg))) ε))) → Real.instLE.1 Lf Lg

Logical form (Lean):

```lean
theorem TendstoOrderLe (hfg : ∀ x ∈ A, f x ≤ g x)
    (hf : TendsTo f A c Lf) (hg : TendsTo g A c Lg) :
    Lf ≤ Lg
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
theorem TendstoOrderLe (hfg : ∀ x ∈ A, f x ≤ g x)
    (hf : TendsTo f A c Lf) (hg : TendsTo g A c Lg) :
    Lf ≤ Lg := by
  sorry

/--
`TendstoStrictOrderNear` TODO

Predicate logic:

  (Lf < Lg) → ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → f x < g x

Predicate logic (unfolded):

  ∀ {f g : Real → Real} {A : Real → Prop} {c Lf Lg : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) Lf) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) Lf))) ε) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (g x) Lg) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (g x) Lg))) ε) ∧ Real.instLT.1 Lf Lg)) → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (f x) (g x))

Logical form (Lean):

```lean
theorem TendstoStrictOrderNear (hf : TendsTo f A c Lf) (hg : TendsTo g A c Lg)
    (hLfg : Lf < Lg) :
    ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → f x < g x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem TendstoStrictOrderNear (hf : TendsTo f A c Lf) (hg : TendsTo g A c Lg)
    (hLfg : Lf < Lg) :
    ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → f x < g x := by
  sorry

/--
`TendstoBoundedNear` TODO

Predicate logic:

  ∃ δ > 0, ∃ M ∈ ℝ, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → |f x| ≤ M

Predicate logic (unfolded):

  ∀ {f : Real → Real} {A : Real → Prop} {c L : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L))) ε)) → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ Exists fun M => ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) M)

Logical form (Lean):

```lean
theorem TendstoBoundedNear (hf : TendsTo f A c L) :
    ∃ δ > 0, ∃ M : ℝ, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → |f x| ≤ M
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem TendstoBoundedNear (hf : TendsTo f A c L) :
    ∃ δ > 0, ∃ M : ℝ, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → |f x| ≤ M := by
  sorry

/--
`TendstoSameSignNear` TODO

Predicate logic:

  ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → 0 < L * f x

Predicate logic (unfolded):

  ∀ {f : Real → Real} {A : Real → Prop} {c L : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L))) ε) ∧ L = Zero.toOfNat0.1 → False) → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 Zero.toOfNat0.1 (instHMul.1 L (f x)))

Logical form (Lean):

```lean
theorem TendstoSameSignNear (hf : TendsTo f A c L) (hL : L ≠ 0) :
    ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → 0 < L * f x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem TendstoSameSignNear (hf : TendsTo f A c L) (hL : L ≠ 0) :
    ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → 0 < L * f x := by
  sorry

end LRA.Analysis.Limits
