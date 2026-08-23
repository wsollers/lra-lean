                                                               

import LRA.NumberSystems.Integers.Constructions.Tao.WellFoundedness

namespace LRA.NumberSystems.Integers.Tao

                                     

             

       
                       
                                                                 
                                     
                            
                               
   
  
def zero_representative
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    FormalDifference whole_data where
  minuend := whole_data.zero
  subtrahend := whole_data.zero


                                                           

             

       
                                  
                                                               
                                                                    
                  
                               
   
  
def whole_embedding_representative
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (value : whole_data.carrier) : FormalDifference whole_data where
  minuend := value
  subtrahend := whole_data.zero

   
                           

             

       
                   
                                                                 
                                              
                                              
                                                     
   
  
def whole_embedding
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    whole_data.carrier → Carrier whole_data :=
  fun value => Quotient.mk (setoid whole_data)
    (whole_embedding_representative whole_data value)

   
                                            

                             

             

       
                                    
                                                                 
                   
                                                                            
                      
   
  
theorem whole_embedding_is_injective
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    ∀ first second,
      whole_embedding whole_data first = whole_embedding whole_data second →
        first = second := by
  sorry

                                     

             

       
                           
                                                               
                                                                                    
                                                             
                                                                      
   
  
def representative_addition
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : FormalDifference whole_data where
  minuend := whole_data.addition first.minuend second.minuend
  subtrahend := whole_data.addition first.subtrahend second.subtrahend


                                     

             

       
                           
                                                               
                                                                             
                             
                             
   
  
def representative_negation
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (value : FormalDifference whole_data) : FormalDifference whole_data where
  minuend := value.subtrahend
  subtrahend := value.minuend


                                           

             

       
                                 
                                                               
                                                                                    
            
                       
                                                              
                                                                    
               
                       
                                                                 
                                                                 
   
  
def representative_multiplication
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : FormalDifference whole_data where
  minuend :=
    whole_data.addition
      (whole_data.multiplication first.minuend second.minuend)
      (whole_data.multiplication first.subtrahend second.subtrahend)
  subtrahend :=
    whole_data.addition
      (whole_data.multiplication first.minuend second.subtrahend)
      (whole_data.multiplication first.subtrahend second.minuend)

   
                       

             

       
               
                                                               
                                                   
                                                           
   
  
def nonnegative
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (value : FormalDifference whole_data) : Prop :=
  whole_data.nonstrict_order value.subtrahend value.minuend

   
                                       

             

       
                               
                                                               
                                                          
                            
                                                         
                                                           
                                      
   
  
def representative_strict_order
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : Prop :=
  whole_data.nonstrict_order
    (whole_data.addition first.minuend second.subtrahend)
    (whole_data.addition second.minuend first.subtrahend) ∧
  ¬ equivalent whole_data first second

end LRA.NumberSystems.Integers.Tao
