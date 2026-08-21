/-
Draft module; not yet imported by the active Volume III root.
Source: real-analysis/notes/proof-techniques/completeness-construction.tex
(§2 of the proof-techniques subsection).

Audit note: `prop:eps-char-sup` here is the SAME underlying fact as the
Bounds chapter's `epsilon_characterization_of_supremum`
(`Bounds/Extrema/EpsilonCharacterization.lean`) — restated in this
chapter's own "proof technique" framing (unpacked directly over `ℝ`
rather than via the `IsSupremum` predicate). Stated independently below
since it is its own labeled node with its own dependency chain in this
chapter, but the two are provably the same theorem. `thm:LUB-iff-MCT`
(the completeness-equivalence toolkit-table entry) is not restated here —
it is a pure forward-pointer to
`thm:lub-property-equivalent-monotone-convergence`, the Completeness
chapter's own theorem, with no separate content of its own in this file.
-/

import Mathlib.Data.Real.Basic
import Mathlib.Order.Bounds.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Order.Filter.Basic

namespace LRA.Analysis.RealAnalysis

/-- Let `S : Set ℝ` and `s : ℝ`. If `hne : S.Nonempty`, `hbdd : BddAbove S`, and `hs : IsLUB S s`.
Then `∀ ε > 0, ∃ x ∈ S, x > s - ε`.

Logical form:

```lean
theorem EpsCharSup (S : Set ℝ) (s : ℝ) (hne : S.Nonempty)
    (hbdd : BddAbove S) (hs : IsLUB S s) :
    ∀ ε > 0, ∃ x ∈ S, x > s - ε
```
-/
theorem EpsCharSup (S : Set ℝ) (s : ℝ) (hne : S.Nonempty)
    (hbdd : BddAbove S) (hs : IsLUB S s) :
    ∀ ε > 0, ∃ x ∈ S, x > s - ε := by
  sorry

-- `thm:inductive-selection`
/-- Let `S : Set ℝ` and `s : ℝ`. If `hne : S.Nonempty`, `hbdd : BddAbove S`, and `hs : IsLUB S s`.
Then `∃ x : ℕ → ℝ, (∀ n, x n ∈ S) ∧ StrictMono x ∧ Filter.Tendsto x Filter.atTop (nhds s)`.

Logical form:

```lean
theorem InductiveSelection (S : Set ℝ) (s : ℝ) (hne : S.Nonempty)
    (hbdd : BddAbove S) (hs : IsLUB S s) :
    ∃ x : ℕ → ℝ, (∀ n, x n ∈ S) ∧ StrictMono x ∧
      Filter.Tendsto x Filter.atTop (nhds s)
```
-/
theorem InductiveSelection (S : Set ℝ) (s : ℝ) (hne : S.Nonempty)
    (hbdd : BddAbove S) (hs : IsLUB S s) :
    ∃ x : ℕ → ℝ, (∀ n, x n ∈ S) ∧ StrictMono x ∧
      Filter.Tendsto x Filter.atTop (nhds s) := by
  sorry

/-- Let `S : Set ℝ`. If `hne : S.Nonempty`, `hbdd_above : BddAbove S`, and `hbdd_below : BddBelow
S`. Then `(∃ x : ℕ → ℝ, (∀ n, x n ∈ S) ∧ Monotone x ∧ Filter.Tendsto x Filter.atTop (nhds (sSup
S))) ∧ (∃ y : ℕ → ℝ, (∀ n, y n ∈ S) ∧ Antitone y ∧ Filter.Tendsto y Filter.atTop (nhds (sInf
S)))`.

Logical form:

```lean
theorem MonotoneApproxBounds (S : Set ℝ) (hne : S.Nonempty)
    (hbdd_above : BddAbove S) (hbdd_below : BddBelow S) :
    (∃ x : ℕ → ℝ, (∀ n, x n ∈ S) ∧ Monotone x ∧
      Filter.Tendsto x Filter.atTop (nhds (sSup S))) ∧
    (∃ y : ℕ → ℝ, (∀ n, y n ∈ S) ∧ Antitone y ∧
      Filter.Tendsto y Filter.atTop (nhds (sInf S)))
```
-/
theorem MonotoneApproxBounds (S : Set ℝ) (hne : S.Nonempty)
    (hbdd_above : BddAbove S) (hbdd_below : BddBelow S) :
    (∃ x : ℕ → ℝ, (∀ n, x n ∈ S) ∧ Monotone x ∧
      Filter.Tendsto x Filter.atTop (nhds (sSup S))) ∧
    (∃ y : ℕ → ℝ, (∀ n, y n ∈ S) ∧ Antitone y ∧
      Filter.Tendsto y Filter.atTop (nhds (sInf S))) := by
  sorry

end LRA.Analysis.RealAnalysis
