import LRA.VolumeI.Operations.Laws.OrderCompatibility.Theorems
import LRA.VolumeI.Operations.Laws.Commutative.Definition

namespace LRA.Operation.Laws.OrderCompatibility

open LRA.Operation

universe u

theorem Commutative.left_preservation_to_right_preservation {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (commutative :
      LRA.Operation.Laws.Commutative.Commutative operation)
    (leftLaw : LeftTranslationPreservesRelation relation operation) :
    RightTranslationPreservesRelation relation operation := by
  sorry

theorem Commutative.right_preservation_to_left_preservation {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (commutative :
      LRA.Operation.Laws.Commutative.Commutative operation)
    (rightLaw : RightTranslationPreservesRelation relation operation) :
    LeftTranslationPreservesRelation relation operation := by
  sorry

theorem PositiveRightTranslationPreservesRelation.to_right_preservation_on_positive
    {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {positive : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : PositiveRightTranslationPreservesRelation relation positive operation) :
    forall fixed, positive fixed ->
      forall left right, relation left right ->
        relation (operation left fixed) (operation right fixed) := by
  sorry

theorem NegativeRightTranslationReversesRelation.to_right_reversal_on_negative
    {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {negative : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : NegativeRightTranslationReversesRelation relation negative operation) :
    forall fixed, negative fixed ->
      forall left right, relation left right ->
        relation (operation right fixed) (operation left fixed) := by
  sorry

end LRA.Operation.Laws.OrderCompatibility
