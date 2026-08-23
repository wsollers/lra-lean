import LRA.UniversalAlgebra.Congruence.Theorems

namespace LRA.UniversalAlgebra.Congruence

open LRA.Operation

                                                                             
def NaturalAddition : BinaryEndoOperation Nat :=
  fun left right => left + right

                                                                                 
def SameParityForCongruenceExample (left right : Nat) : Prop :=
  left % 2 = right % 2

   
                                            

                                                        
  
theorem SameParityAdditionCongruence :
    BinaryOperationCongruence SameParityForCongruenceExample NaturalAddition := by
  sorry

end LRA.UniversalAlgebra.Congruence
