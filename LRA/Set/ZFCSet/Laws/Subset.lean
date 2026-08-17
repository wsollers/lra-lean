import LRA.Set.ZFCSet.Instances
import LRA.Set.Interface.Subset

namespace LRA.Set.Enderton

/-!
Subset laws for Enderton sets: the backend's certificate for
`LRA.Set.SubsetLaws`.

Only the pure-`⊆` laws are here. `SubsetIffUnionEqRight` and
`SubsetIffIntersectionEqLeft` moved to `Laws/Union.lean` and
`Laws/Intersection.lean`, mirroring the interface's placement.
-/
/--
`SubsetReflexive` exposes this formal declaration.

Logical form:

```lean
theorem SubsetReflexive : ∀ A : Set, A ⊆ A
```
-/

theorem SubsetReflexive : ∀ A : Set, A ⊆ A := by
  sorry
/--
`SubsetTransitive` exposes this formal declaration.

Logical form:

```lean
theorem SubsetTransitive :
    ∀ A B C : Set, A ⊆ B → B ⊆ C → A ⊆ C
```
-/

theorem SubsetTransitive :
    ∀ A B C : Set, A ⊆ B → B ⊆ C → A ⊆ C := by
  sorry
/--
`SetEqualityIffMutualSubset` exposes this formal declaration.

Logical form:

```lean
theorem SetEqualityIffMutualSubset :
    ∀ A B : Set, A = B ↔ A ⊆ B ∧ B ⊆ A
```
-/

theorem SetEqualityIffMutualSubset :
    ∀ A B : Set, A = B ↔ A ⊆ B ∧ B ⊆ A := by
  sorry

/-- Registration: Enderton sets satisfy the subset laws. Pure delegation to
the theorems above. -/
instance : SubsetLaws Set where
  SubsetReflexive := LRA.Set.Enderton.SubsetReflexive
  SubsetTransitive := LRA.Set.Enderton.SubsetTransitive
  SetEqualityIffMutualSubset :=
    LRA.Set.Enderton.SetEqualityIffMutualSubset

end LRA.Set.Enderton
