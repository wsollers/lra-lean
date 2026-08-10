import LRA.VolumeI.Set.Laws.Difference

universe u v

namespace LRA.VolumeI.Set.Generic

open LRA.VolumeI.Set.Operations

/-!
Symmetric-difference laws over the generic Boolean set interface.
-/

/-- Symmetric difference is the union minus the intersection. -/
theorem SymmetricDifferenceAsUnionDifferenceIntersection
    (operations : BooleanSetOperations.{u, v})
    (laws : BooleanSetInterfaceLaws operations)
    (left right : operations.SetObject) :
    SymmetricDifference operations left right =
      Difference operations
        (operations.union left right)
        (operations.intersection left right) := by
  sorry

/-- Symmetric difference is commutative. -/
theorem SymmetricDifferenceCommutative
    (operations : BooleanSetOperations.{u, v})
    (laws : BooleanSetInterfaceLaws operations)
    (left right : operations.SetObject) :
    SymmetricDifference operations left right =
      SymmetricDifference operations right left := by
  sorry

/-- Empty is a right identity for symmetric difference. -/
theorem SymmetricDifferenceEmpty
    (operations : BooleanSetOperations.{u, v})
    (laws : BooleanSetInterfaceLaws operations)
    (setObject : operations.SetObject) :
    SymmetricDifference operations setObject operations.empty = setObject := by
  sorry

/-- Empty is a left identity for symmetric difference. -/
theorem EmptySymmetricDifference
    (operations : BooleanSetOperations.{u, v})
    (laws : BooleanSetInterfaceLaws operations)
    (setObject : operations.SetObject) :
    SymmetricDifference operations operations.empty setObject = setObject := by
  sorry

/-- Every set is its own inverse under symmetric difference. -/
theorem SymmetricDifferenceSelf
    (operations : BooleanSetOperations.{u, v})
    (laws : BooleanSetInterfaceLaws operations)
    (setObject : operations.SetObject) :
    SymmetricDifference operations setObject setObject = operations.empty := by
  sorry

/-- Symmetric difference is associative. -/
theorem SymmetricDifferenceAssociative
    (operations : BooleanSetOperations.{u, v})
    (laws : BooleanSetInterfaceLaws operations)
    (left middle right : operations.SetObject) :
    SymmetricDifference operations
        (SymmetricDifference operations left middle)
        right =
      SymmetricDifference operations
        left
        (SymmetricDifference operations middle right) := by
  sorry

/-- Symmetric difference is empty exactly when the two sets are equal. -/
theorem SymmetricDifferenceEqEmptyIff
    (operations : BooleanSetOperations.{u, v})
    (laws : BooleanSetInterfaceLaws operations)
    (left right : operations.SetObject) :
    SymmetricDifference operations left right = operations.empty ↔ left = right := by
  sorry

/-- Symmetric difference is contained in union. -/
theorem SymmetricDifferenceSubsetUnion
    (operations : BooleanSetOperations.{u, v})
    (laws : BooleanSetInterfaceLaws operations)
    (left right : operations.SetObject) :
    operations.subset
      (SymmetricDifference operations left right)
      (operations.union left right) := by
  sorry

end LRA.VolumeI.Set.Generic
