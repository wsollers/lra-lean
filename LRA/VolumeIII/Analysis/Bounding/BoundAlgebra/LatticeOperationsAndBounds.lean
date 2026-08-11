import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.SupremaInfima

/-!
Pairwise lattice operations on bounded real sets.
-/

namespace LRA.VolumeIII.Analysis.Bounding.BoundAlgebra

open LRA.VolumeIII.Analysis.Bounding.ExtremalBounds

/-- The set of pairwise maxima of elements from `A` and `B`.

Logical form:

```lean
def PairwiseMax (A B : Set ℝ) : Set ℝ :=
  {x | ∃ a ∈ A, ∃ b ∈ B, x = max a b}
```
-/
def PairwiseMax (A B : Set ℝ) : Set ℝ :=
  {x | ∃ a ∈ A, ∃ b ∈ B, x = max a b}

/-- The set of pairwise minima of elements from `A` and `B`.

Logical form:

```lean
def PairwiseMin (A B : Set ℝ) : Set ℝ :=
  {x | ∃ a ∈ A, ∃ b ∈ B, x = min a b}
```
-/
def PairwiseMin (A B : Set ℝ) : Set ℝ :=
  {x | ∃ a ∈ A, ∃ b ∈ B, x = min a b}

/-- Let `A B : Set ℝ` and `sA sB : ℝ`. If `leftNonemptyHypothesis : A.Nonempty`,
`rightNonemptyHypothesis : B.Nonempty`, `leftSupremumHypothesis : IsSupremum sA A`, and
`rightSupremumHypothesis : IsSupremum sB B`. Then `IsSupremum (max sA sB) (PairwiseMax A B)`.

Logical form:

```lean
theorem SupremumOfPairwiseMaximumSet {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA sB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (rightSupremumHypothesis : IsSupremum sB B) :
    IsSupremum (max sA sB) (PairwiseMax A B)
```
-/
theorem SupremumOfPairwiseMaximumSet {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA sB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (rightSupremumHypothesis : IsSupremum sB B) :
    IsSupremum (max sA sB) (PairwiseMax A B) := by
  sorry

/-- Let `A B : Set ℝ` and `iA iB : ℝ`. If `leftNonemptyHypothesis : A.Nonempty`,
`rightNonemptyHypothesis : B.Nonempty`, `leftInfimumHypothesis : IsInfimum iA A`, and
`rightInfimumHypothesis : IsInfimum iB B`. Then `IsInfimum (max iA iB) (PairwiseMax A B)`.

Logical form:

```lean
theorem InfimumOfPairwiseMaximumSet {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {iA iB : ℝ}
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightInfimumHypothesis : IsInfimum iB B) :
    IsInfimum (max iA iB) (PairwiseMax A B)
```
-/
theorem InfimumOfPairwiseMaximumSet {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {iA iB : ℝ}
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightInfimumHypothesis : IsInfimum iB B) :
    IsInfimum (max iA iB) (PairwiseMax A B) := by
  sorry

/-- Let `A B : Set ℝ` and `sA sB : ℝ`. If `leftNonemptyHypothesis : A.Nonempty`,
`rightNonemptyHypothesis : B.Nonempty`, `leftSupremumHypothesis : IsSupremum sA A`, and
`rightSupremumHypothesis : IsSupremum sB B`. Then `IsSupremum (min sA sB) (PairwiseMin A B)`.

Logical form:

```lean
theorem SupremumOfPairwiseMinimumSet {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA sB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (rightSupremumHypothesis : IsSupremum sB B) :
    IsSupremum (min sA sB) (PairwiseMin A B)
```
-/
theorem SupremumOfPairwiseMinimumSet {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA sB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (rightSupremumHypothesis : IsSupremum sB B) :
    IsSupremum (min sA sB) (PairwiseMin A B) := by
  sorry

/-- Let `A B : Set ℝ` and `iA iB : ℝ`. If `leftNonemptyHypothesis : A.Nonempty`,
`rightNonemptyHypothesis : B.Nonempty`, `leftInfimumHypothesis : IsInfimum iA A`, and
`rightInfimumHypothesis : IsInfimum iB B`. Then `IsInfimum (min iA iB) (PairwiseMin A B)`.

Logical form:

```lean
theorem InfimumOfPairwiseMinimumSet {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {iA iB : ℝ}
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightInfimumHypothesis : IsInfimum iB B) :
    IsInfimum (min iA iB) (PairwiseMin A B)
```
-/
theorem InfimumOfPairwiseMinimumSet {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {iA iB : ℝ}
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightInfimumHypothesis : IsInfimum iB B) :
    IsInfimum (min iA iB) (PairwiseMin A B) := by
  sorry

end LRA.VolumeIII.Analysis.Bounding.BoundAlgebra
