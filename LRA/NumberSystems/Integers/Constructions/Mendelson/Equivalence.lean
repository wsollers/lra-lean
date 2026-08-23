                                                                      

import LRA.NumberSystems.Integers.Constructions.Mendelson.Carrier

namespace LRA.NumberSystems.Integers.Mendelson

                                                        

             

       
              
                                             
                                                         
                                                  
                                                  
   
  
def equivalent
    (positive_data : PositiveNaturalPairData)
    (first second : PositivePair positive_data) : Prop :=
  positive_data.addition first.left second.right =
    positive_data.addition second.left first.right

                                                          

                             

             

       
                                          
                                               
                                          
   
  
theorem equivalent_is_equivalence_relation
    (positive_data : PositiveNaturalPairData) :
    Equivalence (equivalent positive_data) := by
  sorry

   
                  

             

       
                                                      
                                             
                               
                                                           
   
  
def setoid (positive_data : PositiveNaturalPairData) :
    Setoid (PositivePair positive_data) where
  r := equivalent positive_data
  iseqv := equivalent_is_equivalence_relation positive_data


                                              

             

       
                                                           
                                 
   
  
abbrev Carrier (positive_data : PositiveNaturalPairData) :=
  Quotient (setoid positive_data)

end LRA.NumberSystems.Integers.Mendelson
