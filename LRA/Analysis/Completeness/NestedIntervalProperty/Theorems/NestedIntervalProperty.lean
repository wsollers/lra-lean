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

  (∀ n, a n ≤ b n ∧ ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n) ∧ n ≤ m) → a n ≤ a m ∧ a m ≤ b m ∧ b m ≤ b n

Predicate logic (unfolded):

  ∀ (a b : Nat → Real), (∀ (n : Nat), Real.instLE.1 (a n) (b n) ∧ ∀ (n : Nat), Set.instLE.1 (fun x => (Real.instPreorder.toLE.1 (a (instHAdd.1 n (instOfNatNat 1).1)) x ∧ Real.instPreorder.toLE.1 x (b (instHAdd.1 n (instOfNatNat 1).1)))) fun x => (Real.instPreorder.toLE.1 (a n) x ∧ Real.instPreorder.toLE.1 x (b n))) → ∀ {m n : Nat}, instLENat.1 n m → (Real.instLE.1 (a n) (a m) ∧ (Real.instLE.1 (a m) (b m) ∧ Real.instLE.1 (b m) (b n)))

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

  (∀ n, a n ≤ b n ∧ ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)) → ∀ n, a n ≤ a (n + 1)

Predicate logic (unfolded):

  ∀ (a b : Nat → Real), (∀ (n : Nat), Real.instLE.1 (a n) (b n) ∧ ∀ (n : Nat), Set.instLE.1 (fun x => (Real.instPreorder.toLE.1 (a (instHAdd.1 n (instOfNatNat 1).1)) x ∧ Real.instPreorder.toLE.1 x (b (instHAdd.1 n (instOfNatNat 1).1)))) fun x => (Real.instPreorder.toLE.1 (a n) x ∧ Real.instPreorder.toLE.1 x (b n))) → ∀ (n : Nat), Real.instLE.1 (a n) (a (instHAdd.1 n (instOfNatNat 1).1))

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

  (∀ n, a n ≤ b n ∧ ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)) → ∀ n, b (n + 1) ≤ b n

Predicate logic (unfolded):

  ∀ (a b : Nat → Real), (∀ (n : Nat), Real.instLE.1 (a n) (b n) ∧ ∀ (n : Nat), Set.instLE.1 (fun x => (Real.instPreorder.toLE.1 (a (instHAdd.1 n (instOfNatNat 1).1)) x ∧ Real.instPreorder.toLE.1 x (b (instHAdd.1 n (instOfNatNat 1).1)))) fun x => (Real.instPreorder.toLE.1 (a n) x ∧ Real.instPreorder.toLE.1 x (b n))) → ∀ (n : Nat), Real.instLE.1 (b (instHAdd.1 n (instOfNatNat 1).1)) (b n)

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

  (∀ n, a n ≤ b n ∧ ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)) → ∀ m n, a n ≤ b m

Predicate logic (unfolded):

  ∀ (a b : Nat → Real), (∀ (n : Nat), Real.instLE.1 (a n) (b n) ∧ ∀ (n : Nat), Set.instLE.1 (fun x => (Real.instPreorder.toLE.1 (a (instHAdd.1 n (instOfNatNat 1).1)) x ∧ Real.instPreorder.toLE.1 x (b (instHAdd.1 n (instOfNatNat 1).1)))) fun x => (Real.instPreorder.toLE.1 (a n) x ∧ Real.instPreorder.toLE.1 x (b n))) → ∀ (m n : Nat), Real.instLE.1 (a n) (b m)

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

  (∀ n, a n ≤ b n ∧ ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n) ∧ IsSupremum leftEndpointLimit (Set.range a) ∧ IsInfimum rightEndpointLimit (Set.range b)) → leftEndpointLimit ≤ rightEndpointLimit

Predicate logic (unfolded):

  ∀ (a b : Nat → Real), (∀ (n : Nat), Real.instLE.1 (a n) (b n) ∧ ∀ (n : Nat), Set.instLE.1 (fun x => (Real.instPreorder.toLE.1 (a (instHAdd.1 n (instOfNatNat 1).1)) x ∧ Real.instPreorder.toLE.1 x (b (instHAdd.1 n (instOfNatNat 1).1)))) fun x => (Real.instPreorder.toLE.1 (a n) x ∧ Real.instPreorder.toLE.1 x (b n))) → ∀ {leftEndpointLimit rightEndpointLimit : Real}, ((∀ (x : Real), Set.instMembership.1 (fun x => Exists fun y => a y = x)x → Real.instPreorder.toLE.1 x leftEndpointLimit ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun y => a y = x)x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 leftEndpointLimit u) ∧ (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun y => b y = x)x → Real.instPreorder.toLE.1 rightEndpointLimit x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun y => b y = x)x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l rightEndpointLimit)) → Real.instLE.1 leftEndpointLimit rightEndpointLimit

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

  (∀ n, a n ≤ b n ∧ ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n) ∧ IsSupremum leftEndpointLimit (Set.range a) ∧ IsInfimum rightEndpointLimit (Set.range b)) → leftEndpointLimit ≤ rightEndpointLimit ∧ (⋂ n, Set.Icc (a n) (b n)).Nonempty ∧ ∃ x ∈ ℝ, ∀ n, a n ≤ x ∧ x ≤ b n

Predicate logic (unfolded):

  ∀ (a b : Nat → Real), (∀ (n : Nat), Real.instLE.1 (a n) (b n) ∧ ∀ (n : Nat), Set.instLE.1 (fun x => (Real.instPreorder.toLE.1 (a (instHAdd.1 n (instOfNatNat 1).1)) x ∧ Real.instPreorder.toLE.1 x (b (instHAdd.1 n (instOfNatNat 1).1)))) fun x => (Real.instPreorder.toLE.1 (a n) x ∧ Real.instPreorder.toLE.1 x (b n))) → ∀ {leftEndpointLimit rightEndpointLimit : Real}, ((∀ (x : Real), Set.instMembership.1 (fun x => Exists fun y => a y = x)x → Real.instPreorder.toLE.1 x leftEndpointLimit ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun y => a y = x)x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 leftEndpointLimit u) ∧ (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun y => b y = x)x → Real.instPreorder.toLE.1 rightEndpointLimit x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun y => b y = x)x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l rightEndpointLimit)) → (Real.instLE.1 leftEndpointLimit rightEndpointLimit ∧ (Exists fun x => Set.instMembership.1 (Set.instInfSet.1 (setOf fun x => Exists fun y => (fun n => Set.Icc (a n) (b n)) y = x))x ∧ Exists fun x => ∀ (n : Nat), (Real.instLE.1 (a n) x ∧ Real.instLE.1 x (b n))))

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

  (∀ n, a n ≤ b n ∧ ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n) ∧ IsSupremum leftEndpointLimit (Set.range a)) → (∀ n, a n ≤ leftEndpointLimit ∧ leftEndpointLimit ≤ b n) ∧ leftEndpointLimit ∈ ⋂ n, Set.Icc (a n) (b n)

Predicate logic (unfolded):

  ∀ (a b : Nat → Real), (∀ (n : Nat), Real.instLE.1 (a n) (b n) ∧ ∀ (n : Nat), Set.instLE.1 (fun x => (Real.instPreorder.toLE.1 (a (instHAdd.1 n (instOfNatNat 1).1)) x ∧ Real.instPreorder.toLE.1 x (b (instHAdd.1 n (instOfNatNat 1).1)))) fun x => (Real.instPreorder.toLE.1 (a n) x ∧ Real.instPreorder.toLE.1 x (b n))) → ∀ {leftEndpointLimit : Real}, (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun y => a y = x)x → Real.instPreorder.toLE.1 x leftEndpointLimit ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun y => a y = x)x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 leftEndpointLimit u) → (∀ (n : Nat), (Real.instLE.1 (a n) leftEndpointLimit ∧ Real.instLE.1 leftEndpointLimit (b n)) ∧ Set.instMembership.1 (Set.instInfSet.1 fun x => Exists fun y => (fun n => Set.Icc (a n) (b n)) y = x) leftEndpointLimit)

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

  (∀ n, a n ≤ b n ∧ ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n) ∧ IsInfimum rightEndpointLimit (Set.range b)) → (∀ n, a n ≤ rightEndpointLimit ∧ rightEndpointLimit ≤ b n) ∧ rightEndpointLimit ∈ ⋂ n, Set.Icc (a n) (b n)

Predicate logic (unfolded):

  ∀ (a b : Nat → Real), (∀ (n : Nat), Real.instLE.1 (a n) (b n) ∧ ∀ (n : Nat), Set.instLE.1 (fun x => (Real.instPreorder.toLE.1 (a (instHAdd.1 n (instOfNatNat 1).1)) x ∧ Real.instPreorder.toLE.1 x (b (instHAdd.1 n (instOfNatNat 1).1)))) fun x => (Real.instPreorder.toLE.1 (a n) x ∧ Real.instPreorder.toLE.1 x (b n))) → ∀ {rightEndpointLimit : Real}, (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun y => b y = x)x → Real.instPreorder.toLE.1 rightEndpointLimit x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun y => b y = x)x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l rightEndpointLimit) → (∀ (n : Nat), (Real.instLE.1 (a n) rightEndpointLimit ∧ Real.instLE.1 rightEndpointLimit (b n)) ∧ Set.instMembership.1 (Set.instInfSet.1 fun x => Exists fun y => (fun n => Set.Icc (a n) (b n)) y = x) rightEndpointLimit)

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

  (∀ n, a n ≤ b n ∧ ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n) ∧ ∀ ε > 0, ∃ N, ∀ n ≥ N, 0 ≤ b n - a n ∧ b n - a n < ε) → ∃! x : ℝ, (∀ n, a n ≤ x ∧ x ≤ b n) ∧ IsSupremum x (Set.range a) ∧ IsInfimum x (Set.range b)

Predicate logic (unfolded):

  ∀ (a b : Nat → Real), (∀ (n : Nat), Real.instLE.1 (a n) (b n) ∧ (∀ (n : Nat), Set.instLE.1 (fun x => (Real.instPreorder.toLE.1 (a (instHAdd.1 n (instOfNatNat 1).1)) x ∧ Real.instPreorder.toLE.1 x (b (instHAdd.1 n (instOfNatNat 1).1)))) fun x => (Real.instPreorder.toLE.1 (a n) x ∧ Real.instPreorder.toLE.1 x (b n)) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → (Real.instLE.1 Zero.toOfNat0.1 (instHSub.1 (b n) (a n)) ∧ Real.instLT.1 (instHSub.1 (b n) (a n)) ε))) → Exists fun x => ((fun x => (∀ (n : Nat), (Real.instLE.1 (a n) x ∧ Real.instLE.1 x (b n)) ∧ ((∀ (x_1 : Real), Set.instMembership.1 (fun x => Exists fun y => a y = x)x_1 → Real.instPreorder.toLE.1 x_1 x ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun y => a y = x)x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 x u) ∧ (∀ (x_1 : Real), Set.instMembership.1 (fun x => Exists fun y => b y = x)x_1 → Real.instPreorder.toLE.1 x x_1 ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun y => b y = x)x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l x)))) x ∧ ∀ (y : Real), (∀ (n : Nat), (Real.instLE.1 (a n) y ∧ Real.instLE.1 y (b n)) ∧ ((∀ (x : Real), Set.instMembership.1 (fun x => Exists fun y => a y = x)x → Real.instPreorder.toLE.1 x y ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun y => a y = x)x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 y u) ∧ (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun y => b y = x)x → Real.instPreorder.toLE.1 y x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun y => b y = x)x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l y))) → y = x)

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

  (∀ n, a n ≤ b n ∧ ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n) ∧ ∀ ε > 0, ∃ N, ∀ n ≥ N, b n - a n < ε) → ∃ x ∈ ℝ, Filter.Tendsto a Filter.atTop (nhds x) ∧ Filter.Tendsto b Filter.atTop (nhds x)

Predicate logic (unfolded):

  ∀ (a b : Nat → Real), (∀ (n : Nat), Real.instLE.1 (a n) (b n) ∧ (∀ (n : Nat), Set.instLE.1 (fun x => (Real.instPreorder.toLE.1 (a (instHAdd.1 n (instOfNatNat 1).1)) x ∧ Real.instPreorder.toLE.1 x (b (instHAdd.1 n (instOfNatNat 1).1)))) fun x => (Real.instPreorder.toLE.1 (a n) x ∧ Real.instPreorder.toLE.1 x (b n)) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (instHSub.1 (b n) (a n)) ε)) → Exists fun x => (Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.1 Filter.atTop.sets (Set.preimage a x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds x) ∧ Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.1 Filter.atTop.sets (Set.preimage b x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds x))

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

  (∀ n, a n ≤ b n ∧ ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n) ∧ (⋂ n, Set.Icc (a n) (b n)) = {x}) → Filter.Tendsto a Filter.atTop (nhds x) ∧ Filter.Tendsto b Filter.atTop (nhds x)

Predicate logic (unfolded):

  ∀ (a b : Nat → Real), (∀ (n : Nat), Real.instLE.1 (a n) (b n) ∧ ∀ (n : Nat), Set.instLE.1 (fun x => (Real.instPreorder.toLE.1 (a (instHAdd.1 n (instOfNatNat 1).1)) x ∧ Real.instPreorder.toLE.1 x (b (instHAdd.1 n (instOfNatNat 1).1)))) fun x => (Real.instPreorder.toLE.1 (a n) x ∧ Real.instPreorder.toLE.1 x (b n))) → ∀ {x : Real}, Set.instInfSet.1 fun x => Exists fun y => (fun n => setOf fun x => (Real.instPreorder.le (a n) x ∧ Real.instPreorder.le x (b n))) y = x = Set.instSingletonSet.1 x → (Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.1 Filter.atTop.sets (Set.preimage a x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds x) ∧ Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.1 Filter.atTop.sets (Set.preimage b x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds x))

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

  IsNestedClosedIntervalFamily a b ↔ Monotone a ∧ Antitone b ∧ ∀ n, a n ≤ b n

Predicate logic (unfolded):

  ∀ (a b : Nat → Real), (∀ (n : Nat), Real.instLE.1 (a n) (b n) ∧ ∀ (n : Nat), Set.instLE.1 (fun x => (Real.instPreorder.toLE.1 (a (instHAdd.1 n 1)) x ∧ Real.instPreorder.toLE.1 x (b (instHAdd.1 n 1)))) fun x => (Real.instPreorder.toLE.1 (a n) x ∧ Real.instPreorder.toLE.1 x (b n))) ↔ (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.toLE.1 a_1 b → Real.instPreorder.toLE.1 (a a_1) (a b) ∧ (∀ ⦃a b_1 : Nat⦄, Nat.instPreorder.toLE.1 a b_1 → Real.instPreorder.toLE.1 (b b_1) (b a) ∧ ∀ (n : Nat), Real.instLE.1 (a n) (b n)))

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

  NestedIntervalProperty ℝ

Predicate logic (unfolded):

  ∀ (a b : Nat → Real), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.toLE.1 a_1 b → Real.instPreorder.toLE.1 (a a_1) (a b) ∧ (∀ ⦃a b_1 : Nat⦄, Nat.instPreorder.toLE.1 a b_1 → Real.instPreorder.toLE.1 (b b_1) (b a) ∧ ∀ (n : Nat), Real.instPreorder.toLE.1 (a n) (b n))) → Exists fun x => ∀ (n : Nat), (Real.instPreorder.toLE.1 (a n) x ∧ Real.instPreorder.toLE.1 x (b n))

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
