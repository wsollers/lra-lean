
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

  (∀ x ∈ A, PointwiseSum f g x = f x + g x) ∧ (∀ x ∈ A, PointwiseDiff f g x = f x - g x) ∧ (∀ x ∈ A, PointwiseProd f g x = f x * g x) ∧ (∀ x ∈ A, PointwiseScalarMul lam f x = lam * f x) ∧ (∀ x ∈ A, PointwiseAbs f x = |f x|) ∧ (∀ x ∈ A, PointwiseMax f g x = max (f x) (g x)) ∧ (∀ x ∈ A, PointwiseMin f g x = min (f x) (g x))

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (lam : Real) (A : Real → Prop), (∀ (x : Real), Set.instMembership.1 A x → instHAdd.1 (f x) (g x) = instHAdd.1 (f x) (g x) ∧ (∀ (x : Real), Set.instMembership.1 A x → instHSub.1 (f x) (g x) = instHSub.1 (f x) (g x) ∧ (∀ (x : Real), Set.instMembership.1 A x → instHMul.1 (f x) (g x) = instHMul.1 (f x) (g x) ∧ (∀ (x : Real), Set.instMembership.1 A x → instHMul.1 lam (f x) = instHMul.1 lam (f x) ∧ (∀ (x : Real), Set.instMembership.1 A x → SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x)) = SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x)) ∧ (∀ (x : Real), Set.instMembership.1 A x → Real.instMax.1 (f x) (g x) = Real.instMax.1 (f x) (g x) ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instMin.1 (f x) (g x) = Real.instMin.1 (f x) (g x)))))))

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

  (∀ x ∈ A, g x ≠ 0) → ∀ x ∈ A, PointwiseQuotient f g x = f x / g x

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (A : Real → Prop), (∀ (x : Real), Set.instMembership.1 A x → g x = Zero.toOfNat0.1 → False) → ∀ (x : Real), Set.instMembership.1 A x → instHDiv.1 (f x) (g x) = instHDiv.1 (f x) (g x)

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

  ∀ x ∈ A, PointwiseMax f g x = (f x + g x + |f x - g x|) / 2 ∧ PointwiseMin f g x = (f x + g x - |f x - g x|) / 2

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (A : Real → Prop) (x : Real), Set.instMembership.1 A x → (Real.instMax.1 (f x) (g x) = instHDiv.1 (instHAdd.1 (instHAdd.1 (f x) (g x)) (SemilatticeSup.toMax.1 (instHSub.1 (f x) (g x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (g x))))) instOfNatAtLeastTwo.1 ∧ Real.instMin.1 (f x) (g x) = instHDiv.1 (instHSub.1 (instHAdd.1 (f x) (g x)) (SemilatticeSup.toMax.1 (instHSub.1 (f x) (g x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (g x))))) instOfNatAtLeastTwo.1)

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

  ∀ x ∈ A, PointwiseMin f g x ≤ f x ∧ f x ≤ PointwiseMax f g x ∧ PointwiseMin f g x ≤ g x ∧ g x ≤ PointwiseMax f g x

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (A : Real → Prop) (x : Real), Set.instMembership.1 A x → (Real.instLE.1 (Real.instMin.1 (f x) (g x)) (f x) ∧ (Real.instLE.1 (f x) (Real.instMax.1 (f x) (g x)) ∧ (Real.instLE.1 (Real.instMin.1 (f x) (g x)) (g x) ∧ Real.instLE.1 (g x) (Real.instMax.1 (f x) (g x)))))

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

  (x₀ ∈ A ∧ g x₀ = 0) → ¬ (∀ x ∈ A, g x ≠ 0)

Predicate logic (unfolded):

  ∀ (a g : Real → Real) (A : Real → Prop) (x₀ : Real), (Set.instMembership.1 A x₀ ∧ (g x₀ = Zero.toOfNat0.1 ∧ ∀ (x : Real), Set.instMembership.1 A x → g x = Zero.toOfNat0.1 → False)) → False

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
