/-
SCRATCH FILE — not wired into the lra-lean project.
Not imported by, and does not import, any LRA.* file. Only Mathlib is used.
Source: volume-iii/book-analysis-i/bounding/notes/bounds-extremals/notes-upper-lower-bounds.tex
Corresponds to: def:bound, def:real-upper-bound, def:real-lower-bound,
                 def:bounded-above, def:bounded-below, def:bounded

Verification pass, installment 1 of 5 for bounds-extremals. All six
definitions below were checked against the live .tex source (statement,
predicate reading, negation, empty-set convention) and found precise and
internally consistent. No sorries needed here — this file is definitions
only; the source file has no theorem-like environments.

Written generally (over an arbitrary `Preorder`/`LE` type `F`) rather than
literally specialized to `ℝ` the way the .tex text is, since the .tex
"...in the Real Line" definitions are themselves just the general order
notions instantiated at `F := ℝ`. Nothing is lost: `IsBoundedAbove (A : Set ℝ)`
below specializes to exactly the .tex statement when read with `F := ℝ`.
-/

import Mathlib.Order.Defs
import Mathlib.Data.Set.Defs
import Mathlib.Algebra.Order.Group.Abs

namespace LRA
namespace VolumeIII
namespace Analysis
namespace Bounding
namespace Scratch

variable {F : Type*}

/-- `def:bound`. `b` is a bound of `A` if it is either an upper bound or a
lower bound of `A`. Deliberately does NOT require `A` nonempty: per the
source's "Empty-set convention" remark, every `b` vacuously bounds `∅` from
both sides, and that is intentional, not an oversight. -/
def IsBound [LE F] (b : F) (A : Set F) : Prop :=
  (∀ a ∈ A, a ≤ b) ∨ (∀ a ∈ A, b ≤ a)

/-- `def:real-upper-bound` / general "Upper Bound". `u` is an upper bound of
`A` if every element of `A` is `≤ u`. The .tex states this only for
`A ⊆ ℝ`; here `F := ℝ` recovers that literally. -/
def IsUpperBoundOf [LE F] (u : F) (A : Set F) : Prop :=
  ∀ a ∈ A, a ≤ u

/-- `def:real-lower-bound` / general "Lower Bound". -/
def IsLowerBoundOf [LE F] (l : F) (A : Set F) : Prop :=
  ∀ a ∈ A, l ≤ a

/-- `def:bounded-above`. `A` is bounded above if some upper bound exists. -/
def IsBoundedAbove [LE F] (A : Set F) : Prop :=
  ∃ u, IsUpperBoundOf u A

/-- `def:bounded-below`. `A` is bounded below if some lower bound exists. -/
def IsBoundedBelow [LE F] (A : Set F) : Prop :=
  ∃ l, IsLowerBoundOf l A

/-- `def:bounded`. `A` is bounded if it is both bounded above and bounded
below. The .tex also states an "equivalently, ∃M≥0, ∀a∈A, |a|≤M"
characterization; that equivalence is `IsBounded_iff_abs_bound` below,
per `prop:bounded-iff-absolute-value-bound` (added to the .tex in this
same pass). -/
def IsBounded [LE F] (A : Set F) : Prop :=
  IsBoundedAbove A ∧ IsBoundedBelow A

/-- `prop:bounded-iff-absolute-value-bound`. Reconciles the two-sided
`IsBounded` with the single-number absolute-value characterization used
throughout analysis. Needs more than `[LE F]`: absolute value requires
negation and a linear order, hence `LinearOrderedAddCommGroup` (ℝ is an
instance). Statement only — `sorry`, not proved, per house proof policy. -/
theorem IsBounded_iff_abs_bound [LinearOrderedAddCommGroup F] (A : Set F) :
    IsBounded A ↔ ∃ M ≥ 0, ∀ a ∈ A, |a| ≤ M := by
  sorry

end Scratch
end Bounding
end Analysis
end VolumeIII
end LRA
