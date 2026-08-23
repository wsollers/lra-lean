import LRA.Operation.Laws.Identity.Definition

namespace LRA.Operation.Laws.Identity

open LRA.Operation

universe u

                                         
def FailsRightIdentity {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (candidate : Carrier) : Prop :=
  Not (RightIdentity operation candidate)

                                        
def FailsLeftIdentity {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (candidate : Carrier) : Prop :=
  Not (LeftIdentity operation candidate)

                                                   
def BooleanSecondProjection : BinaryEndoOperation Bool :=
  fun _ right => right

                                                  
def BooleanFirstProjection : BinaryEndoOperation Bool :=
  fun left _ => left

                                                             
theorem BooleanSecondProjectionLeftIdentityButNotRightIdentity :
    LeftIdentity BooleanSecondProjection false ∧
      FailsRightIdentity BooleanSecondProjection false := by
  sorry

                                                             
theorem BooleanFirstProjectionRightIdentityButNotLeftIdentity :
    RightIdentity BooleanFirstProjection false ∧
      FailsLeftIdentity BooleanFirstProjection false := by
  sorry

end LRA.Operation.Laws.Identity
