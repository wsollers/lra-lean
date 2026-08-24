
import Mathlib.Data.Real.Basic
import Mathlib.Topology.Order.Basic
import Mathlib.Topology.Instances.Real.Lemmas

namespace LRA.Analysis.RealAnalysis

/--
`NestedIntervalProperty` TODO

Predicate logic:

  (∀ n, a n ≤ b n ∧ ∀ n, a n ≤ a (n + 1) ∧ b (n + 1) ≤ b n) → ∃ x ∈ ℝ, ∀ n, a n ≤ x ∧ x ≤ b n

Predicate logic (unfolded):

  ∀ (a b : Nat → Real), (∀ (n : Nat), Real.instLE.1 (a n) (b n) ∧ ∀ (n : Nat), (Real.instLE.1 (a n) (a (instHAdd.1 n (instOfNatNat 1).1)) ∧ Real.instLE.1 (b (instHAdd.1 n (instOfNatNat 1).1)) (b n))) → Exists fun x => ∀ (n : Nat), (Real.instLE.1 (a n) x ∧ Real.instLE.1 x (b n))

Logical form (Lean):

```lean
theorem NestedIntervalProperty (a b : ℕ → ℝ)
    (hle : ∀ n, a n ≤ b n)
    (hnest : ∀ n, a n ≤ a (n + 1) ∧ b (n + 1) ≤ b n) :
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
theorem NestedIntervalProperty (a b : ℕ → ℝ)
    (hle : ∀ n, a n ≤ b n)
    (hnest : ∀ n, a n ≤ a (n + 1) ∧ b (n + 1) ≤ b n) :
    ∃ x : ℝ, ∀ n, a n ≤ x ∧ x ≤ b n := by
  sorry

/--
`IvtBisection` TODO

Predicate logic:

  (ℝ → ℝ ∧ a < b ∧ (f a < L ∧ L < f b) ∨ (f a > L ∧ L > f b)) → ∃ c ∈ Set.Ioo a b, f c = L

Predicate logic (unfolded):

  ∀ (f : Real → Real) (a b L : Real), (Real.instLT.1 a b ∧ (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Filter.instPartialOrder.toLE.1 { sets := setOf fun x_1 => Set.instMembership.mem (nhdsWithin x (Set.Icc a b)).sets (Set.preimage f x_1), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds (f x)) ∧ Or ((Real.instLT.1 (f a) L ∧ Real.instLT.1 L (f b))) ((Real.instLT.1 L (f a) ∧ Real.instLT.1 (f b) L)))) → Exists fun c => (Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) c ∧ f c = L)

Logical form (Lean):

```lean
theorem IvtBisection (f : ℝ → ℝ) (a b L : ℝ) (hab : a < b)
    (hf : ContinuousOn f (Set.Icc a b))
    (hL : (f a < L ∧ L < f b) ∨ (f a > L ∧ L > f b)) :
    ∃ c ∈ Set.Ioo a b, f c = L
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, Or.inl, Or.inr, use

-/
theorem IvtBisection (f : ℝ → ℝ) (a b L : ℝ) (hab : a < b)
    (hf : ContinuousOn f (Set.Icc a b))
    (hL : (f a < L ∧ L < f b) ∨ (f a > L ∧ L > f b)) :
    ∃ c ∈ Set.Ioo a b, f c = L := by
  sorry

/--
`RUncountable` TODO

Predicate logic:

  ¬ ∃ x ∈ ℕ → ℝ, Function.Surjective x

Predicate logic (unfolded):

  (Exists fun x => ∀ (b : Real), Exists fun a => x a = b) → False

Logical form (Lean):

```lean
theorem RUncountable : ¬ ∃ x : ℕ → ℝ, Function.Surjective x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem RUncountable : ¬ ∃ x : ℕ → ℝ, Function.Surjective x := by
  sorry

end LRA.Analysis.RealAnalysis
