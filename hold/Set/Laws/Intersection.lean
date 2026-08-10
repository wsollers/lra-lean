import LRA.VolumeI.Set.Laws.Union

universe u v

namespace LRA.VolumeI.Set.Generic

/-!
Intersection laws over the generic set interface.
-/

/-- Intersection is commutative. -/
theorem IntersectionCommutative
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    (left right : interface.SetObject) :
    Intersection interface left right = Intersection interface right left := by
  sorry

/-- Intersection is associative. -/
theorem IntersectionAssociative
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    (left middle right : interface.SetObject) :
    Intersection interface (Intersection interface left middle) right =
      Intersection interface left (Intersection interface middle right) := by
  sorry

/-- Empty is left absorbing for intersection. -/
theorem EmptyIntersection
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    (right : interface.SetObject) :
    Intersection interface (Empty interface) right = Empty interface := by
  sorry

/-- Empty is right absorbing for intersection. -/
theorem IntersectionEmpty
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    (left : interface.SetObject) :
    Intersection interface left (Empty interface) = Empty interface := by
  sorry

/-- Intersection is idempotent. -/
theorem IntersectionIdempotent
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    (setObject : interface.SetObject) :
    Intersection interface setObject setObject = setObject := by
  sorry

/-- Intersection is monotone in both arguments. -/
theorem IntersectionMonotone
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    {left₁ left₂ right₁ right₂ : interface.SetObject}
    (leftSubset : Subset interface left₁ left₂)
    (rightSubset : Subset interface right₁ right₂) :
    Subset interface
      (Intersection interface left₁ right₁)
      (Intersection interface left₂ right₂) := by
  sorry

end LRA.VolumeI.Set.Generic
