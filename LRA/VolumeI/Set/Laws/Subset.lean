import LRA.VolumeI.Set.Laws.Extensionality

universe u v

namespace LRA.VolumeI.Set.Generic

/-!
Subset criteria over the generic set interface.
-/

/-- Subset is reflexive. -/
theorem SubsetReflexive
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    (setObject : interface.SetObject) :
    Subset interface setObject setObject := by
  sorry

/-- Subset is transitive. -/
theorem SubsetTransitive
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    {left middle right : interface.SetObject}
    (leftSubsetMiddle : Subset interface left middle)
    (middleSubsetRight : Subset interface middle right) :
    Subset interface left right := by
  sorry

/-- Equality is equivalent to mutual subset. -/
theorem SetEqualityIffMutualSubset
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    (left right : interface.SetObject) :
    left = right ↔
      Subset interface left right ∧ Subset interface right left := by
  sorry

/-- Subset can be recognized by union with the larger set. -/
theorem SubsetIffUnionEqRight
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    (left right : interface.SetObject) :
    Subset interface left right ↔
      Union interface left right = right := by
  sorry

/-- Subset can be recognized by intersection with the smaller set. -/
theorem SubsetIffIntersectionEqLeft
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    (left right : interface.SetObject) :
    Subset interface left right ↔
      Intersection interface left right = left := by
  sorry

end LRA.VolumeI.Set.Generic
