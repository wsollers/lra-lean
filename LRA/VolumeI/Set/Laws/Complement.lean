import LRA.VolumeI.Set.Laws.Boolean

universe u v

namespace LRA.VolumeI.Set.Generic

open LRA.VolumeI.Set.Operations

/-!
Complement and universal-boundary laws over the generic Boolean set interface.
-/

/-- Complement is antitone with respect to inclusion inside a fixed ambient set. -/
theorem ComplementAntitoneInclusion
    (operations : BooleanSetOperations.{u, v})
    (laws : BooleanSetInterfaceLaws operations)
    {ambient left right : operations.SetObject}
    (leftSubsetRight : operations.subset left right) :
    operations.subset
      (operations.intersection ambient (Complement operations right))
      (operations.intersection ambient (Complement operations left)) := by
  sorry

/-- Complement union the original set gives universal. -/
theorem ComplementUnion
    (operations : BooleanSetOperations.{u, v})
    (laws : BooleanSetInterfaceLaws operations)
    (setObject : operations.SetObject) :
    operations.union (Complement operations setObject) setObject =
      Universal operations := by
  sorry

/-- Complement intersect the original set gives empty. -/
theorem ComplementIntersection
    (operations : BooleanSetOperations.{u, v})
    (laws : BooleanSetInterfaceLaws operations)
    (setObject : operations.SetObject) :
    operations.intersection (Complement operations setObject) setObject =
      operations.empty := by
  sorry

/-- Union with universal gives universal. -/
theorem UnionUniversal
    (operations : BooleanSetOperations.{u, v})
    (laws : BooleanSetInterfaceLaws operations)
    (setObject : operations.SetObject) :
    operations.union setObject (Universal operations) = Universal operations := by
  sorry

/-- Universal union a set gives universal. -/
theorem UniversalUnion
    (operations : BooleanSetOperations.{u, v})
    (laws : BooleanSetInterfaceLaws operations)
    (setObject : operations.SetObject) :
    operations.union (Universal operations) setObject = Universal operations := by
  sorry

/-- Intersection with universal gives the original set. -/
theorem IntersectionUniversal
    (operations : BooleanSetOperations.{u, v})
    (laws : BooleanSetInterfaceLaws operations)
    (setObject : operations.SetObject) :
    operations.intersection setObject (Universal operations) = setObject := by
  sorry

/-- Universal intersection a set gives the original set. -/
theorem UniversalIntersection
    (operations : BooleanSetOperations.{u, v})
    (laws : BooleanSetInterfaceLaws operations)
    (setObject : operations.SetObject) :
    operations.intersection (Universal operations) setObject = setObject := by
  sorry

end LRA.VolumeI.Set.Generic
