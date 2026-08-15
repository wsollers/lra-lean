import LRA.VolumeI.Map.Operation.Laws.Distributive.Definition

namespace LRA.Map.Operation.Laws.Distributive

open LRA.Map.Operation

universe u

/--
A two-sided distributive law supplies a left distributive law.
-/
theorem TwoSidedDistributive.left {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (law : TwoSidedDistributive outer inner) :
    LeftDistributive outer inner :=
  And.left law

/--
A two-sided distributive law supplies a right distributive law.
-/
theorem TwoSidedDistributive.right {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (law : TwoSidedDistributive outer inner) :
    RightDistributive outer inner :=
  And.right law

/--
Left and right distributive laws assemble into a two-sided distributive law.
-/
theorem TwoSidedDistributive.of_left_right {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (leftLaw : LeftDistributive outer inner)
    (rightLaw : RightDistributive outer inner) :
    TwoSidedDistributive outer inner :=
  And.intro leftLaw rightLaw

end LRA.Map.Operation.Laws.Distributive
