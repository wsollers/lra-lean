import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic

namespace LRA.Analysis.Completeness

/--
`OpenNestedIntervalsNeedNotHaveNonemptyIntersection` TODO

Predicate logic:

  Exists fun a => Exists fun b => ((∀ (n : Nat), Real.instLT.lt (a n) (b n)) ∧ ((∀ (n : Nat), Set.instLE.le (Set.Ioo (a (instHAdd.hAdd n 1)) (b (instHAdd.hAdd n 1))) (Set.Ioo (a n) (b n))) ∧ Set.iInter fun n => Set.Ioo (a n) (b n) = Set.instEmptyCollection.emptyCollection))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun a => Exists fun b => ((∀ (n : Nat), Real.instLT.lt (a n) (b n)) ∧ ((∀ (n : Nat), { le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun x => (Real.instPreorder.2.lt (a ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) x ∧ Real.instPreorder.2.lt x (b ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)))) fun x => (Real.instPreorder.2.lt (a n) x ∧ Real.instPreorder.2.lt x (b n))) ∧ (Set.instInfSet.1 fun x => Exists fun y => (fun n => setOf fun x => (Real.instPreorder.lt (a n) x ∧ Real.instPreorder.lt x (b n))) y = x = Set.instEmptyCollection.1)))

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

  Exists fun a => Exists fun b => ((∀ (n : Nat), Real.instLT.lt (a n) (b n)) ∧ ((∀ (n : Nat), Set.instLE.le (Set.Ioc (a (instHAdd.hAdd n 1)) (b (instHAdd.hAdd n 1))) (Set.Ioc (a n) (b n))) ∧ Set.iInter fun n => Set.Ioc (a n) (b n) = Set.instEmptyCollection.emptyCollection))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun a => Exists fun b => ((∀ (n : Nat), Real.instLT.lt (a n) (b n)) ∧ ((∀ (n : Nat), { le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun x => (Real.instPreorder.2.lt (a ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) x ∧ Real.instPreorder.1.le x (b ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)))) fun x => (Real.instPreorder.2.lt (a n) x ∧ Real.instPreorder.1.le x (b n))) ∧ (Set.instInfSet.1 fun x => Exists fun y => (fun n => setOf fun x => (Real.instPreorder.lt (a n) x ∧ Real.instPreorder.le x (b n))) y = x = Set.instEmptyCollection.1)))

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

  Exists fun a => ((∀ (n : Nat), Set.instLE.le (Set.Ici (a (instHAdd.hAdd n 1))) (Set.Ici (a n))) ∧ Set.iInter fun n => Set.Ici (a n) = Set.instEmptyCollection.emptyCollection)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun a => ((∀ (n : Nat), { le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun x => Real.instPreorder.1.le (a ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) x) fun x => Real.instPreorder.1.le (a n) x) ∧ Set.instInfSet.1 fun x => Exists fun y => (fun n => setOf fun x => Real.instPreorder.le (a n) x) y = x = Set.instEmptyCollection.1)

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
