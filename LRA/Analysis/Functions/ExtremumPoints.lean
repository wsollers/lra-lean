
import Mathlib.Data.Real.Basic
import Mathlib.Order.ConditionallyCompleteLattice.Basic

namespace LRA.Analysis.Functions

/--
`CommonMaximumGivesSumMaximum` TODO

Predicate logic:

  ∀ (f g : Real → Real) (A : Set Real) (x₀ : Real), (x₀ ∈ A ∧ ((∀ (x : Real), x ∈ A → Real.instLE.le (f x) (f x₀)) ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (g x) (g x₀)))) → ∀ (x : Real), x ∈ A → Real.instLE.le (instHAdd.hAdd (f x) (g x)) (instHAdd.hAdd (f x₀) (g x₀))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    x₀ : ℝ
  Prove
    (x₀ ∈ A ∧ ((∀ (x : Real), x ∈ A → Real.instLE.le (f x) (f x₀)) ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (g x) (g x₀)))) → ∀ (x : Real), x ∈ A → Real.instLE.le ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (f x) (g x)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (f x₀) (g x₀))

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

  ∀ (f g : Real → Real) (A : Set Real) (x₀ : Real), (x₀ ∈ A ∧ ((∀ (x : Real), x ∈ A → Real.instLE.le (f x₀) (f x)) ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (g x₀) (g x)))) → ∀ (x : Real), x ∈ A → Real.instLE.le (instHAdd.hAdd (f x₀) (g x₀)) (instHAdd.hAdd (f x) (g x))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    x₀ : ℝ
  Prove
    (x₀ ∈ A ∧ ((∀ (x : Real), x ∈ A → Real.instLE.le (f x₀) (f x)) ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (g x₀) (g x)))) → ∀ (x : Real), x ∈ A → Real.instLE.le ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (f x₀) (g x₀)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (f x) (g x))

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

  Exists fun A => Exists fun f => Exists fun g => Exists fun x₀ => (x₀ ∈ A ∧ ((∀ (x : Real), x ∈ A → Real.instLE.le (instHAdd.hAdd (f x) (g x)) (instHAdd.hAdd (f x₀) (g x₀))) ∧ (¬ ∀ (x : Real), x ∈ A → Real.instLE.le (f x) (f x₀))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun A => Exists fun f => Exists fun g => Exists fun x₀ => (x₀ ∈ A ∧ ((∀ (x : Real), x ∈ A → Real.instLE.le ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (f x) (g x)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (f x₀) (g x₀))) ∧ ((∀ (x : Real), x ∈ A → Real.instLE.le (f x) (f x₀)) → False)))

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

  ∀ (f : Real → Real) (A : Set Real) (x₀ : Real), (x₀ ∈ A ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (f x) (f x₀)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (x₀ ∈ A ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (f x) (f x₀)))

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

  ∀ (f : Real → Real) (A : Set Real) (x₀ : Real), (x₀ ∈ A ∧ (A.Nonempty ∧ (Exists fun M => ∀ (x : Real), x ∈ A → Real.instLE.le (f x) M))) → LRA.Analysis.Functions.FunctionMaximumPoint f A x₀ ↔ IsLUB (Set.image f A) (f x₀)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    x₀ : ℝ
    hA : A.Nonempty
  Prove
    (x₀ ∈ A ∧ (A.Nonempty ∧ (Exists fun M => ∀ (x : Real), x ∈ A → Real.instLE.le (f x) M))) → LRA.Analysis.Functions.FunctionMaximumPoint f A x₀ ↔ IsLUB (Set.image f A) (f x₀)

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

  ∀ (f : Real → Real) (A : Set Real) (x₀ : Real), (x₀ ∈ A ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (f x₀) (f x)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (x₀ ∈ A ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (f x₀) (f x)))

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

  ∀ (f : Real → Real) (A : Set Real) (x₀ : Real), (x₀ ∈ A ∧ (A.Nonempty ∧ (Exists fun m => ∀ (x : Real), x ∈ A → Real.instLE.le m (f x)))) → LRA.Analysis.Functions.FunctionMinimumPoint f A x₀ ↔ IsGLB (Set.image f A) (f x₀)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    x₀ : ℝ
    hA : A.Nonempty
  Prove
    (x₀ ∈ A ∧ (A.Nonempty ∧ (Exists fun m => ∀ (x : Real), x ∈ A → Real.instLE.le m (f x)))) → LRA.Analysis.Functions.FunctionMinimumPoint f A x₀ ↔ IsGLB (Set.image f A) (f x₀)

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

  ∀ (f : Real → Real) (A : Set Real) (x₁ x₂ : Real), (LRA.Analysis.Functions.FunctionMaximumPoint f A x₁ ∧ LRA.Analysis.Functions.FunctionMaximumPoint f A x₂) → f x₁ = f x₂

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    x₁ x₂ : ℝ
    h₁ : FunctionMaximumPoint f A x₁
    h₂ : FunctionMaximumPoint f A x₂
  Prove
    ((x₁ ∈ A ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (f x) (f x₁))) ∧ (x₂ ∈ A ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (f x) (f x₂)))) → f x₁ = f x₂

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
