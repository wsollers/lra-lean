import LRA.VolumeI.Map.Operation.Laws.Inverse.Definition

namespace LRA.Map.Operation.Laws.Inverse

open LRA.Map.Operation

universe u

/--
A two-sided inverse law supplies a left inverse law.
-/
theorem TwoSidedInverse.left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : TwoSidedInverse operation identity inverse) :
    LeftInverse operation identity inverse :=
  And.left law

/--
A two-sided inverse law supplies a right inverse law.
-/
theorem TwoSidedInverse.right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : TwoSidedInverse operation identity inverse) :
    RightInverse operation identity inverse :=
  And.right law

/--
Left and right inverse laws assemble into a two-sided inverse law.
-/
theorem TwoSidedInverse.of_left_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (leftLaw : LeftInverse operation identity inverse)
    (rightLaw : RightInverse operation identity inverse) :
    TwoSidedInverse operation identity inverse :=
  And.intro leftLaw rightLaw

end LRA.Map.Operation.Laws.Inverse
