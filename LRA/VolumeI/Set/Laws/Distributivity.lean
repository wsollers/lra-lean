import LRA.VolumeI.Set.Laws.Intersection

universe u v

namespace LRA.VolumeI.Set.Generic

/-!
Distributivity and absorption laws over the generic set interface.
-/

/-- Intersection distributes over union. -/
theorem IntersectionDistributesOverUnion
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    (left middle right : interface.SetObject) :
    Intersection interface left (Union interface middle right) =
      Union interface
        (Intersection interface left middle)
        (Intersection interface left right) := by
  sorry

/-- Union distributes over intersection. -/
theorem UnionDistributesOverIntersection
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    (left middle right : interface.SetObject) :
    Union interface left (Intersection interface middle right) =
      Intersection interface
        (Union interface left middle)
        (Union interface left right) := by
  sorry

/-- Absorption of intersection into union. -/
theorem AbsorptionUnionIntersection
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    (left right : interface.SetObject) :
    Union interface left (Intersection interface left right) = left := by
  sorry

/-- Absorption of union into intersection. -/
theorem AbsorptionIntersectionUnion
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    (left right : interface.SetObject) :
    Intersection interface left (Union interface left right) = left := by
  sorry

end LRA.VolumeI.Set.Generic
