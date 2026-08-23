import LRA.Operation.Definition

namespace LRA.Operation.Laws.Identity

open LRA.Operation

universe u

                                                     
def LeftIdentity {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier) : Prop :=
  forall element, operation identity element = element

                                                      
def RightIdentity {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier) : Prop :=
  forall element, operation element identity = element

                                                          
def TwoSidedIdentity {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier) : Prop :=
  LeftIdentity operation identity /\ RightIdentity operation identity

end LRA.Operation.Laws.Identity
