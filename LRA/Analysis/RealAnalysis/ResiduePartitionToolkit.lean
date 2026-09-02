
import Mathlib.Data.Real.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Order.Filter.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Basic

namespace LRA.Analysis.RealAnalysis

/--
`KPeriodicity` TODO

Predicate logic:

  (ℕ → ℝ ∧ 2 ≤ k) → Filter.Tendsto a Filter.atTop (nhds L) ↔ ∀ r < k, Filter.Tendsto (fun n => a (k * n + r)) Filter.atTop (nhds L)

Predicate logic (unfolded):

  ∀ (a : Nat → Real) (k : Nat), instLENat.1 (instOfNatNat 2).1 k → ∀ (L : Real), Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.1 Filter.atTop.sets (Set.preimage a x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L) ↔ ∀ (r : Nat), instLTNat.1 r k → Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.1 Filter.atTop.sets (Set.preimage (fun n => a (instHAdd.hAdd (instHMul.hMul k n) r)) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L)

Logical form (Lean):

```lean
theorem KPeriodicity (a : ℕ → ℝ) (k : ℕ) (hk : 2 ≤ k) (L : ℝ) :
    Filter.Tendsto a Filter.atTop (nhds L) ↔
      ∀ r < k, Filter.Tendsto (fun n => a (k * n + r)) Filter.atTop (nhds L)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem KPeriodicity (a : ℕ → ℝ) (k : ℕ) (hk : 2 ≤ k) (L : ℝ) :
    Filter.Tendsto a Filter.atTop (nhds L) ↔
      ∀ r < k, Filter.Tendsto (fun n => a (k * n + r)) Filter.atTop (nhds L) := by
  sorry
/--
`ResidueDivergence` TODO

Predicate logic:

  (ℕ → ℝ ∧ r < k ∧ s < k) → ¬ ∃ N, Filter.Tendsto a Filter.atTop (nhds N)

Predicate logic (unfolded):

  ∀ (a : Nat → Real) (k r s : Nat), (instLTNat.1 r k ∧ instLTNat.1 s k) → ∀ (L M : Real), (L = M → False ∧ (Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.1 Filter.atTop.sets (Set.preimage (fun n => a (instHAdd.hAdd (instHMul.hMul k n) r)) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L) ∧ (Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.1 Filter.atTop.sets (Set.preimage (fun n => a (instHAdd.hAdd (instHMul.hMul k n) s)) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds M) ∧ Exists fun N => Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem Filter.atTop.sets (Set.preimage a x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds N)))) → False

Logical form (Lean):

```lean
theorem ResidueDivergence (a : ℕ → ℝ) (k r s : ℕ) (hr : r < k) (hs : s < k)
    (L M : ℝ) (hLM : L ≠ M)
    (hL : Filter.Tendsto (fun n => a (k * n + r)) Filter.atTop (nhds L))
    (hM : Filter.Tendsto (fun n => a (k * n + s)) Filter.atTop (nhds M)) :
    ¬ ∃ N, Filter.Tendsto a Filter.atTop (nhds N)
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
theorem ResidueDivergence (a : ℕ → ℝ) (k r s : ℕ) (hr : r < k) (hs : s < k)
    (L M : ℝ) (hLM : L ≠ M)
    (hL : Filter.Tendsto (fun n => a (k * n + r)) Filter.atTop (nhds L))
    (hM : Filter.Tendsto (fun n => a (k * n + s)) Filter.atTop (nhds M)) :
    ¬ ∃ N, Filter.Tendsto a Filter.atTop (nhds N) := by
  sorry
/--
`AlternatingSeriesTest` TODO

Predicate logic:

  (ℕ → ℝ ∧ ∀ n, 0 < a n ∧ ∀ n, a (n + 1) ≤ a n) → ∃ L ∈ ℝ, Filter.Tendsto (fun n => ∑ i ∈ Finset.range n, -1 ∈ ℝ ^ i * a (i + 1)) Filter.atTop (nhds L)

Predicate logic (unfolded):

  ∀ (a : Nat → Real), (∀ (n : Nat), Real.instLT.1 Zero.toOfNat0.1 (a n) ∧ (∀ (n : Nat), Real.instLE.1 (a (instHAdd.1 n (instOfNatNat 1).1)) (a n) ∧ Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.1 Filter.atTop.sets (Set.preimage a x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds Zero.toOfNat0.1))) → Exists fun L => Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.1 Filter.atTop.sets (Set.preimage (fun n => (Finset.range n).sum fun i => instHMul.hMul (instHPow.hPow (-1) i) (a (instHAdd.hAdd i 1))) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L)

Logical form (Lean):

```lean
theorem AlternatingSeriesTest (a : ℕ → ℝ)
    (hpos : ∀ n, 0 < a n) (hdec : ∀ n, a (n + 1) ≤ a n)
    (hnull : Filter.Tendsto a Filter.atTop (nhds 0)) :
    ∃ L : ℝ, Filter.Tendsto
      (fun n => ∑ i ∈ Finset.range n, (-1 : ℝ) ^ i * a (i + 1))
      Filter.atTop (nhds L)
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
theorem AlternatingSeriesTest (a : ℕ → ℝ)
    (hpos : ∀ n, 0 < a n) (hdec : ∀ n, a (n + 1) ≤ a n)
    (hnull : Filter.Tendsto a Filter.atTop (nhds 0)) :
    ∃ L : ℝ, Filter.Tendsto
      (fun n => ∑ i ∈ Finset.range n, (-1 : ℝ) ^ i * a (i + 1))
      Filter.atTop (nhds L) := by
  sorry
end LRA.Analysis.RealAnalysis
