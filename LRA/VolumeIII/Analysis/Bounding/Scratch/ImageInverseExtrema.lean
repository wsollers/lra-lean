/-
SCRATCH FILE — not wired into the lra-lean project.
Imports only this pass's own scratch files and Mathlib — nothing from the
real `LRA.VolumeIII.Analysis.Bounding.Bounds`, so this can be freely
refactored or discarded without touching the working project.
Source: volume-iii/book-analysis-i/bounding/notes/bounds-algebra/notes-image-inverse-extrema.tex
Third file of `bounds-algebra` (installment 3 of 5 for this chapter).

Structural finding (not a math error): every node in this .tex file cites
`def:continuous-at-point`, `def:function-increasing`, and
`def:function-decreasing` as dependencies — none of which exist yet
anywhere earlier in the read order. Continuity is normally introduced
after sequences and function limits, well past where this "Bounds"
chapter sits in the stated roadmap (bounds → sequences → function limits
→ derivatives). This file reaches forward for concepts several chapters
away. Not wrong math, just a forward dependency worth knowing about —
whether that's intentional (motivating material placed early) or should
be resequenced is an editorial call, not something I've changed.

Because of that forward dependency, and because these are standalone
scratch files anyway, formalized directly against Mathlib's own
continuity/monotonicity machinery (`MonotoneOn`, `AntitoneOn`,
`ContinuousWithinAt`, `Set.BijOn`) rather than inventing placeholder
stand-ins for the project's not-yet-written `def:continuous-at-point` /
`def:function-increasing`. `IsSupremum`/`IsInfimum` are reused from
`SupremaInfima.lean`.

Core math verified correct on all 8 nodes: increasing + continuous at the
endpoint carries sup→sup and inf→inf; decreasing + continuous at the
endpoint swaps sup↔inf; and the four inverse-function theorems are just
the direct-image theorems applied to `f⁻¹`. In every case BOTH hypotheses
are genuinely needed — monotonicity alone only gives the one-sided bound,
continuity is what makes it sharp (attained in the limit).
-/

import Mathlib.Order.Defs
import Mathlib.Data.Set.Defs
import Mathlib.Topology.Order.OrderClosed
import Mathlib.Topology.Algebra.Order.MonotoneContinuity
import LRA.VolumeIII.Analysis.Bounding.Scratch.UpperLowerBounds
import LRA.VolumeIII.Analysis.Bounding.Scratch.SupremaInfima

namespace LRA
namespace VolumeIII
namespace Analysis
namespace Bounding
namespace Scratch

/-- `thm:increasing-image-preserves-suprema`. -/
theorem increasing_image_preserves_suprema {I A : Set ℝ} (hAI : A ⊆ I)
    (hAne : A.Nonempty) {s : ℝ} (hs : IsSupremum s A) (hsI : s ∈ I)
    {f : ℝ → ℝ} (hf_mono : MonotoneOn f I)
    (hf_cont : ContinuousWithinAt f I s) :
    IsSupremum (f s) (f '' A) := by
  sorry

/-- `thm:increasing-image-preserves-infima`. -/
theorem increasing_image_preserves_infima {I A : Set ℝ} (hAI : A ⊆ I)
    (hAne : A.Nonempty) {i : ℝ} (hi : IsInfimum i A) (hiI : i ∈ I)
    {f : ℝ → ℝ} (hf_mono : MonotoneOn f I)
    (hf_cont : ContinuousWithinAt f I i) :
    IsInfimum (f i) (f '' A) := by
  sorry

/-- `thm:decreasing-image-infimum-to-supremum`. -/
theorem decreasing_image_infimum_to_supremum {I A : Set ℝ} (hAI : A ⊆ I)
    (hAne : A.Nonempty) {i : ℝ} (hi : IsInfimum i A) (hiI : i ∈ I)
    {f : ℝ → ℝ} (hf_anti : AntitoneOn f I)
    (hf_cont : ContinuousWithinAt f I i) :
    IsSupremum (f i) (f '' A) := by
  sorry

/-- `thm:decreasing-image-supremum-to-infimum`. -/
theorem decreasing_image_supremum_to_infimum {I A : Set ℝ} (hAI : A ⊆ I)
    (hAne : A.Nonempty) {s : ℝ} (hs : IsSupremum s A) (hsI : s ∈ I)
    {f : ℝ → ℝ} (hf_anti : AntitoneOn f I)
    (hf_cont : ContinuousWithinAt f I s) :
    IsInfimum (f s) (f '' A) := by
  sorry

/-- `thm:increasing-inverse-preserves-suprema`. `f : I → J` a continuous
strictly increasing bijection; applied to a bounded-above `B ⊆ J` with
`sup B ∈ J`. -/
theorem increasing_inverse_preserves_suprema {I J B : Set ℝ}
    {f g : ℝ → ℝ} (hbij : Set.BijOn f I J) (hinv : Set.InvOn g f I J)
    (hBJ : B ⊆ J) (hBne : B.Nonempty) {u : ℝ} (hu : IsSupremum u B)
    (huJ : u ∈ J) (hg_mono : MonotoneOn g J)
    (hg_cont : ContinuousWithinAt g J u) :
    IsSupremum (g u) (g '' B) := by
  sorry

/-- `thm:increasing-inverse-preserves-infima`. -/
theorem increasing_inverse_preserves_infima {I J B : Set ℝ}
    {f g : ℝ → ℝ} (hbij : Set.BijOn f I J) (hinv : Set.InvOn g f I J)
    (hBJ : B ⊆ J) (hBne : B.Nonempty) {v : ℝ} (hv : IsInfimum v B)
    (hvJ : v ∈ J) (hg_mono : MonotoneOn g J)
    (hg_cont : ContinuousWithinAt g J v) :
    IsInfimum (g v) (g '' B) := by
  sorry

/-- `thm:decreasing-inverse-infimum-to-supremum`. -/
theorem decreasing_inverse_infimum_to_supremum {I J B : Set ℝ}
    {f g : ℝ → ℝ} (hbij : Set.BijOn f I J) (hinv : Set.InvOn g f I J)
    (hBJ : B ⊆ J) (hBne : B.Nonempty) {v : ℝ} (hv : IsInfimum v B)
    (hvJ : v ∈ J) (hg_anti : AntitoneOn g J)
    (hg_cont : ContinuousWithinAt g J v) :
    IsSupremum (g v) (g '' B) := by
  sorry

/-- `thm:decreasing-inverse-supremum-to-infimum`. -/
theorem decreasing_inverse_supremum_to_infimum {I J B : Set ℝ}
    {f g : ℝ → ℝ} (hbij : Set.BijOn f I J) (hinv : Set.InvOn g f I J)
    (hBJ : B ⊆ J) (hBne : B.Nonempty) {u : ℝ} (hu : IsSupremum u B)
    (huJ : u ∈ J) (hg_anti : AntitoneOn g J)
    (hg_cont : ContinuousWithinAt g J u) :
    IsInfimum (g u) (g '' B) := by
  sorry

end Scratch
end Bounding
end Analysis
end VolumeIII
end LRA
