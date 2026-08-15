import LRA.VolumeI.Map.Operation.Laws.Absorbing.Definition

namespace LRA.Map.Operation.Laws.Absorbing

open LRA.Map.Operation

universe u

/--
Apply a left-absorbing law to an element.
-/
theorem LeftAbsorbing.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (law : LeftAbsorbing operation absorber)
    (element : Carrier) :
    operation absorber element = absorber :=
  law element

/--
Apply a right-absorbing law to an element.
-/
theorem RightAbsorbing.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (law : RightAbsorbing operation absorber)
    (element : Carrier) :
    operation element absorber = absorber :=
  law element

/--
A two-sided absorbing law supplies a left absorbing law.
-/
theorem TwoSidedAbsorbing.left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (law : TwoSidedAbsorbing operation absorber) :
    LeftAbsorbing operation absorber :=
  And.left law

/--
A two-sided absorbing law supplies a right absorbing law.
-/
theorem TwoSidedAbsorbing.right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (law : TwoSidedAbsorbing operation absorber) :
    RightAbsorbing operation absorber :=
  And.right law

/--
Left and right absorbing laws assemble into a two-sided absorbing law.
-/
theorem TwoSidedAbsorbing.of_left_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (leftLaw : LeftAbsorbing operation absorber)
    (rightLaw : RightAbsorbing operation absorber) :
    TwoSidedAbsorbing operation absorber :=
  And.intro leftLaw rightLaw

end LRA.Map.Operation.Laws.Absorbing
