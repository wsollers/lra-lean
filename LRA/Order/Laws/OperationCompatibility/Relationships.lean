import LRA.Order.Laws.OperationCompatibility.Theorems
import LRA.Operation.Laws.Commutative.Definition

namespace LRA.Order

universe u

   
                                                                      
                               
  

theorem Commutative.left_preservation_to_right_preservation {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (commutative :
      LRA.Operation.Laws.Commutative.Commutative operation)
    (leftLaw : LeftTranslationPreservesRelation relation operation) :
    RightTranslationPreservesRelation relation operation := by
  sorry


theorem Commutative.right_preservation_to_left_preservation {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (commutative :
      LRA.Operation.Laws.Commutative.Commutative operation)
    (rightLaw : RightTranslationPreservesRelation relation operation) :
    LeftTranslationPreservesRelation relation operation := by
  sorry


theorem PositiveRightTranslationPreservesRelation.to_right_preservation_on_positive
    {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {positive : Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : PositiveRightTranslationPreservesRelation relation positive operation) :
    forall fixed, positive fixed ->
      forall left right, relation left right ->
        relation (operation left fixed) (operation right fixed) := by
  sorry


theorem NegativeRightTranslationReversesRelation.to_right_reversal_on_negative
    {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {negative : Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : NegativeRightTranslationReversesRelation relation negative operation) :
    forall fixed, negative fixed ->
      forall left right, relation left right ->
        relation (operation right fixed) (operation left fixed) := by
  sorry



/-- The direction `Consequences.lean`'s `CoordinatewisePreservesRelation.
left_translation`/`.right_translation` don't cover: two-sided
(bi-)invariance composes into coordinatewise preservation, given
transitivity. This is the generic form of the standard "bi-invariant
relations allow 2-variable composition" fact
(`r a b -> r c d -> r (a * c) (b * d)`, via `r a b -> r (a*c) (b*c)`
[right] then `r (b*c) (b*d)` [left] then transitivity) — no new
predicate needed, `CoordinatewisePreservesRelation` already *is* the
bi-invariance bundle; this theorem is what was missing to reach it from
separately-proved left/right laws. -/
theorem CoordinatewisePreservesRelation.of_left_and_right_translation
    {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    [Trans relation relation relation]
    (leftLaw : LeftTranslationPreservesRelation relation operation)
    (rightLaw : RightTranslationPreservesRelation relation operation) :
    CoordinatewisePreservesRelation relation operation := by
  sorry



/-- `AdditionRespectsOrderLaws.AddLeAddLeft` is
`LeftTranslationPreservesRelation (· <= ·) (· + ·)` up to argument order
(`c` last there, `fixed` first here) — a bridging theorem rather than a
restructure of the class itself, since `AddLeAddLeft`/`AddLeAddRight`
already have an established call signature used throughout this
codebase and reordering their arguments would be a real, if mechanical,
breaking change to every call site. -/
theorem AdditionRespectsOrderLaws.to_left_translation
    {R : Type u} [Add R] [LE R] [AdditionRespectsOrderLaws R] :
    LeftTranslationPreservesRelation (· <= · : R -> R -> Prop)
      (fun a b => a + b) := by
  sorry

/-- `AdditionRespectsOrderLaws.AddLeAddRight` is
`RightTranslationPreservesRelation (· <= ·) (· + ·)`, same caveat as
`to_left_translation` above. -/
theorem AdditionRespectsOrderLaws.to_right_translation
    {R : Type u} [Add R] [LE R] [AdditionRespectsOrderLaws R] :
    RightTranslationPreservesRelation (· <= · : R -> R -> Prop)
      (fun a b => a + b) := by
  sorry

end LRA.Order
