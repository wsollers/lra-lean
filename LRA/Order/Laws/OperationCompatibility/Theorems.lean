import LRA.Order.Laws.OperationCompatibility.Definition

namespace LRA.Order

universe u

/-!
Central theorems about order-operation compatibility belong here.
-/

theorem LeftTranslationPreservesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : LeftTranslationPreservesRelation relation operation)
    (fixed left right : Carrier)
    (related : relation left right) :
    relation (operation fixed left) (operation fixed right) :=
  law fixed left right related

theorem RightTranslationPreservesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : RightTranslationPreservesRelation relation operation)
    (left right fixed : Carrier)
    (related : relation left right) :
    relation (operation left fixed) (operation right fixed) :=
  law left right fixed related

theorem CoordinatewisePreservesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : CoordinatewisePreservesRelation relation operation)
    (left₁ left₂ right₁ right₂ : Carrier)
    (left_related : relation left₁ left₂)
    (right_related : relation right₁ right₂) :
    relation (operation left₁ right₁) (operation left₂ right₂) :=
  law left₁ left₂ right₁ right₂ left_related right_related

theorem LeftTranslationReversesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : LeftTranslationReversesRelation relation operation)
    (fixed left right : Carrier)
    (related : relation left right) :
    relation (operation fixed right) (operation fixed left) :=
  law fixed left right related

theorem RightTranslationReversesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : RightTranslationReversesRelation relation operation)
    (left right fixed : Carrier)
    (related : relation left right) :
    relation (operation right fixed) (operation left fixed) :=
  law left right fixed related

theorem PositiveRightTranslationPreservesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {positive : Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : PositiveRightTranslationPreservesRelation relation positive operation)
    (left right fixed : Carrier)
    (fixed_positive : positive fixed)
    (related : relation left right) :
    relation (operation left fixed) (operation right fixed) :=
  law left right fixed fixed_positive related

theorem PositiveLeftTranslationPreservesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {positive : Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : PositiveLeftTranslationPreservesRelation relation positive operation)
    (fixed left right : Carrier)
    (fixed_positive : positive fixed)
    (related : relation left right) :
    relation (operation fixed left) (operation fixed right) :=
  law fixed left right fixed_positive related

theorem NegativeRightTranslationReversesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {negative : Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : NegativeRightTranslationReversesRelation relation negative operation)
    (left right fixed : Carrier)
    (fixed_negative : negative fixed)
    (related : relation left right) :
    relation (operation right fixed) (operation left fixed) :=
  law left right fixed fixed_negative related

theorem NegativeLeftTranslationReversesRelation.apply {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {negative : Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : NegativeLeftTranslationReversesRelation relation negative operation)
    (fixed left right : Carrier)
    (fixed_negative : negative fixed)
    (related : relation left right) :
    relation (operation fixed right) (operation fixed left) :=
  law fixed left right fixed_negative related

end LRA.Order
