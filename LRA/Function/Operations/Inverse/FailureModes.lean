import LRA.Function.Operations.Inverse.Definition

   
                                     

                                                                     
                                                                               
                                                                
  

namespace LRA.Function

universe u v

                                                 
def MultipleLeftInverses {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  ∃ first second : LRA.Function Codomain Domain,
    first ≠ second ∧ LeftInverse function first ∧ LeftInverse function second

                                                  
def MultipleRightInverses {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  ∃ first second : LRA.Function Codomain Domain,
    first ≠ second ∧ RightInverse function first ∧ RightInverse function second

end LRA.Function
