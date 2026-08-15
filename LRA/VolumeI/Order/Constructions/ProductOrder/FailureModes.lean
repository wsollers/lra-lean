import LRA.VolumeI.Order.Constructions.ProductOrder.Definition
import LRA.VolumeI.Relations.Basic.CoreProperties

namespace LRA.Order

universe u v

/--
`ProductOrderFailsTotality`

Statement: A coordinatewise product relation fails totality.

Logical form: `Not (LRA.Relation.Total (ProductRelation leftRelation rightRelation))`.
-/
def ProductOrderFailsTotality
    {Left : Type u} {Right : Type v}
    (leftRelation : LRA.Relation.Endorelation Left)
    (rightRelation : LRA.Relation.Endorelation Right) : Prop :=
  Not (LRA.Relation.Total
    (ProductRelation leftRelation rightRelation))

/--
`ProductOfLinearOrdersNeedNotBeLinear`

Statement: Product orders need not be linear, even when both factors are linear.

Logical form: `ProductOrderFailsTotality (fun left right : Nat => left ≤ right) (fun left right : Nat => left ≤ right)`.
-/
theorem ProductOfLinearOrdersNeedNotBeLinear :
    ProductOrderFailsTotality
      (fun left right : Nat => left ≤ right)
      (fun left right : Nat => left ≤ right) := by
  sorry

end LRA.Order
