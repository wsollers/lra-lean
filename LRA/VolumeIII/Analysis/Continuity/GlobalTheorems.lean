/-
Draft module; not yet imported by the active Volume III root.
Source: book-analysis-ii/continuity/notes/global-theorems/notes-ivt.tex.

Full-coverage pass over the `global-theorems` section (EVT, IVT, and
supporting theorems on closed bounded intervals). One Lean statement per
book label, `sorry`-bodied.
-/

import Mathlib.Data.Real.Basic
import LRA.VolumeIII.Analysis.Continuity.PointContinuity

namespace LRA.VolumeIII.Analysis.Continuity

/-- Continuity on all of a set `A` (pointwise at every element). -/
def ContinuousOn' (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ x ∈ A, ContinuousAtPoint f A x

/-- `def:bounded-on-a-set`. (ISSUES.md #48: the book's own Predicate
reading block for this def is corrupted with an unrelated Darboux-Property
formula; the definition itself, restated below, is fine.) -/
def BoundedOnSet (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∃ M > 0, ∀ x ∈ A, |f x| ≤ M

/-- `thm:boundedness-theorem`: continuous on `[a,b]` implies bounded on
`[a,b]`. -/
theorem BoundednessTheorem (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) : BoundedOnSet f (Set.Icc a b) := by
  sorry

/-- `def:absolute-extrema`. -/
def IsAbsoluteMaximum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∀ x ∈ A, f x ≤ f c

def IsAbsoluteMinimum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∀ x ∈ A, f c ≤ f x

/-- `thm:extreme-value-theorem`. -/
theorem ExtremeValueTheorem (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) :
    (∃ c, IsAbsoluteMaximum f (Set.Icc a b) c) ∧
    (∃ c, IsAbsoluteMinimum f (Set.Icc a b) c) := by
  sorry

/-- `thm:location-of-roots` (Bolzano's theorem): opposite-signed
endpoints force an interior root. -/
theorem LocationOfRoots (f : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hf : ContinuousOn' f (Set.Icc a b)) (hsign : f a * f b < 0) :
    ∃ c ∈ Set.Ioo a b, f c = 0 := by
  sorry

/-- `thm:bolzano-intermediate-value` (IVT). -/
theorem BolzanoIntermediateValue (f : ℝ → ℝ) (a b y : ℝ) (hab : a < b)
    (hf : ContinuousOn' f (Set.Icc a b))
    (hy : (f a < y ∧ y < f b) ∨ (f b < y ∧ y < f a)) :
    ∃ c ∈ Set.Ioo a b, f c = y := by
  sorry

/-- `thm:preservation-of-intervals`: a continuous image of an interval is
an interval. -/
theorem PreservationOfIntervals (f : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hf : ContinuousOn' f I) : (f '' I).OrdConnected := by
  sorry

/-- `thm:darboux-property`: the book's name for the intermediate value
property phrased as a Prop, used elsewhere for comparison against
Darboux's theorem on derivatives (Differentiation chapter,
`thm:darboux`). -/
def DarbouxProperty (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ a ∈ A, ∀ b ∈ A, ∀ y : ℝ, (f a < y ∧ y < f b) ∨ (f b < y ∧ y < f a) →
    ∃ c ∈ A, f c = y

theorem ContinuousImpliesDarbouxProperty (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hf : ContinuousOn' f I) : DarbouxProperty f I := by
  sorry

/-- `thm:heine-cantor`: continuity on a closed bounded interval is
uniform. Stated here with the plain ε-δ uniform-continuity formula
(matching `def:uniform-continuity` in the `uniform-continuity` section)
rather than importing that file, to keep this file's dependency graph
matching the book's own section order. -/
theorem HeineCantor (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) :
    ∀ ε > 0, ∃ δ > 0, ∀ x ∈ Set.Icc a b, ∀ y ∈ Set.Icc a b,
      |x - y| < δ → |f x - f y| < ε := by
  sorry

/-- `thm:image-of-closed-bounded-interval`: the continuous image of
`[a,b]` is itself a closed bounded interval. -/
theorem ImageOfClosedBoundedInterval (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) :
    ∃ m M, m ≤ M ∧ f '' Set.Icc a b = Set.Icc m M := by
  sorry

end LRA.VolumeIII.Analysis.Continuity
