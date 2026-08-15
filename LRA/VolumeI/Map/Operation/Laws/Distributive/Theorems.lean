import LRA.VolumeI.Map.Operation.Laws.Distributive.Definition

namespace LRA.Map.Operation.Laws.Distributive

open LRA.Map.Operation

universe u

/--
Apply a left-distributive law to three elements.
-/
theorem LeftDistributive.apply {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (law : LeftDistributive outer inner)
    (left right third : Carrier) :
    outer left (inner right third) =
      inner (outer left right) (outer left third) :=
  law left right third

/--
Apply a right-distributive law to three elements.
-/
theorem RightDistributive.apply {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (law : RightDistributive outer inner)
    (left right third : Carrier) :
    outer (inner left right) third =
      inner (outer left third) (outer right third) :=
  law left right third

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
