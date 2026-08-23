                                                                                 
                                                                         
                                                                      
                                                                    
                   
  
                                                             
                                                  
                                                            
                                                                        
                                                                           
                                                        
                                                                         
                                                                       
                                                                       
                                                                          
                                                                     
                                                                             
                                                                            
                               

import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals.WellFoundedness

namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervals
open LRA.NumberSystems.Models

variable (rational_model : DenselyOrderedFieldModel)

                                                                

                                                                                                                  


             

       
                 
                                                                     
                        
                                  
                                                  
                         
                                  
                                                  
   
  
def IsIntervalSum
    (first second result : RationalInterval rational_model) : Prop :=
  result.left_endpoint =
      rational_model.signature.add
        first.left_endpoint second.left_endpoint ∧
  result.right_endpoint =
      rational_model.signature.add
        first.right_endpoint second.right_endpoint


                                                                

                                                                                                                   


             

       
                      
                                                                 
                        
                                                            
                         
                                                         
   
  
def IsIntervalNegation
    (interval result : RationalInterval rational_model) : Prop :=
  result.left_endpoint =
      rational_model.signature.neg interval.right_endpoint ∧
  result.right_endpoint =
      rational_model.signature.neg interval.left_endpoint


                                              

                                                                                                                                               


             

       
                   
                                                    
                                               
                                           
                                                
                                           
                                                 
                                           
                                                 
                                           
                                                
   
  
def IsCornerProduct
    (first second : RationalInterval rational_model)
    (value : Rational rational_model) : Prop :=
  value = rational_model.signature.multiply
      first.left_endpoint second.left_endpoint ∨
  value = rational_model.signature.multiply
      first.left_endpoint second.right_endpoint ∨
  value = rational_model.signature.multiply
      first.right_endpoint second.left_endpoint ∨
  value = rational_model.signature.multiply
      first.right_endpoint second.right_endpoint


                                                                         

                                                                                                                      


             

       
                     
                                                                     
            
                                                        
                                                              
            
                                                        
                                                               
                                                                    
                                                                   
   
  
def IsIntervalProduct
    (first second result : RationalInterval rational_model) : Prop :=
  (∀ corner,
    IsCornerProduct rational_model first second corner →
    rational_model.signature.le result.left_endpoint corner) ∧
  (∀ corner,
    IsCornerProduct rational_model first second corner →
    rational_model.signature.le corner result.right_endpoint) ∧
  IsCornerProduct rational_model first second result.left_endpoint ∧
  IsCornerProduct rational_model first second result.right_endpoint


                                 

                                                                                 


             

       
                                                  
                                                                 
   
  
noncomputable def zero : Carrier rational_model :=
  rational_embedding rational_model rational_model.signature.zero

   
               

                                                                                


             

       
                                                 
                                                                
   
  
noncomputable def one : Carrier rational_model :=
  rational_embedding rational_model rational_model.signature.one


                                               

                                                                                                                       


             

       
                               
                                                            
                             
                                        
                                                 
                                                  
   
  
def representative_strict_order
    (first second : Representative rational_model) : Prop :=
  ∃ first_index second_index,
    rational_model.signature.StrictOrder
      (first.interval first_index).right_endpoint
      (second.interval second_index).left_endpoint

end LRA.NumberSystems.RealNumbers.PrimitiveIntervals
