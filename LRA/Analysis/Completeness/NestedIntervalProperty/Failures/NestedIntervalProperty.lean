import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic

namespace LRA.Analysis.Completeness

/--
`OpenNestedIntervalsNeedNotHaveNonemptyIntersection` TODO

Predicate logic:

  ∃ a b ∈ ℕ → ℝ, (∀ n, a n < b n) ∧ (∀ n, Set.Ioo (a (n + 1)) (b (n + 1)) ⊆ Set.Ioo (a n) (b n)) ∧ (⋂ n, Set.Ioo (a n) (b n)) = ∅

Predicate logic (unfolded):

  Exists fun a => Exists fun b => (∀ (n : Nat), Real.instLT.1 (a n) (b n) ∧ (∀ (n : Nat), Set.instLE.1 (fun x => (Real.instPreorder.toLT.1 (a (instHAdd.1 n (instOfNatNat 1).1)) x ∧ Real.instPreorder.toLT.1 x (b (instHAdd.1 n (instOfNatNat 1).1)))) fun x => (Real.instPreorder.toLT.1 (a n) x ∧ Real.instPreorder.toLT.1 x (b n)) ∧ Set.instInfSet.1 fun x => Exists fun y => (fun n => setOf fun x => (Real.instPreorder.lt (a n) x ∧ Real.instPreorder.lt x (b n))) y = x = Set.instEmptyCollection.1))

Logical form (Lean):

```lean
theorem OpenNestedIntervalsNeedNotHaveNonemptyIntersection :
    ∃ a b : ℕ → ℝ, (∀ n, a n < b n) ∧
      (∀ n, Set.Ioo (a (n + 1)) (b (n + 1)) ⊆ Set.Ioo (a n) (b n)) ∧
        (⋂ n, Set.Ioo (a n) (b n)) = ∅
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
theorem OpenNestedIntervalsNeedNotHaveNonemptyIntersection :
    ∃ a b : ℕ → ℝ, (∀ n, a n < b n) ∧
      (∀ n, Set.Ioo (a (n + 1)) (b (n + 1)) ⊆ Set.Ioo (a n) (b n)) ∧
        (⋂ n, Set.Ioo (a n) (b n)) = ∅ := by
  sorry

/--
`ClosednessIsNecessaryInNestedIntervalTheorem` TODO

Predicate logic:

  ∃ a b ∈ ℕ → ℝ, (∀ n, a n < b n) ∧ (∀ n, Set.Ioc (a (n + 1)) (b (n + 1)) ⊆ Set.Ioc (a n) (b n)) ∧ (⋂ n, Set.Ioc (a n) (b n)) = ∅

Predicate logic (unfolded):

  Exists fun a => Exists fun b => (∀ (n : Nat), Real.instLT.1 (a n) (b n) ∧ (∀ (n : Nat), Set.instLE.1 (fun x => (Real.instPreorder.toLT.1 (a (instHAdd.1 n (instOfNatNat 1).1)) x ∧ Real.instPreorder.toLE.1 x (b (instHAdd.1 n (instOfNatNat 1).1)))) fun x => (Real.instPreorder.toLT.1 (a n) x ∧ Real.instPreorder.toLE.1 x (b n)) ∧ Set.instInfSet.1 fun x => Exists fun y => (fun n => setOf fun x => (Real.instPreorder.lt (a n) x ∧ Real.instPreorder.le x (b n))) y = x = Set.instEmptyCollection.1))

Logical form (Lean):

```lean
theorem ClosednessIsNecessaryInNestedIntervalTheorem :
    ∃ a b : ℕ → ℝ, (∀ n, a n < b n) ∧
      (∀ n, Set.Ioc (a (n + 1)) (b (n + 1)) ⊆ Set.Ioc (a n) (b n)) ∧
        (⋂ n, Set.Ioc (a n) (b n)) = ∅
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
theorem ClosednessIsNecessaryInNestedIntervalTheorem :
    ∃ a b : ℕ → ℝ, (∀ n, a n < b n) ∧
      (∀ n, Set.Ioc (a (n + 1)) (b (n + 1)) ⊆ Set.Ioc (a n) (b n)) ∧
        (⋂ n, Set.Ioc (a n) (b n)) = ∅ := by
  sorry

/--
`BoundednessIsNecessaryInNestedIntervalTheorem` TODO

Predicate logic:

  ∃ a ∈ ℕ → ℝ, (∀ n, Set.Ici (a (n + 1)) ⊆ Set.Ici (a n)) ∧ (⋂ n, Set.Ici (a n)) = ∅

Predicate logic (unfolded):

  Exists fun a => (∀ (n : Nat), Set.instLE.1 (fun x => Real.instPreorder.toLE.1 (a (instHAdd.1 n (instOfNatNat 1).1)) x) fun x => Real.instPreorder.toLE.1 (a n) x ∧ Set.instInfSet.1 fun x => Exists fun y => (fun n => setOf fun x => Real.instPreorder.le (a n) x) y = x = Set.instEmptyCollection.1)

Logical form (Lean):

```lean
theorem BoundednessIsNecessaryInNestedIntervalTheorem :
    ∃ a : ℕ → ℝ, (∀ n, Set.Ici (a (n + 1)) ⊆ Set.Ici (a n)) ∧
      (⋂ n, Set.Ici (a n)) = ∅
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
theorem BoundednessIsNecessaryInNestedIntervalTheorem :
    ∃ a : ℕ → ℝ, (∀ n, Set.Ici (a (n + 1)) ⊆ Set.Ici (a n)) ∧
      (⋂ n, Set.Ici (a n)) = ∅ := by
  sorry

end LRA.Analysis.Completeness
