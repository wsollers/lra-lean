import LRA.VolumeI.Set.LRASet.Instances
import LRA.VolumeI.Set.Interface.Subset

namespace LRA.Set.LRASet

universe u

variable {Alpha : Type u}

/-!
Subset laws for predicate sets: the backend's certificate for
`LRA.Set.SubsetLaws`. As in the interface and in
`Enderton/Laws/`, only the pure-`⊆` laws are here; the union/intersection
characterizations live in `Laws/Union.lean` and `Laws/Intersection.lean`.
-/
/--
`SubsetReflexive` exposes this formal declaration.

Logical form:

```lean
theorem SubsetReflexive : ∀ A : LRASet Alpha, A ⊆ A
```
-/

theorem SubsetReflexive : ∀ A : LRASet Alpha, A ⊆ A := by
  sorry
/--
`SubsetTransitive` exposes this formal declaration.

Logical form:

```lean
theorem SubsetTransitive :
    ∀ A B C : LRASet Alpha, A ⊆ B → B ⊆ C → A ⊆ C
```
-/

theorem SubsetTransitive :
    ∀ A B C : LRASet Alpha, A ⊆ B → B ⊆ C → A ⊆ C := by
  sorry
/--
`SetEqualityIffMutualSubset` exposes this formal declaration.

Logical form:

```lean
theorem SetEqualityIffMutualSubset :
    ∀ A B : LRASet Alpha, A = B ↔ A ⊆ B ∧ B ⊆ A
```
-/

theorem SetEqualityIffMutualSubset :
    ∀ A B : LRASet Alpha, A = B ↔ A ⊆ B ∧ B ⊆ A := by
  sorry

/-- Registration: predicate sets satisfy the subset laws. Pure delegation
to the theorems above. -/
instance : SubsetLaws (LRASet Alpha) where
  SubsetReflexive := LRA.Set.LRASet.SubsetReflexive
  SubsetTransitive := LRA.Set.LRASet.SubsetTransitive
  SetEqualityIffMutualSubset :=
    LRA.Set.LRASet.SetEqualityIffMutualSubset

end LRA.Set.LRASet
