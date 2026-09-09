import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.Definition

namespace LRA.Analysis.Limits

variable {f g : ℝ → ℝ} {A : Set ℝ} {c Lf Lg L : ℝ}

/--
`TendstoOrderLe` TODO

Predicate logic:

  ∀ {f g : Real → Real} {A : Set Real} {c Lf Lg : Real}, ((∀ (x : Real), x ∈ A → Real.instLE.le (f x) (g x)) ∧ (LRA.Analysis.Limits.TendsTo f A c Lf ∧ LRA.Analysis.Limits.TendsTo g A c Lg)) → Real.instLE.le Lf Lg

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    c Lf Lg L : ℝ
    hf : TendsTo f A c Lf
    hg : TendsTo g A c Lg
  Prove
    ((∀ (x : Real), x ∈ A → Real.instLE.le (f x) (g x)) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) Lf)) ε))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g x) Lg)) ε))))) → Real.instLE.le Lf Lg

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

  ∀ {f g : Real → Real} {A : Set Real} {c Lf Lg : Real}, (LRA.Analysis.Limits.TendsTo f A c Lf ∧ (LRA.Analysis.Limits.TendsTo g A c Lg ∧ Real.instLT.lt Lf Lg)) → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs (instHSub.hSub x c)) → Real.instLT.lt (abs (instHSub.hSub x c)) δ → Real.instLT.lt (f x) (g x)))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    c Lf Lg L : ℝ
    hf : TendsTo f A c Lf
    hg : TendsTo g A c Lg
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) Lf)) ε))) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g x) Lg)) ε))) ∧ Real.instLT.lt Lf Lg)) → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (f x) (g x)))

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

  ∀ {f : Real → Real} {A : Set Real} {c L : Real}, LRA.Analysis.Limits.TendsTo f A c L → Exists fun δ => (GT.gt δ 0 ∧ (Exists fun M => ∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs (instHSub.hSub x c)) → Real.instLT.lt (abs (instHSub.hSub x c)) δ → Real.instLE.le (abs (f x)) M))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    c Lf Lg L : ℝ
    hf : TendsTo f A c L
  Prove
    (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L)) ε))) → Exists fun δ => (Real.instLT.lt 0 δ ∧ (Exists fun M => ∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLE.le (abs (f x)) M))

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

  ∀ {f : Real → Real} {A : Set Real} {c L : Real}, (LRA.Analysis.Limits.TendsTo f A c L ∧ Ne L 0) → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs (instHSub.hSub x c)) → Real.instLT.lt (abs (instHSub.hSub x c)) δ → Real.instLT.lt 0 (instHMul.hMul L (f x))))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    c Lf Lg L : ℝ
    hf : TendsTo f A c L
    hL : L ≠ 0
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L)) ε))) ∧ (L = 0 → False)) → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt 0 ({ hMul := fun a b => Real.instMul.mul a b }.hMul L (f x))))

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
