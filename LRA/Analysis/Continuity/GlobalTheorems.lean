/-
Draft module; not yet imported by the active Volume III root.
Source: book-analysis-ii/continuity/notes/global-theorems/notes-ivt.tex.

Full-coverage pass over the `global-theorems` section (EVT, IVT, and
supporting theorems on closed bounded intervals). One Lean statement per
book label, `sorry`-bodied.
-/

import Mathlib.Data.Real.Basic
import LRA.Analysis.Continuity.PointContinuity

namespace LRA.Analysis.Continuity

/-- Continuity on all of a set `A` (pointwise at every element).

Logical form:

```lean
def ContinuousOn' (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ x ∈ A, ContinuousAtPoint f A x
```
-/
def ContinuousOn' (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ x ∈ A, ContinuousAtPoint f A x

/-- `def:bounded-on-a-set`. (ISSUES.md #48: the book's own Predicate
reading block for this def is corrupted with an unrelated Darboux-Property
formula; the definition itself, restated below, is fine.)

Logical form:

```lean
def BoundedOnSet (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∃ M > 0, ∀ x ∈ A, |f x| ≤ M
```
-/
def BoundedOnSet (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∃ M > 0, ∀ x ∈ A, |f x| ≤ M

-- `thm:boundedness-theorem`
/-- Let `a b : ℝ`. If `f : ℝ → ℝ`, `hab : a ≤ b`, and `hf : ContinuousOn' f (Set.Icc a b)`. Then
`BoundedOnSet f (Set.Icc a b)`.

Logical form:

```lean
theorem BoundednessTheorem (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) : BoundedOnSet f (Set.Icc a b)
```
-/
theorem BoundednessTheorem (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) : BoundedOnSet f (Set.Icc a b) := by
  sorry

/-- `def:absolute-extrema`.

Logical form:

```lean
def IsAbsoluteMaximum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∀ x ∈ A, f x ≤ f c
```
-/
def IsAbsoluteMaximum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∀ x ∈ A, f x ≤ f c

/--
`IsAbsoluteMinimum` defines the displayed object for is absolute minimum.

Logical form:

```lean
def IsAbsoluteMinimum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∀ x ∈ A, f c ≤ f x
```
-/
def IsAbsoluteMinimum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∀ x ∈ A, f c ≤ f x

-- `thm:extreme-value-theorem`
/-- Let `a b : ℝ`. If `f : ℝ → ℝ`, `hab : a ≤ b`, and `hf : ContinuousOn' f (Set.Icc a b)`. Then `(∃
c, IsAbsoluteMaximum f (Set.Icc a b) c) ∧ (∃ c, IsAbsoluteMinimum f (Set.Icc a b) c)`.

Logical form:

```lean
theorem ExtremeValueTheorem (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) :
    (∃ c, IsAbsoluteMaximum f (Set.Icc a b) c) ∧
    (∃ c, IsAbsoluteMinimum f (Set.Icc a b) c)
```
-/
theorem ExtremeValueTheorem (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) :
    (∃ c, IsAbsoluteMaximum f (Set.Icc a b) c) ∧
    (∃ c, IsAbsoluteMinimum f (Set.Icc a b) c) := by
  sorry

-- `thm:location-of-roots`
/-- Let `a b : ℝ`. If `f : ℝ → ℝ`, `hab : a < b`, `hf : ContinuousOn' f (Set.Icc a b)`, and `hsign :
f a * f b < 0`. Then `∃ c ∈ Set.Ioo a b, f c = 0`.

Logical form:

```lean
theorem LocationOfRoots (f : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hf : ContinuousOn' f (Set.Icc a b)) (hsign : f a * f b < 0) :
    ∃ c ∈ Set.Ioo a b, f c = 0
```
-/
theorem LocationOfRoots (f : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hf : ContinuousOn' f (Set.Icc a b)) (hsign : f a * f b < 0) :
    ∃ c ∈ Set.Ioo a b, f c = 0 := by
  sorry

-- `thm:bolzano-intermediate-value`
/-- Let `a b y : ℝ`. If `f : ℝ → ℝ`, `hab : a < b`, `hf : ContinuousOn' f (Set.Icc a b)`, and `hy :
(f a < y ∧ y < f b) ∨ (f b < y ∧ y < f a)`. Then `∃ c ∈ Set.Ioo a b, f c = y`.

Logical form:

```lean
theorem BolzanoIntermediateValue (f : ℝ → ℝ) (a b y : ℝ) (hab : a < b)
    (hf : ContinuousOn' f (Set.Icc a b))
    (hy : (f a < y ∧ y < f b) ∨ (f b < y ∧ y < f a)) :
    ∃ c ∈ Set.Ioo a b, f c = y
```
-/
theorem BolzanoIntermediateValue (f : ℝ → ℝ) (a b y : ℝ) (hab : a < b)
    (hf : ContinuousOn' f (Set.Icc a b))
    (hy : (f a < y ∧ y < f b) ∨ (f b < y ∧ y < f a)) :
    ∃ c ∈ Set.Ioo a b, f c = y := by
  sorry

-- `thm:preservation-of-intervals`
/-- Let `I : Set ℝ`. If `f : ℝ → ℝ`, `hI : I.OrdConnected`, and `hf : ContinuousOn' f I`. Then `(f
'' I).OrdConnected`.

Logical form:

```lean
theorem PreservationOfIntervals (f : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hf : ContinuousOn' f I) : (f '' I).OrdConnected
```
-/
theorem PreservationOfIntervals (f : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hf : ContinuousOn' f I) : (f '' I).OrdConnected := by
  sorry

-- `thm:darboux-property`
/-- the book's name for the intermediate value
property phrased as a Prop, used elsewhere for comparison against
Darboux's theorem on derivatives (Differentiation chapter,
`thm:darboux`).

Logical form:

```lean
def DarbouxProperty (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ a ∈ A, ∀ b ∈ A, ∀ y : ℝ, (f a < y ∧ y < f b) ∨ (f b < y ∧ y < f a) →
    ∃ c ∈ A, f c = y
```
-/
def DarbouxProperty (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ a ∈ A, ∀ b ∈ A, ∀ y : ℝ, (f a < y ∧ y < f b) ∨ (f b < y ∧ y < f a) →
    ∃ c ∈ A, f c = y

/-- Let `I : Set ℝ`. If `f : ℝ → ℝ`, `hI : I.OrdConnected`, and `hf : ContinuousOn' f I`. Then
`DarbouxProperty f I`.

Logical form:

```lean
theorem ContinuousImpliesDarbouxProperty (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hf : ContinuousOn' f I) : DarbouxProperty f I
```
-/
theorem ContinuousImpliesDarbouxProperty (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hf : ContinuousOn' f I) : DarbouxProperty f I := by
  sorry

-- `thm:heine-cantor`
/-- Let `a b : ℝ`. If `f : ℝ → ℝ`, `hab : a ≤ b`, and `hf : ContinuousOn' f (Set.Icc a b)`. Then `∀
ε > 0, ∃ δ > 0, ∀ x ∈ Set.Icc a b, ∀ y ∈ Set.Icc a b, |x - y| < δ → |f x - f y| < ε`.

Logical form:

```lean
theorem HeineCantor (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) :
    ∀ ε > 0, ∃ δ > 0, ∀ x ∈ Set.Icc a b, ∀ y ∈ Set.Icc a b,
      |x - y| < δ → |f x - f y| < ε
```
-/
theorem HeineCantor (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) :
    ∀ ε > 0, ∃ δ > 0, ∀ x ∈ Set.Icc a b, ∀ y ∈ Set.Icc a b,
      |x - y| < δ → |f x - f y| < ε := by
  sorry

-- `thm:image-of-closed-bounded-interval`
/-- Let `a b : ℝ`. If `f : ℝ → ℝ`, `hab : a ≤ b`, and `hf : ContinuousOn' f (Set.Icc a b)`. Then `∃
m M, m ≤ M ∧ f '' Set.Icc a b = Set.Icc m M`.

Logical form:

```lean
theorem ImageOfClosedBoundedInterval (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) :
    ∃ m M, m ≤ M ∧ f '' Set.Icc a b = Set.Icc m M
```
-/
theorem ImageOfClosedBoundedInterval (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) :
    ∃ m M, m ≤ M ∧ f '' Set.Icc a b = Set.Icc m M := by
  sorry

end LRA.Analysis.Continuity
