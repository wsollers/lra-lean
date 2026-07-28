/-
SCRATCH FILE — not wired into the lra-lean project.
Imports only this pass's own scratch files and Mathlib — nothing from the
real `LRA.VolumeIII.Analysis.Bounding.Bounds`, so this can be freely
refactored or discarded without touching the working project.
Source: volume-iii/book-analysis-i/bounding/notes/bounds-extremals/notes-epsilon-characterization-supremum.tex
Installment 4 of 5 for bounds-extremals.

Audit note: found and fixed a real structural defect in the .tex before
formalizing — both `def:epsilon-characterization-of-supremum` and
`def:epsilon-characterization-of-infimum` had a duplicated "Failure modes"
remark block (an older plain-exposition version immediately followed by a
newer underbrace-annotated version with otherwise identical content),
almost certainly a merge artifact from an earlier edit pass. Removed the
older duplicate of each, kept the underbrace version. Not a math error —
the actual Definition/Lemma statements and their Standard/Predicate/
Negated/Negation-predicate remarks were all correct and un-duplicated —
but it's exactly the kind of authoring bug that would confuse the
knowledge-explorer extraction pipeline (two `failure_modes` blocks
competing for one node).

Core math verified correct: both epsilon characterizations match the
standard textbook statement (upper/lower bound clause + epsilon-gap
clause), and both strict-approximation lemmas follow directly from them.

These are stated over ℝ directly (not generalized to an arbitrary ordered
field/`S`), since the epsilon clause genuinely needs subtraction (`s - ε`)
and a notion of "arbitrarily small positive" — real structure, not just an
order. Formalized as iff theorems relating `IsSupremum`/`IsInfimum`
(already defined in `SupremaInfima.lean`) to their unpacked epsilon
characterization, rather than as new standalone predicates, since that is
what the .tex's "if and only if" phrasing actually asserts.
-/

import Mathlib.Order.Defs
import Mathlib.Data.Set.Defs
import LRA.VolumeIII.Analysis.Bounding.Scratch.UpperLowerBounds
import LRA.VolumeIII.Analysis.Bounding.Scratch.SupremaInfima

namespace LRA
namespace VolumeIII
namespace Analysis
namespace Bounding
namespace Scratch

/-- `def:epsilon-characterization-of-supremum`. `s = sup A` iff `s` is an
upper bound of `A` and every positive `ε` admits a point of `A` strictly
above `s - ε`. -/
theorem epsilon_characterization_of_supremum {A : Set ℝ} {s : ℝ} :
    IsSupremum s A ↔ IsUpperBoundOf s A ∧ ∀ ε > 0, ∃ a ∈ A, s - ε < a := by
  sorry

/-- `def:epsilon-characterization-of-infimum`. -/
theorem epsilon_characterization_of_infimum {A : Set ℝ} {i : ℝ} :
    IsInfimum i A ↔ IsLowerBoundOf i A ∧ ∀ ε > 0, ∃ a ∈ A, a < i + ε := by
  sorry

/-- `lem:supremum-strict-upper-approximation`. Every number strictly below a
supremum is crossed by some element of the set. -/
theorem supremum_strict_upper_approximation {A : Set ℝ} {s : ℝ}
    (hs : IsSupremum s A) {x : ℝ} (hx : x < s) :
    ∃ a ∈ A, x < a ∧ a ≤ s := by
  sorry

/-- `lem:infimum-strict-lower-approximation`. Every number strictly above an
infimum is reached from below by some element of the set. -/
theorem infimum_strict_lower_approximation {A : Set ℝ} {i : ℝ}
    (hi : IsInfimum i A) {x : ℝ} (hx : i < x) :
    ∃ a ∈ A, i ≤ a ∧ a < x := by
  sorry

end Scratch
end Bounding
end Analysis
end VolumeIII
end LRA
