-- LRA/VolumeIII/Analysis/Bounding/Bounds.lean
-- Bounds, extrema, suprema, and infima over ordered carriers.

import Mathlib.Algebra.Order.Field.Basic
import Mathlib.Algebra.Group.Pointwise.Set.Basic
import Mathlib.Order.Bounds.Defs

open scoped Pointwise

namespace LRA.VolumeIII.Analysis.Bounding.Bounds
open scoped Pointwise

/-!
Volume III label: analysis-bounding-bounds
Lean module: LRA.VolumeIII.Analysis.Bounding.Bounds
Verification status: definitions accepted; algebraic proofs pending

The definitions are carrier-generic. Concrete carrier checks live in
`LRA.VolumeIII.Analysis.Bounding.BoundsTests`.
-/

variable {F : Type*}

/-- `IsUpperBound u A` says `u` dominates every element of `A`.

Logical form:

```lean
def IsUpperBound [LE F] (u : F) (A : Set F) : Prop :=
  forall x, x ∈ A -> x <= u
```
-/
def IsUpperBound [LE F] (u : F) (A : Set F) : Prop :=
  forall x, x ∈ A -> x <= u

/-- `IsLowerBound l A` says `l` is below every element of `A`.

Logical form:

```lean
def IsLowerBound [LE F] (l : F) (A : Set F) : Prop :=
  forall x, x ∈ A -> l <= x
```
-/
def IsLowerBound [LE F] (l : F) (A : Set F) : Prop :=
  forall x, x ∈ A -> l <= x

/-- A set is bounded above when it has an upper bound.

Logical form:

```lean
def IsBoundedAbove [LE F] (A : Set F) : Prop :=
  exists u, IsUpperBound u A
```
-/
def IsBoundedAbove [LE F] (A : Set F) : Prop :=
  exists u, IsUpperBound u A

/-- A set is bounded below when it has a lower bound.

Logical form:

```lean
def IsBoundedBelow [LE F] (A : Set F) : Prop :=
  exists l, IsLowerBound l A
```
-/
def IsBoundedBelow [LE F] (A : Set F) : Prop :=
  exists l, IsLowerBound l A

/-- A set is bounded when it is bounded above and below.

Logical form:

```lean
def IsBounded [LE F] (A : Set F) : Prop :=
  IsBoundedAbove A /\ IsBoundedBelow A
```
-/
def IsBounded [LE F] (A : Set F) : Prop :=
  IsBoundedAbove A /\ IsBoundedBelow A

/-- A maximum is an upper bound that belongs to the set.

Logical form:

```lean
def IsMaximum [LE F] (m : F) (A : Set F) : Prop :=
  m ∈ A /\ IsUpperBound m A
```
-/
def IsMaximum [LE F] (m : F) (A : Set F) : Prop :=
  m ∈ A /\ IsUpperBound m A

/-- A minimum is a lower bound that belongs to the set.

Logical form:

```lean
def IsMinimum [LE F] (m : F) (A : Set F) : Prop :=
  m ∈ A /\ IsLowerBound m A
```
-/
def IsMinimum [LE F] (m : F) (A : Set F) : Prop :=
  m ∈ A /\ IsLowerBound m A

/-- A supremum is a least upper bound.

Logical form:

```lean
def IsSupremum [Preorder F] (s : F) (A : Set F) : Prop :=
  IsUpperBound s A /\ forall u, IsUpperBound u A -> s <= u
```
-/
def IsSupremum [Preorder F] (s : F) (A : Set F) : Prop :=
  IsUpperBound s A /\ forall u, IsUpperBound u A -> s <= u

/-- An infimum is a greatest lower bound.

Logical form:

```lean
def IsInfimum [Preorder F] (i : F) (A : Set F) : Prop :=
  IsLowerBound i A /\ forall l, IsLowerBound l A -> l <= i
```
-/
def IsInfimum [Preorder F] (i : F) (A : Set F) : Prop :=
  IsLowerBound i A /\ forall l, IsLowerBound l A -> l <= i

/-- Let `m : F` and `A : Set F`. If `[Preorder F]` and `maximum_hypothesis : IsMaximum m A`. Then
`IsSupremum m A`.

Logical form:

```lean
theorem MaximumIsSupremum [Preorder F] {m : F} {A : Set F}
    (maximum_hypothesis : IsMaximum m A) : IsSupremum m A
```
-/
theorem MaximumIsSupremum [Preorder F] {m : F} {A : Set F}
    (maximum_hypothesis : IsMaximum m A) : IsSupremum m A :=
  ⟨maximum_hypothesis.2, fun _ upper_hypothesis =>
    upper_hypothesis m maximum_hypothesis.1⟩

/-- Let `s t : F` and `A : Set F`. If `[PartialOrder F]`, `left_supremum : IsSupremum s A`, and
`right_supremum : IsSupremum t A`. Then `s = t`.

Logical form:

```lean
theorem SupremumUnique [PartialOrder F] {s t : F} {A : Set F}
    (left_supremum : IsSupremum s A)
    (right_supremum : IsSupremum t A) : s = t
```
-/
theorem SupremumUnique [PartialOrder F] {s t : F} {A : Set F}
    (left_supremum : IsSupremum s A)
    (right_supremum : IsSupremum t A) : s = t :=
  le_antisymm
    (left_supremum.2 t right_supremum.1)
    (right_supremum.2 s left_supremum.1)

/-- Let `s t : F` and `A : Set F`. If `[PartialOrder F]`, `left_infimum : IsInfimum s A`, and
`right_infimum : IsInfimum t A`. Then `s = t`.

Logical form:

```lean
theorem InfimumUnique [PartialOrder F] {s t : F} {A : Set F}
    (left_infimum : IsInfimum s A)
    (right_infimum : IsInfimum t A) : s = t
```
-/
theorem InfimumUnique [PartialOrder F] {s t : F} {A : Set F}
    (left_infimum : IsInfimum s A)
    (right_infimum : IsInfimum t A) : s = t :=
  le_antisymm
    (right_infimum.2 s left_infimum.1)
    (left_infimum.2 t right_infimum.1)

/-- Let `s : F` and `A : Set F`. If `[Preorder F]`. Then `IsSupremum s A <-> IsLUB A s`.

Logical form:

```lean
theorem SupremumIffIsLUB [Preorder F] {s : F} {A : Set F} :
    IsSupremum s A <-> IsLUB A s
```
-/
theorem SupremumIffIsLUB [Preorder F] {s : F} {A : Set F} :
    IsSupremum s A <-> IsLUB A s := by
  constructor
  case mp =>
    sorry
  case mpr =>
    sorry



end LRA.VolumeIII.Analysis.Bounding.Bounds
namespace LRA.VolumeIII.Analysis.Bounding.Bounds.Algebra
open scoped Pointwise

variable {F : Type*} [Field F] [LinearOrder F] [IsStrictOrderedRing F]

/-- Let `sA sB : F` and `A B : Set F`. If `A_nonempty : A.Nonempty`, `B_nonempty : B.Nonempty`,
`left_supremum : IsSupremum sA A`, and `right_supremum : IsSupremum sB B`. Then `IsSupremum (sA
+ sB) (A + B)`.

Logical form:

```lean
theorem SupremumOfSum {sA sB : F} {A B : Set F}
    (A_nonempty : A.Nonempty)
    (B_nonempty : B.Nonempty)
    (left_supremum : IsSupremum sA A)
    (right_supremum : IsSupremum sB B) :
    IsSupremum (sA + sB) (A + B)
```
-/
theorem SupremumOfSum {sA sB : F} {A B : Set F}
    (A_nonempty : A.Nonempty)
    (B_nonempty : B.Nonempty)
    (left_supremum : IsSupremum sA A)
    (right_supremum : IsSupremum sB B) :
    IsSupremum (sA + sB) (A + B) := by
  sorry

/-- Let `iA iB : F` and `A B : Set F`. If `A_nonempty : A.Nonempty`, `B_nonempty : B.Nonempty`,
`left_infimum : IsInfimum iA A`, and `right_infimum : IsInfimum iB B`. Then `IsInfimum (iA + iB)
(A + B)`.

Logical form:

```lean
theorem InfimumOfSum {iA iB : F} {A B : Set F}
    (A_nonempty : A.Nonempty)
    (B_nonempty : B.Nonempty)
    (left_infimum : IsInfimum iA A)
    (right_infimum : IsInfimum iB B) :
    IsInfimum (iA + iB) (A + B)
```
-/
theorem InfimumOfSum {iA iB : F} {A B : Set F}
    (A_nonempty : A.Nonempty)
    (B_nonempty : B.Nonempty)
    (left_infimum : IsInfimum iA A)
    (right_infimum : IsInfimum iB B) :
    IsInfimum (iA + iB) (A + B) := by
  sorry

/-- Let `a s : F` and `A : Set F`. If `A_nonempty : A.Nonempty`, `scale_positive : 0 < a`, and
`supremum_hypothesis : IsSupremum s A`. Then `IsSupremum (a * s) ((fun x => a * x) '' A)`.

Logical form:

```lean
theorem SupremumOfPositiveScale {a s : F} {A : Set F}
    (A_nonempty : A.Nonempty)
    (scale_positive : 0 < a)
    (supremum_hypothesis : IsSupremum s A) :
    IsSupremum (a * s) ((fun x => a * x) '' A)
```
-/
theorem SupremumOfPositiveScale {a s : F} {A : Set F}
    (A_nonempty : A.Nonempty)
    (scale_positive : 0 < a)
    (supremum_hypothesis : IsSupremum s A) :
    IsSupremum (a * s) ((fun x => a * x) '' A) := by
  sorry

/-- Let `s : F` and `A : Set F`. Then `IsSupremum s A <-> IsInfimum (-s) (-A)`.

Logical form:

```lean
theorem NegationSwapsSupremumInfimum {s : F} {A : Set F} :
    IsSupremum s A <-> IsInfimum (-s) (-A)
```
-/
theorem NegationSwapsSupremumInfimum {s : F} {A : Set F} :
    IsSupremum s A <-> IsInfimum (-s) (-A) := by
  sorry

/-- Let `sA sB : F` and `A B : Set F`. If `subset_hypothesis : A ⊆ B`, `left_supremum : IsSupremum
sA A`, and `right_supremum : IsSupremum sB B`. Then `sA <= sB`.

Logical form:

```lean
theorem SupremumMonotone {sA sB : F} {A B : Set F}
    (subset_hypothesis : A ⊆ B)
    (left_supremum : IsSupremum sA A)
    (right_supremum : IsSupremum sB B) :
    sA <= sB
```
-/
theorem SupremumMonotone {sA sB : F} {A B : Set F}
    (subset_hypothesis : A ⊆ B)
    (left_supremum : IsSupremum sA A)
    (right_supremum : IsSupremum sB B) :
    sA <= sB := by
  sorry

end LRA.VolumeIII.Analysis.Bounding.Bounds.Algebra
namespace LRA.VolumeIII.Analysis.Bounding.Bounds
open scoped Pointwise

end LRA.VolumeIII.Analysis.Bounding.Bounds
