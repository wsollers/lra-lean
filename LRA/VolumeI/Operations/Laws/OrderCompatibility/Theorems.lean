import LRA.VolumeI.Operations.Laws.OrderCompatibility.Definition

namespace LRA.Operation.Laws.OrderCompatibility

open LRA.Operation

universe u

theorem LeftTranslationPreservesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : LeftTranslationPreservesRelation relation operation)
    (fixed left right : Carrier)
    (related : relation left right) :
    relation (operation fixed left) (operation fixed right) := by
  sorry

theorem RightTranslationPreservesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : RightTranslationPreservesRelation relation operation)
    (left right fixed : Carrier)
    (related : relation left right) :
    relation (operation left fixed) (operation right fixed) := by
  sorry

theorem CoordinatewisePreservesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : CoordinatewisePreservesRelation relation operation)
    (left₁ left₂ right₁ right₂ : Carrier)
    (left_related : relation left₁ left₂)
    (right_related : relation right₁ right₂) :
    relation (operation left₁ right₁) (operation left₂ right₂) := by
  sorry

theorem LeftTranslationReversesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : LeftTranslationReversesRelation relation operation)
    (fixed left right : Carrier)
    (related : relation left right) :
    relation (operation fixed right) (operation fixed left) := by
  sorry

theorem RightTranslationReversesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : RightTranslationReversesRelation relation operation)
    (left right fixed : Carrier)
    (related : relation left right) :
    relation (operation right fixed) (operation left fixed) := by
  sorry

theorem PositiveRightTranslationPreservesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {positive : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : PositiveRightTranslationPreservesRelation relation positive operation)
    (left right fixed : Carrier)
    (fixed_positive : positive fixed)
    (related : relation left right) :
    relation (operation left fixed) (operation right fixed) := by
  sorry

theorem PositiveLeftTranslationPreservesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {positive : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : PositiveLeftTranslationPreservesRelation relation positive operation)
    (fixed left right : Carrier)
    (fixed_positive : positive fixed)
    (related : relation left right) :
    relation (operation fixed left) (operation fixed right) := by
  sorry

theorem NegativeRightTranslationReversesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {negative : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : NegativeRightTranslationReversesRelation relation negative operation)
    (left right fixed : Carrier)
    (fixed_negative : negative fixed)
    (related : relation left right) :
    relation (operation right fixed) (operation left fixed) := by
  sorry

theorem NegativeLeftTranslationReversesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {negative : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : NegativeLeftTranslationReversesRelation relation negative operation)
    (fixed left right : Carrier)
    (fixed_negative : negative fixed)
    (related : relation left right) :
    relation (operation fixed right) (operation fixed left) := by
  sorry

end LRA.Operation.Laws.OrderCompatibility
