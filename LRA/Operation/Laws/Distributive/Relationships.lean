import LRA.Operation.Laws.Distributive.Theorems
import LRA.Operation.Laws.Commutative.Definition

namespace LRA.Operation.Laws.Distributive

open LRA.Operation

universe u

theorem Commutative.left_distributive_to_right_distributive {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (outerCommutative :
      LRA.Operation.Laws.Commutative.Commutative outer)
    (leftLaw : LeftDistributive outer inner) :
    RightDistributive outer inner := by
  sorry


theorem Commutative.right_distributive_to_left_distributive {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (outerCommutative :
      LRA.Operation.Laws.Commutative.Commutative outer)
    (rightLaw : RightDistributive outer inner) :
    LeftDistributive outer inner := by
  sorry

end LRA.Operation.Laws.Distributive
