import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.Definition

namespace LRA.Analysis.Limits

/--
`TendstoUnique` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c L₁ L₂ : Real), ((∀ (δ : Real), GT.gt δ 0 → Exists fun x => (x ∈ A ∧ (Real.instLT.lt 0 (abs (instHSub.hSub x c)) ∧ Real.instLT.lt (abs (instHSub.hSub x c)) δ))) ∧ (LRA.Analysis.Limits.TendsTo f A c L₁ ∧ LRA.Analysis.Limits.TendsTo f A c L₂)) → L₁ = L₂

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    c L₁ L₂ : ℝ
    h₁ : TendsTo f A c L₁
    h₂ : TendsTo f A c L₂
  Prove
    ((∀ (δ : Real), Real.instLT.lt 0 δ → Exists fun x => (x ∈ A ∧ (Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ))) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L₁)) ε))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L₂)) ε))))) → L₁ = L₂

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

  ∀ (f g : Real → Real) (A B : Set Real) (c₁ c₂ L₂ : Real), (LRA.Analysis.Limits.TendsTo f A c₁ c₂ ∧ ((∀ (x : Real), x ∈ A → f x ∈ B) ∧ (LRA.Analysis.Limits.TendsTo g B c₂ L₂ ∧ g c₂ = L₂))) → LRA.Analysis.Limits.TendsTo (fun x => g (f x)) A c₁ L₂

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A B : Set ℝ
    c₁ c₂ L₂ : ℝ
    hf : TendsTo f A c₁ c₂
    hg : TendsTo g B c₂ L₂
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c₁)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c₁)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) c₂)) ε))) ∧ ((∀ (x : Real), x ∈ A → f x ∈ B) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ B → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c₂)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c₂)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g x) L₂)) ε))) ∧ g c₂ = L₂))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c₁)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c₁)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => g (f x)) x) L₂)) ε))

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
