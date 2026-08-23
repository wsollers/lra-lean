import LRA.Operation.Laws.Absorption.Definition
import LRA.Operation.Laws.Absorbing.Definition

namespace LRA.Operation.Laws.Absorption

open LRA.Operation

universe u

                                              
def FailsAbsorptionLaw {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  Not (AbsorptionLaw outer inner)

                                    
def FailsMutualAbsorptionLaw {Carrier : Type u}
    (first second : BinaryEndoOperation Carrier) : Prop :=
  Not (MutualAbsorptionLaw first second)

                                                         
def NaturalAdditionOperation : BinaryEndoOperation Nat :=
  fun left right => left + right

                                                               
def NaturalMultiplicationOperation : BinaryEndoOperation Nat :=
  fun left right => left * right

                                                                
def NaturalMaxOperation : BinaryEndoOperation Nat :=
  fun left right => Nat.max left right

                                                                
def NaturalMinOperation : BinaryEndoOperation Nat :=
  fun left right => Nat.min left right

                                                                           
                      
theorem NaturalAdditionMultiplicationFailAbsorption :
    FailsAbsorptionLaw NaturalAdditionOperation NaturalMultiplicationOperation ∧
      FailsAbsorptionLaw NaturalMultiplicationOperation NaturalAdditionOperation := by
  sorry

                                                                                 
                  
theorem NaturalMultiplicationHasAbsorberButFailsAbsorption :
    LRA.Operation.Laws.Absorbing.TwoSidedAbsorbing
      NaturalMultiplicationOperation 0 ∧
      FailsAbsorptionLaw NaturalMultiplicationOperation
        NaturalAdditionOperation := by
  sorry

                                                                                  
                                                
theorem NaturalMaxHasNoAbsorbingElement :
    MutualAbsorptionLaw NaturalMaxOperation NaturalMinOperation ∧
      Not
        (∃ absorber : Nat,
          LRA.Operation.Laws.Absorbing.TwoSidedAbsorbing
            NaturalMaxOperation absorber) := by
  sorry

end LRA.Operation.Laws.Absorption
