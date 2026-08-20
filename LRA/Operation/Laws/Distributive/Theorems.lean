import LRA.Operation.Laws.Distributive.Definition

namespace LRA.Operation.Laws.Distributive

open LRA.Operation

universe u

theorem LeftDistributive.apply {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (law : LeftDistributive outer inner)
    (left right third : Carrier) :
    outer left (inner right third) =
      inner (outer left right) (outer left third) := by
  sorry


theorem RightDistributive.apply {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (law : RightDistributive outer inner)
    (left right third : Carrier) :
    outer (inner left right) third =
      inner (outer left third) (outer right third) := by
  sorry


theorem TwoSidedDistributive.left {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (law : TwoSidedDistributive outer inner) :
    LeftDistributive outer inner := by
  sorry


theorem TwoSidedDistributive.right {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (law : TwoSidedDistributive outer inner) :
    RightDistributive outer inner := by
  sorry


theorem TwoSidedDistributive.of_left_right {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (leftLaw : LeftDistributive outer inner)
    (rightLaw : RightDistributive outer inner) :
    TwoSidedDistributive outer inner := by
  sorry

end LRA.Operation.Laws.Distributive
