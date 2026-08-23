                                             
                                                                         

import LRA.VolumeII.Integers.Implementation

namespace LRA.NumberSystems.Integers.ArithmeticTests

open LRA.AlgebraicStructures
open LRA.Order

universe u

   
                                          
                                                       
                                        

                                                                      
                                                                  
                                                                     
                                              
  

                                                                 
                                                                
       

             

       
                                 
                                                          
                                       
                                                
                                                     
                 
                       
                       
               
               
                               
                   
                
               
               
                               
                   
                                 
                                 
                            
                             
         
   
  
theorem integerSuite (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LE R]
    [HasSuccessor R] [HasPredecessor R]
    [CommutativeRingLaws R] [PartialOrderLaws R]
    [SuccessorLaws R] [SuccessorMultiplicationLaws R]
    (a b c : R) :
    Pred (Succ a) = a ∧
    Succ (Pred a) = a ∧
    a + 0 = a ∧
    0 + a = a ∧
    (a + b) + c = a + (b + c) ∧
    a + b = b + a ∧
    -a + a = 0 ∧
    a * 0 = 0 ∧
    1 * a = a ∧
    (a * b) * c = a * (b * c) ∧
    a * b = b * a ∧
    a * (b + c) = a * b + a * c ∧
    (a + b) * c = a * c + b * c ∧
    a * Succ b = a * b + a ∧
    a * Pred b = a * b + -a ∧
    a ≤ a := by
  sorry

                                           
example (a b c : Z) := integerSuite Z a b c

                                                                   
                                                                     
                                    
example (a b c : Polish.TwoSidedSuccessor.Z) :=
  integerSuite Polish.TwoSidedSuccessor.Z a b c

section IntInstantiation

   
                                                                      
                                                                     
                                                                
                                  
  

instance : HasSuccessor Int := ⟨fun n => n + 1⟩
instance : HasPredecessor Int := ⟨fun n => n - 1⟩

instance : SuccessorLaws Int where
  PredSucc := fun a => by simp [Succ, Pred, HasSuccessor.Succ, HasPredecessor.Pred]
  SuccPred := fun a => by simp [Succ, Pred, HasSuccessor.Succ, HasPredecessor.Pred]
  SuccInjective := fun a b h => by
    simpa [Succ, HasSuccessor.Succ] using h
  PredInjective := fun a b h => by
    simpa [Pred, HasPredecessor.Pred] using h

instance : SuccessorAdditionLaw Int := ⟨fun _ => rfl⟩

instance : SuccessorMultiplicationLaws Int where
  MulSucc := fun a b => by
    show a * (b + 1) = a * b + a
    ring
  MulPred := fun a b => by
    show a * (b - 1) = a * b + -a
    ring

example (a b c : Int) := integerSuite Int a b c

end IntInstantiation

                                                     

section Concrete

   
                                           

             

       
                     
   
  
def two : Z := Succ 1
   
                                                      

             

       
                          
   
  
def minusOne : Z := Pred 0
   
                                                      

             

       
                                 
   
  
def minusTwo : Z := Pred minusOne

example : Pred (Succ two) = two := PredSucc two
example : two + minusOne = (1 : Z) := rfl
example : -(0 : Z) = 0 := rfl
example : -(1 : Z) = minusOne := rfl
example : -minusOne = (1 : Z) := rfl
example : Succ minusOne = (0 : Z) := rfl
example : (1 : Z) ≤ 1 := LeRefl 1

                                                               
example : ¬ (1 : Z) < 1 := Polish.TwoSidedSuccessor.lt_irrefl 1
example : (0 : Z) < 1 := Polish.TwoSidedSuccessor.lt_succ_self 0

end Concrete

                                                                      

                                                                    
                                                            
            

section MathlibAutomation

example (a b : Z) : a * b = b * a := by
  letI : CommRing Z := toMathlibCommRing Z
  exact mul_comm a b

example (a b : Z) : (a + b) * (a + b) = a * a + (1 + 1) * (a * b) + b * b := by
  letI : CommRing Z := toMathlibCommRing Z
  ring

end MathlibAutomation

end LRA.NumberSystems.Integers.ArithmeticTests
