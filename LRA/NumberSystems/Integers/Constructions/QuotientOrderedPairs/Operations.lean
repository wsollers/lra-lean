                                                                                
                                                                   
                                                                   

import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs.WellFoundedness

namespace LRA.NumberSystems.Integers.QuotientOrderedPairs

                                       

             

       
                           
                                                        
                                                                                
                        
                                                                            
                        
                                                                            
   
  
def representative_addition
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (first second : Representative whole_data) : Representative whole_data where
  positive_coordinate :=
    whole_data.addition first.positive_coordinate second.positive_coordinate
  negative_coordinate :=
    whole_data.addition first.negative_coordinate second.negative_coordinate


                                       

             

       
                           
                                                        
                                                                         
                                                  
                                                  
   
  
def representative_negation
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (value : Representative whole_data) : Representative whole_data where
  positive_coordinate := value.negative_coordinate
  negative_coordinate := value.positive_coordinate


                                             

             

       
                                 
                                                        
                                                                                
                        
                       
                                                                                      
                                                                                      
                        
                       
                                                                                      
                                                                                      
   
  
def representative_multiplication
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (first second : Representative whole_data) : Representative whole_data where
  positive_coordinate :=
    whole_data.addition
      (whole_data.multiplication first.positive_coordinate second.positive_coordinate)
      (whole_data.multiplication first.negative_coordinate second.negative_coordinate)
  negative_coordinate :=
    whole_data.addition
      (whole_data.multiplication first.positive_coordinate second.negative_coordinate)
      (whole_data.multiplication first.negative_coordinate second.positive_coordinate)


                                               

             

       
                                  
                                                        
                                                        
                            
                                                                              
                                                                              
   
  
def representative_nonstrict_order
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (first second : Representative whole_data) : Prop :=
  whole_data.nonstrict_order
    (whole_data.addition first.positive_coordinate second.negative_coordinate)
    (whole_data.addition second.positive_coordinate first.negative_coordinate)


                        

             

       
                                                                                                              
                                        
                                        
   
  
def zero_representative (whole_data : WholeNumberArithmeticForQuotientPairs) : Representative whole_data where
  positive_coordinate := whole_data.zero
  negative_coordinate := whole_data.zero


                       

             

       
                                                                                                             
                                       
                                        
   
  
def one_representative (whole_data : WholeNumberArithmeticForQuotientPairs) : Representative whole_data where
  positive_coordinate := whole_data.one
  negative_coordinate := whole_data.zero


                                                                   

             

       
         
                                                        
                                                        
               
                                  
                                              
   
  
def embed
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (value : whole_data.carrier) : Carrier whole_data :=
  Quotient.mk _
    { positive_coordinate := value
      negative_coordinate := whole_data.zero }


                                            

                             

             

       
                              
                                                          
                   
                                                                       
   
  
theorem embedding_is_injective
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∀ first second,
      embed whole_data first = embed whole_data second → first = second := by
  sorry

end LRA.NumberSystems.Integers.QuotientOrderedPairs
