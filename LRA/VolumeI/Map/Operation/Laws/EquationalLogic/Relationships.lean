import LRA.VolumeI.Map.Operation.Laws.EquationalLogic.Theorems

namespace LRA.Map.Operation.Laws.EquationalLogic

open LRA.Map.Operation

universe u v w

/--
**[Theorem — BinaryEqualityCompatible]**

Two-argument equality compatibility implies left-argument equality
compatibility.
-/
theorem BinaryEqualityCompatible.left {Left : Type u} {Right : Type v}
    {Codomain : Type w}
    {operation : BinaryOperation Left Right Codomain}
    (law : BinaryEqualityCompatible operation) :
    LeftArgumentEqualityCompatible operation := by
  sorry

/--
**[Theorem — BinaryEqualityCompatible]**

Two-argument equality compatibility implies right-argument equality
compatibility.
-/
theorem BinaryEqualityCompatible.right {Left : Type u} {Right : Type v}
    {Codomain : Type w}
    {operation : BinaryOperation Left Right Codomain}
    (law : BinaryEqualityCompatible operation) :
    RightArgumentEqualityCompatible operation := by
  sorry

/--
**[Theorem — BinaryEqualityCompatible]**

Left- and right-argument equality compatibility assemble into two-argument
equality compatibility.
-/
theorem BinaryEqualityCompatible.of_left_right {Left : Type u} {Right : Type v}
    {Codomain : Type w}
    {operation : BinaryOperation Left Right Codomain}
    (leftLaw : LeftArgumentEqualityCompatible operation)
    (rightLaw : RightArgumentEqualityCompatible operation) :
    BinaryEqualityCompatible operation := by
  sorry

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

end LRA.Map.Operation.Laws.EquationalLogic
