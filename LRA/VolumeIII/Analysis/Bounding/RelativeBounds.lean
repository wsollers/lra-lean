/-
Draft module; not yet imported by the active Volume III root.
Source: bounding/notes/bounds-extremals/notes-relative-bounds-suprema.tex
(new file added in the bounding-chapter rework; audited but never formalized
until now — see ISSUES.md #39 for the one finding on this file: its
`def:relative-supremum-infimum` dependency list cites the ordinary
`def:supremum`/`def:infimum`, unused by the formal definition, while omitting
`def:relative-bounds`, defined 50 lines earlier, which it explicitly builds
on). As of this pass the file is still not `\input` into `index.tex`.

Formalized generically over an arbitrary preorder `T`, matching the .tex's
own `(T,≤)` ordered-set setup — the relative-bounds framework is genuinely
type-generic, not ℝ-specific, which is exactly its point (it's what lets the
same definitions describe "bounded in ℚ" vs "bounded in ℝ" for the same set).
-/

import Mathlib.Order.Basic
import Mathlib.Data.Real.Basic
import Mathlib.Data.Real.Sqrt
import Mathlib.Data.Rat.Cast.Defs

namespace LRA.VolumeIII.Analysis.Bounding

variable {T : Type*} [Preorder T]

/-- `def:relative-bounds`.

Logical form:

```lean
def IsRelativeUpperBound (u : T) (A S : Set T) : Prop :=
  u ∈ S ∧ ∀ a ∈ A, a ≤ u
```
-/
def IsRelativeUpperBound (u : T) (A S : Set T) : Prop :=
  u ∈ S ∧ ∀ a ∈ A, a ≤ u

/-- `def:relative-bounds`.

Logical form:

```lean
def IsRelativeLowerBound (l : T) (A S : Set T) : Prop :=
  l ∈ S ∧ ∀ a ∈ A, l ≤ a
```
-/
def IsRelativeLowerBound (l : T) (A S : Set T) : Prop :=
  l ∈ S ∧ ∀ a ∈ A, l ≤ a

/-- `def:relative-supremum-infimum`.

Logical form:

```lean
def IsRelativeSupremum (s : T) (A S : Set T) : Prop :=
  IsRelativeUpperBound s A S ∧ ∀ u ∈ S, (∀ a ∈ A, a ≤ u) → s ≤ u
```
-/
def IsRelativeSupremum (s : T) (A S : Set T) : Prop :=
  IsRelativeUpperBound s A S ∧ ∀ u ∈ S, (∀ a ∈ A, a ≤ u) → s ≤ u

/-- `def:relative-supremum-infimum`.

Logical form:

```lean
def IsRelativeInfimum (i : T) (A S : Set T) : Prop :=
  IsRelativeLowerBound i A S ∧ ∀ l ∈ S, (∀ a ∈ A, l ≤ a) → l ≤ i
```
-/
def IsRelativeInfimum (i : T) (A S : Set T) : Prop :=
  IsRelativeLowerBound i A S ∧ ∀ l ∈ S, (∀ a ∈ A, l ≤ a) → l ≤ i

/- ================================================================
   ADDITIONS.md item 24. Added with user sign-off.
   ================================================================ -/

/-- Let `A S : Set T` and `s : T`. If `hs : IsLUB A s` and `hsS : s ∈ S`. Then `IsRelativeSupremum s
A S`.

Logical form:

```lean
theorem OrdinarySupremumInSIsRelativeSupremum
    (A S : Set T) (s : T) (hs : IsLUB A s) (hsS : s ∈ S) :
    IsRelativeSupremum s A S
```
-/
theorem OrdinarySupremumInSIsRelativeSupremum
    (A S : Set T) (s : T) (hs : IsLUB A s) (hsS : s ∈ S) :
    IsRelativeSupremum s A S := by
  sorry

/-- Let `A S : Set T` and `i : T`. If `hi : IsGLB A i` and `hiS : i ∈ S`. Then `IsRelativeInfimum i
A S`.

Logical form:

```lean
theorem OrdinaryInfimumInSIsRelativeInfimum
    (A S : Set T) (i : T) (hi : IsGLB A i) (hiS : i ∈ S) :
    IsRelativeInfimum i A S
```
-/
theorem OrdinaryInfimumInSIsRelativeInfimum
    (A S : Set T) (i : T) (hi : IsGLB A i) (hiS : i ∈ S) :
    IsRelativeInfimum i A S := by
  sorry

/- ================================================================
   ADDITIONS.md item 21. Added with user sign-off. Worked example
   instantiating the file's own recurring motivating remark
   (`{q∈ℚ:q²<2}` has no relative supremum in `ℚ` but supremum `√2` in
   `ℝ`) against the actual `IsRelativeSupremum` machinery above, with
   the ambient type fixed to `ℝ` and `S` ranging over the embedded
   copy of `ℚ` versus all of `ℝ`. Companion to
   `CompletenessAdditions.lean`'s `RationalsLackLubProperty`
   (ADDITIONS.md #20) — same underlying fact, viewed through the
   relative-bounds lens instead of the plain-LUB-property lens.
   ================================================================ -/

/-- The set `{q∈ℚ:q²<2}`, viewed as a subset of the ambient `ℝ` (cast
along `ℚ ↪ ℝ`) — the file's own recurring motivating example, made
concrete.

Logical form:

```lean
def RationalsWithSquareLessThanTwoInR : Set ℝ :=
  {x : ℝ | ∃ q : ℚ, x = (q : ℝ) ∧ q ^ 2 < 2}
```
-/
def RationalsWithSquareLessThanTwoInR : Set ℝ :=
  {x : ℝ | ∃ q : ℚ, x = (q : ℝ) ∧ q ^ 2 < 2}

/-- The theorem asserts `¬ ∃ s : ℝ, IsRelativeSupremum s RationalsWithSquareLessThanTwoInR
(Set.range ((↑) : ℚ → ℝ))`.

Logical form:

```lean
theorem NoRelativeSupremumOfRationalsExample :
    ¬ ∃ s : ℝ, IsRelativeSupremum s RationalsWithSquareLessThanTwoInR
      (Set.range ((↑) : ℚ → ℝ))
```
-/
theorem NoRelativeSupremumOfRationalsExample :
    ¬ ∃ s : ℝ, IsRelativeSupremum s RationalsWithSquareLessThanTwoInR
      (Set.range ((↑) : ℚ → ℝ)) := by
  sorry

/-- The theorem asserts `IsRelativeSupremum (Real.sqrt 2) RationalsWithSquareLessThanTwoInR
(Set.univ : Set ℝ)`.

Logical form:

```lean
theorem RelativeSupremumOfRationalsInRExample :
    IsRelativeSupremum (Real.sqrt 2) RationalsWithSquareLessThanTwoInR
      (Set.univ : Set ℝ)
```
-/
theorem RelativeSupremumOfRationalsInRExample :
    IsRelativeSupremum (Real.sqrt 2) RationalsWithSquareLessThanTwoInR
      (Set.univ : Set ℝ) := by
  sorry

end LRA.VolumeIII.Analysis.Bounding
