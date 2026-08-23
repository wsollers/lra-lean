                                                                       
                                                                         
                                                                     
                                                                         
                                                                          
                                                                           
                                                               

import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.WellFoundedness

namespace LRA.NumberSystems.RealNumbers.Dedekind
open LRA.NumberSystems.Models

variable (rational_model : DenselyOrderedFieldModel)

                                                           

                                                                                                                       


             

       
                                                                                        
                                                                       
   
  
def rational_lower_ray (value : Rational rational_model) : RationalSet rational_model :=
  fun candidate => rational_model.signature.StrictOrder candidate value


                                                         

                                                                                                                         


             

       
                                                                                          
              
                 
                                          
                                            
                                                     
   
  
def addition_lower_set (first second : Cut rational_model) : RationalSet rational_model :=
  fun value =>
    ∃ left right,
      contains rational_model first left ∧
      contains rational_model second right ∧
      value = rational_model.signature.add left right


                                                      

                                                                                                                


             

       
                                                                                 
              
               
                                              
                                          
                                                     
   
  
def negation_lower_set (cut : Cut rational_model) : RationalSet rational_model :=
  fun value =>
    ∃ excluded,
      ¬ contains rational_model cut excluded ∧
      rational_model.signature.StrictOrder
        value (rational_model.signature.neg excluded)


                                                    

                                                                                                                                    


             

       
                                 
                                                                       
              
                                                                              
                 
                                          
                                            
                                                                               
                                                                                
                                          
                                                            
   
  
def nonnegative_product_lower_set
    (first second : Cut rational_model) : RationalSet rational_model :=
  fun value =>
    rational_model.signature.StrictOrder value rational_model.signature.zero ∨
    ∃ left right,
      contains rational_model first left ∧
      contains rational_model second right ∧
      rational_model.signature.StrictOrder rational_model.signature.zero left ∧
      rational_model.signature.StrictOrder rational_model.signature.zero right ∧
      rational_model.signature.StrictOrder
        value (rational_model.signature.multiply left right)


                                                              

                                                                                                                    


             

       
                
                                                                        
                                                                    
   
  
def family_union
    (family : Cut rational_model → Prop) : RationalSet rational_model :=
  fun value => ∃ cut, family cut ∧ contains rational_model cut value

end LRA.NumberSystems.RealNumbers.Dedekind
