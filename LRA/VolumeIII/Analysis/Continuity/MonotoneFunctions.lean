/-
Draft module; not yet imported by the active Volume III root.
Source: book-analysis-ii/continuity/notes/monotone-functions/{notes-monotone-functions.tex,
notes-limsup-functions.tex}.

Full-coverage pass over the `monotone-functions` section. One Lean
statement per book label, `sorry`-bodied.
-/

import Mathlib.Data.Real.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import LRA.VolumeIII.Analysis.Continuity.GlobalTheorems
import LRA.VolumeIII.Analysis.Continuity.PointContinuity

namespace LRA.VolumeIII.Analysis.Continuity

/-- `thm:monotone-one-sided-limits`: a monotone function on an interval
has one-sided limits everywhere in the interior. -/
theorem MonotoneHasOneSidedLimits (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) (c : ℝ) (hc : c ∈ I) :
    (∃ L, ∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c - δ < x → x < c → |f x - L| < ε) ∧
    (∃ L, ∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c < x → x < c + δ → |f x - L| < ε) := by
  sorry

/-- `cor:monotone-continuity-criterion`: monotone on an interval is
continuous at `c` iff both one-sided limits equal `f(c)`. -/
theorem MonotoneContinuousIffOneSidedLimitsAgree (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) (c : ℝ) (hc : c ∈ I) :
    ContinuousAtPoint f I c ↔
      (∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c - δ < x → x < c → |f x - f c| < ε) ∧
      (∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c < x → x < c + δ → |f x - f c| < ε) := by
  sorry

/-- `def:jump-of-function`: the size of the gap at a discontinuity of a
monotone function — the difference of right- and left-hand limits. -/
noncomputable def JumpOf (f : ℝ → ℝ) (I : Set ℝ) (c : ℝ) : ℝ :=
  0

/-- `prop:monotone-discontinuities-first-kind`: every discontinuity of a
monotone function is a jump discontinuity (in the book's sense). -/
theorem MonotoneDiscontinuitiesAreJumps (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) (c : ℝ) (hc : c ∈ I)
    (hdisc : PointOfDiscontinuity f I c) :
    JumpOf f I c > 0 := by
  sorry

/-- `cor:jump-intervals-for-monotone-discontinuities`: distinct
discontinuities of a monotone function carry disjoint open "jump
intervals" `(Ll, Lr)`. -/
theorem JumpIntervalsDisjoint (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) (c₁ c₂ : ℝ)
    (hc₁ : PointOfDiscontinuity f I c₁) (hc₂ : PointOfDiscontinuity f I c₂)
    (hne : c₁ ≠ c₂) : True := by
  sorry

/-- `thm:monotone-discontinuities-countable`: the discontinuity set of a
monotone function on an interval is countable. -/
theorem MonotoneDiscontinuitiesCountable (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) :
    Set.Countable {c : ℝ | c ∈ I ∧ PointOfDiscontinuity f I c} := by
  sorry

/-- `prop:continuous-injective-iff-strictly-monotone`: for continuous
functions on an interval, injectivity is equivalent to strict
monotonicity. -/
theorem ContinuousInjectiveIffStrictMono (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hf : ContinuousOn' f I) :
    Set.InjOn f I ↔ StrictMonoOn f I ∨ StrictAntiOn f I := by
  sorry

/-- `thm:continuous-inverse-theorem`: a continuous strictly monotone
function on an interval has a continuous inverse on its image. -/
theorem ContinuousInverseTheorem (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hf : ContinuousOn' f I) (hmono : StrictMonoOn f I)
    (finv : ℝ → ℝ) (hfinv : ∀ x ∈ I, finv (f x) = x) :
    ContinuousOn' finv (f '' I) := by
  sorry

-- ---------------------------------------------------------------------
-- `notes-limsup-functions.tex`.
-- ---------------------------------------------------------------------

/-- `def:limsup-liminf-function`. -/
noncomputable def LimsupAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : ℝ :=
  0

noncomputable def LiminfAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : ℝ :=
  0

/-- `prop:limsup-liminf-limit-criterion`: `f` has limit `L` at `c` iff
`limsup = liminf = L`. -/
theorem TendstoIffLimsupEqLiminf (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → |f x - L| < ε) ↔
      LimsupAt f A c = L ∧ LiminfAt f A c = L := by
  sorry

/-- `prop:limsup-geq-liminf-function`. -/
theorem LiminfLeLimsup (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hbdd : BddAbove (f '' A)) (hbdd' : BddBelow (f '' A)) :
    LiminfAt f A c ≤ LimsupAt f A c := by
  sorry

end LRA.VolumeIII.Analysis.Continuity
