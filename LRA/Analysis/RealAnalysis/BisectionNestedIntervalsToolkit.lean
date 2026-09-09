
import Mathlib.Data.Real.Basic
import Mathlib.Topology.Order.Basic
import Mathlib.Topology.Instances.Real.Lemmas

namespace LRA.Analysis.RealAnalysis

/--
`NestedIntervalProperty` TODO

Predicate logic:

  ∀ (a b : Nat → Real), ((∀ (n : Nat), Real.instLE.le (a n) (b n)) ∧ (∀ (n : Nat), (Real.instLE.le (a n) (a (instHAdd.hAdd n 1)) ∧ Real.instLE.le (b (instHAdd.hAdd n 1)) (b n)))) → Exists fun x => ∀ (n : Nat), (Real.instLE.le (a n) x ∧ Real.instLE.le x (b n))

Predicate logic (unfolded):

  Ambient
    (ℕ, ℝ)
  Objects
    a b : ℕ → ℝ
  Prove
    ((∀ (n : Nat), Real.instLE.le (a n) (b n)) ∧ (∀ (n : Nat), (Real.instLE.le (a n) (a ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) ∧ Real.instLE.le (b ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) (b n)))) → Exists fun x => ∀ (n : Nat), (Real.instLE.le (a n) x ∧ Real.instLE.le x (b n))

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

  ∀ (f : Real → Real) (a b L : Real), (Real.instLT.lt a b ∧ (ContinuousOn f (Set.Icc a b) ∧ (Or ((Real.instLT.lt (f a) L ∧ Real.instLT.lt L (f b))) ((GT.gt (f a) L ∧ GT.gt L (f b)))))) → Exists fun c => (c ∈ Set.Ioo a b ∧ f c = L)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    a b L : ℝ
    hf : ContinuousOn f (Set.Icc a b)
  Prove
    (Real.instLT.lt a b ∧ ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Filter.instPartialOrder.toPreorder.1.le { sets := fun x_1 => .sets ∈ nhdsWithin x (Set.Icc a b)(Set.preimage f x_1), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds (f x))) ∧ (Or ((Real.instLT.lt (f a) L ∧ Real.instLT.lt L (f b))) ((Real.instLT.lt L (f a) ∧ Real.instLT.lt (f b) L))))) → Exists fun c => ((c ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b)) ∧ f c = L)

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

  ¬ Exists fun x => Function.Surjective x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
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
