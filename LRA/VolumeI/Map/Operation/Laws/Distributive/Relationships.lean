import LRA.VolumeI.Map.Operation.Laws.Distributive.Theorems
import LRA.VolumeI.Map.Operation.Laws.Commutative.Definition

namespace LRA.Map.Operation.Laws.Distributive

open LRA.Map.Operation

universe u

/--
**[Theorem — Commutative.left_distributive_to_right_distributive]**

When the outer operation is commutative, left distributivity transfers to right
distributivity.
-/
theorem Commutative.left_distributive_to_right_distributive {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (outerCommutative :
      LRA.Map.Operation.Laws.Commutative.Commutative outer)
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
      LRA.Map.Operation.Laws.Commutative.Commutative outer)
    (rightLaw : RightDistributive outer inner) :
    LeftDistributive outer inner := by
  sorry

end LRA.Map.Operation.Laws.Distributive
