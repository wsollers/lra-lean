import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import LRA.Analysis.Bounds.Extrema.SupremaInfima
import LRA.Analysis.Completeness.NestedIntervalProperty.Definition

namespace LRA.Analysis.Completeness

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

variable (a b : ℕ → ℝ)

/--
`NestedClosedIntervalsHaveOrderedEndpoints` TODO

Predicate logic:

  ∀ (a b : Nat → Real), ((∀ (n : Nat), Real.instLE.le (a n) (b n)) ∧ (∀ (n : Nat), Set.instLE.le (Set.Icc (a (instHAdd.hAdd n 1)) (b (instHAdd.hAdd n 1))) (Set.Icc (a n) (b n)))) → ∀ {m n : Nat}, instLENat.le n m → (Real.instLE.le (a n) (a m) ∧ (Real.instLE.le (a m) (b m) ∧ Real.instLE.le (b m) (b n)))

Predicate logic (unfolded):

  Ambient
    (ℕ, ℝ)
  Objects
    a b : ℕ → ℝ
    m n : ℕ
  Prove
    ((∀ (n : Nat), Real.instLE.le (a n) (b n)) ∧ (∀ (n : Nat), { le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun x => (Real.instPreorder.1.le (a ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) x ∧ Real.instPreorder.1.le x (b ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)))) fun x => (Real.instPreorder.1.le (a n) x ∧ Real.instPreorder.1.le x (b n)))) → ∀ {m n : Nat}, instLENat.le n m → (Real.instLE.le (a n) (a m) ∧ (Real.instLE.le (a m) (b m) ∧ Real.instLE.le (b m) (b n)))

Logical form (Lean):

```lean
theorem NestedClosedIntervalsHaveOrderedEndpoints
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {m n : ℕ}
    (indexOrderHypothesis : n ≤ m) :
    a n ≤ a m ∧ a m ≤ b m ∧ b m ≤ b n
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
theorem NestedClosedIntervalsHaveOrderedEndpoints
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {m n : ℕ}
    (indexOrderHypothesis : n ≤ m) :
    a n ≤ a m ∧ a m ≤ b m ∧ b m ≤ b n := by
  sorry
/--
`LeftEndpointsOfNestedIntervalsIncrease` TODO

Predicate logic:

  ∀ (a b : Nat → Real), ((∀ (n : Nat), Real.instLE.le (a n) (b n)) ∧ (∀ (n : Nat), Set.instLE.le (Set.Icc (a (instHAdd.hAdd n 1)) (b (instHAdd.hAdd n 1))) (Set.Icc (a n) (b n)))) → ∀ (n : Nat), Real.instLE.le (a n) (a (instHAdd.hAdd n 1))

Predicate logic (unfolded):

  Ambient
    (ℕ, ℝ)
  Objects
    a b : ℕ → ℝ
  Prove
    ((∀ (n : Nat), Real.instLE.le (a n) (b n)) ∧ (∀ (n : Nat), { le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun x => (Real.instPreorder.1.le (a ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) x ∧ Real.instPreorder.1.le x (b ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)))) fun x => (Real.instPreorder.1.le (a n) x ∧ Real.instPreorder.1.le x (b n)))) → ∀ (n : Nat), Real.instLE.le (a n) (a ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1))

Logical form (Lean):

```lean
theorem LeftEndpointsOfNestedIntervalsIncrease
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)) :
    ∀ n, a n ≤ a (n + 1)
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
theorem LeftEndpointsOfNestedIntervalsIncrease
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)) :
    ∀ n, a n ≤ a (n + 1) := by
  sorry
/--
`RightEndpointsOfNestedIntervalsDecrease` TODO

Predicate logic:

  ∀ (a b : Nat → Real), ((∀ (n : Nat), Real.instLE.le (a n) (b n)) ∧ (∀ (n : Nat), Set.instLE.le (Set.Icc (a (instHAdd.hAdd n 1)) (b (instHAdd.hAdd n 1))) (Set.Icc (a n) (b n)))) → ∀ (n : Nat), Real.instLE.le (b (instHAdd.hAdd n 1)) (b n)

Predicate logic (unfolded):

  Ambient
    (ℕ, ℝ)
  Objects
    a b : ℕ → ℝ
  Prove
    ((∀ (n : Nat), Real.instLE.le (a n) (b n)) ∧ (∀ (n : Nat), { le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun x => (Real.instPreorder.1.le (a ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) x ∧ Real.instPreorder.1.le x (b ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)))) fun x => (Real.instPreorder.1.le (a n) x ∧ Real.instPreorder.1.le x (b n)))) → ∀ (n : Nat), Real.instLE.le (b ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) (b n)

Logical form (Lean):

```lean
theorem RightEndpointsOfNestedIntervalsDecrease
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)) :
    ∀ n, b (n + 1) ≤ b n
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
theorem RightEndpointsOfNestedIntervalsDecrease
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)) :
    ∀ n, b (n + 1) ≤ b n := by
  sorry
/--
`LeftEndpointsAreBoundedAboveByRightEndpoints` TODO

Predicate logic:

  ∀ (a b : Nat → Real), ((∀ (n : Nat), Real.instLE.le (a n) (b n)) ∧ (∀ (n : Nat), Set.instLE.le (Set.Icc (a (instHAdd.hAdd n 1)) (b (instHAdd.hAdd n 1))) (Set.Icc (a n) (b n)))) → ∀ (m n : Nat), Real.instLE.le (a n) (b m)

Predicate logic (unfolded):

  Ambient
    (ℕ, ℝ)
  Objects
    a b : ℕ → ℝ
  Prove
    ((∀ (n : Nat), Real.instLE.le (a n) (b n)) ∧ (∀ (n : Nat), { le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun x => (Real.instPreorder.1.le (a ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) x ∧ Real.instPreorder.1.le x (b ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)))) fun x => (Real.instPreorder.1.le (a n) x ∧ Real.instPreorder.1.le x (b n)))) → ∀ (m n : Nat), Real.instLE.le (a n) (b m)

Logical form (Lean):

```lean
theorem LeftEndpointsAreBoundedAboveByRightEndpoints
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)) :
    ∀ m n, a n ≤ b m
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
theorem LeftEndpointsAreBoundedAboveByRightEndpoints
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)) :
    ∀ m n, a n ≤ b m := by
  sorry
/--
`EndpointSupremumLeEndpointInfimum` TODO

Predicate logic:

  ∀ (a b : Nat → Real), ((∀ (n : Nat), Real.instLE.le (a n) (b n)) ∧ (∀ (n : Nat), Set.instLE.le (Set.Icc (a (instHAdd.hAdd n 1)) (b (instHAdd.hAdd n 1))) (Set.Icc (a n) (b n)))) → ∀ {leftEndpointLimit rightEndpointLimit : Real}, (LRA.Analysis.Bounds.IsSupremum leftEndpointLimit (Set.range a) ∧ LRA.Analysis.Bounds.IsInfimum rightEndpointLimit (Set.range b)) → Real.instLE.le leftEndpointLimit rightEndpointLimit

Predicate logic (unfolded):

  Ambient
    (ℕ, ℝ)
  Objects
    a b : ℕ → ℝ
    leftEndpointLimit rightEndpointLimit : ℝ
  Prove
    ((∀ (n : Nat), Real.instLE.le (a n) (b n)) ∧ (∀ (n : Nat), { le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun x => (Real.instPreorder.1.le (a ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) x ∧ Real.instPreorder.1.le x (b ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)))) fun x => (Real.instPreorder.1.le (a n) x ∧ Real.instPreorder.1.le x (b n)))) → ∀ {leftEndpointLimit rightEndpointLimit : Real}, (((∀ (x : Real), x ∈ fun x => Exists fun y => a y = x → Real.instPreorder.1.le x leftEndpointLimit) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ fun x => Exists fun y => a y = x → Real.instPreorder.1.le x u) → Real.instPreorder.1.le leftEndpointLimit u)) ∧ ((∀ (x : Real), x ∈ fun x => Exists fun y => b y = x → Real.instPreorder.1.le rightEndpointLimit x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ fun x => Exists fun y => b y = x → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l rightEndpointLimit))) → Real.instLE.le leftEndpointLimit rightEndpointLimit

Logical form (Lean):

```lean
theorem EndpointSupremumLeEndpointInfimum
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {leftEndpointLimit rightEndpointLimit : ℝ}
    (leftSupremumHypothesis : IsSupremum leftEndpointLimit (Set.range a))
    (rightInfimumHypothesis : IsInfimum rightEndpointLimit (Set.range b)) :
    leftEndpointLimit ≤ rightEndpointLimit
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
theorem EndpointSupremumLeEndpointInfimum
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {leftEndpointLimit rightEndpointLimit : ℝ}
    (leftSupremumHypothesis : IsSupremum leftEndpointLimit (Set.range a))
    (rightInfimumHypothesis : IsInfimum rightEndpointLimit (Set.range b)) :
    leftEndpointLimit ≤ rightEndpointLimit := by
  sorry
/--
`NestedIntervalTheorem` TODO

Predicate logic:

  ∀ (a b : Nat → Real), ((∀ (n : Nat), Real.instLE.le (a n) (b n)) ∧ (∀ (n : Nat), Set.instLE.le (Set.Icc (a (instHAdd.hAdd n 1)) (b (instHAdd.hAdd n 1))) (Set.Icc (a n) (b n)))) → ∀ {leftEndpointLimit rightEndpointLimit : Real}, (LRA.Analysis.Bounds.IsSupremum leftEndpointLimit (Set.range a) ∧ LRA.Analysis.Bounds.IsInfimum rightEndpointLimit (Set.range b)) → (Real.instLE.le leftEndpointLimit rightEndpointLimit ∧ (Set.iInter fun n => Set.Icc (a n) (b n) ∧ .Nonempty) (Exists fun x => ∀ (n : Nat), (Real.instLE.le (a n) x ∧ Real.instLE.le x (b n))))

Predicate logic (unfolded):

  Ambient
    (ℕ, ℝ)
  Objects
    a b : ℕ → ℝ
    leftEndpointLimit rightEndpointLimit : ℝ
  Prove
    ((∀ (n : Nat), Real.instLE.le (a n) (b n)) ∧ (∀ (n : Nat), { le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun x => (Real.instPreorder.1.le (a ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) x ∧ Real.instPreorder.1.le x (b ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)))) fun x => (Real.instPreorder.1.le (a n) x ∧ Real.instPreorder.1.le x (b n)))) → ∀ {leftEndpointLimit rightEndpointLimit : Real}, (((∀ (x : Real), x ∈ fun x => Exists fun y => a y = x → Real.instPreorder.1.le x leftEndpointLimit) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ fun x => Exists fun y => a y = x → Real.instPreorder.1.le x u) → Real.instPreorder.1.le leftEndpointLimit u)) ∧ ((∀ (x : Real), x ∈ fun x => Exists fun y => b y = x → Real.instPreorder.1.le rightEndpointLimit x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ fun x => Exists fun y => b y = x → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l rightEndpointLimit))) → (Real.instLE.le leftEndpointLimit rightEndpointLimit ∧ (Exists fun x => x ∈ Set.instInfSet.1 (setOf fun x => Exists fun y => (fun n => Set.Icc (a n) (b n)) y = x) ∧ (Exists fun x => ∀ (n : Nat), (Real.instLE.le (a n) x ∧ Real.instLE.le x (b n)))))

Logical form (Lean):

```lean
theorem NestedIntervalTheorem
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {leftEndpointLimit rightEndpointLimit : ℝ}
    (leftSupremumHypothesis : IsSupremum leftEndpointLimit (Set.range a))
    (rightInfimumHypothesis : IsInfimum rightEndpointLimit (Set.range b)) :
    leftEndpointLimit ≤ rightEndpointLimit ∧
      (⋂ n, Set.Icc (a n) (b n)).Nonempty ∧
        ∃ x : ℝ, ∀ n, a n ≤ x ∧ x ≤ b n
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
theorem NestedIntervalTheorem
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {leftEndpointLimit rightEndpointLimit : ℝ}
    (leftSupremumHypothesis : IsSupremum leftEndpointLimit (Set.range a))
    (rightInfimumHypothesis : IsInfimum rightEndpointLimit (Set.range b)) :
    leftEndpointLimit ≤ rightEndpointLimit ∧
      (⋂ n, Set.Icc (a n) (b n)).Nonempty ∧
        ∃ x : ℝ, ∀ n, a n ≤ x ∧ x ≤ b n := by
  sorry
/--
`NestedIntervalIntersectionContainsEndpointSupremum` TODO

Predicate logic:

  ∀ (a b : Nat → Real), ((∀ (n : Nat), Real.instLE.le (a n) (b n)) ∧ (∀ (n : Nat), Set.instLE.le (Set.Icc (a (instHAdd.hAdd n 1)) (b (instHAdd.hAdd n 1))) (Set.Icc (a n) (b n)))) → ∀ {leftEndpointLimit : Real}, LRA.Analysis.Bounds.IsSupremum leftEndpointLimit (Set.range a) → ((∀ (n : Nat), (Real.instLE.le (a n) leftEndpointLimit ∧ Real.instLE.le leftEndpointLimit (b n))) ∧ leftEndpointLimit ∈ Set.iInter fun n => Set.Icc (a n) (b n))

Predicate logic (unfolded):

  Ambient
    (ℕ, ℝ)
  Objects
    a b : ℕ → ℝ
    leftEndpointLimit : ℝ
  Prove
    ((∀ (n : Nat), Real.instLE.le (a n) (b n)) ∧ (∀ (n : Nat), { le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun x => (Real.instPreorder.1.le (a ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) x ∧ Real.instPreorder.1.le x (b ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)))) fun x => (Real.instPreorder.1.le (a n) x ∧ Real.instPreorder.1.le x (b n)))) → ∀ {leftEndpointLimit : Real}, ((∀ (x : Real), x ∈ fun x => Exists fun y => a y = x → Real.instPreorder.1.le x leftEndpointLimit) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ fun x => Exists fun y => a y = x → Real.instPreorder.1.le x u) → Real.instPreorder.1.le leftEndpointLimit u)) → ((∀ (n : Nat), (Real.instLE.le (a n) leftEndpointLimit ∧ Real.instLE.le leftEndpointLimit (b n))) ∧ leftEndpointLimit ∈ Set.instInfSet.1 fun x => Exists fun y => (fun n => Set.Icc (a n) (b n)) y = x)

Logical form (Lean):

```lean
theorem NestedIntervalIntersectionContainsEndpointSupremum
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {leftEndpointLimit : ℝ}
    (leftSupremumHypothesis : IsSupremum leftEndpointLimit (Set.range a)) :
    (∀ n, a n ≤ leftEndpointLimit ∧ leftEndpointLimit ≤ b n) ∧
      leftEndpointLimit ∈ ⋂ n, Set.Icc (a n) (b n)
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
theorem NestedIntervalIntersectionContainsEndpointSupremum
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {leftEndpointLimit : ℝ}
    (leftSupremumHypothesis : IsSupremum leftEndpointLimit (Set.range a)) :
    (∀ n, a n ≤ leftEndpointLimit ∧ leftEndpointLimit ≤ b n) ∧
      leftEndpointLimit ∈ ⋂ n, Set.Icc (a n) (b n) := by
  sorry
/--
`NestedIntervalIntersectionContainsEndpointInfimum` TODO

Predicate logic:

  ∀ (a b : Nat → Real), ((∀ (n : Nat), Real.instLE.le (a n) (b n)) ∧ (∀ (n : Nat), Set.instLE.le (Set.Icc (a (instHAdd.hAdd n 1)) (b (instHAdd.hAdd n 1))) (Set.Icc (a n) (b n)))) → ∀ {rightEndpointLimit : Real}, LRA.Analysis.Bounds.IsInfimum rightEndpointLimit (Set.range b) → ((∀ (n : Nat), (Real.instLE.le (a n) rightEndpointLimit ∧ Real.instLE.le rightEndpointLimit (b n))) ∧ rightEndpointLimit ∈ Set.iInter fun n => Set.Icc (a n) (b n))

Predicate logic (unfolded):

  Ambient
    (ℕ, ℝ)
  Objects
    a b : ℕ → ℝ
    rightEndpointLimit : ℝ
  Prove
    ((∀ (n : Nat), Real.instLE.le (a n) (b n)) ∧ (∀ (n : Nat), { le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun x => (Real.instPreorder.1.le (a ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) x ∧ Real.instPreorder.1.le x (b ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)))) fun x => (Real.instPreorder.1.le (a n) x ∧ Real.instPreorder.1.le x (b n)))) → ∀ {rightEndpointLimit : Real}, ((∀ (x : Real), x ∈ fun x => Exists fun y => b y = x → Real.instPreorder.1.le rightEndpointLimit x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ fun x => Exists fun y => b y = x → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l rightEndpointLimit)) → ((∀ (n : Nat), (Real.instLE.le (a n) rightEndpointLimit ∧ Real.instLE.le rightEndpointLimit (b n))) ∧ rightEndpointLimit ∈ Set.instInfSet.1 fun x => Exists fun y => (fun n => Set.Icc (a n) (b n)) y = x)

Logical form (Lean):

```lean
theorem NestedIntervalIntersectionContainsEndpointInfimum
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {rightEndpointLimit : ℝ}
    (rightInfimumHypothesis : IsInfimum rightEndpointLimit (Set.range b)) :
    (∀ n, a n ≤ rightEndpointLimit ∧ rightEndpointLimit ≤ b n) ∧
      rightEndpointLimit ∈ ⋂ n, Set.Icc (a n) (b n)
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
theorem NestedIntervalIntersectionContainsEndpointInfimum
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {rightEndpointLimit : ℝ}
    (rightInfimumHypothesis : IsInfimum rightEndpointLimit (Set.range b)) :
    (∀ n, a n ≤ rightEndpointLimit ∧ rightEndpointLimit ≤ b n) ∧
      rightEndpointLimit ∈ ⋂ n, Set.Icc (a n) (b n) := by
  sorry
/--
`NestedIntervalsWithVanishingLengthHaveUniquePoint` TODO

Predicate logic:

  ∀ (a b : Nat → Real), ((∀ (n : Nat), Real.instLE.le (a n) (b n)) ∧ ((∀ (n : Nat), Set.instLE.le (Set.Icc (a (instHAdd.hAdd n 1)) (b (instHAdd.hAdd n 1))) (Set.Icc (a n) (b n))) ∧ (∀ (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (n : Nat), GE.ge n N → (Real.instLE.le 0 (instHSub.hSub (b n) (a n)) ∧ Real.instLT.lt (instHSub.hSub (b n) (a n)) ε)))) → ExistsUnique fun x => ((∀ (n : Nat), (Real.instLE.le (a n) x ∧ Real.instLE.le x (b n))) ∧ (LRA.Analysis.Bounds.IsSupremum x (Set.range a) ∧ LRA.Analysis.Bounds.IsInfimum x (Set.range b)))

Predicate logic (unfolded):

  Ambient
    (ℕ, ℝ)
  Objects
    a b : ℕ → ℝ
  Prove
    ((∀ (n : Nat), Real.instLE.le (a n) (b n)) ∧ ((∀ (n : Nat), { le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun x => (Real.instPreorder.1.le (a ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) x ∧ Real.instPreorder.1.le x (b ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)))) fun x => (Real.instPreorder.1.le (a n) x ∧ Real.instPreorder.1.le x (b n))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → (Real.instLE.le 0 ({ hSub := fun a b => Real.instSub.sub a b }.hSub (b n) (a n)) ∧ Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub (b n) (a n)) ε)))) → Exists fun x => (((fun x => ((∀ (n : Nat), (Real.instLE.le (a n) x ∧ Real.instLE.le x (b n))) ∧ (((∀ (x_1 : Real), x_1 ∈ fun x => Exists fun y => a y = x → Real.instPreorder.1.le x_1 x) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ fun x => Exists fun y => a y = x → Real.instPreorder.1.le x u) → Real.instPreorder.1.le x u)) ∧ ((∀ (x_1 : Real), x_1 ∈ fun x => Exists fun y => b y = x → Real.instPreorder.1.le x x_1) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ fun x => Exists fun y => b y = x → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l x))))) x) ∧ (∀ (y : Real), ((∀ (n : Nat), (Real.instLE.le (a n) y ∧ Real.instLE.le y (b n))) ∧ (((∀ (x : Real), x ∈ fun x => Exists fun y => a y = x → Real.instPreorder.1.le x y) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ fun x => Exists fun y => a y = x → Real.instPreorder.1.le x u) → Real.instPreorder.1.le y u)) ∧ ((∀ (x : Real), x ∈ fun x => Exists fun y => b y = x → Real.instPreorder.1.le y x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ fun x => Exists fun y => b y = x → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l y)))) → y = x))

Logical form (Lean):

```lean
theorem NestedIntervalsWithVanishingLengthHaveUniquePoint
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    (vanishingLengthHypothesis :
      ∀ ε > 0, ∃ N, ∀ n ≥ N, 0 ≤ b n - a n ∧ b n - a n < ε) :
    ∃! x : ℝ, (∀ n, a n ≤ x ∧ x ≤ b n) ∧
      IsSupremum x (Set.range a) ∧ IsInfimum x (Set.range b)
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
theorem NestedIntervalsWithVanishingLengthHaveUniquePoint
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    (vanishingLengthHypothesis :
      ∀ ε > 0, ∃ N, ∀ n ≥ N, 0 ≤ b n - a n ∧ b n - a n < ε) :
    ∃! x : ℝ, (∀ n, a n ≤ x ∧ x ≤ b n) ∧
      IsSupremum x (Set.range a) ∧ IsInfimum x (Set.range b) := by
  sorry
/--
`NestedIntervalsWithVanishingLengthHaveEqualEndpointLimits` TODO

Predicate logic:

  ∀ (a b : Nat → Real), ((∀ (n : Nat), Real.instLE.le (a n) (b n)) ∧ ((∀ (n : Nat), Set.instLE.le (Set.Icc (a (instHAdd.hAdd n 1)) (b (instHAdd.hAdd n 1))) (Set.Icc (a n) (b n))) ∧ (∀ (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt (instHSub.hSub (b n) (a n)) ε))) → Exists fun x => (Filter.Tendsto a Filter.atTop (nhds x) ∧ Filter.Tendsto b Filter.atTop (nhds x))

Predicate logic (unfolded):

  Ambient
    (ℕ, ℝ)
  Objects
    a b : ℕ → ℝ
  Prove
    ((∀ (n : Nat), Real.instLE.le (a n) (b n)) ∧ ((∀ (n : Nat), { le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun x => (Real.instPreorder.1.le (a ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) x ∧ Real.instPreorder.1.le x (b ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)))) fun x => (Real.instPreorder.1.le (a n) x ∧ Real.instPreorder.1.le x (b n))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub (b n) (a n)) ε))) → Exists fun x => (Filter.instPartialOrder.toPreorder.1.le { sets := fun x => setOf fun x_1 => a x_1 ∈ x ∈ Filter.atTop.1, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds x) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := fun x => setOf fun x_1 => b x_1 ∈ x ∈ Filter.atTop.1, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds x))

Logical form (Lean):

```lean
theorem NestedIntervalsWithVanishingLengthHaveEqualEndpointLimits
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    (vanishingLengthHypothesis : ∀ ε > 0, ∃ N, ∀ n ≥ N, b n - a n < ε) :
    ∃ x : ℝ, Filter.Tendsto a Filter.atTop (nhds x) ∧
      Filter.Tendsto b Filter.atTop (nhds x)
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
theorem NestedIntervalsWithVanishingLengthHaveEqualEndpointLimits
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    (vanishingLengthHypothesis : ∀ ε > 0, ∃ N, ∀ n ≥ N, b n - a n < ε) :
    ∃ x : ℝ, Filter.Tendsto a Filter.atTop (nhds x) ∧
      Filter.Tendsto b Filter.atTop (nhds x) := by
  sorry
/--
`UniquePointInNestedIntervalsIsEndpointLimit` TODO

Predicate logic:

  ∀ (a b : Nat → Real), ((∀ (n : Nat), Real.instLE.le (a n) (b n)) ∧ (∀ (n : Nat), Set.instLE.le (Set.Icc (a (instHAdd.hAdd n 1)) (b (instHAdd.hAdd n 1))) (Set.Icc (a n) (b n)))) → ∀ {x : Real}, Set.iInter fun n => Set.Icc (a n) (b n) = Set.instSingletonSet.singleton x → (Filter.Tendsto a Filter.atTop (nhds x) ∧ Filter.Tendsto b Filter.atTop (nhds x))

Predicate logic (unfolded):

  Ambient
    (ℕ, ℝ)
  Objects
    a b : ℕ → ℝ
    x : ℝ
  Prove
    ((∀ (n : Nat), Real.instLE.le (a n) (b n)) ∧ (∀ (n : Nat), { le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun x => (Real.instPreorder.1.le (a ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) x ∧ Real.instPreorder.1.le x (b ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)))) fun x => (Real.instPreorder.1.le (a n) x ∧ Real.instPreorder.1.le x (b n)))) → ∀ {x : Real}, Set.instInfSet.1 fun x => Exists fun y => (fun n => setOf fun x => (Real.instPreorder.le (a n) x ∧ Real.instPreorder.le x (b n))) y = x = Set.instSingletonSet.1 x → (Filter.instPartialOrder.toPreorder.1.le { sets := fun x => setOf fun x_1 => a x_1 ∈ x ∈ Filter.atTop.1, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds x) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := fun x => setOf fun x_1 => b x_1 ∈ x ∈ Filter.atTop.1, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds x))

Logical form (Lean):

```lean
theorem UniquePointInNestedIntervalsIsEndpointLimit
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {x : ℝ}
    (singletonIntersectionHypothesis : (⋂ n, Set.Icc (a n) (b n)) = {x}) :
    Filter.Tendsto a Filter.atTop (nhds x) ∧
      Filter.Tendsto b Filter.atTop (nhds x)
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
theorem UniquePointInNestedIntervalsIsEndpointLimit
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {x : ℝ}
    (singletonIntersectionHypothesis : (⋂ n, Set.Icc (a n) (b n)) = {x}) :
    Filter.Tendsto a Filter.atTop (nhds x) ∧
      Filter.Tendsto b Filter.atTop (nhds x) := by
  sorry
/--
`IsNestedClosedIntervalFamilyIffMonotoneAntitone` TODO

Predicate logic:

  ∀ (a b : Nat → Real), LRA.Analysis.Completeness.IsNestedClosedIntervalFamily a b ↔ (Monotone a ∧ (Antitone b ∧ (∀ (n : Nat), Real.instLE.le (a n) (b n))))

Predicate logic (unfolded):

  Ambient
    (ℕ, ℝ)
  Objects
    a b : ℕ → ℝ
    a b : ℕ → ℝ
  Prove
    LRA.Analysis.Completeness.IsNestedClosedIntervalFamily a b ↔ (Monotone a ∧ (Antitone b ∧ (∀ (n : Nat), Real.instLE.le (a n) (b n))))

Logical form (Lean):

```lean
theorem IsNestedClosedIntervalFamilyIffMonotoneAntitone (a b : ℕ → ℝ) :
    IsNestedClosedIntervalFamily a b ↔ Monotone a ∧ Antitone b ∧ ∀ n, a n ≤ b n
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
theorem IsNestedClosedIntervalFamilyIffMonotoneAntitone (a b : ℕ → ℝ) :
    IsNestedClosedIntervalFamily a b ↔ Monotone a ∧ Antitone b ∧ ∀ n, a n ≤ b n := by
  sorry
/--
`RealsSatisfyNestedIntervalProperty` TODO

Predicate logic:

  LRA.Analysis.Completeness.NestedIntervalProperty Real

Predicate logic (unfolded):

  Ambient
    (ℕ, ℝ)
  Objects
    a b : ℕ → ℝ
  Prove
    ((∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.1.le a_1 b → Real.instPreorder.1.le (a a_1) (a b)) ∧ ((∀ ⦃a b_1 : Nat⦄, Nat.instPreorder.1.le a b_1 → Real.instPreorder.1.le (b b_1) (b a)) ∧ (∀ (n : Nat), Real.instPreorder.1.le (a n) (b n)))) → Exists fun x => ∀ (n : Nat), (Real.instPreorder.1.le (a n) x ∧ Real.instPreorder.1.le x (b n))

Logical form (Lean):

```lean
theorem RealsSatisfyNestedIntervalProperty : NestedIntervalProperty ℝ
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
theorem RealsSatisfyNestedIntervalProperty : NestedIntervalProperty ℝ := by
  sorry
end LRA.Analysis.Completeness
