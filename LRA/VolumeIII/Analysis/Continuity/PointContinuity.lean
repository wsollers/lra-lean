/-
Draft module; not yet imported by the active Volume III root.
Source: book-analysis-ii/continuity/notes/point-continuity/{notes-continuity.tex,
notes-discontinuity.tex, notes-oscillation.tex}.

Full-coverage pass over the `point-continuity` section. One Lean statement
per book label, `sorry`-bodied.
-/

import Mathlib.Data.Real.Basic

namespace LRA.VolumeIII.Analysis.Continuity

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
-- Taxonomy of discontinuities. Note ISSUES.md #47: the book's own
-- Essential clause is merely "not Removable," which as stated makes
-- Jump ⊆ Essential rather than a disjoint third case. `IsEssential`
-- below is written to match the book's literal (imprecise) definition,
-- so this file records the same gap rather than silently fixing it.
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

/-- Both one-sided limits exist (as reals) but disagree with each other,
or agree with each other but not with `f(c)` — the jump case.

Logical form:

```lean
def IsJumpDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∃ L₁ L₂ : ℝ,
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → |f x - L₁| < ε) ∧
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → |f x - L₂| < ε) ∧
    (L₁ ≠ L₂ ∨ f c ≠ L₁)
```
-/
def IsJumpDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∃ L₁ L₂ : ℝ,
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → |f x - L₁| < ε) ∧
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → |f x - L₂| < ε) ∧
    (L₁ ≠ L₂ ∨ f c ≠ L₁)

/-- `def:types-of-discontinuity-at-a-point`, Essential case: literally
"not Removable," per ISSUES.md #47 — as stated, this does not exclude
`IsJumpDiscontinuity`.

Logical form:

```lean
def IsEssentialDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  PointOfDiscontinuity f A c ∧ ¬ IsRemovableDiscontinuity f A c
```
-/
def IsEssentialDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  PointOfDiscontinuity f A c ∧ ¬ IsRemovableDiscontinuity f A c

/-- Let `A : Set ℝ` and `c : ℝ`. If `f : ℝ → ℝ` and `h : IsJumpDiscontinuity f A c`. Then
`IsEssentialDiscontinuity f A c`.

Logical form:

```lean
theorem JumpSubsetEssential (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (h : IsJumpDiscontinuity f A c) : IsEssentialDiscontinuity f A c
```
-/
theorem JumpSubsetEssential (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (h : IsJumpDiscontinuity f A c) : IsEssentialDiscontinuity f A c := by
  sorry

-- ---------------------------------------------------------------------
-- Oscillation (`notes-oscillation.tex`).
-- ---------------------------------------------------------------------

/-- `def:oscillation-on-a-set`: the diameter of `f`'s image on `A`.

Logical form:

```lean
noncomputable def OscillationOnSet (f : ℝ → ℝ) (A : Set ℝ) : ℝ :=
  0
```
-/
noncomputable def OscillationOnSet (f : ℝ → ℝ) (A : Set ℝ) : ℝ :=
  0

/-- `def:oscillation-at-a-point`: the limit, as `δ → 0⁺`, of the
oscillation on the punctured relative δ-neighbourhood of `c`.

Logical form:

```lean
noncomputable def OscillationAtPoint (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : ℝ :=
  0
```
-/
noncomputable def OscillationAtPoint (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : ℝ :=
  0

-- `thm:continuity-iff-zero-oscillation`
/-- Let `A : Set ℝ` and `c : ℝ`. If `f : ℝ → ℝ` and `hc : c ∈ A`. Then `ContinuousAtPoint f A c ↔
OscillationAtPoint f A c = 0`.

Logical form:

```lean
theorem ContinuousAtPointIffZeroOscillation (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hc : c ∈ A) :
    ContinuousAtPoint f A c ↔ OscillationAtPoint f A c = 0
```
-/
theorem ContinuousAtPointIffZeroOscillation (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hc : c ∈ A) :
    ContinuousAtPoint f A c ↔ OscillationAtPoint f A c = 0 := by
  sorry

/-- Let `A : Set ℝ`. If `f : ℝ → ℝ`. Then `{c ∈ A | PointOfDiscontinuity f A c} = ⋃ n : ℕ, {c ∈ A |
OscillationAtPoint f A c ≥ 1 / (n + 1 : ℝ)}`.

Logical form:

```lean
theorem DiscontinuitySetEqUnionOscillationBounded (f : ℝ → ℝ) (A : Set ℝ) :
    {c ∈ A | PointOfDiscontinuity f A c} =
      ⋃ n : ℕ, {c ∈ A | OscillationAtPoint f A c ≥ 1 / (n + 1 : ℝ)}
```
-/
theorem DiscontinuitySetEqUnionOscillationBounded (f : ℝ → ℝ) (A : Set ℝ) :
    {c ∈ A | PointOfDiscontinuity f A c} =
      ⋃ n : ℕ, {c ∈ A | OscillationAtPoint f A c ≥ 1 / (n + 1 : ℝ)} := by
  sorry

end LRA.VolumeIII.Analysis.Continuity
