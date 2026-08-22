/-
Draft module; not yet imported by the active Volume III root.
Source: book-analysis-ii/continuity/notes/point-continuity/{notes-continuity.tex,
notes-discontinuity.tex, notes-oscillation.tex}.

Full-coverage pass over the `point-continuity` section. One Lean statement
per book label, `sorry`-bodied.
-/

import Mathlib.Data.Real.Basic

namespace LRA.Analysis.Continuity

/-- `def:relative-neighborhood`: a relative (to `A`) ε-neighbourhood of
`c` in `A`.

Logical form:

```lean
def RelativeNeighborhood (A : Set ℝ) (c ε : ℝ) : Set ℝ :=
  {x ∈ A | |x - c| < ε}
```
-/
def RelativeNeighborhood (A : Set ℝ) (c ε : ℝ) : Set ℝ :=
  {x ∈ A | |x - c| < ε}

/-- `def:continuous-at-point`: the ε-δ definition of continuity at a
point, requiring no punctured condition (unlike `TendsTo`) since `f(c)`
itself is the target value.

Logical form:

```lean
def ContinuousAtPoint (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, |x - c| < δ → |f x - f c| < ε
```
-/
def ContinuousAtPoint (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, |x - c| < δ → |f x - f c| < ε

/-- `def:continuous-at-point-nbhd`: the neighbourhood-based reformulation
of continuity at a point.

Logical form:

```lean
def ContinuousAtPointNbhd (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ RelativeNeighborhood A c δ, |f x - f c| < ε
```
-/
def ContinuousAtPointNbhd (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ RelativeNeighborhood A c δ, |f x - f c| < ε

/-- Let `A : Set ℝ` and `c : ℝ`. If `f : ℝ → ℝ`. Then `ContinuousAtPoint f A c ↔
ContinuousAtPointNbhd f A c`.

Logical form:

```lean
theorem ContinuousAtPointIffNbhd (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    ContinuousAtPoint f A c ↔ ContinuousAtPointNbhd f A c
```
-/
theorem ContinuousAtPointIffNbhd (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    ContinuousAtPoint f A c ↔ ContinuousAtPointNbhd f A c := by
  sorry

/-- `def:continuous-at-point-seq`: the sequential characterization of
continuity at a point.

Logical form:

```lean
def ContinuousAtPointSeq (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ xs : ℕ → ℝ, (∀ n, xs n ∈ A) →
    (∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |xs n - c| < ε) →
    ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - f c| < ε
```
-/
def ContinuousAtPointSeq (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ xs : ℕ → ℝ, (∀ n, xs n ∈ A) →
    (∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |xs n - c| < ε) →
    ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - f c| < ε

/-- Let `A : Set ℝ` and `c : ℝ`. If `f : ℝ → ℝ` and `hc : c ∈ A`. Then `ContinuousAtPoint f A c ↔
ContinuousAtPointSeq f A c`.

Logical form:

```lean
theorem ContinuousAtPointIffSeq (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) (hc : c ∈ A) :
    ContinuousAtPoint f A c ↔ ContinuousAtPointSeq f A c
```
-/
theorem ContinuousAtPointIffSeq (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) (hc : c ∈ A) :
    ContinuousAtPoint f A c ↔ ContinuousAtPointSeq f A c := by
  sorry

/-- `def:point-of-discontinuity`: `f` fails to be continuous at `c`.

Logical form:

```lean
def PointOfDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ¬ ContinuousAtPoint f A c
```
-/
def PointOfDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ¬ ContinuousAtPoint f A c

/-- `def:sequential-discontinuity-at-a-point`: witnessed by a single
sequence in `A` converging to `c` whose images do not converge to `f(c)`.

Logical form:

```lean
def SequentialDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∃ xs : ℕ → ℝ, (∀ n, xs n ∈ A) ∧
    (∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |xs n - c| < ε) ∧
    ¬ (∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - f c| < ε)
```
-/
def SequentialDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∃ xs : ℕ → ℝ, (∀ n, xs n ∈ A) ∧
    (∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |xs n - c| < ε) ∧
    ¬ (∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - f c| < ε)

/-- Let `A : Set ℝ` and `c : ℝ`. If `f : ℝ → ℝ`. Then `PointOfDiscontinuity f A c ↔
SequentialDiscontinuity f A c`.

Logical form:

```lean
theorem DiscontinuityIffSequential (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    PointOfDiscontinuity f A c ↔ SequentialDiscontinuity f A c
```
-/
theorem DiscontinuityIffSequential (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    PointOfDiscontinuity f A c ↔ SequentialDiscontinuity f A c := by
  sorry

/-- `def:neighborhood-discontinuity-at-a-point`: the negated
neighbourhood formulation, an explicit ε that survives every δ.

Logical form:

```lean
def NeighborhoodDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∃ ε > 0, ∀ δ > 0, ∃ x ∈ RelativeNeighborhood A c δ, |f x - f c| ≥ ε
```
-/
def NeighborhoodDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∃ ε > 0, ∀ δ > 0, ∃ x ∈ RelativeNeighborhood A c δ, |f x - f c| ≥ ε

/-- Let `A : Set ℝ` and `c : ℝ`. If `f : ℝ → ℝ`. Then `PointOfDiscontinuity f A c ↔
NeighborhoodDiscontinuity f A c`.

Logical form:

```lean
theorem DiscontinuityIffNeighborhood (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    PointOfDiscontinuity f A c ↔ NeighborhoodDiscontinuity f A c
```
-/
theorem DiscontinuityIffNeighborhood (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    PointOfDiscontinuity f A c ↔ NeighborhoodDiscontinuity f A c := by
  sorry

-- ---------------------------------------------------------------------
-- Taxonomy of discontinuities. The book's informal prose blurs the
-- removable / jump / essential split; the Lean surface below makes the
-- three cases disjoint by defining "essential" to exclude both removable
-- and jump discontinuities.
-- ---------------------------------------------------------------------

/-- One-sided limits both exist (as reals) and agree with each other but
not with `f(c)`, or `f(c)` is undefined/irrelevant — the removable case:
redefining `f` at `c` restores continuity.

Logical form:

```lean
def IsRemovableDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∃ L : ℝ,
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → |f x - L| < ε) ∧
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → |f x - L| < ε) ∧
    f c ≠ L
```
-/
def IsRemovableDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∃ L : ℝ,
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → |f x - L| < ε) ∧
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → |f x - L| < ε) ∧
    f c ≠ L

/-- Both one-sided limits exist (as reals) and disagree with each other
— the jump case.

Logical form:

```lean
def IsJumpDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∃ L₁ L₂ : ℝ,
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → |f x - L₁| < ε) ∧
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → |f x - L₂| < ε) ∧
    L₁ ≠ L₂
```
-/
def IsJumpDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∃ L₁ L₂ : ℝ,
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → |f x - L₁| < ε) ∧
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → |f x - L₂| < ε) ∧
    (L₁ ≠ L₂ ∨ f c ≠ L₁)

/-- `def:types-of-discontinuity-at-a-point`, Essential case: a
discontinuity that is neither removable nor a jump.

Logical form:

```lean
def IsEssentialDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  PointOfDiscontinuity f A c ∧ ¬ IsRemovableDiscontinuity f A c
```
-/
def IsEssentialDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  PointOfDiscontinuity f A c ∧
    ¬ IsRemovableDiscontinuity f A c ∧
    ¬ IsJumpDiscontinuity f A c

/-- Let `A : Set ℝ` and `c : ℝ`. If `f : ℝ → ℝ` and
`h : IsJumpDiscontinuity f A c`, then `¬ IsEssentialDiscontinuity f A c`.

Logical form:

```lean
theorem JumpDiscontinuityNotEssential (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (h : IsJumpDiscontinuity f A c) : ¬ IsEssentialDiscontinuity f A c
```
-/
theorem JumpDiscontinuityNotEssential (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (h : IsJumpDiscontinuity f A c) : ¬ IsEssentialDiscontinuity f A c := by
  sorry

-- ---------------------------------------------------------------------
-- Oscillation (`notes-oscillation.tex`).
-- ---------------------------------------------------------------------

/-- `def:oscillation-on-a-set`: `ω` is the oscillation of `f` on `A`
when it is the least upper bound of all pairwise value differences on
that set.

Logical form:

```lean
def OscillationOnSet (f : ℝ → ℝ) (A : Set ℝ) (ω : ℝ) : Prop :=
  0 ≤ ω ∧
    (∀ x ∈ A, ∀ y ∈ A, |f x - f y| ≤ ω) ∧
    ∀ b, 0 ≤ b → b < ω -> ∃ x ∈ A, ∃ y ∈ A, b < |f x - f y|
```
-/
def OscillationOnSet (f : ℝ → ℝ) (A : Set ℝ) (ω : ℝ) : Prop :=
  0 ≤ ω ∧
    (∀ x ∈ A, ∀ y ∈ A, |f x - f y| ≤ ω) ∧
    ∀ b, 0 ≤ b → b < ω -> ∃ x ∈ A, ∃ y ∈ A, b < |f x - f y|

/-- `def:oscillation-at-a-point`: `ω` is the oscillation of `f` at `c`
relative to `A` when oscillations on sufficiently small relative
neighbourhoods are eventually below `ω + ε`, while every smaller bound
is violated on every sufficiently small neighbourhood.

Logical form:

```lean
def OscillationAtPoint (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) (ω : ℝ) : Prop :=
  0 ≤ ω ∧
    (∀ ε > 0, ∃ δ > 0, ∃ Ω : ℝ,
      OscillationOnSet f (RelativeNeighborhood A c δ) Ω ∧ Ω < ω + ε) ∧
    (∀ b, 0 ≤ b → b < ω -> ∀ δ > 0, ∃ Ω : ℝ,
      OscillationOnSet f (RelativeNeighborhood A c δ) Ω ∧ b < Ω)
```
-/
def OscillationAtPoint (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) (ω : ℝ) : Prop :=
  0 ≤ ω ∧
    (∀ ε > 0, ∃ δ > 0, ∃ Ω : ℝ,
      OscillationOnSet f (RelativeNeighborhood A c δ) Ω ∧ Ω < ω + ε) ∧
    (∀ b, 0 ≤ b → b < ω -> ∀ δ > 0, ∃ Ω : ℝ,
      OscillationOnSet f (RelativeNeighborhood A c δ) Ω ∧ b < Ω)

-- `thm:continuity-iff-zero-oscillation`
/-- Let `A : Set ℝ` and `c : ℝ`. If `f : ℝ → ℝ` and `hc : c ∈ A`. Then `ContinuousAtPoint f A c ↔
OscillationAtPoint f A c 0`.

Logical form:

```lean
theorem ContinuousAtPointIffZeroOscillation (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hc : c ∈ A) :
    ContinuousAtPoint f A c ↔ OscillationAtPoint f A c 0
```
-/
theorem ContinuousAtPointIffZeroOscillation (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hc : c ∈ A) :
    ContinuousAtPoint f A c ↔ OscillationAtPoint f A c 0 := by
  sorry

/-- Let `A : Set ℝ`. If `f : ℝ → ℝ`. Then `{c ∈ A | PointOfDiscontinuity f A c} = ⋃ n : ℕ, {c ∈ A |
∃ ω : ℝ, OscillationAtPoint f A c ω ∧ 1 / (n + 1 : ℝ) ≤ ω}`.

Logical form:

```lean
theorem DiscontinuitySetEqUnionOscillationBounded (f : ℝ → ℝ) (A : Set ℝ) :
    {c ∈ A | PointOfDiscontinuity f A c} =
      ⋃ n : ℕ, {c ∈ A | ∃ ω : ℝ,
        OscillationAtPoint f A c ω ∧ 1 / (n + 1 : ℝ) ≤ ω}
```
-/
theorem DiscontinuitySetEqUnionOscillationBounded (f : ℝ → ℝ) (A : Set ℝ) :
    {c ∈ A | PointOfDiscontinuity f A c} =
      ⋃ n : ℕ, {c ∈ A | ∃ ω : ℝ,
        OscillationAtPoint f A c ω ∧ 1 / (n + 1 : ℝ) ≤ ω} := by
  sorry

end LRA.Analysis.Continuity
