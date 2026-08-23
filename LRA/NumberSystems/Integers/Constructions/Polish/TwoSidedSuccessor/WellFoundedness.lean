                                                                                         
                                                                         
            

import LRA.NumberSystems.Integers.Constructions.Polish.TwoSidedSuccessor.Carrier

namespace LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor

open Z

   
                         

             

       
                                             
   
  
theorem pred_succ (x : Z) : pred (succ x) = x := by
  sorry

   
                         

             

       
                                             
   
  
theorem succ_pred (x : Z) : succ (pred x) = x := by
  sorry

   
                

             

       
                                                   
                         
                                     
   
  
def recP {α : Type} (a0 : α) (step : α → α) : P → α
  | P.succZero => step a0
  | P.succ p => step (recP a0 step p)

   
                

             

       
                                                   
                         
                                     
   
  
def recN {α : Type} (a0 : α) (step : α → α) : N → α
  | N.predZero => step a0
  | N.pred n => step (recN a0 step n)

   
                

             

       
                                                                
              
                               
                               
   
  
def recZ {α : Type} (a0 : α) (stepSucc stepPred : α → α) : Z → α
  | zero => a0
  | pos p => recP a0 stepSucc p
  | neg n => recN a0 stepPred n

   
                         

             

       
                                                                   
                                       
   
  
theorem recZ_zero {α : Type} (a0 : α) (stepSucc stepPred : α → α) :
    recZ a0 stepSucc stepPred zero = a0 := by
  sorry

   
                         

             

       
                                                                 
                                                     
                                                 
                                            
   
  
theorem recZ_succ {α : Type} (a0 : α) (stepSucc stepPred : α → α)
    (rightInverse : ∀ a, stepSucc (stepPred a) = a) :
    ∀ x : Z, recZ a0 stepSucc stepPred (succ x) =
      stepSucc (recZ a0 stepSucc stepPred x) := by
  sorry

   
                         

             

       
                                                                 
                                                    
                                                 
                                            
   
  
theorem recZ_pred {α : Type} (a0 : α) (stepSucc stepPred : α → α)
    (leftInverse : ∀ a, stepPred (stepSucc a) = a) :
    ∀ x : Z, recZ a0 stepSucc stepPred (pred x) =
      stepPred (recZ a0 stepSucc stepPred x) := by
  sorry

   
                                

             

       
                                                                        
                                                  
                                                     
                
                   
                                          
                                        
   
  
theorem recursion_exists {α : Type} (a0 : α) (stepSucc stepPred : α → α)
    (leftInverse : ∀ a, stepPred (stepSucc a) = a)
    (rightInverse : ∀ a, stepSucc (stepPred a) = a) :
    ∃ h : Z → α,
      h zero = a0 ∧
      (∀ x, h (succ x) = stepSucc (h x)) ∧
      (∀ x, h (pred x) = stepPred (h x)) := by
  sorry

   
                              

                          

             

       
                                                                              
   
  
theorem succ_injective {x y : Z} (successorEquality : succ x = succ y) : x = y := by
  sorry

   
                              

                          

             

       
                                                                                
   
  
theorem pred_injective {x y : Z} (predecessorEquality : pred x = pred y) : x = y := by
  sorry

                                                                      
                          

                                                                                                                                                                                 


             

       
                         
                  
                         
                                      
                                        
            
   
  
theorem twoSidedInduction
    (A : Z → Prop)
    (zeroCase : A Z.zero)
    (succStep : ∀ x, A x → A (succ x))
    (predStep : ∀ x, A x → A (pred x)) :
    ∀ x, A x := by
  sorry

                                                                     
               

             

       
                                   
            
                               
                                          
                                                    
                                                                                   
                                                                                   
                                                      
                                                                                      
                                                                                        
                                           
   
  
theorem recursion_unique {α : Type}
    (a0 : α)
    (stepSucc stepPred : α → α)
    (firstFunction secondFunction : Z → α)
    (firstFunction_zero : firstFunction Z.zero = a0)
    (firstFunction_succ : ∀ x, firstFunction (succ x) = stepSucc (firstFunction x))
    (firstFunction_pred : ∀ x, firstFunction (pred x) = stepPred (firstFunction x))
    (secondFunction_zero : secondFunction Z.zero = a0)
    (secondFunction_succ : ∀ x, secondFunction (succ x) = stepSucc (secondFunction x))
    (secondFunction_pred : ∀ x, secondFunction (pred x) = stepPred (secondFunction x)) :
    ∀ x, firstFunction x = secondFunction x := by
  sorry

end LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor
