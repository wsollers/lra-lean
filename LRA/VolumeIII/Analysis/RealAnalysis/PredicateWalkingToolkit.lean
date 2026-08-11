/-
Draft module; not yet imported by the active Volume III root.
Source: real-analysis/notes/proof-techniques/predicate-walking.tex
(§3 of the proof-techniques subsection).

Audit note: `prop:bw-bisection` (Bolzano–Weierstrass via bisection) proves
the SAME fact as the Sequences chapter's own Bolzano–Weierstrass content
(`BolzanoWeierstrassSequences`, referenced from
`Sequences/Subsequences.lean`'s ADDITIONS item 7) — this file's
version is the bisection-based proof route rather than the peak-argument
route, and per this chapter's own "Comparison with the peak proof" remark
the two are genuinely different proof strategies for the same theorem, so
both get their own statement. `rem:arzela-ascoli` (diagonal extraction) is
a `\label`ed remark, not a theorem/definition/proposition environment —
consistent with this chapter's toolkit style, it is prose walking through
a forward-pointing sketch (full Arzelà–Ascoli needs equicontinuity
machinery not yet in this corpus) and is not formalized here.
-/

import Mathlib.Data.Real.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Order.Filter.Basic

namespace LRA.VolumeIII.Analysis.RealAnalysis

/-- If `P : ℕ → Prop`. Then `(∀ N, ∃ n ≥ N, P n) ↔ ¬ (∃ N, ∀ n ≥ N, ¬ P n)`.

Logical form:

```lean
theorem IoEvDichotomy (P : ℕ → Prop) :
    (∀ N, ∃ n ≥ N, P n) ↔ ¬ (∃ N, ∀ n ≥ N, ¬ P n)
```
-/
theorem IoEvDichotomy (P : ℕ → Prop) :
    (∀ N, ∃ n ≥ N, P n) ↔ ¬ (∃ N, ∀ n ≥ N, ¬ P n) := by
  sorry

-- `thm:monotone-subsequence`
/-- If `x : ℕ → ℝ`. Then `∃ φ : ℕ → ℕ, StrictMono φ ∧ (Monotone (x ∘ φ) ∨ Antitone (x ∘ φ))`.

Logical form:

```lean
theorem MonotoneSubsequence (x : ℕ → ℝ) :
    ∃ φ : ℕ → ℕ, StrictMono φ ∧ (Monotone (x ∘ φ) ∨ Antitone (x ∘ φ))
```
-/
theorem MonotoneSubsequence (x : ℕ → ℝ) :
    ∃ φ : ℕ → ℕ, StrictMono φ ∧ (Monotone (x ∘ φ) ∨ Antitone (x ∘ φ)) := by
  sorry

/-- If `x : ℕ → ℝ` and `hbdd : ∃ M, ∀ n, |x n| ≤ M`. Then `∃ φ : ℕ → ℕ, StrictMono φ ∧ ∃ L : ℝ,
Filter.Tendsto (x ∘ φ) Filter.atTop (nhds L)`.

Logical form:

```lean
theorem BwBisection (x : ℕ → ℝ) (hbdd : ∃ M, ∀ n, |x n| ≤ M) :
    ∃ φ : ℕ → ℕ, StrictMono φ ∧
      ∃ L : ℝ, Filter.Tendsto (x ∘ φ) Filter.atTop (nhds L)
```
-/
theorem BwBisection (x : ℕ → ℝ) (hbdd : ∃ M, ∀ n, |x n| ≤ M) :
    ∃ φ : ℕ → ℕ, StrictMono φ ∧
      ∃ L : ℝ, Filter.Tendsto (x ∘ φ) Filter.atTop (nhds L) := by
  sorry

end LRA.VolumeIII.Analysis.RealAnalysis
