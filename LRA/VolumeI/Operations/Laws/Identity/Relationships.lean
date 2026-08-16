import LRA.VolumeI.Operations.Laws.Identity.Theorems

namespace LRA.Operation.Laws.Identity

open LRA.Operation

universe u

/--
**[Theorem — LeftRightIdentitiesCoincide]**

A left identity and a right identity for the same operation coincide.
-/
theorem LeftRightIdentitiesCoincide {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {leftIdentity rightIdentity : Carrier}
    (leftLaw : LeftIdentity operation leftIdentity)
    (rightLaw : RightIdentity operation rightIdentity) :
    leftIdentity = rightIdentity := by
  sorry

/--
**[Theorem — TwoSidedIdentityUnique]**

A two-sided identity for a binary operation is unique.
-/
theorem TwoSidedIdentityUnique {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {firstIdentity secondIdentity : Carrier}
    (firstLaw : TwoSidedIdentity operation firstIdentity)
    (secondLaw : TwoSidedIdentity operation secondIdentity) :
    firstIdentity = secondIdentity := by
  sorry

end LRA.Operation.Laws.Identity
