                                                                    
                                                                          
                                                                      

import LRA.NumberSystems.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RealNumbers.Dedekind

open LRA.NumberSystems.Interface.ModelTheory

   
                                                   
                                              
                                                                                      

                                                                        
                                                                        
                                                                         
                                                                          
                                                              
                                                                        
                                                                              
  

variable (rational_model : DenselyOrderedFieldModel)

   
                       

                                                 


             

       
                                                   
   
  
abbrev Rational := rational_model.signature.carrier
   
                          

                                                    


             

       
                                                    
   
  
abbrev RationalSet := Rational rational_model → Prop


                                               

                                                                                           


             

       
                                                            
                              
                                
                 
                     
                                                      
                      
           
                     
              
                         
                                                         
   
  
def IsCut (lower_set : RationalSet rational_model) : Prop :=
  (∃ value, lower_set value) ∧
  (∃ value, ¬ lower_set value) ∧
  (∀ upper lower,
    lower_set upper →
    rational_model.signature.StrictOrder lower upper →
    lower_set lower) ∧
  (∀ value,
    lower_set value →
    ∃ greater,
      lower_set greater ∧
      rational_model.signature.StrictOrder value greater)


                                              

                                            


             

       
                                                                                          
   
  
abbrev Cut := { lower_set : RationalSet rational_model // IsCut rational_model lower_set }


                                      

                                                                                                                  


             

       
                                                                                   
             
   
  
def contains (cut : Cut rational_model) (value : Rational rational_model) : Prop :=
  cut.1 value


                                                          

                                                                                                                                                                                                       

                             


             

       
                                                                
                    
              
                                             
                                            
   
  
theorem cut_extensionality (first second : Cut rational_model) :
    first = second ↔
      ∀ value,
        contains rational_model first value ↔
        contains rational_model second value := by
  sorry

end LRA.NumberSystems.RealNumbers.Dedekind
