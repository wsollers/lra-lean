import LRA.VolumeI.Map.Operation.Laws.Identity.Definition

namespace LRA.Map.Operation.Laws.Identity

open LRA.Map.Operation

universe u

/--
A two-sided identity supplies a left identity.
-/
theorem TwoSidedIdentity.left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (law : TwoSidedIdentity operation identity) :
    LeftIdentity operation identity :=
  And.left law

/--
A two-sided identity supplies a right identity.
-/
theorem TwoSidedIdentity.right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (law : TwoSidedIdentity operation identity) :
    RightIdentity operation identity :=
  And.right law

/--
Left and right identity laws assemble into a two-sided identity law.
-/
theorem TwoSidedIdentity.of_left_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (leftLaw : LeftIdentity operation identity)
    (rightLaw : RightIdentity operation identity) :
    TwoSidedIdentity operation identity :=
  And.intro leftLaw rightLaw

end LRA.Map.Operation.Laws.Identity
