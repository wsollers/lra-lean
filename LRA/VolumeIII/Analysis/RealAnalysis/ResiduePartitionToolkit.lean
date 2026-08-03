/-
Draft module; not yet imported by the active Volume III root.
Source: real-analysis/notes/proof-techniques/residue-partition.tex
(§5 of the proof-techniques subsection, the last of the six
proof-techniques files).
-/

import Mathlib.Data.Real.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Order.Filter.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Basic

namespace LRA.VolumeIII.Analysis.RealAnalysis

-- `thm:k-periodicity`
/-- Let `k : ℕ` and `L : ℝ`. If `a : ℕ → ℝ` and `hk : 2 ≤ k`. Then `Filter.Tendsto a Filter.atTop
(nhds L) ↔ ∀ r < k, Filter.Tendsto (fun n => a (k * n + r)) Filter.atTop (nhds L)`. -/
theorem KPeriodicity (a : ℕ → ℝ) (k : ℕ) (hk : 2 ≤ k) (L : ℝ) :
    Filter.Tendsto a Filter.atTop (nhds L) ↔
      ∀ r < k, Filter.Tendsto (fun n => a (k * n + r)) Filter.atTop (nhds L) := by
  sorry

/-- Let `k r s : ℕ` and `L M : ℝ`. If `a : ℕ → ℝ`, `hr : r < k`, `hs : s < k`, `hLM : L ≠ M`, `hL :
Filter.Tendsto (fun n => a (k * n + r)) Filter.atTop (nhds L)`, and `hM : Filter.Tendsto (fun n
=> a (k * n + s)) Filter.atTop (nhds M)`. Then `¬ ∃ N, Filter.Tendsto a Filter.atTop (nhds N)`. -/
theorem ResidueDivergence (a : ℕ → ℝ) (k r s : ℕ) (hr : r < k) (hs : s < k)
    (L M : ℝ) (hLM : L ≠ M)
    (hL : Filter.Tendsto (fun n => a (k * n + r)) Filter.atTop (nhds L))
    (hM : Filter.Tendsto (fun n => a (k * n + s)) Filter.atTop (nhds M)) :
    ¬ ∃ N, Filter.Tendsto a Filter.atTop (nhds N) := by
  sorry

-- `thm:alternating-series-test`
/-- If `a : ℕ → ℝ`, `hpos : ∀ n, 0 < a n`, `hdec : ∀ n, a (n + 1) ≤ a n`, and `hnull :
Filter.Tendsto a Filter.atTop (nhds 0)`. Then `∃ L : ℝ, Filter.Tendsto (fun n => ∑ i ∈
Finset.range n, (-1 : ℝ) ^ i * a (i + 1)) Filter.atTop (nhds L)`. -/
theorem AlternatingSeriesTest (a : ℕ → ℝ)
    (hpos : ∀ n, 0 < a n) (hdec : ∀ n, a (n + 1) ≤ a n)
    (hnull : Filter.Tendsto a Filter.atTop (nhds 0)) :
    ∃ L : ℝ, Filter.Tendsto
      (fun n => ∑ i ∈ Finset.range n, (-1 : ℝ) ^ i * a (i + 1))
      Filter.atTop (nhds L) := by
  sorry

end LRA.VolumeIII.Analysis.RealAnalysis
