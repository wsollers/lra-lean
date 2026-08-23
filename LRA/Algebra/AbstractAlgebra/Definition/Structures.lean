   
                                           

                                                                               
                                                                             
                                           
  

namespace LRA.Algebra

universe u

                                   

             

       
                                                
                              
                 
                                             
                                                            
   
  
structure SemigroupDefinition (G : Type u) where
                              
  mul : G → G → G
                                             
  mul_assoc : ∀ a b c : G, mul (mul a b) c = mul a (mul b c)

                                

             

       
                                                                           
                              
         
                                               
                                  
                                                
                                  
   
  
structure MonoidDefinition (M : Type u) extends SemigroupDefinition M where
                              
  one : M
                                               
  one_mul : ∀ a : M, mul one a = a
                                                
  mul_one : ∀ a : M, mul a one = a

                               

             

       
                                                                       
                               
             
                                     
                                               
   
  
structure GroupDefinition (G : Type u) extends MonoidDefinition G where
                               
  inv : G → G
                                     
  inv_mul_cancel : ∀ a : G, mul (inv a) a = one

                              

             

       
                                           
                               
          
                  
                 
                          
             
                                     
         
                        
                 
                                 
                                                            
                                 
                                         
                                          
                                    
                                              
                                              
                                       
                                                            
                                               
                                  
                                                
                                  
                                                              
                                                                       
                                                               
                                                                        
   
  
structure RingDefinition (R : Type u) where
                               
  zero : R
                  
  add : R → R → R
                          
  neg : R → R
                                     
  one : R
                        
  mul : R → R → R
                                 
  add_assoc : ∀ a b c : R, add (add a b) c = add a (add b c)
                                 
  add_comm : ∀ a b : R, add a b = add b a
                                          
  zero_add : ∀ a : R, add zero a = a
                                              
  add_left_neg : ∀ a : R, add (neg a) a = zero
                                       
  mul_assoc : ∀ a b c : R, mul (mul a b) c = mul a (mul b c)
                                               
  one_mul : ∀ a : R, mul one a = a
                                                
  mul_one : ∀ a : R, mul a one = a
                                                              
  left_distrib : ∀ a b c : R, mul a (add b c) = add (mul a b) (mul a c)
                                                               
  right_distrib : ∀ a b c : R, mul (add a b) c = add (mul a c) (mul b c)

                               

             

       
                                                                     
                                
             
                                       
                                         
                                             
                                                          
   
  
structure FieldDefinition (K : Type u) extends RingDefinition K where
                                
  inv : K → K
                                       
  mul_comm : ∀ a b : K, mul a b = mul b a
                                             
  inv_mul_cancel : ∀ a : K, a ≠ zero → mul (inv a) a = one

                                                      

             

       
                                            
                                
                  
                                                         
                                
   
  
structure AlgebraicStructureDefinition where
                                
  Carrier : Type u
                                                         
  structureData : Carrier → Prop

end LRA.Algebra
