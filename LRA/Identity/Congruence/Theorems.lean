import LRA.Identity.Substitution

namespace LRA.Identity

universe u

                                                                                   
theorem CongruenceWithRespectToEqualityIsAutomatic {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right') :
    (∀ predicate : Carrier -> Prop, predicate left ↔ predicate left') ∧
      (∀ relation : Carrier -> Carrier -> Prop,
        relation left right ↔ relation left' right') ∧
      (∀ operation : Carrier -> Carrier -> Carrier,
        operation left right = operation left' right') := by
  sorry

                                              
theorem EqualityCongruence {Carrier : Type u}
    {Left LeftPrime Right RightPrime : Carrier}
    (LeftCoordinatesEqual : Left = LeftPrime)
    (RightCoordinatesEqual : Right = RightPrime) :
    (∀ Predicate : Carrier -> Prop, Predicate Left ↔ Predicate LeftPrime) ∧
      (∀ Relation : Carrier -> Carrier -> Prop,
        Relation Left Right ↔ Relation LeftPrime RightPrime) ∧
      (∀ Operation : Carrier -> Carrier -> Carrier,
        Operation Left Right = Operation LeftPrime RightPrime) := by
  sorry

end LRA.Identity
