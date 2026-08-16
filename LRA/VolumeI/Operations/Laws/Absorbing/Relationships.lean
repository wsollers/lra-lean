import LRA.VolumeI.Operations.Laws.Absorbing.Theorems

namespace LRA.Operation.Laws.Absorbing

open LRA.Operation

universe u

/--
**[Theorem — LeftRightAbsorbersCoincide]**

A left absorber and a right absorber for the same operation coincide.
-/
theorem LeftRightAbsorbersCoincide {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {leftAbsorber rightAbsorber : Carrier}
    (leftLaw : LeftAbsorbing operation leftAbsorber)
    (rightLaw : RightAbsorbing operation rightAbsorber) :
    leftAbsorber = rightAbsorber := by
  sorry

/--
**[Theorem — TwoSidedAbsorbingUnique]**

A two-sided absorbing element for a binary operation is unique.
-/
theorem TwoSidedAbsorbingUnique {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {firstAbsorber secondAbsorber : Carrier}
    (firstLaw : TwoSidedAbsorbing operation firstAbsorber)
    (secondLaw : TwoSidedAbsorbing operation secondAbsorber) :
    firstAbsorber = secondAbsorber := by
  sorry

end LRA.Operation.Laws.Absorbing
