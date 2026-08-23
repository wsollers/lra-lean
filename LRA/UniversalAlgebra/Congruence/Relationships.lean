import LRA.UniversalAlgebra.Congruence.Theorems

namespace LRA.UniversalAlgebra.Congruence

open LRA.Operation

universe u

                                                                                      
theorem BinaryOperationCongruence.left {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : BinaryEndoOperation Carrier}
    (reflexive : LRA.Relation.Reflexive relation)
    (law : BinaryOperationCongruence relation operation) :
    forall {left₁ left₂ : Carrier} (right : Carrier),
      relation left₁ left₂ ->
        relation (operation left₁ right) (operation left₂ right) := by
  sorry

                                                                                       
theorem BinaryOperationCongruence.right {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : BinaryEndoOperation Carrier}
    (reflexive : LRA.Relation.Reflexive relation)
    (law : BinaryOperationCongruence relation operation) :
    forall (left : Carrier) {right₁ right₂ : Carrier},
      relation right₁ right₂ ->
        relation (operation left right₁) (operation left right₂) := by
  sorry

end LRA.UniversalAlgebra.Congruence
