/-
Draft module; not yet imported by the active Volume III root.
Source: book-analysis-ii/continuity/notes/monotone-functions/{notes-monotone-functions.tex,
notes-limsup-functions.tex}.

Full-coverage pass over the `monotone-functions` section. One Lean
statement per book label, `sorry`-bodied.
-/

import Mathlib.Data.Real.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import LRA.Analysis.Continuity.GlobalTheorems
import LRA.Analysis.Continuity.PointContinuity

namespace LRA.Analysis.Continuity

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

/-- `def:jump-of-function`: `J` is the jump size at `c` when it is the
difference between the right- and left-hand limits.

Logical form:

```lean
def JumpOf (f : ℝ → ℝ) (I : Set ℝ) (c J : ℝ) : Prop :=
  0 ≤ J ∧ ∃ L₁ L₂ : ℝ,
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c - δ < x → x < c -> |f x - L₁| < ε) ∧
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c < x → x < c + δ -> |f x - L₂| < ε) ∧
    J = L₂ - L₁
```
-/
def JumpOf (f : ℝ → ℝ) (I : Set ℝ) (c J : ℝ) : Prop :=
  0 ≤ J ∧ ∃ L₁ L₂ : ℝ,
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c - δ < x → x < c -> |f x - L₁| < ε) ∧
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c < x → x < c + δ -> |f x - L₂| < ε) ∧
    J = L₂ - L₁

/-- Let `I : Set ℝ` and `c : ℝ`. If `f : ℝ → ℝ`, `hI : I.OrdConnected`, `hmono : MonotoneOn f I`,
`hc : c ∈ I`, and `hdisc : PointOfDiscontinuity f I c`. Then `∃ J > 0, JumpOf f I c J`.

Logical form:

```lean
theorem MonotoneDiscontinuitiesAreJumps (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) (c : ℝ) (hc : c ∈ I)
    (hdisc : PointOfDiscontinuity f I c) :
    ∃ J > 0, JumpOf f I c J
```
-/
theorem MonotoneDiscontinuitiesAreJumps (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) (c : ℝ) (hc : c ∈ I)
    (hdisc : PointOfDiscontinuity f I c) :
    ∃ J > 0, JumpOf f I c J := by
  sorry

/-- Let `I : Set ℝ` and `c₁ c₂ : ℝ`. If `f : ℝ → ℝ`, `hI : I.OrdConnected`, `hmono : MonotoneOn f
I`, `hc₁ : PointOfDiscontinuity f I c₁`, `hc₂ : PointOfDiscontinuity f I c₂`, and `hne : c₁ ≠
c₂`. Then `True`.

Logical form:

```lean
theorem JumpIntervalsDisjoint (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) (c₁ c₂ : ℝ)
    (hc₁ : PointOfDiscontinuity f I c₁) (hc₂ : PointOfDiscontinuity f I c₂)
    (hne : c₁ ≠ c₂) (J₁ J₂ : ℝ)
    (hj₁ : JumpOf f I c₁ J₁) (hj₂ : JumpOf f I c₂ J₂) :
    Disjoint
      (Set.Ioc c₁ (c₁ + J₁))
      (Set.Ioc c₂ (c₂ + J₂))
```
-/
theorem JumpIntervalsDisjoint (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) (c₁ c₂ : ℝ)
    (hc₁ : PointOfDiscontinuity f I c₁) (hc₂ : PointOfDiscontinuity f I c₂)
    (hne : c₁ ≠ c₂) (J₁ J₂ : ℝ)
    (hj₁ : JumpOf f I c₁ J₁) (hj₂ : JumpOf f I c₂ J₂) :
    Disjoint
      (Set.Ioc c₁ (c₁ + J₁))
      (Set.Ioc c₂ (c₂ + J₂)) := by
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

/-- `def:limsup-liminf-function`. `L` is a limsup value at `c` when
values of `f` near `c` are eventually bounded above by `L + ε`, and
arbitrarily small punctured neighbourhoods still realize values above
`L - ε`.

Logical form:

```lean
def LimsupAt (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) : Prop :=
  (∀ ε > 0, ∃ δ > 0,
    ∀ x ∈ A, 0 < |x - c| → |x - c| < δ -> f x < L + ε) ∧
  (∀ ε > 0, ∀ δ > 0, ∃ x ∈ A,
    0 < |x - c| ∧ |x - c| < δ ∧ L - ε < f x)
```
-/
def LimsupAt (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) : Prop :=
  (∀ ε > 0, ∃ δ > 0,
    ∀ x ∈ A, 0 < |x - c| → |x - c| < δ -> f x < L + ε) ∧
  (∀ ε > 0, ∀ δ > 0, ∃ x ∈ A,
    0 < |x - c| ∧ |x - c| < δ ∧ L - ε < f x)

/--
`LiminfAt` defines the displayed object for liminf at. `L` is a liminf
value at `c` when values of `f` near `c` are eventually bounded below by
`L - ε`, and arbitrarily small punctured neighbourhoods still realize
values below `L + ε`.

Logical form:

```lean
def LiminfAt (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) : Prop :=
  (∀ ε > 0, ∃ δ > 0,
    ∀ x ∈ A, 0 < |x - c| → |x - c| < δ -> L - ε < f x) ∧
  (∀ ε > 0, ∀ δ > 0, ∃ x ∈ A,
    0 < |x - c| ∧ |x - c| < δ ∧ f x < L + ε)
```
-/
def LiminfAt (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) : Prop :=
  (∀ ε > 0, ∃ δ > 0,
    ∀ x ∈ A, 0 < |x - c| → |x - c| < δ -> L - ε < f x) ∧
  (∀ ε > 0, ∀ δ > 0, ∃ x ∈ A,
    0 < |x - c| ∧ |x - c| < δ ∧ f x < L + ε)

/-- Let `A : Set ℝ` and `c L : ℝ`. If `f : ℝ → ℝ`. Then `(∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| →
|x - c| < δ → |f x - L| < ε) ↔ LimsupAt f A c L ∧ LiminfAt f A c L`.

Logical form:

```lean
theorem TendstoIffLimsupAndLiminf (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → |f x - L| < ε) ↔
      LimsupAt f A c L ∧ LiminfAt f A c L
```
-/
theorem TendstoIffLimsupAndLiminf (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → |f x - L| < ε) ↔
      LimsupAt f A c L ∧ LiminfAt f A c L := by
  sorry

/-- Let `A : Set ℝ` and `c L₁ L₂ : ℝ`. If `f : ℝ → ℝ`,
`hInf : LiminfAt f A c L₁`, and `hSup : LimsupAt f A c L₂`, then
`L₁ ≤ L₂`.

Logical form:

```lean
theorem LiminfLeLimsup (f : ℝ → ℝ) (A : Set ℝ) (c L₁ L₂ : ℝ)
    (hInf : LiminfAt f A c L₁) (hSup : LimsupAt f A c L₂) :
    L₁ ≤ L₂
```
-/
theorem LiminfLeLimsup (f : ℝ → ℝ) (A : Set ℝ) (c L₁ L₂ : ℝ)
    (hInf : LiminfAt f A c L₁) (hSup : LimsupAt f A c L₂) :
    L₁ ≤ L₂ := by
  sorry

end LRA.Analysis.Continuity
