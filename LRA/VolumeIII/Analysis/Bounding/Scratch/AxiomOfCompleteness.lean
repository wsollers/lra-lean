/-
SCRATCH FILE — not wired into the lra-lean project.
Imports only this pass's own scratch files and Mathlib — nothing from the
real `LRA.VolumeIII.Analysis.Bounding.Bounds`, so this can be freely
refactored or discarded without touching the working project.
Source: volume-iii/book-analysis-i/bounding/notes/completeness/notes-axiom-of-completess.tex
First file of `completeness` (installment 1 of 6 for this chapter).

Audit note: clean, correct, 2 nodes. `def:least-upper-bound-property` is
stated generally over any partially ordered set, and
`ax:completeness-of-reals` asserts ℝ has it. Minor cross-file note (not a
bug): `thm:lub-property-implies-existence-of-suprema` back in
`bounds-extremals/notes-suprema-infima.tex` already cited
`def:least-upper-bound-property` as a dependency before it was formally
introduced here — a forward reference in the citation list. Harmless:
that theorem is a general conditional ("if S has the LUB property, then
suprema exist") that doesn't actually need `ax:completeness-of-reals`
itself, only the defined term appearing in its hypothesis.

Mathlib's ℝ is Dedekind-complete already (`Real.exists_isLUB` et al.), so
`completeness_of_reals` below is a genuinely provable fact, not an axiom
in the Lean sense — kept as `sorry` per house proof policy for this pass,
but flagged as low-hanging fruit if/when this scratch work moves toward
actual proof completion.
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

/-- `def:least-upper-bound-property`. `S` has the least upper bound
property if every nonempty subset of `S` bounded above in `S` has a
supremum in `S`. -/
def HasLeastUpperBoundProperty (S : Type*) [Preorder S] : Prop :=
  ∀ A : Set S, A.Nonempty → (∃ u, IsUpperBoundOf u A) → ∃ s, IsSupremum s A

/-- `ax:completeness-of-reals`. ℝ has the least upper bound property.
Mathlib already proves this for ℝ (`Real.exists_isLUB` and friends) — kept
as `sorry` here per house proof policy, not because it's actually open. -/
theorem completeness_of_reals : HasLeastUpperBoundProperty ℝ := by
  sorry

end Scratch
end Bounding
end Analysis
end VolumeIII
end LRA
