import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.Definition

namespace LRA.Analysis.Limits

/--
`TendstoUnique` TODO

Predicate logic:

  (ℝ → ℝ ∧ ∀ δ > 0, ∃ x ∈ A, 0 < |x - c| ∧ |x - c| < δ) → L₁ = L₂

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c L₁ L₂ : Real), (∀ (δ : Real), Real.instLT.1 Zero.toOfNat0.1 δ → Exists fun x => (Set.instMembership.1 A x ∧ (Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ)) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L₁) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L₁))) ε) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L₂) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L₂))) ε))) → L₁ = L₂

Logical form (Lean):

```lean
theorem TendstoUnique (f : ℝ → ℝ) (A : Set ℝ) (c L₁ L₂ : ℝ)
    (hc : ∀ δ > 0, ∃ x ∈ A, 0 < |x - c| ∧ |x - c| < δ)
    (h₁ : TendsTo f A c L₁) (h₂ : TendsTo f A c L₂) : L₁ = L₂
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem TendstoUnique (f : ℝ → ℝ) (A : Set ℝ) (c L₁ L₂ : ℝ)
    (hc : ∀ δ > 0, ∃ x ∈ A, 0 < |x - c| ∧ |x - c| < δ)
    (h₁ : TendsTo f A c L₁) (h₂ : TendsTo f A c L₂) : L₁ = L₂ := by
  sorry

/--
`TendstoComp` TODO

Predicate logic:

  (∀ x ∈ A, f x ∈ B ∧ g c₂ = L₂) → TendsTo (fun x => g (f x)) A c₁ L₂

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (A B : Real → Prop) (c₁ c₂ L₂ : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c₁) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c₁))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c₁) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c₁))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) c₂) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) c₂))) ε) ∧ (∀ (x : Real), Set.instMembership.1 A x → Set.instMembership.1 B (f x) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 B x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c₂) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c₂))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c₂) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c₂))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (g x) L₂) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (g x) L₂))) ε) ∧ g c₂ = L₂))) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c₁) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c₁))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c₁) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c₁))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => g (f x)) x) L₂) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun x => g (f x)) x) L₂))) ε)

Logical form (Lean):

```lean
theorem TendstoComp (f g : ℝ → ℝ) (A B : Set ℝ) (c₁ c₂ L₂ : ℝ)
    (hf : TendsTo f A c₁ c₂) (hfA : ∀ x ∈ A, f x ∈ B)
    (hg : TendsTo g B c₂ L₂) (hgc : g c₂ = L₂) :
    TendsTo (fun x => g (f x)) A c₁ L₂
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
theorem TendstoComp (f g : ℝ → ℝ) (A B : Set ℝ) (c₁ c₂ L₂ : ℝ)
    (hf : TendsTo f A c₁ c₂) (hfA : ∀ x ∈ A, f x ∈ B)
    (hg : TendsTo g B c₂ L₂) (hgc : g c₂ = L₂) :
    TendsTo (fun x => g (f x)) A c₁ L₂ := by
  sorry

end LRA.Analysis.Limits
