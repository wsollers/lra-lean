import LRA.VolumeI.Order.Constructions.ProductOrder.Definition
import LRA.VolumeI.Relations.Basic.CoreProperties

namespace LRA.Order

/-- Product orders need not be linear, even when both factors are linear. -/
theorem ProductOfLinearOrdersNeedNotBeLinear :
    Not (LRA.Relation.Total
      (ProductRelation (fun left right : Nat => left ≤ right)
        (fun left right : Nat => left ≤ right))) := by
  sorry

end LRA.Order
