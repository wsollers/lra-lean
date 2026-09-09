
import Mathlib.Data.Real.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Order.Filter.Basic

namespace LRA.Analysis.RealAnalysis

/--
`IoEvDichotomy` TODO

Predicate logic:

  ∀ (P : Nat → Prop), ∀ (N : Nat), Exists fun n => (GE.ge n N ∧ P n) ↔ ¬ Exists fun N => ∀ (n : Nat), GE.ge n N → ¬ P n

Predicate logic (unfolded):

  Ambient
    (ℕ)
  Objects
    P : ℕ → Prop
  Prove
    ∀ (N : Nat), Exists fun n => (GE.ge n N ∧ P n) ↔ ¬ Exists fun N => ∀ (n : Nat), GE.ge n N → ¬ P n

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

  ∀ (x : Nat → Real), Exists fun φ => (StrictMono φ ∧ Or (Monotone (Function.comp x φ)) (Antitone (Function.comp x φ)))

Predicate logic (unfolded):

  Ambient
    (ℕ, ℝ)
  Objects
    x : ℕ → ℝ
  Prove
    Exists fun φ => ((∀ ⦃a b : Nat⦄, Nat.instPreorder.2.lt a b → Nat.instPreorder.2.lt (φ a) (φ b)) ∧ (Or (∀ ⦃a b : Nat⦄, Nat.instPreorder.1.le a b → Real.instPreorder.1.le (x (φ a)) (x (φ b))) (∀ ⦃a b : Nat⦄, Nat.instPreorder.1.le a b → Real.instPreorder.1.le (x (φ b)) (x (φ a)))))

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

  ∀ (x : Nat → Real), (Exists fun M => ∀ (n : Nat), Real.instLE.le (abs (x n)) M) → Exists fun φ => (StrictMono φ ∧ Exists fun L => Filter.Tendsto (Function.comp x φ) Filter.atTop (nhds L))

Predicate logic (unfolded):

  Ambient
    (ℕ, ℝ)
  Objects
    x : ℕ → ℝ
  Prove
    (Exists fun M => ∀ (n : Nat), Real.instLE.le (abs (x n)) M) → Exists fun φ => ((∀ ⦃a b : Nat⦄, Nat.instPreorder.2.lt a b → Nat.instPreorder.2.lt (φ a) (φ b)) ∧ Exists fun L => Filter.instPartialOrder.toPreorder.1.le { sets := fun x_1 => setOf fun x_2 => Function.comp x φ x_2 ∈ x_1 ∈ Filter.atTop.1, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))

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
