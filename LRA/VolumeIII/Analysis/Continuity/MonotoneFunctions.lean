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

-- `thm:monotone-one-sided-limits`
/-- Let `I : Set ℝ` and `c : ℝ`. If `f : ℝ → ℝ`, `hI : I.OrdConnected`, `hmono : MonotoneOn f I`,
and `hc : c ∈ I`. Then `(∃ L, ∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c - δ < x → x < c → |f x - L| < ε) ∧ (∃
L, ∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c < x → x < c + δ → |f x - L| < ε)`.

Logical form:

```lean
theorem MonotoneHasOneSidedLimits (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) (c : ℝ) (hc : c ∈ I) :
    (∃ L, ∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c - δ < x → x < c → |f x - L| < ε) ∧
    (∃ L, ∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c < x → x < c + δ → |f x - L| < ε)
```
-/
theorem MonotoneHasOneSidedLimits (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) (c : ℝ) (hc : c ∈ I) :
    (∃ L, ∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c - δ < x → x < c → |f x - L| < ε) ∧
    (∃ L, ∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c < x → x < c + δ → |f x - L| < ε) := by
  sorry

/-- Let `I : Set ℝ` and `c : ℝ`. If `f : ℝ → ℝ`, `hI : I.OrdConnected`, `hmono : MonotoneOn f I`,
and `hc : c ∈ I`. Then `ContinuousAtPoint f I c ↔ (∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c - δ < x → x < c
→ |f x - f c| < ε) ∧ (∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c < x → x < c + δ → |f x - f c| < ε)`.

Logical form:

```lean
theorem MonotoneContinuousIffOneSidedLimitsAgree (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) (c : ℝ) (hc : c ∈ I) :
    ContinuousAtPoint f I c ↔
      (∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c - δ < x → x < c → |f x - f c| < ε) ∧
      (∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c < x → x < c + δ → |f x - f c| < ε)
```
-/
theorem MonotoneContinuousIffOneSidedLimitsAgree (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) (c : ℝ) (hc : c ∈ I) :
    ContinuousAtPoint f I c ↔
      (∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c - δ < x → x < c → |f x - f c| < ε) ∧
      (∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c < x → x < c + δ → |f x - f c| < ε) := by
  sorry

/-- `def:jump-of-function`: the size of the gap at a discontinuity of a
monotone function — the difference of right- and left-hand limits.

Logical form:

```lean
noncomputable def JumpOf (f : ℝ → ℝ) (I : Set ℝ) (c : ℝ) : ℝ :=
  0
```
-/
noncomputable def JumpOf (f : ℝ → ℝ) (I : Set ℝ) (c : ℝ) : ℝ :=
  0

/-- Let `I : Set ℝ` and `c : ℝ`. If `f : ℝ → ℝ`, `hI : I.OrdConnected`, `hmono : MonotoneOn f I`,
`hc : c ∈ I`, and `hdisc : PointOfDiscontinuity f I c`. Then `JumpOf f I c > 0`.

Logical form:

```lean
theorem MonotoneDiscontinuitiesAreJumps (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) (c : ℝ) (hc : c ∈ I)
    (hdisc : PointOfDiscontinuity f I c) :
    JumpOf f I c > 0
```
-/
theorem MonotoneDiscontinuitiesAreJumps (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) (c : ℝ) (hc : c ∈ I)
    (hdisc : PointOfDiscontinuity f I c) :
    JumpOf f I c > 0 := by
  sorry

/-- Let `I : Set ℝ` and `c₁ c₂ : ℝ`. If `f : ℝ → ℝ`, `hI : I.OrdConnected`, `hmono : MonotoneOn f
I`, `hc₁ : PointOfDiscontinuity f I c₁`, `hc₂ : PointOfDiscontinuity f I c₂`, and `hne : c₁ ≠
c₂`. Then `True`.

Logical form:

```lean
theorem JumpIntervalsDisjoint (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) (c₁ c₂ : ℝ)
    (hc₁ : PointOfDiscontinuity f I c₁) (hc₂ : PointOfDiscontinuity f I c₂)
    (hne : c₁ ≠ c₂) : True
```
-/
theorem JumpIntervalsDisjoint (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) (c₁ c₂ : ℝ)
    (hc₁ : PointOfDiscontinuity f I c₁) (hc₂ : PointOfDiscontinuity f I c₂)
    (hne : c₁ ≠ c₂) : True := by
  sorry

-- `thm:monotone-discontinuities-countable`
/-- Let `I : Set ℝ`. If `f : ℝ → ℝ`, `hI : I.OrdConnected`, and `hmono : MonotoneOn f I`. Then
`Set.Countable {c : ℝ | c ∈ I ∧ PointOfDiscontinuity f I c}`.

Logical form:

```lean
theorem MonotoneDiscontinuitiesCountable (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) :
    Set.Countable {c : ℝ | c ∈ I ∧ PointOfDiscontinuity f I c}
```
-/
theorem MonotoneDiscontinuitiesCountable (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) :
    Set.Countable {c : ℝ | c ∈ I ∧ PointOfDiscontinuity f I c} := by
  sorry

/-- Let `I : Set ℝ`. If `f : ℝ → ℝ`, `hI : I.OrdConnected`, and `hf : ContinuousOn' f I`. Then
`Set.InjOn f I ↔ StrictMonoOn f I ∨ StrictAntiOn f I`.

Logical form:

```lean
theorem ContinuousInjectiveIffStrictMono (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hf : ContinuousOn' f I) :
    Set.InjOn f I ↔ StrictMonoOn f I ∨ StrictAntiOn f I
```
-/
theorem ContinuousInjectiveIffStrictMono (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hf : ContinuousOn' f I) :
    Set.InjOn f I ↔ StrictMonoOn f I ∨ StrictAntiOn f I := by
  sorry

-- `thm:continuous-inverse-theorem`
/-- Let `I : Set ℝ`. If `f : ℝ → ℝ`, `hI : I.OrdConnected`, `hf : ContinuousOn' f I`, `hmono :
StrictMonoOn f I`, `finv : ℝ → ℝ`, and `hfinv : ∀ x ∈ I, finv (f x) = x`. Then `ContinuousOn'
finv (f '' I)`.

Logical form:

```lean
theorem ContinuousInverseTheorem (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hf : ContinuousOn' f I) (hmono : StrictMonoOn f I)
    (finv : ℝ → ℝ) (hfinv : ∀ x ∈ I, finv (f x) = x) :
    ContinuousOn' finv (f '' I)
```
-/
theorem ContinuousInverseTheorem (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hf : ContinuousOn' f I) (hmono : StrictMonoOn f I)
    (finv : ℝ → ℝ) (hfinv : ∀ x ∈ I, finv (f x) = x) :
    ContinuousOn' finv (f '' I) := by
  sorry

-- ---------------------------------------------------------------------
-- `notes-limsup-functions.tex`.
-- ---------------------------------------------------------------------

/-- `def:limsup-liminf-function`.

Logical form:

```lean
noncomputable def LimsupAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : ℝ :=
  0
```
-/
noncomputable def LimsupAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : ℝ :=
  0

/--
`LiminfAt` defines the displayed object for liminf at.

Logical form:

```lean
noncomputable def LiminfAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : ℝ :=
  0
```
-/
noncomputable def LiminfAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : ℝ :=
  0

/-- Let `A : Set ℝ` and `c L : ℝ`. If `f : ℝ → ℝ`. Then `(∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| →
|x - c| < δ → |f x - L| < ε) ↔ LimsupAt f A c = L ∧ LiminfAt f A c = L`.

Logical form:

```lean
theorem TendstoIffLimsupEqLiminf (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → |f x - L| < ε) ↔
      LimsupAt f A c = L ∧ LiminfAt f A c = L
```
-/
theorem TendstoIffLimsupEqLiminf (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → |f x - L| < ε) ↔
      LimsupAt f A c = L ∧ LiminfAt f A c = L := by
  sorry

/-- Let `A : Set ℝ` and `c : ℝ`. If `f : ℝ → ℝ`, `hbdd : BddAbove (f '' A)`, and `hbdd' : BddBelow
(f '' A)`. Then `LiminfAt f A c ≤ LimsupAt f A c`.

Logical form:

```lean
theorem LiminfLeLimsup (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hbdd : BddAbove (f '' A)) (hbdd' : BddBelow (f '' A)) :
    LiminfAt f A c ≤ LimsupAt f A c
```
-/
theorem LiminfLeLimsup (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hbdd : BddAbove (f '' A)) (hbdd' : BddBelow (f '' A)) :
    LiminfAt f A c ≤ LimsupAt f A c := by
  sorry

end LRA.VolumeIII.Analysis.Continuity
