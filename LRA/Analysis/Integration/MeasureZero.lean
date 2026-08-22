/-
Draft module promoted from scratch and wired into the Volume III Analysis integration router.
Source: book-integration/riemann-integration/notes/measure-zero/notes-measure-zero.tex.

Full-coverage pass over the `measure-zero` section — the diagnostic scan
of the whole Riemann/Darboux family, not a new integral itself. One Lean
statement per book label, `sorry`-bodied.
-/

import Mathlib.Data.Real.Basic
import LRA.Analysis.Integration.RiemannIntegral
import LRA.Analysis.Integration.DarbouxIntegral
import LRA.Analysis.Continuity.PointContinuity
import LRA.Analysis.StructureOfRealLine.OpenClosedSets

namespace LRA.Analysis.Integration

/-- `def:measure-zero`: `E` is covered, for every `ε`, by countably many
open intervals of total length at most `ε`. Intervals are given directly
by their endpoint sequences `p k < q k` (rather than as an abstract
`Set ℝ` satisfying "is an open interval"), so the total-length sum is
Mathematical statement (Lean): `def IsMeasureZero (E : Set ℝ) : Prop :=`.
just `∑ (q k - p k)` with no auxiliary length function needed.

Logical form:

```lean
def IsMeasureZero (E : Set ℝ) : Prop :=
  ∀ ε > 0, ∃ p q : ℕ → ℝ, (∀ k, p k < q k) ∧ E ⊆ ⋃ k, Set.Ioo (p k) (q k) ∧
    ∃ L ≤ ε, HasSum (fun k => q k - p k) L
```
-/
def IsMeasureZero (E : Set ℝ) : Prop :=
  ∀ ε > 0, ∃ p q : ℕ → ℝ, (∀ k, p k < q k) ∧ E ⊆ ⋃ k, Set.Ioo (p k) (q k) ∧
    ∃ L ≤ ε, HasSum (fun k => q k - p k) L

/-- `def:point-oscillation-integration`.
Mathematical statement (Lean): `def PointOscillation (f : ℝ → ℝ) (a b x ω : ℝ) : Prop :=`.


Logical form:

```lean
def PointOscillation (f : ℝ → ℝ) (a b x ω : ℝ) : Prop :=
  x ∈ Set.Icc a b ∧ LRA.Analysis.Continuity.OscillationAtPoint f (Set.Icc a b) x ω
```
-/
def PointOscillation (f : ℝ → ℝ) (a b x ω : ℝ) : Prop :=
  x ∈ Set.Icc a b ∧ LRA.Analysis.Continuity.OscillationAtPoint f (Set.Icc a b) x ω

-- `thm:lebesgue-criterion-riemann-integrability`
/-- Let `a b : ℝ`. If `f : ℝ → ℝ`, `hab : a ≤ b`, and `hbdd :
LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)`. Then `IsRiemannIntegrable f a b
↔ IsMeasureZero {x ∈ Set.Icc a b | ∃ ω : ℝ, 0 < ω ∧ PointOscillation f a b x ω}`.

Logical form:

```lean
theorem lebesgue_criterion_riemann_integrability (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)) :
    IsRiemannIntegrable f a b ↔
      IsMeasureZero {x ∈ Set.Icc a b | ∃ ω : ℝ, 0 < ω ∧ PointOscillation f a b x ω}
```
-/
theorem lebesgue_criterion_riemann_integrability (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)) :
    IsRiemannIntegrable f a b ↔
      IsMeasureZero {x ∈ Set.Icc a b | ∃ ω : ℝ, 0 < ω ∧ PointOscillation f a b x ω} := by
  sorry

end LRA.Analysis.Integration
