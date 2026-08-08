import LRA.VolumeI.Set.Laws.Complement

universe u v

namespace LRA.VolumeI.Set.Generic

open LRA.VolumeI.Set.Operations

/-!
Difference laws over the generic Boolean set interface.
-/

/-- Difference is monotone in its left argument. -/
theorem DifferenceMonotoneLeft
    (operations : BooleanSetOperations.{u, v})
    (laws : BooleanSetInterfaceLaws operations)
    {left right fixed : operations.SetObject}
    (leftSubsetRight : operations.subset left right) :
    operations.subset
      (Difference operations left fixed)
      (Difference operations right fixed) := by
  sorry

/-- Difference is antitone in its right argument. -/
theorem DifferenceAntitoneRight
    (operations : BooleanSetOperations.{u, v})
    (laws : BooleanSetInterfaceLaws operations)
    {smaller larger fixed : operations.SetObject}
    (smallerSubsetLarger : operations.subset smaller larger) :
    operations.subset
      (Difference operations fixed larger)
      (Difference operations fixed smaller) := by
  sorry

/-- Difference by empty gives the original set. -/
theorem DifferenceEmpty
    (operations : BooleanSetOperations.{u, v})
    (laws : BooleanSetInterfaceLaws operations)
    (setObject : operations.SetObject) :
    Difference operations setObject operations.empty = setObject := by
  sorry

/-- Empty difference any set is empty. -/
theorem EmptyDifference
    (operations : BooleanSetOperations.{u, v})
    (laws : BooleanSetInterfaceLaws operations)
    (setObject : operations.SetObject) :
    Difference operations operations.empty setObject = operations.empty := by
  sorry

/-- Difference by universal is empty. -/
theorem DifferenceUniversal
    (operations : BooleanSetOperations.{u, v})
    (laws : BooleanSetInterfaceLaws operations)
    (setObject : operations.SetObject) :
    Difference operations setObject (Universal operations) = operations.empty := by
  sorry

/-- Universal difference a set is its complement. -/
theorem UniversalDifference
    (operations : BooleanSetOperations.{u, v})
    (laws : BooleanSetInterfaceLaws operations)
    (setObject : operations.SetObject) :
    Difference operations (Universal operations) setObject =
      Complement operations setObject := by
  sorry

/-- Self-difference is empty. -/
theorem DifferenceSelf
    (operations : BooleanSetOperations.{u, v})
    (laws : BooleanSetInterfaceLaws operations)
    (setObject : operations.SetObject) :
    Difference operations setObject setObject = operations.empty := by
  sorry

/-- Difference over a union in the right argument. -/
theorem DifferenceUnion
    (operations : BooleanSetOperations.{u, v})
    (laws : BooleanSetInterfaceLaws operations)
    (left middle right : operations.SetObject) :
    Difference operations left (operations.union middle right) =
      operations.intersection
        (Difference operations left middle)
        (Difference operations left right) := by
  sorry

/-- Difference over an intersection in the right argument. -/
theorem DifferenceIntersection
    (operations : BooleanSetOperations.{u, v})
    (laws : BooleanSetInterfaceLaws operations)
    (left middle right : operations.SetObject) :
    Difference operations left (operations.intersection middle right) =
      operations.union
        (Difference operations left middle)
        (Difference operations left right) := by
  sorry

/-- Difference distributes over union in the left argument. -/
theorem UnionDifferenceDistributes
    (operations : BooleanSetOperations.{u, v})
    (laws : BooleanSetInterfaceLaws operations)
    (left middle right : operations.SetObject) :
    Difference operations (operations.union left middle) right =
      operations.union
        (Difference operations left right)
        (Difference operations middle right) := by
  sorry

/-- Difference distributes over intersection in the left argument. -/
theorem IntersectionDifferenceDistributes
    (operations : BooleanSetOperations.{u, v})
    (laws : BooleanSetInterfaceLaws operations)
    (left middle right : operations.SetObject) :
    Difference operations (operations.intersection left middle) right =
      operations.intersection
        (Difference operations left right)
        (Difference operations middle right) := by
  sorry

/-- Difference is contained in its left argument. -/
theorem DifferenceSubsetLeft
    (operations : BooleanSetOperations.{u, v})
    (laws : BooleanSetInterfaceLaws operations)
    (left right : operations.SetObject) :
    operations.subset (Difference operations left right) left := by
  sorry

/-- A difference is disjoint from its right argument. -/
theorem DifferenceDisjointRight
    (operations : BooleanSetOperations.{u, v})
    (laws : BooleanSetInterfaceLaws operations)
    (left right : operations.SetObject) :
    operations.intersection (Difference operations left right) right =
      operations.empty := by
  sorry

end LRA.VolumeI.Set.Generic
