import LRA.VolumeI.Set.Laws.Subset

universe u v

namespace LRA.VolumeI.Set.Generic

/-!
Union laws over the generic set interface.
-/

/-- Union is commutative. -/
theorem UnionCommutative
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    (left right : interface.SetObject) :
    Union interface left right = Union interface right left := by
  sorry

/-- Union is associative. -/
theorem UnionAssociative
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    (left middle right : interface.SetObject) :
    Union interface (Union interface left middle) right =
      Union interface left (Union interface middle right) := by
  sorry

/-- Empty is a left identity for union. -/
theorem EmptyUnion
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    (right : interface.SetObject) :
    Union interface (Empty interface) right = right := by
  sorry

/-- Empty is a right identity for union. -/
theorem UnionEmpty
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    (left : interface.SetObject) :
    Union interface left (Empty interface) = left := by
  sorry

/-- Union is idempotent. -/
theorem UnionIdempotent
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    (setObject : interface.SetObject) :
    Union interface setObject setObject = setObject := by
  sorry

/-- Union is monotone in both arguments. -/
theorem UnionMonotone
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    {left₁ left₂ right₁ right₂ : interface.SetObject}
    (leftSubset : Subset interface left₁ left₂)
    (rightSubset : Subset interface right₁ right₂) :
    Subset interface
      (Union interface left₁ right₁)
      (Union interface left₂ right₂) := by
  sorry

end LRA.VolumeI.Set.Generic
