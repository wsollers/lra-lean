                                                  
                                                                           
                                                                   
                                            

namespace LRA.NumberSystems.IntegerStructure.Bundled

   
                                                           
                                                      

                                                                            

                                                
                                                    
                            

                                                                            
                                                                          

                                                                      
                                                                       
                                                                         
                                                                            
                                                                          
                                                                      
                                                                       
                                                                
                         
  

   
                   

             

       
                                                  
             
                                 
   
  
def iterate {α : Type u} (f : α → α) : Nat → α → α
  | 0, x => x
  | n + 1, x => f (iterate f n x)

   
                            

             

       
                                                                  
                                           
   
  
theorem iterate_succ' {α : Type u} (f : α → α) (n : Nat) (x : α) :
    iterate f (n + 1) x = f (iterate f n x) := by
  sorry

   
                            

             

       
                                                                 
                                         
   
  
theorem iterate_comm {α : Type u} (f : α → α) (n : Nat) (x : α) :
    f (iterate f n x) = iterate f n (f x) := by
  sorry

   
                                  

             

       
                                                                       
                                           
   
  
theorem iterate_succ_apply {α : Type u} (f : α → α) (n : Nat) (x : α) :
    iterate f (n + 1) x = iterate f n (f x) := by
  sorry

   
                           

             

       
                                                                  
                                                     
   
  
theorem iterate_add {α : Type u} (f : α → α) (m n : Nat) (x : α) :
    iterate f (m + n) x = iterate f m (iterate f n x) := by
  sorry

   
                     

             

       
   
  
def Injective {α β : Type _} (f : α → β) : Prop :=
  ∀ ⦃a b⦄, f a = f b → a = b

   
                      

             

       
   
  
def Surjective {α β : Type _} (f : α → β) : Prop :=
  ∀ b, ∃ a, f a = b

   
                     

             

       
   
  
def Bijective {α β : Type _} (f : α → β) : Prop :=
  Injective f ∧ Surjective f

   
                                  

             

       
                                
                  
                
                          
                          
                                    
                                    
                                                           
             
                           
              
                               
                               
              
   
  
structure IntegerStructure where
  carrier : Type u
  zero : carrier
  succ : carrier → carrier
  pred : carrier → carrier
  pred_succ : ∀ x, pred (succ x) = x
  succ_pred : ∀ x, succ (pred x) = x
  aperiodic : ∀ n : Nat, 0 < n → iterate succ n zero ≠ zero
  induction :
    ∀ (A : carrier → Prop),
      A zero →
      (∀ x, A x → A (succ x)) →
      (∀ x, A x → A (pred x)) →
      ∀ x, A x

end LRA.NumberSystems.IntegerStructure.Bundled
namespace LRA.NumberSystems.IntegerStructure.Bundled.IntegerStructure

variable (S : IntegerStructure)

   
               

             

       
                         
                                          
                                                  
   
  
def rep : Int → S.carrier
  | Int.ofNat n => iterate S.succ n S.zero
  | Int.negSucc n => iterate S.pred (n + 1) S.zero

   
                           

             

       
                                   
   
  
theorem rep_zero : S.rep 0 = S.zero := by
  sorry

attribute [simp] rep_zero

   
                                         

             

       
                                                             
                                             
   
  
theorem pred_iterate_succ_iterate (n : Nat) (x : S.carrier) :
    iterate S.pred n (iterate S.succ n x) = x := by
  sorry

   
                                         

             

       
                                                             
                                             
   
  
theorem succ_iterate_pred_iterate (n : Nat) (x : S.carrier) :
    iterate S.succ n (iterate S.pred n x) = x := by
  sorry

   
                              

             

       
                                              
                                    
   
  
theorem aperiodic_pred (n : Nat) (h : 0 < n) :
    iterate S.pred n S.zero ≠ S.zero := by
  sorry

   
                                      

             

       
                                                                       
   
  
theorem iterate_succ_injective (n : Nat) :
    _root_.Function.Injective (iterate S.succ n) := by
  sorry

   
                                      

             

       
                                                                       
   
  
theorem iterate_pred_injective (n : Nat) :
    _root_.Function.Injective (iterate S.pred n) := by
  sorry

   
                                    

             

       
                            
               
                                                             
         
   
  
theorem no_forward_collision
    (m n : Nat)
    (h : iterate S.succ m S.zero = iterate S.succ n S.zero) :
    m = n := by
  sorry

   
                                     

             

       
                             
               
                                                             
         
   
  
theorem no_backward_collision
    (m n : Nat)
    (h : iterate S.pred m S.zero = iterate S.pred n S.zero) :
    m = n := by
  sorry

   
                                  

             

       
                          
               
                                                                   
         
   
  
theorem no_mixed_collision
    (m n : Nat)
    (h : iterate S.succ m S.zero = iterate S.pred (n + 1) S.zero) :
    False := by
  sorry

   
                             

             

       
                                       
   
  
theorem rep_injective : _root_.Function.Injective S.rep := by
  sorry

   
                        

             

       
                                                             
   
  
theorem rep_succ (n : Int) : S.rep (n + 1) = S.succ (S.rep n) := by
  sorry

   
                        

             

       
                                                             
   
  
theorem rep_pred (n : Int) : S.rep (n - 1) = S.pred (S.rep n) := by
  sorry

   
                              

             

       
                                         
   
  
theorem rep_surjective : _root_.Function.Surjective S.rep := by
  sorry

   
                             

             

       
                                       
   
  
theorem rep_bijective :
    _root_.Function.Injective S.rep ∧ _root_.Function.Surjective S.rep := by
  sorry

   
                            

             

       
                      
                                     
                        
                                                 
   
  
theorem categoricity :
    (_root_.Function.Injective S.rep ∧ _root_.Function.Surjective S.rep) ∧
      S.rep 0 = S.zero ∧
      ∀ n : Int, S.rep (n + 1) = S.succ (S.rep n) := by
  sorry

end LRA.NumberSystems.IntegerStructure.Bundled.IntegerStructure
namespace LRA.NumberSystems.IntegerStructure.Bundled

end LRA.NumberSystems.IntegerStructure.Bundled
