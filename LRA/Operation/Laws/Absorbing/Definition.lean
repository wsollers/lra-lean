import LRA.Operation.Definition

namespace LRA.Operation.Laws.Absorbing

open LRA.Operation

universe u

                                                      
def LeftAbsorbing {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (absorber : Carrier) : Prop :=
  forall element, operation absorber element = absorber

                                                       
def RightAbsorbing {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (absorber : Carrier) : Prop :=
  forall element, operation element absorber = absorber

                                                           
def TwoSidedAbsorbing {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (absorber : Carrier) : Prop :=
  LeftAbsorbing operation absorber /\ RightAbsorbing operation absorber

end LRA.Operation.Laws.Absorbing
