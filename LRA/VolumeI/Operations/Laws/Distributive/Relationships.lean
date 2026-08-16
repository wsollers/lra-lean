import LRA.VolumeI.Operations.Laws.Distributive.Theorems
import LRA.VolumeI.Operations.Laws.Commutative.Definition

namespace LRA.Operation.Laws.Distributive

open LRA.Operation

universe u

/--
**[Theorem — Commutative.left_distributive_to_right_distributive]**

When the outer operation is commutative, left distributivity transfers to right
distributivity.
-/
theorem Commutative.left_distributive_to_right_distributive {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (outerCommutative :
      LRA.Operation.Laws.Commutative.Commutative outer)
    (leftLaw : LeftDistributive outer inner) :
    RightDistributive outer inner := by
  sorry

/--
**[Theorem — Commutative.right_distributive_to_left_distributive]**

When the outer operation is commutative, right distributivity transfers to left
distributivity.
-/
theorem Commutative.right_distributive_to_left_distributive {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (outerCommutative :
      LRA.Operation.Laws.Commutative.Commutative outer)
    (rightLaw : RightDistributive outer inner) :
    LeftDistributive outer inner := by
  sorry

end LRA.Operation.Laws.Distributive
