                                                                            
                                                                   
                                                                         
                                                                          
                                                                         
                                                                          
                                                                      
                                                                          
                                                                   
                                                      

import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.Operations

namespace LRA.NumberSystems.RealNumbers.Dedekind
open LRA.NumberSystems.Models

variable (rational_model : DenselyOrderedFieldModel)

                                                   

                                                                                                                                                                      

                             


             

       
                                                                     
                                                                  
   
  
theorem rational_lower_ray_is_cut (value : Rational rational_model) :
    IsCut rational_model (rational_lower_ray rational_model value) := by
  sorry

                                                          

                                                                                                               


             

       
                                                                                
                                           
                                                   
   
  
def rational_embedding (value : Rational rational_model) : Cut rational_model :=
  ⟨rational_lower_ray rational_model value,
    rational_lower_ray_is_cut rational_model value⟩


                                                                                     

                                                                                                                                                                                                                                                                                                     

                             


             

       
                                               
                    
                                               
                                                                    
                    
                                                         
                                   
                                                   
                                                     
   
  
theorem rational_embedding_is_order_embedding :
    (∀ first second,
      rational_embedding rational_model first =
        rational_embedding rational_model second → first = second) ∧
    (∀ first second,
      rational_model.signature.StrictOrder first second ↔
        strict_order rational_model
          (rational_embedding rational_model first)
          (rational_embedding rational_model second)) := by
  sorry

                                        

                                                                                                                                                                               

                             


             

       
                                                                       
                                                                         
   
  
theorem addition_lower_set_is_cut (first second : Cut rational_model) :
    IsCut rational_model (addition_lower_set rational_model first second) := by
  sorry

                                     

                                                                                                       


             

       
                                                                        
                                                  
                                                          
   
  
def addition (first second : Cut rational_model) : Cut rational_model :=
  ⟨addition_lower_set rational_model first second,
    addition_lower_set_is_cut rational_model first second⟩


                                 

                                                               


             

       
                                
                                                                 
   
  
def zero : Cut rational_model :=
  rational_embedding rational_model rational_model.signature.zero


                                            

                                                                                                                                                             

                             


             

       
                                                              
                                                                
   
  
theorem negation_lower_set_is_cut (cut : Cut rational_model) :
    IsCut rational_model (negation_lower_set rational_model cut) := by
  sorry

                                              

                                                                                              


             

       
                                                               
                                         
                                                 
   
  
def negation (cut : Cut rational_model) : Cut rational_model :=
  ⟨negation_lower_set rational_model cut,
    negation_lower_set_is_cut rational_model cut⟩


                                                         

                                                                                  


             

       
                                                   
                                                       
   
  
def IsPositive (cut : Cut rational_model) : Prop :=
  strict_order rational_model (zero rational_model) cut

   
                         

                                                                                     


             

       
                                                      
                                                          
   
  
def IsNonnegative (cut : Cut rational_model) : Prop :=
  nonstrict_order rational_model (zero rational_model) cut


                                                      

                                                                                                                                                                                                                                                                                                      

                             


             

       
                                  
                                       
                                                            
                                                                
                        
                                                                 
   
  
theorem nonnegative_product_is_cut
    (first second : Cut rational_model)
    (first_nonnegative : IsNonnegative rational_model first)
    (second_nonnegative : IsNonnegative rational_model second) :
    IsCut rational_model
      (nonnegative_product_lower_set rational_model first second) := by
  sorry

                                

                                                                                                                                                                                                                                             


             

       
                              
                                       
                                                            
                                                                
                         
                                                             
                                                          
                                           
   
  
def nonnegative_multiplication
    (first second : Cut rational_model)
    (first_nonnegative : IsNonnegative rational_model first)
    (second_nonnegative : IsNonnegative rational_model second) :
    Cut rational_model :=
  ⟨nonnegative_product_lower_set rational_model first second,
    nonnegative_product_is_cut rational_model first second
      first_nonnegative second_nonnegative⟩


                                                                        

                                                                                                  


             

       
                                                                   
                                                            
                                                               
                                                                      
                                               
                                                            
                                                               
                                                            
                                          
                                         
                                                    
                                                  
                                                        
                                                             
                                                             
                                                             
                                           
                                         
                                                    
                                                  
                                                        
                                                            
                                                              
                                                          
                                        
                                                             
                                           
                                                           
                                         
                                          
                                                       
   
  
def IsProduct (first second product : Cut rational_model) : Prop :=
  (∃ first_nonnegative : IsNonnegative rational_model first,
    ∃ second_nonnegative : IsNonnegative rational_model second,
      product = nonnegative_multiplication rational_model first second
        first_nonnegative second_nonnegative) ∨
  (strict_order rational_model first (zero rational_model) ∧
    ∃ second_nonnegative : IsNonnegative rational_model second,
      ∃ first_neg_nonnegative : IsNonnegative rational_model
          (negation rational_model first),
        product = negation rational_model
          (nonnegative_multiplication rational_model
            (negation rational_model first) second
            first_neg_nonnegative second_nonnegative)) ∨
  (strict_order rational_model second (zero rational_model) ∧
    ∃ first_nonnegative : IsNonnegative rational_model first,
      ∃ second_neg_nonnegative : IsNonnegative rational_model
          (negation rational_model second),
        product = negation rational_model
          (nonnegative_multiplication rational_model
            first (negation rational_model second)
            first_nonnegative second_neg_nonnegative)) ∨
  (strict_order rational_model first (zero rational_model) ∧
    strict_order rational_model second (zero rational_model) ∧
    ∃ first_neg_nonnegative : IsNonnegative rational_model
        (negation rational_model first),
      ∃ second_neg_nonnegative : IsNonnegative rational_model
          (negation rational_model second),
        product = nonnegative_multiplication rational_model
          (negation rational_model first)
          (negation rational_model second)
          first_neg_nonnegative second_neg_nonnegative)


                                                          

                                                                                                                                                                                                                                                              

                             


             

       
                                                                     
                                   
                                                     
                                                                            
   
  
theorem product_exists_uniquely (first second : Cut rational_model) :
    ∃ product : Cut rational_model,
      IsProduct rational_model first second product ∧
      ∀ other, IsProduct rational_model first second other → other = product := by
  sorry

                                                     

                                                                                                                           


             

       
                                
                                                               
                                                                        
   
  
noncomputable def multiplication
    (first second : Cut rational_model) : Cut rational_model :=
  Classical.choose (product_exists_uniquely rational_model first second)


                                

                                                              


             

       
                               
                                                                
   
  
def one : Cut rational_model :=
  rational_embedding rational_model rational_model.signature.one


                                                                          

                                                                                               


             

       
                                                                
                                                                     
                                                                   
   
  
def IsReciprocal (cut reciprocal : Cut rational_model) : Prop :=
  multiplication rational_model cut reciprocal = one rational_model ∧
  multiplication rational_model reciprocal cut = one rational_model


                                                           

                                                                                                                                                                                                                                                                                               

                             


             

       
                                  
                              
                                               
                                      
                                                  
                                                                         
   
  
theorem reciprocal_exists_uniquely
    (cut : Cut rational_model)
    (cut_nonzero : cut ≠ zero rational_model) :
    ∃ reciprocal : Cut rational_model,
      IsReciprocal rational_model cut reciprocal ∧
      ∀ other, IsReciprocal rational_model cut other → other = reciprocal := by
  sorry

                                                    

                                                                                                                                                     


             

       
                         
                              
                                                                     
                  
                                                               
   
  
noncomputable def inverse
    (cut : Cut rational_model)
    (cut_nonzero : cut ≠ zero rational_model) : Cut rational_model :=
  Classical.choose
    (reciprocal_exists_uniquely rational_model cut cut_nonzero)


                                        

                                                                                                                                                                                                         

                             


             

       
                       
                              
                                               
                                   
                                              
   
  
theorem inverse_correct
    (cut : Cut rational_model)
    (cut_nonzero : cut ≠ zero rational_model) :
    IsReciprocal rational_model cut
      (inverse rational_model cut cut_nonzero) := by
  sorry

                                                           

                                                                                                                                                                                                                                                                                             

                             


             

       
                           
                                        
                                         
                     
              
              
                                                                  
                                                             
   
  
theorem family_union_is_cut
    (family : Cut rational_model → Prop)
    (family_nonempty : ∃ cut, family cut)
    (family_bounded :
      ∃ upper,
        ∀ cut,
          family cut → nonstrict_order rational_model cut upper) :
    IsCut rational_model (family_union rational_model family) := by
  sorry

                                               

                                                                                                                                                                                                                                              


             

       
                   
                                        
                                         
                     
              
              
                                                                  
                         
                                      
                                             
                                     
   
  
def family_supremum
    (family : Cut rational_model → Prop)
    (family_nonempty : ∃ cut, family cut)
    (family_bounded :
      ∃ upper,
        ∀ cut,
          family cut → nonstrict_order rational_model cut upper) :
    Cut rational_model :=
  ⟨family_union rational_model family,
    family_union_is_cut rational_model family
      family_nonempty family_bounded⟩


                                               

                                                                                                                                                                                                                                                                                                      

                             


             

       
                                
                                        
                                         
                     
              
              
                                                                  
           
                  
                                        
                                              
                                            
             
             
                                                                
                                    
                                              
                                         
              
   
  
theorem family_union_is_supremum
    (family : Cut rational_model → Prop)
    (family_nonempty : ∃ cut, family cut)
    (family_bounded :
      ∃ upper,
        ∀ cut,
          family cut → nonstrict_order rational_model cut upper) :
    (∀ cut,
      family cut →
      nonstrict_order rational_model cut
        (family_supremum rational_model family
          family_nonempty family_bounded)) ∧
    (∀ upper,
      (∀ cut,
        family cut → nonstrict_order rational_model cut upper) →
      nonstrict_order rational_model
        (family_supremum rational_model family
          family_nonempty family_bounded)
        upper) := by
  sorry

end LRA.NumberSystems.RealNumbers.Dedekind
