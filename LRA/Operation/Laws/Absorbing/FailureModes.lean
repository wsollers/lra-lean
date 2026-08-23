import LRA.Operation.Laws.Absorbing.Definition

namespace LRA.Operation.Laws.Absorbing

open LRA.Operation

universe u

                                          
def FailsRightAbsorbing {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (candidate : Carrier) : Prop :=
  Not (RightAbsorbing operation candidate)

                                         
def FailsLeftAbsorbing {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (candidate : Carrier) : Prop :=
  Not (LeftAbsorbing operation candidate)

                                                  
def BooleanFirstProjection : BinaryEndoOperation Bool :=
  fun left _ => left

                                                   
def BooleanSecondProjection : BinaryEndoOperation Bool :=
  fun _ right => right

                                                             
theorem BooleanFirstProjectionLeftAbsorbingButNotRightAbsorbing :
    LeftAbsorbing BooleanFirstProjection false ∧
      FailsRightAbsorbing BooleanFirstProjection false := by
  sorry

                                                             
theorem BooleanSecondProjectionRightAbsorbingButNotLeftAbsorbing :
    RightAbsorbing BooleanSecondProjection false ∧
      FailsLeftAbsorbing BooleanSecondProjection false := by
  sorry

end LRA.Operation.Laws.Absorbing
