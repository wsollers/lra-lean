import Mathlib.Data.Real.Basic
import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.Basic
import Mathlib.Topology.MetricSpace.Basic
import LRA.Analysis.Limits.Definition
import LRA.Analysis.Limits.LimitsAtInfinity.Definition

namespace LRA.Analysis.Limits

open scoped Topology

/--
`HasJumpAt` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c : Real), Exists fun L₁ => Exists fun L₂ => (LRA.Analysis.Limits.TendsToLeft f A c L₁ ∧ (LRA.Analysis.Limits.TendsToRight f A c L₂ ∧ Ne L₁ L₂))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun L₁ => Exists fun L₂ => ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L₁)) ε))) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt c x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L₂)) ε))) ∧ (L₁ = L₂ → False)))

Logical form (Lean):

```lean
def HasJumpAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∃ L₁ L₂ : ℝ, TendsToLeft f A c L₁ ∧ TendsToRight f A c L₂ ∧ L₁ ≠ L₂
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def HasJumpAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∃ L₁ L₂ : ℝ, TendsToLeft f A c L₁ ∧ TendsToRight f A c L₂ ∧ L₁ ≠ L₂

/--
`DivergesToInftyAt` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c M : Real), Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs (instHSub.hSub x c)) → Real.instLT.lt (abs (instHSub.hSub x c)) δ → GT.gt (f x) M))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt M (f x)))

Logical form (Lean):

```lean
def DivergesToInftyAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ M : ℝ, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → f x > M
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def DivergesToInftyAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ M : ℝ, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → f x > M

/--
`DivergesToNegInftyAt` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c M : Real), Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs (instHSub.hSub x c)) → Real.instLT.lt (abs (instHSub.hSub x c)) δ → Real.instLT.lt (f x) M))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (f x) M))

Logical form (Lean):

```lean
def DivergesToNegInftyAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ M : ℝ, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → f x < M
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def DivergesToNegInftyAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ M : ℝ, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → f x < M

/--
`DivergesToInftyFromRight` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c M : Real), Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt c x → Real.instLT.lt x (instHAdd.hAdd c δ) → GT.gt (f x) M))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt c x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ) → Real.instLT.lt M (f x)))

Logical form (Lean):

```lean
def DivergesToInftyFromRight (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ M : ℝ, ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → f x > M
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def DivergesToInftyFromRight (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ M : ℝ, ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → f x > M

/--
`DivergesToInftyFromLeft` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c M : Real), Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt (instHSub.hSub c δ) x → Real.instLT.lt x c → GT.gt (f x) M))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt M (f x)))

Logical form (Lean):

```lean
def DivergesToInftyFromLeft (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ M : ℝ, ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → f x > M
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def DivergesToInftyFromLeft (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ M : ℝ, ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → f x > M

/--
`DivergesToNegInftyFromRight` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c M : Real), Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt c x → Real.instLT.lt x (instHAdd.hAdd c δ) → Real.instLT.lt (f x) M))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt c x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ) → Real.instLT.lt (f x) M))

Logical form (Lean):

```lean
def DivergesToNegInftyFromRight (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ M : ℝ, ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → f x < M
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def DivergesToNegInftyFromRight (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ M : ℝ, ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → f x < M

/--
`DivergesToNegInftyFromLeft` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c M : Real), Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt (instHSub.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (f x) M))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (f x) M))

Logical form (Lean):

```lean
def DivergesToNegInftyFromLeft (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ M : ℝ, ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → f x < M
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def DivergesToNegInftyFromLeft (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ M : ℝ, ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → f x < M

/--
`LimitDoesNotExist` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c : Real), (Exists fun L => LRA.Analysis.Limits.TendsTo f A c L) → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L)) ε))) → False

Logical form (Lean):

```lean
def LimitDoesNotExist (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ¬ ∃ L : ℝ, TendsTo f A c L
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def LimitDoesNotExist (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ¬ ∃ L : ℝ, TendsTo f A c L

/--
`Oscillates` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c : Real), Exists fun xs => Exists fun ys => (LRA.Analysis.Limits.ApproachesButNotEqual xs A c ∧ (LRA.Analysis.Limits.ApproachesButNotEqual ys A c ∧ (Exists fun L₁ => Exists fun L₂ => (Ne L₁ L₂ ∧ (Filter.Tendsto (Function.comp f xs) Filter.atTop (nhds L₁) ∧ Filter.Tendsto (Function.comp f ys) Filter.atTop (nhds L₂))))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun xs => Exists fun ys => (((∀ (n : Nat), xs n ∈ A) ∧ ((∀ (n : Nat), xs n = c → False) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (xs n) c)) ε))) ∧ (((∀ (n : Nat), ys n ∈ A) ∧ ((∀ (n : Nat), ys n = c → False) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (ys n) c)) ε))) ∧ (Exists fun L₁ => Exists fun L₂ => ((L₁ = L₂ → False) ∧ (Filter.instPartialOrder.toPreorder.1.le { sets := fun x => setOf fun x_1 => Function.comp f xs x_1 ∈ x ∈ Filter.atTop.1, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L₁) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := fun x => setOf fun x_1 => Function.comp f ys x_1 ∈ x ∈ Filter.atTop.1, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L₂))))))

Logical form (Lean):

```lean
def Oscillates (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∃ xs ys : ℕ → ℝ, ApproachesButNotEqual xs A c ∧ ApproachesButNotEqual ys A c ∧
    ∃ L₁ L₂ : ℝ, L₁ ≠ L₂ ∧
      Filter.Tendsto (f ∘ xs) Filter.atTop (𝓝 L₁) ∧
        Filter.Tendsto (f ∘ ys) Filter.atTop (𝓝 L₂)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def Oscillates (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∃ xs ys : ℕ → ℝ, ApproachesButNotEqual xs A c ∧ ApproachesButNotEqual ys A c ∧
    ∃ L₁ L₂ : ℝ, L₁ ≠ L₂ ∧
      Filter.Tendsto (f ∘ xs) Filter.atTop (𝓝 L₁) ∧
        Filter.Tendsto (f ∘ ys) Filter.atTop (𝓝 L₂)

/--
`DivergesAtInfinity` TODO

Predicate logic:

  ∀ (f : Real → Real) (X : Set Real), (Exists fun L => LRA.Analysis.Limits.TendsToInfty f X L) → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun M => ∀ (x : Real), x ∈ X → Real.instLT.lt M x → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L)) ε) → False

Logical form (Lean):

```lean
def DivergesAtInfinity (f : ℝ → ℝ) (X : Set ℝ) : Prop :=
  ¬ ∃ L : ℝ, TendsToInfty f X L
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def DivergesAtInfinity (f : ℝ → ℝ) (X : Set ℝ) : Prop :=
  ¬ ∃ L : ℝ, TendsToInfty f X L

end LRA.Analysis.Limits
