import LRA.VolumeI.Set.Public.Interface
import LRA.VolumeI.Set.Operations.Comprehension

universe u v

namespace LRA.VolumeI.Set

/-!
Foundational set-existence statements over the generic set interface.
-/

/-- There exists a set object with no members. -/
theorem EmptySetExist
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface) :
    ∃ empty : interface.SetObject,
      ∀ element, ¬ interface.member element empty := by
  sorry

/-- For each element, there exists a singleton containing exactly it. -/
theorem SingletonSetExist
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    (chosen : interface.Element) :
    ∃ singletonSet : interface.SetObject,
      ∀ element, interface.member element singletonSet ↔ element = chosen := by
  sorry

/-- For any two elements, there exists a pair set containing exactly them. -/
theorem PairSetExist
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    (left right : interface.Element) :
    ∃ pairSet : interface.SetObject,
      ∀ element,
        interface.member element pairSet ↔ element = left ∨ element = right := by
  sorry

/-- For any two sets, there exists a union with the expected members. -/
theorem BinaryUnionExist
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    (left right : interface.SetObject) :
    ∃ unionSet : interface.SetObject,
      ∀ element,
        interface.member element unionSet ↔
          interface.member element left ∨ interface.member element right := by
  sorry

/-- For any two sets, there exists an intersection with the expected members. -/
theorem IntersectionExist
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    (left right : interface.SetObject) :
    ∃ intersectionSet : interface.SetObject,
      ∀ element,
        interface.member element intersectionSet ↔
          interface.member element left ∧ interface.member element right := by
  sorry

/-- For any ambient set and predicate, there exists the separated subset. -/
theorem SeparationExist
    (operations : Operations.ComprehensionSetOperations.{u, v})
    (laws : Operations.ComprehensionSetInterfaceLaws operations)
    (ambient : operations.SetObject)
    (predicate : operations.Element → Prop) :
    ∃ separatedSet : operations.SetObject,
      ∀ element,
        operations.member element separatedSet ↔
          operations.member element ambient ∧ predicate element := by
  sorry

end LRA.VolumeI.Set
