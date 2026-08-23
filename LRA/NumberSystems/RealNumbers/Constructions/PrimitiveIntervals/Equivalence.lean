                                                                                  
                                                                      
                                                                         
                                                                        
                                                                     
                                 

import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals.Carrier

namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervals
open LRA.NumberSystems.Interface.ModelTheory

variable (rational_model : DenselyOrderedFieldModel)

                                                   

                                                                                                      


             

       
              
                                                            
                             
                           
                                  
                                    
   
  
def equivalent
    (first second : Representative rational_model) : Prop :=
  ∀ first_index second_index,
    overlaps rational_model
      (first.interval first_index)
      (second.interval second_index)


                                                               

                                                                                                                      

                             


             

       
                                            
                                           
   
  
theorem equivalent_is_equivalence_relation :
    Equivalence (equivalent rational_model) := by
  sorry

                                              

                                                                                                    


             

       
                                                                        
                                
                                                            
   
  
def representative_setoid : Setoid (Representative rational_model) where
  r := equivalent rational_model
  iseqv := equivalent_is_equivalence_relation rational_model


                                                         

                                                


             

       
                                                                 
   
  
abbrev Carrier := Quotient (representative_setoid rational_model)


                                                 

                                                                                                                                                                                                                                                            

                             


             

       
                                                  
                                       
                                                     
              
                                       
                                                  
   
  
theorem constant_degenerate_sequence_is_admissible
    (value : Rational rational_model) :
    ∃ representative : Representative rational_model,
      ∀ index,
        representative.interval index =
          degenerate_interval rational_model value := by
  sorry

                                                    

                                                                                                                                             


             

       
                                         
                                                                        
                  
                                                                     
   
  
noncomputable def rational_representative
    (value : Rational rational_model) : Representative rational_model :=
  Classical.choose
    (constant_degenerate_sequence_is_admissible rational_model value)


                                                 

                                                                                                                                 


             

       
                                    
                                                                 
                                                              
   
  
noncomputable def rational_embedding
    (value : Rational rational_model) : Carrier rational_model :=
  Quotient.mk _ (rational_representative rational_model value)


                                                     

                                                                                                                                                                                               

                             


             

       
                                         
                   
                                               
                                                  
                    
   
  
theorem rational_embedding_is_injective :
    ∀ first second,
      rational_embedding rational_model first =
        rational_embedding rational_model second →
      first = second := by
  sorry

end LRA.NumberSystems.RealNumbers.PrimitiveIntervals
