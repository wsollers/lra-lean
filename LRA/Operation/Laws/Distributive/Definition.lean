import LRA.Operation.Definition

namespace LRA.Operation.Laws.Distributive

open LRA.Operation

universe u

                                                                     
def LeftDistributive {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  forall left right third,
    outer left (inner right third) =
      inner (outer left right) (outer left third)

                                                                      
def RightDistributive {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  forall left right third,
    outer (inner left right) third =
      inner (outer left third) (outer right third)

                                                                          
def TwoSidedDistributive {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  LeftDistributive outer inner /\ RightDistributive outer inner

end LRA.Operation.Laws.Distributive
