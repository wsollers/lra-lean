
import Mathlib.Data.Real.Basic

namespace LRA.Analysis.Functions

/--
`PointwiseSum` TODO

Predicate logic:

  def PointwiseSum (f g : ℝ → ℝ) : ℝ → ℝ := fun x => f x + g x

Predicate logic (unfolded):

  def PointwiseSum (f g : ℝ → ℝ) : ℝ → ℝ := fun x => f x + g x (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PointwiseSum (f g : ℝ → ℝ) : ℝ → ℝ := fun x => f x + g x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def PointwiseSum (f g : ℝ → ℝ) : ℝ → ℝ := fun x => f x + g x

/--
`PointwiseDiff` TODO

Predicate logic:

  def PointwiseDiff (f g : ℝ → ℝ) : ℝ → ℝ := fun x => f x - g x

Predicate logic (unfolded):

  def PointwiseDiff (f g : ℝ → ℝ) : ℝ → ℝ := fun x => f x - g x (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PointwiseDiff (f g : ℝ → ℝ) : ℝ → ℝ := fun x => f x - g x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def PointwiseDiff (f g : ℝ → ℝ) : ℝ → ℝ := fun x => f x - g x

/--
`PointwiseProd` TODO

Predicate logic:

  def PointwiseProd (f g : ℝ → ℝ) : ℝ → ℝ := fun x => f x * g x

Predicate logic (unfolded):

  def PointwiseProd (f g : ℝ → ℝ) : ℝ → ℝ := fun x => f x * g x (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PointwiseProd (f g : ℝ → ℝ) : ℝ → ℝ := fun x => f x * g x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def PointwiseProd (f g : ℝ → ℝ) : ℝ → ℝ := fun x => f x * g x

/--
`PointwiseScalarMul` TODO

Predicate logic:

  def PointwiseScalarMul (lam : ℝ) (f : ℝ → ℝ) : ℝ → ℝ := fun x => lam * f x

Predicate logic (unfolded):

  def PointwiseScalarMul (lam : ℝ) (f : ℝ → ℝ) : ℝ → ℝ := fun x => lam * f x (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PointwiseScalarMul (lam : ℝ) (f : ℝ → ℝ) : ℝ → ℝ := fun x => lam * f x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def PointwiseScalarMul (lam : ℝ) (f : ℝ → ℝ) : ℝ → ℝ := fun x => lam * f x

/--
`PointwiseAbs` TODO

Predicate logic:

  def PointwiseAbs (f : ℝ → ℝ) : ℝ → ℝ := fun x => |f x|

Predicate logic (unfolded):

  def PointwiseAbs (f : ℝ → ℝ) : ℝ → ℝ := fun x => |f x| (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PointwiseAbs (f : ℝ → ℝ) : ℝ → ℝ := fun x => |f x|
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def PointwiseAbs (f : ℝ → ℝ) : ℝ → ℝ := fun x => |f x|

/--
`PointwiseMax` TODO

Predicate logic:

  def PointwiseMax (f g : ℝ → ℝ) : ℝ → ℝ := fun x => max (f x) (g x)

Predicate logic (unfolded):

  def PointwiseMax (f g : ℝ → ℝ) : ℝ → ℝ := fun x => max (f x) (g x) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PointwiseMax (f g : ℝ → ℝ) : ℝ → ℝ := fun x => max (f x) (g x)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def PointwiseMax (f g : ℝ → ℝ) : ℝ → ℝ := fun x => max (f x) (g x)

/--
`PointwiseMin` TODO

Predicate logic:

  def PointwiseMin (f g : ℝ → ℝ) : ℝ → ℝ := fun x => min (f x) (g x)

Predicate logic (unfolded):

  def PointwiseMin (f g : ℝ → ℝ) : ℝ → ℝ := fun x => min (f x) (g x) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PointwiseMin (f g : ℝ → ℝ) : ℝ → ℝ := fun x => min (f x) (g x)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def PointwiseMin (f g : ℝ → ℝ) : ℝ → ℝ := fun x => min (f x) (g x)

/--
`PointwiseQuotient` TODO

Predicate logic:

  noncomputable def PointwiseQuotient (f g : ℝ → ℝ) : ℝ → ℝ := fun x => f x / g x

Predicate logic (unfolded):

  noncomputable def PointwiseQuotient (f g : ℝ → ℝ) : ℝ → ℝ := fun x => f x / g x (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def PointwiseQuotient (f g : ℝ → ℝ) : ℝ → ℝ := fun x => f x / g x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
noncomputable def PointwiseQuotient (f g : ℝ → ℝ) : ℝ → ℝ := fun x => f x / g x

/--
`PointwiseReciprocal` TODO

Predicate logic:

  noncomputable def PointwiseReciprocal (f : ℝ → ℝ) : ℝ → ℝ := fun x => 1 / f x

Predicate logic (unfolded):

  noncomputable def PointwiseReciprocal (f : ℝ → ℝ) : ℝ → ℝ := fun x => 1 / f x (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def PointwiseReciprocal (f : ℝ → ℝ) : ℝ → ℝ := fun x => 1 / f x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
noncomputable def PointwiseReciprocal (f : ℝ → ℝ) : ℝ → ℝ := fun x => 1 / f x

/--
`FunctionAlgebraClosure` TODO

Predicate logic:

  ∀ (f g : Real → Real) (lam : Real) (A : Set Real), ((∀ (x : Real), x ∈ A → LRA.Analysis.Functions.PointwiseSum f g x = instHAdd.hAdd (f x) (g x)) ∧ ((∀ (x : Real), x ∈ A → LRA.Analysis.Functions.PointwiseDiff f g x = instHSub.hSub (f x) (g x)) ∧ ((∀ (x : Real), x ∈ A → LRA.Analysis.Functions.PointwiseProd f g x = instHMul.hMul (f x) (g x)) ∧ ((∀ (x : Real), x ∈ A → LRA.Analysis.Functions.PointwiseScalarMul lam f x = instHMul.hMul lam (f x)) ∧ ((∀ (x : Real), x ∈ A → LRA.Analysis.Functions.PointwiseAbs f x = abs (f x)) ∧ ((∀ (x : Real), x ∈ A → LRA.Analysis.Functions.PointwiseMax f g x = Real.instMax.max (f x) (g x)) ∧ (∀ (x : Real), x ∈ A → LRA.Analysis.Functions.PointwiseMin f g x = Real.instMin.min (f x) (g x))))))))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    lam : ℝ
    A : Set ℝ
  Prove
    ((∀ (x : Real), x ∈ A → { hAdd := fun a b => Real.instAdd.add a b }.hAdd (f x) (g x) = { hAdd := fun a b => Real.instAdd.add a b }.hAdd (f x) (g x)) ∧ ((∀ (x : Real), x ∈ A → { hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (g x) = { hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (g x)) ∧ ((∀ (x : Real), x ∈ A → { hMul := fun a b => Real.instMul.mul a b }.hMul (f x) (g x) = { hMul := fun a b => Real.instMul.mul a b }.hMul (f x) (g x)) ∧ ((∀ (x : Real), x ∈ A → { hMul := fun a b => Real.instMul.mul a b }.hMul lam (f x) = { hMul := fun a b => Real.instMul.mul a b }.hMul lam (f x)) ∧ ((∀ (x : Real), x ∈ A → abs (f x) = abs (f x)) ∧ ((∀ (x : Real), x ∈ A → Real.instMax.1 (f x) (g x) = Real.instMax.1 (f x) (g x)) ∧ (∀ (x : Real), x ∈ A → Real.instMin.1 (f x) (g x) = Real.instMin.1 (f x) (g x))))))))

Logical form (Lean):

```lean
theorem FunctionAlgebraClosure (f g : ℝ → ℝ) (lam : ℝ) (A : Set ℝ) :
    (∀ x ∈ A, PointwiseSum f g x = f x + g x) ∧
      (∀ x ∈ A, PointwiseDiff f g x = f x - g x) ∧
      (∀ x ∈ A, PointwiseProd f g x = f x * g x) ∧
      (∀ x ∈ A, PointwiseScalarMul lam f x = lam * f x) ∧
      (∀ x ∈ A, PointwiseAbs f x = |f x|) ∧
      (∀ x ∈ A, PointwiseMax f g x = max (f x) (g x)) ∧
      (∀ x ∈ A, PointwiseMin f g x = min (f x) (g x))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases

-/
theorem FunctionAlgebraClosure (f g : ℝ → ℝ) (lam : ℝ) (A : Set ℝ) :
    (∀ x ∈ A, PointwiseSum f g x = f x + g x) ∧
      (∀ x ∈ A, PointwiseDiff f g x = f x - g x) ∧
      (∀ x ∈ A, PointwiseProd f g x = f x * g x) ∧
      (∀ x ∈ A, PointwiseScalarMul lam f x = lam * f x) ∧
      (∀ x ∈ A, PointwiseAbs f x = |f x|) ∧
      (∀ x ∈ A, PointwiseMax f g x = max (f x) (g x)) ∧
      (∀ x ∈ A, PointwiseMin f g x = min (f x) (g x)) := by
  sorry
/--
`FunctionQuotientClosure` TODO

Predicate logic:

  ∀ (f g : Real → Real) (A : Set Real), (∀ (x : Real), x ∈ A → Ne (g x) 0) → ∀ (x : Real), x ∈ A → LRA.Analysis.Functions.PointwiseQuotient f g x = instHDiv.hDiv (f x) (g x)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
  Prove
    (∀ (x : Real), x ∈ A → g x = 0 → False) → ∀ (x : Real), x ∈ A → { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (f x) (g x) = { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (f x) (g x)

Logical form (Lean):

```lean
theorem FunctionQuotientClosure (f g : ℝ → ℝ) (A : Set ℝ)
    (h : ∀ x ∈ A, g x ≠ 0) : ∀ x ∈ A, PointwiseQuotient f g x = f x / g x
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
theorem FunctionQuotientClosure (f g : ℝ → ℝ) (A : Set ℝ)
    (h : ∀ x ∈ A, g x ≠ 0) : ∀ x ∈ A, PointwiseQuotient f g x = f x / g x := by
  sorry
/--
`PointwiseMaxMinAbsoluteValueFormulas` TODO

Predicate logic:

  ∀ (f g : Real → Real) (A : Set Real) (x : Real), x ∈ A → (LRA.Analysis.Functions.PointwiseMax f g x = instHDiv.hDiv (instHAdd.hAdd (instHAdd.hAdd (f x) (g x)) (abs (instHSub.hSub (f x) (g x)))) 2 ∧ LRA.Analysis.Functions.PointwiseMin f g x = instHDiv.hDiv (instHSub.hSub (instHAdd.hAdd (f x) (g x)) (abs (instHSub.hSub (f x) (g x)))) 2)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
  Prove
    x ∈ A → (Real.instMax.1 (f x) (g x) = { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (f x) (g x)) (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (g x)))) 2 ∧ Real.instMin.1 (f x) (g x) = { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (f x) (g x)) (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (g x)))) 2)

Logical form (Lean):

```lean
theorem PointwiseMaxMinAbsoluteValueFormulas (f g : ℝ → ℝ) (A : Set ℝ) :
    ∀ x ∈ A, PointwiseMax f g x = (f x + g x + |f x - g x|) / 2 ∧
      PointwiseMin f g x = (f x + g x - |f x - g x|) / 2
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases

-/
theorem PointwiseMaxMinAbsoluteValueFormulas (f g : ℝ → ℝ) (A : Set ℝ) :
    ∀ x ∈ A, PointwiseMax f g x = (f x + g x + |f x - g x|) / 2 ∧
      PointwiseMin f g x = (f x + g x - |f x - g x|) / 2 := by
  sorry
/--
`PointwiseMaxMinBounds` TODO

Predicate logic:

  ∀ (f g : Real → Real) (A : Set Real) (x : Real), x ∈ A → (Real.instLE.le (LRA.Analysis.Functions.PointwiseMin f g x) (f x) ∧ (Real.instLE.le (f x) (LRA.Analysis.Functions.PointwiseMax f g x) ∧ (Real.instLE.le (LRA.Analysis.Functions.PointwiseMin f g x) (g x) ∧ Real.instLE.le (g x) (LRA.Analysis.Functions.PointwiseMax f g x))))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
  Prove
    x ∈ A → (Real.instLE.le (Real.instMin.1 (f x) (g x)) (f x) ∧ (Real.instLE.le (f x) (Real.instMax.1 (f x) (g x)) ∧ (Real.instLE.le (Real.instMin.1 (f x) (g x)) (g x) ∧ Real.instLE.le (g x) (Real.instMax.1 (f x) (g x)))))

Logical form (Lean):

```lean
theorem PointwiseMaxMinBounds (f g : ℝ → ℝ) (A : Set ℝ) :
    ∀ x ∈ A, PointwiseMin f g x ≤ f x ∧ f x ≤ PointwiseMax f g x ∧
      PointwiseMin f g x ≤ g x ∧ g x ≤ PointwiseMax f g x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases

-/
theorem PointwiseMaxMinBounds (f g : ℝ → ℝ) (A : Set ℝ) :
    ∀ x ∈ A, PointwiseMin f g x ≤ f x ∧ f x ≤ PointwiseMax f g x ∧
      PointwiseMin f g x ≤ g x ∧ g x ≤ PointwiseMax f g x := by
  sorry
/--
`QuotientUndefinedWhenDenominatorVanishes` TODO

Predicate logic:

  ∀ (a g : Real → Real) (A : Set Real) (x₀ : Real), (x₀ ∈ A ∧ g x₀ = 0) → ¬ ∀ (x : Real), x ∈ A → Ne (g x) 0

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    x₀ : ℝ
  Prove
    (x₀ ∈ A ∧ (g x₀ = 0 ∧ (∀ (x : Real), x ∈ A → g x = 0 → False))) → False

Logical form (Lean):

```lean
theorem QuotientUndefinedWhenDenominatorVanishes (f g : ℝ → ℝ)
    (A : Set ℝ) (x₀ : ℝ) (hx₀ : x₀ ∈ A) (hg : g x₀ = 0) :
    ¬ (∀ x ∈ A, g x ≠ 0)
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
theorem QuotientUndefinedWhenDenominatorVanishes (f g : ℝ → ℝ)
    (A : Set ℝ) (x₀ : ℝ) (hx₀ : x₀ ∈ A) (hg : g x₀ = 0) :
    ¬ (∀ x ∈ A, g x ≠ 0) := by
  sorry
end LRA.Analysis.Functions
