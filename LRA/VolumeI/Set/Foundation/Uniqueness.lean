import LRA.VolumeI.Set.Public.Interface
import LRA.VolumeI.Set.Operations.Comprehension

universe u v

namespace LRA.VolumeI.Set

/-!
Foundational set-uniqueness statements over the generic set interface.
-/

/-- Any two empty set objects are equal. -/
theorem EmptySetUnique
    (interface : SetInterface.{u, v})
    (laws : SetInterfaceLaws interface)
    {left right : interface.SetObject}
    (leftEmpty : ∀ element, ¬ interface.member element left)
    (rightEmpty : ∀ element, ¬ interface.member element right) :
    left = right := by
  apply laws.extensionality
  intro element
  constructor
  · intro elementInLeft
    exact False.elim (leftEmpty element elementInLeft)
  · intro elementInRight
    exact False.elim (rightEmpty element elementInRight)


/-- Any two singleton set objects for the same element are equal. -/
theorem SingletonSetUnique
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    (chosen : interface.Element)
    {left right : interface.SetObject}
    (leftSingleton :
      ∀ element, interface.member element left ↔ element = chosen)
    (rightSingleton :
      ∀ element, interface.member element right ↔ element = chosen) :
    left = right := by
  sorry

/-- Any two pair set objects for the same two elements are equal. -/
theorem PairSetUnique
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    (leftElement rightElement : interface.Element)
    {left right : interface.SetObject}
    (leftPair :
      ∀ element,
        interface.member element left ↔
          element = leftElement ∨ element = rightElement)
    (rightPair :
      ∀ element,
        interface.member element right ↔
          element = leftElement ∨ element = rightElement) :
    left = right := by
  sorry

/-- Any two union set objects for the same two input sets are equal. -/
theorem BinaryUnionUnique
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    (leftInput rightInput : interface.SetObject)
    {left right : interface.SetObject}
    (leftUnion :
      ∀ element,
        interface.member element left ↔
          interface.member element leftInput ∨ interface.member element rightInput)
    (rightUnion :
      ∀ element,
        interface.member element right ↔
          interface.member element leftInput ∨ interface.member element rightInput) :
    left = right := by
  sorry

/-- Any two intersection set objects for the same two input sets are equal. -/
theorem IntersectionUnique
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    (leftInput rightInput : interface.SetObject)
    {left right : interface.SetObject}
    (leftIntersection :
      ∀ element,
        interface.member element left ↔
          interface.member element leftInput ∧ interface.member element rightInput)
    (rightIntersection :
      ∀ element,
        interface.member element right ↔
          interface.member element leftInput ∧ interface.member element rightInput) :
    left = right := by
  sorry

/-- Any two separated subsets for the same ambient set and predicate are equal. -/
theorem SeparationUnique
    (operations : Operations.ComprehensionSetOperations.{u, v})
    (laws : Operations.ComprehensionSetInterfaceLaws operations)
    (ambient : operations.SetObject)
    (predicate : operations.Element → Prop)
    {left right : operations.SetObject}
    (leftSeparated :
      ∀ element,
        operations.member element left ↔
          operations.member element ambient ∧ predicate element)
    (rightSeparated :
      ∀ element,
        operations.member element right ↔
          operations.member element ambient ∧ predicate element) :
    left = right := by
  sorry

end LRA.VolumeI.Set
