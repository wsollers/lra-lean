
import Mathlib.Data.Real.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Order.Filter.Basic

namespace LRA.Analysis.RealAnalysis

/--
`IoEvDichotomy` TODO

Predicate logic:

  (ℕ → Prop) → (∀ N, ∃ n ≥ N, P n) ↔ ¬ (∃ N, ∀ n ≥ N, ¬ P n)

Predicate logic (unfolded):

  ∀ (P : Nat → Prop), ∀ (N : Nat), Exists fun n => (instLENat.1 N n ∧ P n) ↔ (Exists fun N => ∀ (n : Nat), instLENat.1 N n → P n → False) → False

Logical form (Lean):

```lean
theorem IoEvDichotomy (P : ℕ → Prop) :
    (∀ N, ∃ n ≥ N, P n) ↔ ¬ (∃ N, ∀ n ≥ N, ¬ P n)
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
theorem IoEvDichotomy (P : ℕ → Prop) :
    (∀ N, ∃ n ≥ N, P n) ↔ ¬ (∃ N, ∀ n ≥ N, ¬ P n) := by
  sorry

/--
`MonotoneSubsequence` TODO

Predicate logic:

  (ℕ → ℝ) → ∃ φ ∈ ℕ → ℕ, StrictMono φ ∧ (Monotone (x ∘ φ) ∨ Antitone (x ∘ φ))

Predicate logic (unfolded):

  ∀ (x : Nat → Real), Exists fun φ => (∀ ⦃a b : Nat⦄, Nat.instPreorder.toLT.1 a b → Nat.instPreorder.toLT.1 (φ a) (φ b) ∧ Or (∀ ⦃a b : Nat⦄, Nat.instPreorder.toLE.1 a b → Real.instPreorder.toLE.1 (x (φ a)) (x (φ b))) (∀ ⦃a b : Nat⦄, Nat.instPreorder.toLE.1 a b → Real.instPreorder.toLE.1 (x (φ b)) (x (φ a))))

Logical form (Lean):

```lean
theorem MonotoneSubsequence (x : ℕ → ℝ) :
    ∃ φ : ℕ → ℕ, StrictMono φ ∧ (Monotone (x ∘ φ) ∨ Antitone (x ∘ φ))
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
theorem MonotoneSubsequence (x : ℕ → ℝ) :
    ∃ φ : ℕ → ℕ, StrictMono φ ∧ (Monotone (x ∘ φ) ∨ Antitone (x ∘ φ)) := by
  sorry

/--
`BwBisection` TODO

Predicate logic:

  (ℕ → ℝ ∧ ∃ M, ∀ n, |x n| ≤ M) → ∃ φ ∈ ℕ → ℕ, StrictMono φ ∧ ∃ L ∈ ℝ, Filter.Tendsto (x ∘ φ) Filter.atTop (nhds L)

Predicate logic (unfolded):

  ∀ (x : Nat → Real), (Exists fun M => ∀ (n : Nat), Real.instLE.1 (SemilatticeSup.toMax.1 (x n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (x n))) M) → Exists fun φ => (∀ ⦃a b : Nat⦄, Nat.instPreorder.toLT.1 a b → Nat.instPreorder.toLT.1 (φ a) (φ b) ∧ Exists fun L => Filter.instPartialOrder.toLE.1 { sets := fun x_1 => Set.instMembership.1 Filter.atTop.sets (Set.preimage (Function.comp x φ) x_1), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))

Logical form (Lean):

```lean
theorem BwBisection (x : ℕ → ℝ) (hbdd : ∃ M, ∀ n, |x n| ≤ M) :
    ∃ φ : ℕ → ℕ, StrictMono φ ∧
      ∃ L : ℝ, Filter.Tendsto (x ∘ φ) Filter.atTop (nhds L)
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
theorem BwBisection (x : ℕ → ℝ) (hbdd : ∃ M, ∀ n, |x n| ≤ M) :
    ∃ φ : ℕ → ℕ, StrictMono φ ∧
      ∃ L : ℝ, Filter.Tendsto (x ∘ φ) Filter.atTop (nhds L) := by
  sorry

end LRA.Analysis.RealAnalysis
