
import Mathlib.Data.Real.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Order.Filter.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Basic

namespace LRA.Analysis.RealAnalysis

/--
`KPeriodicity` TODO

Predicate logic:

  ∀ (a : Nat → Real) (k : Nat), instLENat.le 2 k → ∀ (L : Real), Filter.Tendsto a Filter.atTop (nhds L) ↔ ∀ (r : Nat), instLTNat.lt r k → Filter.Tendsto (fun n => a (instHAdd.hAdd (instHMul.hMul k n) r)) Filter.atTop (nhds L)

Predicate logic (unfolded):

  Ambient
    (ℕ, ℝ)
  Objects
    a : ℕ → ℝ
    k : ℕ
    L : ℝ
  Prove
    instLENat.le 2 k → ∀ (L : Real), Filter.Tendsto a Filter.atTop (nhds L) ↔ ∀ (r : Nat), instLTNat.lt r k → Filter.Tendsto (fun n => a (instHAdd.hAdd (instHMul.hMul k n) r)) Filter.atTop (nhds L)

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

  ∀ (a : Nat → Real) (k r s : Nat), (instLTNat.lt r k ∧ instLTNat.lt s k) → ∀ (L M : Real), (Ne L M ∧ (Filter.Tendsto (fun n => a (instHAdd.hAdd (instHMul.hMul k n) r)) Filter.atTop (nhds L) ∧ Filter.Tendsto (fun n => a (instHAdd.hAdd (instHMul.hMul k n) s)) Filter.atTop (nhds M))) → ¬ Exists fun N => Filter.Tendsto a Filter.atTop (nhds N)

Predicate logic (unfolded):

  Ambient
    (ℕ, ℝ)
  Objects
    a : ℕ → ℝ
    k r s : ℕ
    L M : ℝ
    hLM : L ≠ M
    hL : Filter.Tendsto (fun n => a (k * n + r)) Filter.atTop (nhds L)
    hM : Filter.Tendsto (fun n => a (k * n + s)) Filter.atTop (nhds M)
  Prove
    (instLTNat.lt r k ∧ instLTNat.lt s k) → ∀ (L M : Real), ((L = M → False) ∧ (Filter.instPartialOrder.toPreorder.1.le { sets := fun x => setOf fun x_1 => (fun n => a (instHAdd.hAdd (instHMul.hMul k n) r)) x_1 ∈ x ∈ Filter.atTop.1, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L) ∧ (Filter.instPartialOrder.toPreorder.1.le { sets := fun x => setOf fun x_1 => (fun n => a (instHAdd.hAdd (instHMul.hMul k n) s)) x_1 ∈ x ∈ Filter.atTop.1, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds M) ∧ Exists fun N => Filter.instPartialOrder.toPreorder.1.le { sets := fun x => Set.preimage a x ∈ Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds N)))) → False

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

  ∀ (a : Nat → Real), ((∀ (n : Nat), Real.instLT.lt 0 (a n)) ∧ ((∀ (n : Nat), Real.instLE.le (a (instHAdd.hAdd n 1)) (a n)) ∧ Filter.Tendsto a Filter.atTop (nhds 0))) → Exists fun L => Filter.Tendsto (fun n => (Finset.range n).sum fun i => instHMul.hMul (instHPow.hPow (-1) i) (a (instHAdd.hAdd i 1))) Filter.atTop (nhds L)

Predicate logic (unfolded):

  Ambient
    (ℕ, ℝ)
  Objects
    a : ℕ → ℝ
    hnull : Filter.Tendsto a Filter.atTop (nhds 0)
  Prove
    ((∀ (n : Nat), Real.instLT.lt 0 (a n)) ∧ ((∀ (n : Nat), Real.instLE.le (a ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) (a n)) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := fun x => setOf fun x_1 => a x_1 ∈ x ∈ Filter.atTop.1, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds 0))) → Exists fun L => Filter.instPartialOrder.toPreorder.1.le { sets := fun x => setOf fun x_1 => (fun n => (Finset.range n).sum fun i => instHMul.hMul (instHPow.hPow (-1) i) (a (instHAdd.hAdd i 1))) x_1 ∈ x ∈ Filter.atTop.1, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L)

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
