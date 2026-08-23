                                                                              
                                                            

import LRA.NumberSystems.Integers.Constructions.Polish.TwoSidedSuccessor.Operations

namespace LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor

open Z

   
                                              
                                                                     
                                           

                                                                 
                                                               
                                                                     
                                                                      
                                                               
                                                                         
      
  

   
                        

             

       
                                         
   
  
theorem add_zero (x : Z) : x + Z.zero = x := by
  sorry

   
                              

             

       
                                                              
   
  
theorem succ_pred_comm (w : Z) : succ (pred w) = pred (succ w) := by
  sorry

   
                        

             

       
                                         
   
  
theorem zero_add (x : Z) : Z.zero + x = x := by
  sorry

   
                        

             

       
                                                      
   
  
theorem succ_add (x y : Z) : succ x + y = succ (x + y) := by
  sorry

   
                        

             

       
                                                      
   
  
theorem pred_add (x y : Z) : pred x + y = pred (x + y) := by
  sorry

   
                        

             

       
                                          
   
  
theorem add_comm (x y : Z) : x + y = y + x := by
  sorry

   
                         

             

       
                                                         
   
  
theorem add_assoc (x y z : Z) : (x + y) + z = x + (y + z) := by
  sorry

   
                        

             

       
                                         
   
  
theorem neg_zero : (-Z.zero : Z) = Z.zero := by
  sorry

   
                        

             

       
                                                
   
  
theorem neg_succ (x : Z) : -(succ x) = pred (-x) := by
  sorry

   
                        

             

       
                                                
   
  
theorem neg_pred (x : Z) : -(pred x) = succ (-x) := by
  sorry

   
                       

             

       
                                   
   
  
theorem neg_neg (x : Z) : -(-x) = x := by
  sorry

   
                            

             

       
                                                
   
  
theorem add_neg_self (x : Z) : x + (-x) = Z.zero := by
  sorry

   
                            

             

       
                                                
   
  
theorem neg_add_self (x : Z) : (-x) + x = Z.zero := by
  sorry

   
                       

             

       
                                                  
   
  
theorem neg_add (x y : Z) : -(x + y) = (-x) + (-y) := by
  sorry

   
                        

             

       
                                                   
   
  
theorem mul_succ (x y : Z) : x * succ y = x * y + x := by
  sorry

   
                        

             

       
                                                      
   
  
theorem mul_pred (x y : Z) : x * pred y = x * y + (-x) := by
  sorry

   
                        

             

       
                                              
   
  
theorem zero_mul (x : Z) : Z.zero * x = Z.zero := by
  sorry

   
                       

             

       
                                          
   
  
theorem add_one (x : Z) : x + one = succ x := by
  sorry

   
                          

             

       
                                             
   
  
theorem neg_one_eq : (-one : Z) = pred Z.zero := by
  sorry

   
                           

             

       
                                                 
   
  
theorem add_neg_one (x : Z) : x + (-one) = pred x := by
  sorry

   
                       

             

       
                                     
   
  
theorem one_mul (x : Z) : one * x = x := by
  sorry

   
                        

             

       
                                                   
   
  
theorem succ_mul (x y : Z) : succ x * y = x * y + y := by
  sorry

   
                        

             

       
                                                      
   
  
theorem pred_mul (x y : Z) : pred x * y = x * y + (-y) := by
  sorry

   
                        

             

       
                                          
   
  
theorem mul_comm (x y : Z) : x * y = y * x := by
  sorry

                                                      

             

       
                                                                          
   
  
theorem add_add_comm (a b c d : Z) : (a + b) + (c + d) = (a + c) + (b + d) := by
  sorry

   
                             

             

       
                                                               
   
  
theorem distrib_right (a b c : Z) : (a + b) * c = a * c + b * c := by
  sorry

   
                            

             

       
                                                              
   
  
theorem distrib_left (a b c : Z) : a * (b + c) = a * b + a * c := by
  sorry

   
                       

             

       
                                               
   
  
theorem mul_neg (x y : Z) : x * (-y) = -(x * y) := by
  sorry

   
                       

             

       
                                               
   
  
theorem neg_mul (x y : Z) : (-x) * y = -(x * y) := by
  sorry

   
                         

             

       
                                                         
   
  
theorem mul_assoc (x y z : Z) : (x * y) * z = x * (y * z) := by
  sorry

                                               

             

       
                                              
   
  
def Pos (z : Z) : Prop := ∃ p : P, z = Z.pos p

                                                 

             

       
                                                
   
  
def IsNeg (z : Z) : Prop := ∃ n : N, z = Z.neg n

   
                            

             

       
                                   
   
  
theorem not_pos_zero : ¬ Pos Z.zero := by
  sorry

   
                              

             

       
                                       
   
  
theorem not_isNeg_zero : ¬ IsNeg Z.zero := by
  sorry

   
                                 

             

       
                                                       
   
  
theorem not_pos_and_isNeg (z : Z) : ¬ (Pos z ∧ IsNeg z) := by
  sorry

   
                          

             

       
                                                         
   
  
theorem trichotomy (z : Z) : z = Z.zero ∨ Pos z ∨ IsNeg z := by
  sorry

   
                       

             

       
                                                                                      
   
  
theorem pos_add {x y : Z} (leftPositive : Pos x) (rightPositive : Pos y) : Pos (x + y) := by
  sorry

   
                                

             

       
                                                                     
   
  
theorem isNeg_neg_of_pos {x : Z} (positiveInput : Pos x) : IsNeg (-x) := by
  sorry

   
                                

             

       
                                                                     
   
  
theorem pos_neg_of_isNeg {x : Z} (negativeInput : IsNeg x) : Pos (-x) := by
  sorry

   
                                 

             

       
                                                      
   
  
theorem pos_neg_iff_isNeg (x : Z) : Pos (-x) ↔ IsNeg x := by
  sorry

   
              

             

       
                                         
   
  
def lt (x y : Z) : Prop := Pos (y + (-x))

instance : LT Z where
  lt := lt

   
              

             

       
                                        
   
  
def le (x y : Z) : Prop := x = y ∨ x < y

instance : LE Z where
  le := le

   
                      

             

       
                                                 
   
  
theorem lt_def (x y : Z) : x < y ↔ Pos (y + (-x)) := by
  sorry

   
                              

             

       
                                                   
   
  
theorem pos_of_zero_lt (x : Z) : Z.zero < x → Pos x := by
  sorry

   
                         

             

       
                                   
   
  
theorem lt_irrefl (x : Z) : ¬ x < x := by
  sorry

   
                        

             

       
                                                                                        
   
  
theorem lt_trans {x y z : Z} (firstLessSecond : x < y) (secondLessThird : y < z) : x < z := by
  sorry

   
                             

             

       
                                                       
   
  
theorem lt_trichotomy (x y : Z) : x < y ∨ x = y ∨ y < x := by
  sorry

   
                            

             

       
                                         
   
  
theorem lt_succ_self (x : Z) : x < succ x := by
  sorry

   
                            

             

       
                                         
   
  
theorem pred_lt_self (x : Z) : pred x < x := by
  sorry

   
                                

             

       
                                                                                    
   
  
theorem add_lt_add_right {x y : Z} (firstLessSecond : x < y) (z : Z) : x + z < y + z := by
  sorry

   
                      

             

       
                                                
   
  
theorem le_iff (x y : Z) : x ≤ y ↔ x = y ∨ x < y := by
  sorry

   
                       

             

       
                               
   
  
theorem le_refl (x : Z) : x ≤ x := by
  sorry

   
                              

             

       
                                                                                      
         
   
  
theorem lt_of_le_of_lt {x y z : Z} (firstLeSecond : x ≤ y) (secondLessThird : y < z) :
    x < z := by
  sorry

   
                           

             

       
                                                                                     
   
  
theorem le_antisymm {x y : Z} (firstLeSecond : x ≤ y) (secondLeFirst : y ≤ x) : x = y := by
  sorry

   
                       

             

       
                                                                                      
   
  
theorem pos_mul {x y : Z} (leftPositive : Pos x) (rightPositive : Pos y) : Pos (x * y) := by
  sorry

   
                                    

             

       
                                                                                                 
                 
   
  
theorem mul_lt_mul_pos_right {x y z : Z} (firstLessSecond : x < y) (multiplierPositive : Pos z) :
    x * z < y * z := by
  sorry

end LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor
