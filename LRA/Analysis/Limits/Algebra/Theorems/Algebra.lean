import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.Definition

namespace LRA.Analysis.Limits

section AlgebraOfLimits

variable {f g : ℝ → ℝ} {A : Set ℝ} {c Lf Lg α : ℝ}

/--
`TendstoAdd` TODO

Predicate logic:

  ∀ {f g : Real → Real} {A : Set Real} {c Lf Lg : Real}, (LRA.Analysis.Limits.TendsTo f A c Lf ∧ LRA.Analysis.Limits.TendsTo g A c Lg) → LRA.Analysis.Limits.TendsTo (fun x => instHAdd.hAdd (f x) (g x)) A c (instHAdd.hAdd Lf Lg)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    c Lf Lg α : ℝ
    hf : TendsTo f A c Lf
    hg : TendsTo g A c Lg
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) Lf)) ε))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g x) Lg)) ε)))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => { hAdd := fun a b => Real.instAdd.add a b }.hAdd (f x) (g x)) x) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd Lf Lg))) ε))

Logical form (Lean):

```lean
theorem TendstoAdd (hf : TendsTo f A c Lf) (hg : TendsTo g A c Lg) :
    TendsTo (fun x => f x + g x) A c (Lf + Lg)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem TendstoAdd (hf : TendsTo f A c Lf) (hg : TendsTo g A c Lg) :
    TendsTo (fun x => f x + g x) A c (Lf + Lg) := by
  sorry
/--
`TendstoSub` TODO

Predicate logic:

  ∀ {f g : Real → Real} {A : Set Real} {c Lf Lg : Real}, (LRA.Analysis.Limits.TendsTo f A c Lf ∧ LRA.Analysis.Limits.TendsTo g A c Lg) → LRA.Analysis.Limits.TendsTo (fun x => instHSub.hSub (f x) (g x)) A c (instHSub.hSub Lf Lg)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    c Lf Lg α : ℝ
    hf : TendsTo f A c Lf
    hg : TendsTo g A c Lg
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) Lf)) ε))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g x) Lg)) ε)))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (g x)) x) ({ hSub := fun a b => Real.instSub.sub a b }.hSub Lf Lg))) ε))

Logical form (Lean):

```lean
theorem TendstoSub (hf : TendsTo f A c Lf) (hg : TendsTo g A c Lg) :
    TendsTo (fun x => f x - g x) A c (Lf - Lg)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem TendstoSub (hf : TendsTo f A c Lf) (hg : TendsTo g A c Lg) :
    TendsTo (fun x => f x - g x) A c (Lf - Lg) := by
  sorry
/--
`TendstoScalar` TODO

Predicate logic:

  ∀ {f : Real → Real} {A : Set Real} {c Lf : Real}, LRA.Analysis.Limits.TendsTo f A c Lf → ∀ (α : Real), LRA.Analysis.Limits.TendsTo (fun x => instHMul.hMul α (f x)) A c (instHMul.hMul α Lf)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    c Lf Lg α : ℝ
    hf : TendsTo f A c Lf
    α : ℝ
  Prove
    (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) Lf)) ε))) → ∀ (α ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul α (f x)) x) ({ hMul := fun a b => Real.instMul.mul a b }.hMul α Lf))) ε))

Logical form (Lean):

```lean
theorem TendstoScalar (hf : TendsTo f A c Lf) (α : ℝ) :
    TendsTo (fun x => α * f x) A c (α * Lf)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem TendstoScalar (hf : TendsTo f A c Lf) (α : ℝ) :
    TendsTo (fun x => α * f x) A c (α * Lf) := by
  sorry
/--
`TendstoMul` TODO

Predicate logic:

  ∀ {f g : Real → Real} {A : Set Real} {c Lf Lg : Real}, (LRA.Analysis.Limits.TendsTo f A c Lf ∧ LRA.Analysis.Limits.TendsTo g A c Lg) → LRA.Analysis.Limits.TendsTo (fun x => instHMul.hMul (f x) (g x)) A c (instHMul.hMul Lf Lg)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    c Lf Lg α : ℝ
    hf : TendsTo f A c Lf
    hg : TendsTo g A c Lg
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) Lf)) ε))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g x) Lg)) ε)))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul (f x) (g x)) x) ({ hMul := fun a b => Real.instMul.mul a b }.hMul Lf Lg))) ε))

Logical form (Lean):

```lean
theorem TendstoMul (hf : TendsTo f A c Lf) (hg : TendsTo g A c Lg) :
    TendsTo (fun x => f x * g x) A c (Lf * Lg)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem TendstoMul (hf : TendsTo f A c Lf) (hg : TendsTo g A c Lg) :
    TendsTo (fun x => f x * g x) A c (Lf * Lg) := by
  sorry
/--
`TendstoDiv` TODO

Predicate logic:

  ∀ {f g : Real → Real} {A : Set Real} {c Lf Lg : Real}, (LRA.Analysis.Limits.TendsTo f A c Lf ∧ (LRA.Analysis.Limits.TendsTo g A c Lg ∧ Ne Lg 0)) → LRA.Analysis.Limits.TendsTo (fun x => instHDiv.hDiv (f x) (g x)) A c (instHDiv.hDiv Lf Lg)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    c Lf Lg α : ℝ
    hf : TendsTo f A c Lf
    hg : TendsTo g A c Lg
    hLg : Lg ≠ 0
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) Lf)) ε))) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g x) Lg)) ε))) ∧ (Lg = 0 → False))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (f x) (g x)) x) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv Lf Lg))) ε))

Logical form (Lean):

```lean
theorem TendstoDiv (hf : TendsTo f A c Lf) (hg : TendsTo g A c Lg)
    (hLg : Lg ≠ 0) :
    TendsTo (fun x => f x / g x) A c (Lf / Lg)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem TendstoDiv (hf : TendsTo f A c Lf) (hg : TendsTo g A c Lg)
    (hLg : Lg ≠ 0) :
    TendsTo (fun x => f x / g x) A c (Lf / Lg) := by
  sorry
end AlgebraOfLimits

/--
`SqueezeFunctionLimits` TODO

Predicate logic:

  ∀ (f g h : Real → Real) (A : Set Real) (c L : Real), ((∀ (x : Real), x ∈ A → Real.instLE.le (f x) (g x)) ∧ ((∀ (x : Real), x ∈ A → Real.instLE.le (g x) (h x)) ∧ (LRA.Analysis.Limits.TendsTo f A c L ∧ LRA.Analysis.Limits.TendsTo h A c L))) → LRA.Analysis.Limits.TendsTo g A c L

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    c Lf Lg α : ℝ
    f g h : ℝ → ℝ
    A : Set ℝ
    c L : ℝ
    hf : TendsTo f A c L
    hh : TendsTo h A c L
  Prove
    ((∀ (x : Real), x ∈ A → Real.instLE.le (f x) (g x)) ∧ ((∀ (x : Real), x ∈ A → Real.instLE.le (g x) (h x)) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L)) ε))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (h x) L)) ε)))))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g x) L)) ε))

Logical form (Lean):

```lean
theorem SqueezeFunctionLimits (f g h : ℝ → ℝ) (A : Set ℝ) (c L : ℝ)
    (hfg : ∀ x ∈ A, f x ≤ g x) (hgh : ∀ x ∈ A, g x ≤ h x)
    (hf : TendsTo f A c L) (hh : TendsTo h A c L) :
    TendsTo g A c L
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
theorem SqueezeFunctionLimits (f g h : ℝ → ℝ) (A : Set ℝ) (c L : ℝ)
    (hfg : ∀ x ∈ A, f x ≤ g x) (hgh : ∀ x ∈ A, g x ≤ h x)
    (hf : TendsTo f A c L) (hh : TendsTo h A c L) :
    TendsTo g A c L := by
  sorry
end LRA.Analysis.Limits
