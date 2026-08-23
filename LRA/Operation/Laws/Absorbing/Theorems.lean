import LRA.Operation.Laws.Absorbing.Definition

namespace LRA.Operation.Laws.Absorbing

open LRA.Operation

universe u

                                                
theorem LeftAbsorbing.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (law : LeftAbsorbing operation absorber)
    (element : Carrier) :
    operation absorber element = absorber := by
  sorry

                                                 
theorem RightAbsorbing.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (law : RightAbsorbing operation absorber)
    (element : Carrier) :
    operation element absorber = absorber := by
  sorry

                                                               
theorem TwoSidedAbsorbing.left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (law : TwoSidedAbsorbing operation absorber) :
    LeftAbsorbing operation absorber := by
  sorry

                                                                
theorem TwoSidedAbsorbing.right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (law : TwoSidedAbsorbing operation absorber) :
    RightAbsorbing operation absorber := by
  sorry

                                                                             
theorem TwoSidedAbsorbing.of_left_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (leftLaw : LeftAbsorbing operation absorber)
    (rightLaw : RightAbsorbing operation absorber) :
    TwoSidedAbsorbing operation absorber := by
  sorry

end LRA.Operation.Laws.Absorbing
