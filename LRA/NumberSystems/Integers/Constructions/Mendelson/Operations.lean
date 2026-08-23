                                                                     

import LRA.NumberSystems.Integers.Constructions.Mendelson.WellFoundedness

namespace LRA.NumberSystems.Integers.Mendelson

                                           

             

       
                           
                                             
                                                                                  
                                                       
                                                          
   
  
def representative_addition
    (positive_data : PositiveNaturalPairData)
    (first second : PositivePair positive_data) : PositivePair positive_data where
  left := positive_data.addition first.left second.left
  right := positive_data.addition first.right second.right


                                         

             

       
                           
                                             
                                                                           
                     
                     
   
  
def representative_negation
    (positive_data : PositiveNaturalPairData)
    (value : PositivePair positive_data) : PositivePair positive_data where
  left := value.right
  right := value.left


                                                 

             

       
                                 
                                             
                                                                                  
         
                          
                                                           
                                                             
          
                          
                                                            
                                                            
   
  
def representative_multiplication
    (positive_data : PositiveNaturalPairData)
    (first second : PositivePair positive_data) : PositivePair positive_data where
  left :=
    positive_data.addition
      (positive_data.multiplication first.left second.left)
      (positive_data.multiplication first.right second.right)
  right :=
    positive_data.addition
      (positive_data.multiplication first.left second.right)
      (positive_data.multiplication first.right second.left)

   
                          

             

       
                  
                                             
                                                  
                                                        
                                    
                                                               
   
  
def positive_class
    (positive_data : PositiveNaturalPairData)
    (value : PositivePair positive_data) : Prop :=
  positive_data.nonstrict_order value.right value.left ∧
    ¬ equivalent positive_data value
      { left := positive_data.one, right := positive_data.one }

   
                                       

             

       
                               
                                             
                                                         
                              
                                                            
                                                               
   
  
def representative_strict_order
    (positive_data : PositiveNaturalPairData)
    (first second : PositivePair positive_data) : Prop :=
  positive_class positive_data
    { left := positive_data.addition second.left first.right
      right := positive_data.addition first.left second.right }

end LRA.NumberSystems.Integers.Mendelson
