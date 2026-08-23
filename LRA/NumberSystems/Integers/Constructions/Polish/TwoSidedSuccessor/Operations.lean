                                                                                    
                                                                   

import LRA.NumberSystems.Integers.Constructions.Polish.TwoSidedSuccessor.WellFoundedness

namespace LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor

open Z

   
               

             

       
                       
             
            
                          
                              
                                     
            
            
                          
                              
                                     
            
   
  
def add (x : Z) : Z → Z
  | zero => x
  | pos p =>
      let rec addP : P → Z
        | P.succZero => succ x
        | P.succ p' => succ (addP p')
      addP p
  | neg n =>
      let rec addN : N → Z
        | N.predZero => pred x
        | N.pred n' => pred (addN n')
      addN n

instance : Add Z where
  add := add

   
                        

             

       
                                                      
   
  
theorem add_succ (x y : Z) : x + succ y = succ (x + y) := by
  sorry

   
                        

             

       
                                                      
   
  
theorem add_pred (x y : Z) : x + pred y = pred (x + y) := by
  sorry

   
                

             

       
                
                
            
                           
                                  
                                        
                   
            
                           
                                  
                                        
                   
   
  
def negZ : Z → Z
  | zero => zero
  | pos p =>
      let rec flipP : P → N
        | P.succZero => N.predZero
        | P.succ p' => N.pred (flipP p')
      neg (flipP p)
  | neg n =>
      let rec flipN : N → P
        | N.predZero => P.succZero
        | N.pred n' => P.succ (flipN n')
      pos (flipN n)

instance : Neg Z where
  neg := negZ

   
               

             

       
                       
                
            
                          
                         
                                  
            
            
                          
                          
                                   
            
   
  
def mul (x : Z) : Z → Z
  | zero => zero
  | pos p =>
      let rec mulP : P → Z
        | P.succZero => x
        | P.succ p' => mulP p' + x
      mulP p
  | neg n =>
      let rec mulN : N → Z
        | N.predZero => -x
        | N.pred n' => mulN n' + -x
      mulN n

instance : Mul Z where
  mul := mul

   
                        

             

       
                                          
   
  
theorem mul_zero (x : Z) : x * zero = zero := by
  sorry

   
                                

             

       
                                                         
   
  
theorem mul_pos_succZero (x : Z) : x * pos P.succZero = x := by
  sorry

   
                            

             

       
                                                                         
   
  
theorem mul_pos_succ (x : Z) (p : P) : x * pos (P.succ p) = x * pos p + x := by
  sorry

   
                                

             

       
                                                          
   
  
theorem mul_neg_predZero (x : Z) : x * neg N.predZero = -x := by
  sorry

   
                            

             

       
                                                                          
   
  
theorem mul_neg_pred (x : Z) (n : N) : x * neg (N.pred n) = x * neg n + -x := by
  sorry

end LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor
