                                                                        
                                                                             
                                                                        
                                                                     
                                                                     
                                                                            

import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.Carrier

namespace LRA.NumberSystems.RealNumbers.Dedekind
open LRA.NumberSystems.Interface.ModelTheory

variable (rational_model : DenselyOrderedFieldModel)

                                       

                                                                                                


             

       
                                                                 
          
                                         
                                        
   
  
def nonstrict_order (first second : Cut rational_model) : Prop :=
  ∀ value,
    contains rational_model first value →
    contains rational_model second value


                                                     

                                                                                             


             

       
                                                              
                                                              
   
  
def strict_order (first second : Cut rational_model) : Prop :=
  nonstrict_order rational_model first second ∧ first ≠ second


                                              

                                                             


             

       
                              
                                                                       
                                             
                                              
                                              
                                              
                                       
                    
                                              
                                             
   
  
def StrictTotalOrder : Prop :=
  (∀ cut : Cut rational_model, ¬ strict_order rational_model cut cut) ∧
  (∀ first second third : Cut rational_model,
    strict_order rational_model first second →
    strict_order rational_model second third →
    strict_order rational_model first third) ∧
  (∀ first second : Cut rational_model,
    first ≠ second →
    strict_order rational_model first second ∨
    strict_order rational_model second first)


                                                          

                                                                                              

                             


             

       
                                                            
   
  
theorem strict_total_order : StrictTotalOrder rational_model := by
  sorry

end LRA.NumberSystems.RealNumbers.Dedekind
