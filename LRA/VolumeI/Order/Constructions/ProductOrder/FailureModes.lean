import LRA.VolumeI.Order.Constructions.ProductOrder.Definition
import LRA.VolumeI.Relations.Basic.CoreProperties

namespace LRA.VolumeI.Order

/-- Product orders need not be total, even when both factors are total. -/
theorem ProductOfTotalOrdersNeedNotBeTotal :
    Not (LRA.VolumeI.Relations.Total
      (ProductRelation (fun left right : Nat => left ≤ right)
        (fun left right : Nat => left ≤ right))) := by
  sorry

end LRA.VolumeI.Order
