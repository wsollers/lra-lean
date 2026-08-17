import LRA.VolumeI.UniversalAlgebra.Congruence.Theorems

namespace LRA.UniversalAlgebra.Congruence

open LRA.Operation

universe u

/-- Binary congruence supplies left-side congruence when the relation is reflexive. -/
theorem BinaryOperationCongruence.left {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {operation : BinaryEndoOperation Carrier}
    (reflexive : LRA.Relation.Reflexive relation)
    (law : BinaryOperationCongruence relation operation) :
    forall {left₁ left₂ : Carrier} (right : Carrier),
      relation left₁ left₂ ->
        relation (operation left₁ right) (operation left₂ right) := by
  sorry

/-- Binary congruence supplies right-side congruence when the relation is reflexive. -/
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
