import LRA.Operation.Definition

namespace LRA.Operation.Laws.Cancellation

open LRA.Operation

universe u

                                                         
def LeftCancellative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall fixed first second,
    operation fixed first = operation fixed second -> first = second

                                                          
def RightCancellative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall first second fixed,
    operation first fixed = operation second fixed -> first = second

                                                                                     
def LeftRegular {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (fixed : Carrier) : Prop :=
  forall first second,
    operation fixed first = operation fixed second -> first = second

                                                                                       
def RightRegular {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (fixed : Carrier) : Prop :=
  forall first second,
    operation first fixed = operation second fixed -> first = second

                                                                                    
def LeftCancellativeOn {Carrier : Type u}
    (eligible : Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall fixed, eligible fixed -> LeftRegular operation fixed

                                                                                     
def RightCancellativeOn {Carrier : Type u}
    (eligible : Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall fixed, eligible fixed -> RightRegular operation fixed

                                                                                         
def TwoSidedCancellativeOn {Carrier : Type u}
    (eligible : Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  LeftCancellativeOn eligible operation /\
    RightCancellativeOn eligible operation

                                                              
def TwoSidedCancellative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  LeftCancellative operation /\ RightCancellative operation

end LRA.Operation.Laws.Cancellation
