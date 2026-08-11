import Mathlib.Algebra.Order.Group.Abs
import Mathlib.Data.Set.Basic

/-!
Upper and lower bounds for ordered carriers.
-/

namespace LRA.VolumeIII.Analysis.Bounding.ExtremalBounds

variable {F : Type*}

/-- `IsBound b A` says `b` is either an upper or lower bound of `A`.

Logical form:

```lean
def IsBound [LE F] (b : F) (A : Set F) : Prop :=
  (∀ a ∈ A, a ≤ b) ∨ (∀ a ∈ A, b ≤ a)
```
-/
def IsBound [LE F] (b : F) (A : Set F) : Prop :=
  (∀ a ∈ A, a ≤ b) ∨ (∀ a ∈ A, b ≤ a)

/-- `IsUpperBound u A` says every element of `A` is at most `u`.

Logical form:

```lean
def IsUpperBound [LE F] (u : F) (A : Set F) : Prop :=
  ∀ a ∈ A, a ≤ u
```
-/
def IsUpperBound [LE F] (u : F) (A : Set F) : Prop :=
  ∀ a ∈ A, a ≤ u

/-- `IsLowerBound l A` says `l` is at most every element of `A`.

Logical form:

```lean
def IsLowerBound [LE F] (l : F) (A : Set F) : Prop :=
  ∀ a ∈ A, l ≤ a
```
-/
def IsLowerBound [LE F] (l : F) (A : Set F) : Prop :=
  ∀ a ∈ A, l ≤ a

/-- `A` is bounded above when it has an upper bound.

Logical form:

```lean
def IsBoundedAbove [LE F] (A : Set F) : Prop :=
  ∃ u, IsUpperBound u A
```
-/
def IsBoundedAbove [LE F] (A : Set F) : Prop :=
  ∃ u, IsUpperBound u A

/-- `A` is bounded below when it has a lower bound.

Logical form:

```lean
def IsBoundedBelow [LE F] (A : Set F) : Prop :=
  ∃ l, IsLowerBound l A
```
-/
def IsBoundedBelow [LE F] (A : Set F) : Prop :=
  ∃ l, IsLowerBound l A

/-- `A` is bounded when it is bounded above and below.

Logical form:

```lean
def IsBounded [LE F] (A : Set F) : Prop :=
  IsBoundedAbove A ∧ IsBoundedBelow A
```
-/
def IsBounded [LE F] (A : Set F) : Prop :=
  IsBoundedAbove A ∧ IsBoundedBelow A

/-- Let `A : Set F`. If `[AddCommGroup F]`, `[LinearOrder F]`, and `[IsOrderedAddMonoid F]`. Then
`IsBounded A ↔ ∃ M, 0 ≤ M ∧ ∀ a ∈ A, |a| ≤ M`.

Logical form:

```lean
theorem IsBoundedIffAbsBound [AddCommGroup F] [LinearOrder F] [IsOrderedAddMonoid F]
    (A : Set F) :
    IsBounded A ↔ ∃ M, 0 ≤ M ∧ ∀ a ∈ A, |a| ≤ M
```
-/
theorem IsBoundedIffAbsBound [AddCommGroup F] [LinearOrder F] [IsOrderedAddMonoid F]
    (A : Set F) :
    IsBounded A ↔ ∃ M, 0 ≤ M ∧ ∀ a ∈ A, |a| ≤ M := by
  sorry

end LRA.VolumeIII.Analysis.Bounding.ExtremalBounds
