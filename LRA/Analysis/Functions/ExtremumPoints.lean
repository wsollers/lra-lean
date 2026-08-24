
import Mathlib.Data.Real.Basic
import Mathlib.Order.ConditionallyCompleteLattice.Basic

namespace LRA.Analysis.Functions

/--
`CommonMaximumGivesSumMaximum` TODO

Predicate logic:

  (x₀ ∈ A ∧ ∀ x ∈ A, f x ≤ f x₀ ∧ ∀ x ∈ A, g x ≤ g x₀) → ∀ x ∈ A, f x + g x ≤ f x₀ + g x₀

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (A : Real → Prop) (x₀ : Real), (Set.instMembership.1 A x₀ ∧ (∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f x) (f x₀) ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (g x) (g x₀))) → ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (instHAdd.1 (f x) (g x)) (instHAdd.1 (f x₀) (g x₀))

Logical form (Lean):

```lean
theorem CommonMaximumGivesSumMaximum (f g : ℝ → ℝ) (A : Set ℝ) (x₀ : ℝ)
    (hx₀ : x₀ ∈ A)
    (hf : ∀ x ∈ A, f x ≤ f x₀) (hg : ∀ x ∈ A, g x ≤ g x₀) :
    ∀ x ∈ A, f x + g x ≤ f x₀ + g x₀
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
theorem CommonMaximumGivesSumMaximum (f g : ℝ → ℝ) (A : Set ℝ) (x₀ : ℝ)
    (hx₀ : x₀ ∈ A)
    (hf : ∀ x ∈ A, f x ≤ f x₀) (hg : ∀ x ∈ A, g x ≤ g x₀) :
    ∀ x ∈ A, f x + g x ≤ f x₀ + g x₀ := by
  sorry

/--
`CommonMinimumGivesSumMinimum` TODO

Predicate logic:

  (x₀ ∈ A ∧ ∀ x ∈ A, f x₀ ≤ f x ∧ ∀ x ∈ A, g x₀ ≤ g x) → ∀ x ∈ A, f x₀ + g x₀ ≤ f x + g x

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (A : Real → Prop) (x₀ : Real), (Set.instMembership.1 A x₀ ∧ (∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f x₀) (f x) ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (g x₀) (g x))) → ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (instHAdd.1 (f x₀) (g x₀)) (instHAdd.1 (f x) (g x))

Logical form (Lean):

```lean
theorem CommonMinimumGivesSumMinimum (f g : ℝ → ℝ) (A : Set ℝ) (x₀ : ℝ)
    (hx₀ : x₀ ∈ A)
    (hf : ∀ x ∈ A, f x₀ ≤ f x) (hg : ∀ x ∈ A, g x₀ ≤ g x) :
    ∀ x ∈ A, f x₀ + g x₀ ≤ f x + g x
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
theorem CommonMinimumGivesSumMinimum (f g : ℝ → ℝ) (A : Set ℝ) (x₀ : ℝ)
    (hx₀ : x₀ ∈ A)
    (hf : ∀ x ∈ A, f x₀ ≤ f x) (hg : ∀ x ∈ A, g x₀ ≤ g x) :
    ∀ x ∈ A, f x₀ + g x₀ ≤ f x + g x := by
  sorry

/--
`CommonExtremumConverseFails` TODO

Predicate logic:

  ∃ A ∈ Set ℝ f g ∈ ℝ → ℝ x₀ ∈ ℝ, x₀ ∈ A ∧ (∀ x ∈ A, f x + g x ≤ f x₀ + g x₀) ∧ ¬ (∀ x ∈ A, f x ≤ f x₀)

Predicate logic (unfolded):

  Exists fun A => Exists fun f => Exists fun g => Exists fun x₀ => (Set.instMembership.1 A x₀ ∧ (∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (instHAdd.1 (f x) (g x)) (instHAdd.1 (f x₀) (g x₀)) ∧ (∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f x) (f x₀)) → False))

Logical form (Lean):

```lean
theorem CommonExtremumConverseFails :
    ∃ (A : Set ℝ) (f g : ℝ → ℝ) (x₀ : ℝ), x₀ ∈ A ∧
      (∀ x ∈ A, f x + g x ≤ f x₀ + g x₀) ∧
      ¬ (∀ x ∈ A, f x ≤ f x₀)
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
theorem CommonExtremumConverseFails :
    ∃ (A : Set ℝ) (f g : ℝ → ℝ) (x₀ : ℝ), x₀ ∈ A ∧
      (∀ x ∈ A, f x + g x ≤ f x₀ + g x₀) ∧
      ¬ (∀ x ∈ A, f x ≤ f x₀) := by
  sorry

/--
`FunctionMaximumPoint` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (x₀ : Real), (Set.instMembership.mem A x₀ ∧ ∀ (x : Real), Set.instMembership.mem A x → Real.instLE.le (f x) (f x₀))

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (x₀ : Real), (Set.instMembership.1 A x₀ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f x) (f x₀))

Logical form (Lean):

```lean
def FunctionMaximumPoint (f : ℝ → ℝ) (A : Set ℝ) (x₀ : ℝ) : Prop :=
  x₀ ∈ A ∧ ∀ x ∈ A, f x ≤ f x₀
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def FunctionMaximumPoint (f : ℝ → ℝ) (A : Set ℝ) (x₀ : ℝ) : Prop :=
  x₀ ∈ A ∧ ∀ x ∈ A, f x ≤ f x₀

/--
`MaximumPointCharacterizedBySupremum` TODO

Predicate logic:

  (∀ hA ∈ A.Nonempty), (ℝ → ℝ ∧ x₀ ∈ A ∧ ∃ M, ∀ x ∈ A, f x ≤ M) → FunctionMaximumPoint f A x₀ ↔ IsLUB (f '' A) (f x₀)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (x₀ : Real), (Set.instMembership.1 A x₀ ∧ (Exists fun x => Set.instMembership.1 A x ∧ Exists fun M => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f x) M)) → (Set.instMembership.1 A x₀ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f x) (f x₀)) ↔ (Set.instMembership.1 (fun x => ∀ ⦃a : Real⦄, Set.instMembership.1 (Set.image f A) a → Real.instLE.1 a x) (f x₀) ∧ Set.instMembership.1 (fun x => ∀ ⦃a : Real⦄, Set.instMembership.1 (upperBounds (Set.image f A)) a → Real.instLE.1 x a) (f x₀))

Logical form (Lean):

```lean
theorem MaximumPointCharacterizedBySupremum (f : ℝ → ℝ) (A : Set ℝ) (x₀ : ℝ)
    (hx₀ : x₀ ∈ A) (hA : A.Nonempty) (hbdd : ∃ M, ∀ x ∈ A, f x ≤ M) :
    FunctionMaximumPoint f A x₀ ↔ IsLUB (f '' A) (f x₀)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, use, rcases

-/
theorem MaximumPointCharacterizedBySupremum (f : ℝ → ℝ) (A : Set ℝ) (x₀ : ℝ)
    (hx₀ : x₀ ∈ A) (hA : A.Nonempty) (hbdd : ∃ M, ∀ x ∈ A, f x ≤ M) :
    FunctionMaximumPoint f A x₀ ↔ IsLUB (f '' A) (f x₀) := by
  sorry

/--
`FunctionMinimumPoint` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (x₀ : Real), (Set.instMembership.mem A x₀ ∧ ∀ (x : Real), Set.instMembership.mem A x → Real.instLE.le (f x₀) (f x))

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (x₀ : Real), (Set.instMembership.1 A x₀ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f x₀) (f x))

Logical form (Lean):

```lean
def FunctionMinimumPoint (f : ℝ → ℝ) (A : Set ℝ) (x₀ : ℝ) : Prop :=
  x₀ ∈ A ∧ ∀ x ∈ A, f x₀ ≤ f x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def FunctionMinimumPoint (f : ℝ → ℝ) (A : Set ℝ) (x₀ : ℝ) : Prop :=
  x₀ ∈ A ∧ ∀ x ∈ A, f x₀ ≤ f x

/--
`MinimumPointCharacterizedByInfimum` TODO

Predicate logic:

  (∀ hA ∈ A.Nonempty), (ℝ → ℝ ∧ x₀ ∈ A ∧ ∃ m, ∀ x ∈ A, m ≤ f x) → FunctionMinimumPoint f A x₀ ↔ IsGLB (f '' A) (f x₀)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (x₀ : Real), (Set.instMembership.1 A x₀ ∧ (Exists fun x => Set.instMembership.1 A x ∧ Exists fun m => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 m (f x))) → (Set.instMembership.1 A x₀ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f x₀) (f x)) ↔ (Set.instMembership.1 (fun x => ∀ ⦃a : Real⦄, Set.instMembership.1 (Set.image f A) a → Real.instLE.1 x a) (f x₀) ∧ Set.instMembership.1 (fun x => ∀ ⦃a : Real⦄, Set.instMembership.1 (lowerBounds (Set.image f A)) a → Real.instLE.1 a x) (f x₀))

Logical form (Lean):

```lean
theorem MinimumPointCharacterizedByInfimum (f : ℝ → ℝ) (A : Set ℝ) (x₀ : ℝ)
    (hx₀ : x₀ ∈ A) (hA : A.Nonempty) (hbdd : ∃ m, ∀ x ∈ A, m ≤ f x) :
    FunctionMinimumPoint f A x₀ ↔ IsGLB (f '' A) (f x₀)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, use, rcases

-/
theorem MinimumPointCharacterizedByInfimum (f : ℝ → ℝ) (A : Set ℝ) (x₀ : ℝ)
    (hx₀ : x₀ ∈ A) (hA : A.Nonempty) (hbdd : ∃ m, ∀ x ∈ A, m ≤ f x) :
    FunctionMinimumPoint f A x₀ ↔ IsGLB (f '' A) (f x₀) := by
  sorry

/--
`FunctionExtremumValuesAreUnique` TODO

Predicate logic:

  (ℝ → ℝ) → f x₁ = f x₂

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (x₁ x₂ : Real), ((Set.instMembership.1 A x₁ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f x) (f x₁)) ∧ (Set.instMembership.1 A x₂ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f x) (f x₂))) → f x₁ = f x₂

Logical form (Lean):

```lean
theorem FunctionExtremumValuesAreUnique (f : ℝ → ℝ) (A : Set ℝ)
    (x₁ x₂ : ℝ) (h₁ : FunctionMaximumPoint f A x₁)
    (h₂ : FunctionMaximumPoint f A x₂) : f x₁ = f x₂
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
theorem FunctionExtremumValuesAreUnique (f : ℝ → ℝ) (A : Set ℝ)
    (x₁ x₂ : ℝ) (h₁ : FunctionMaximumPoint f A x₁)
    (h₂ : FunctionMaximumPoint f A x₂) : f x₁ = f x₂ := by
  sorry

end LRA.Analysis.Functions
