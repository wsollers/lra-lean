import Mathlib.Algebra.Order.Group.Abs
import Mathlib.Data.Set.Basic
import LRA.VolumeIII.Analysis.Bounding.Bounds

/-!
Upper and lower bounds for ordered carriers.
-/

namespace LRA.Analysis.Bounds.Extremal

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

/-! Upper/lower/bounded predicates are canonically owned by the parent
`LRA.Analysis.Bounds` namespace. -/

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

end LRA.Analysis.Bounds.Extremal
