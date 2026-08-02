/-
Draft module; not yet imported by the active Volume III root.
Source: book-analysis-ii/differentiation/notes/derivative-geometry/{notes-shape-questions.tex,
notes-derivative-geometry.tex}.

Full-coverage pass over the `derivative-geometry` section. One Lean
statement per book label, `sorry`-bodied. Per ISSUES.md #59,
`cor:relative-extremum-necessary-condition` is the identical proposition
to `thm:necessary-condition-extremum` with its disjuncts swapped; both
are recorded below (as the book does) but the duplication is preserved
faithfully rather than silently collapsed, matching this audit's
report-only policy.
-/

import Mathlib.Data.Real.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import LRA.VolumeIII.Analysis.Differentiation.DerivativeDefinition

namespace LRA.VolumeIII.Analysis.Differentiation

/-- `def:relative-minimum`. -/
def IsRelativeMinimum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∃ δ > 0, ∀ x ∈ A, |x - c| < δ → f c ≤ f x

/-- `def:relative-maximum`. -/
def IsRelativeMaximum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∃ δ > 0, ∀ x ∈ A, |x - c| < δ → f x ≤ f c

-- `thm:necessary-condition-extremum`
/-- a relative extremum at an
interior point is either a point of non-differentiability or a critical
point. -/
theorem NecessaryConditionExtremum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hc : c ∈ A)
    (hext : IsRelativeMinimum f A c ∨ IsRelativeMaximum f A c) :
    ¬ IsDifferentiable f A c ∨ Derivative 0 f A c := by
  sorry

/-- `cor:relative-extremum-necessary-condition`: literally the same
proposition as `thm:necessary-condition-extremum` (ISSUES.md #59) — the
same disjunction with the disjuncts swapped. -/
theorem RelativeExtremumNecessaryCondition (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hc : c ∈ A)
    (hext : IsRelativeMinimum f A c ∨ IsRelativeMaximum f A c) :
    Derivative 0 f A c ∨ ¬ IsDifferentiable f A c := by
  sorry

/-- `def:convex-function`: the chord (secant) definition of convexity on
an interval. -/
def IsConvexOn (f : ℝ → ℝ) (I : Set ℝ) : Prop :=
  I.OrdConnected ∧
  ∀ x ∈ I, ∀ y ∈ I, ∀ t : ℝ, 0 ≤ t → t ≤ 1 →
    f (t * x + (1 - t) * y) ≤ t * f x + (1 - t) * f y

/-- `def:concave-function`. -/
def IsConcaveOn (f : ℝ → ℝ) (I : Set ℝ) : Prop :=
  I.OrdConnected ∧
  ∀ x ∈ I, ∀ y ∈ I, ∀ t : ℝ, 0 ≤ t → t ≤ 1 →
    t * f x + (1 - t) * f y ≤ f (t * x + (1 - t) * y)

/-- `def:inflection-point`: a point where convexity switches to concavity
(or vice versa) — the negation of both properties holding on any common
one-sided neighbourhood. -/
def IsInflection (f : ℝ → ℝ) (c : ℝ) : Prop :=
  (∃ δ > 0, IsConvexOn f (Set.Icc (c - δ) c) ∧ IsConcaveOn f (Set.Icc c (c + δ))) ∨
  (∃ δ > 0, IsConcaveOn f (Set.Icc (c - δ) c) ∧ IsConvexOn f (Set.Icc c (c + δ)))

end LRA.VolumeIII.Analysis.Differentiation
