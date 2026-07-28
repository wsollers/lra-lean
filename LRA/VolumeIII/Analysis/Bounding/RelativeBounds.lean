/-
Draft module; not yet imported by the active Volume III root.
Source: bounding/notes/bounds-extremals/notes-relative-bounds-suprema.tex
(new file added in the bounding-chapter rework; audited but never formalized
until now — see ISSUES.md #39 for the one finding on this file: its
`def:relative-supremum-infimum` dependency list cites the ordinary
`def:supremum`/`def:infimum`, unused by the formal definition, while omitting
`def:relative-bounds`, defined 50 lines earlier, which it explicitly builds
on). As of this pass the file is still not `\input` into `index.tex`.

Formalized generically over an arbitrary preorder `T`, matching the .tex's
own `(T,≤)` ordered-set setup — the relative-bounds framework is genuinely
type-generic, not ℝ-specific, which is exactly its point (it's what lets the
same definitions describe "bounded in ℚ" vs "bounded in ℝ" for the same set).
-/

import Mathlib.Order.Basic
import Mathlib.Data.Real.Basic
import Mathlib.Data.Real.Sqrt
import Mathlib.Data.Rat.Cast.Defs

namespace LRA
namespace VolumeIII
namespace Analysis
namespace Bounding

variable {T : Type*} [Preorder T]

/-- `def:relative-bounds`. -/
def IsRelativeUpperBound (u : T) (A S : Set T) : Prop :=
  u ∈ S ∧ ∀ a ∈ A, a ≤ u

/-- `def:relative-bounds`. -/
def IsRelativeLowerBound (l : T) (A S : Set T) : Prop :=
  l ∈ S ∧ ∀ a ∈ A, l ≤ a

/-- `def:relative-supremum-infimum`. -/
def IsRelativeSupremum (s : T) (A S : Set T) : Prop :=
  IsRelativeUpperBound s A S ∧ ∀ u ∈ S, (∀ a ∈ A, a ≤ u) → s ≤ u

/-- `def:relative-supremum-infimum`. -/
def IsRelativeInfimum (i : T) (A S : Set T) : Prop :=
  IsRelativeLowerBound i A S ∧ ∀ l ∈ S, (∀ a ∈ A, l ≤ a) → l ≤ i

/- ================================================================
   ADDITIONS.md item 24. Added with user sign-off.
   ================================================================ -/

/-- ADDITIONS.md #24. If the ORDINARY supremum of `A` exists and happens to
land inside the ambient carrier `S`, it is also the relative supremum of `A`
in `S` — the missing bridge between this file's relative-bounds framework
and the plain `def:supremum` content elsewhere in the book. This is exactly
the theorem that makes the file's own motivating example
(`{q∈ℚ:q²<2}` has supremum `√2` in `ℝ` but no relative supremum in `ℚ`)
rigorous rather than merely suggestive: `√2 ∉ ℚ` is precisely why the
hypothesis `s ∈ S` fails when `S = ℚ`. -/
theorem OrdinarySupremumInSIsRelativeSupremum
    (A S : Set T) (s : T) (hs : IsLUB A s) (hsS : s ∈ S) :
    IsRelativeSupremum s A S := by
  sorry

/-- Dual of `OrdinarySupremumInSIsRelativeSupremum` for infima. -/
theorem OrdinaryInfimumInSIsRelativeInfimum
    (A S : Set T) (i : T) (hi : IsGLB A i) (hiS : i ∈ S) :
    IsRelativeInfimum i A S := by
  sorry

/- ================================================================
   ADDITIONS.md item 21. Added with user sign-off. Worked example
   instantiating the file's own recurring motivating remark
   (`{q∈ℚ:q²<2}` has no relative supremum in `ℚ` but supremum `√2` in
   `ℝ`) against the actual `IsRelativeSupremum` machinery above, with
   the ambient type fixed to `ℝ` and `S` ranging over the embedded
   copy of `ℚ` versus all of `ℝ`. Companion to
   `CompletenessAdditions.lean`'s `RationalsLackLubProperty`
   (ADDITIONS.md #20) — same underlying fact, viewed through the
   relative-bounds lens instead of the plain-LUB-property lens.
   ================================================================ -/

/-- The set `{q∈ℚ:q²<2}`, viewed as a subset of the ambient `ℝ` (cast
along `ℚ ↪ ℝ`) — the file's own recurring motivating example, made
concrete. -/
def RationalsWithSquareLessThanTwoInR : Set ℝ :=
  {x : ℝ | ∃ q : ℚ, x = (q : ℝ) ∧ q ^ 2 < 2}

/-- ADDITIONS.md #21. `S = {x∈ℚ:x²<2}` has NO relative supremum when the
ambient carrier is restricted to the embedded copy of `ℚ` inside `ℝ` — the
relative-bounds-framework restatement of `RationalsLackLubProperty`. -/
theorem NoRelativeSupremumOfRationalsExample :
    ¬ ∃ s : ℝ, IsRelativeSupremum s RationalsWithSquareLessThanTwoInR
      (Set.range ((↑) : ℚ → ℝ)) := by
  sorry

/-- ADDITIONS.md #21. The SAME set has relative supremum `√2` once the
ambient carrier is widened to all of `ℝ` — direct instance of
`OrdinarySupremumInSIsRelativeSupremum` above with `S = Set.univ`,
since `√2 ∈ ℝ = Set.univ` trivially. This is the theorem that makes the
file's own motivating remark rigorous: the only thing that changed between
the two results is whether the candidate supremum `√2` lies in the ambient
carrier `S`. -/
theorem RelativeSupremumOfRationalsInRExample :
    IsRelativeSupremum (Real.sqrt 2) RationalsWithSquareLessThanTwoInR
      (Set.univ : Set ℝ) := by
  sorry

end Bounding
end Analysis
end VolumeIII
end LRA
