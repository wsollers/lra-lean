import LRA.Identity.Interface
import LRA.Identity.Substitution

namespace LRA.Identity

universe u v

                                                         

                                                                  
def NativeEquality (Carrier : Type u) : Carrier -> Carrier -> Prop :=
  EqualityDiagonal Carrier

                                                          
theorem NativeEqualityIsDiagonal (Carrier : Type u) :
    ∀ left right, NativeEquality Carrier left right ↔ left = right := by
  sorry

                                                     
theorem FunctionCongruence {Domain : Type u} {Codomain : Type v}
    {left right : Domain}
    (ObjectsAreEqual : left = right)
    (function : Domain -> Codomain) :
    function left = function right := by
  sorry

                                  
theorem BinaryFunctionCongruence {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left' right' := by
  sorry

                                 
theorem RelationCongruence {Carrier : Type u}
    {left right : Carrier}
    (ObjectsAreEqual : left = right)
    (relation : Carrier -> Prop) :
    relation left ↔ relation right := by
  sorry

                                                      
theorem BinaryRelationCongruence {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right')
    (relation : Carrier -> Carrier -> Prop) :
    relation left right ↔ relation left' right' := by
  sorry

end LRA.Identity
