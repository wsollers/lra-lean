                                                                      
                                                           

import LRA.NumberSystems.RealNumbers.Constructions.Cantor.Carrier

namespace LRA.NumberSystems.RealNumbers.Cantor

open LRA.NumberSystems.Interface.ModelTheory

                                                                          
                                                                              
                            

                                                                            
                                                                            
                                                                     
         

             

       
                      
                                           
                                                                
                                   
                   
                    
                                                                                    
                                                                                  
   
  
def EndpointEquivalent
    (fieldModel : DenselyOrderedFieldModel)
    (first second : NestedIntervalSequence fieldModel) : Prop :=
  ∀ tolerance : fieldModel.Carrier,
    0 < tolerance →
      ∃ index : Nat,
        fieldModel.signature.StrictOrder
          (fieldModel.signature.add
            (first.interval index).lower
            (fieldModel.signature.neg (second.interval index).upper))
          tolerance ∧
        fieldModel.signature.StrictOrder
          (fieldModel.signature.add
            (second.interval index).lower
            (fieldModel.signature.neg (first.interval index).upper))
          tolerance

                                                                               
                   

                                                                       
                                                                             
                                

             

       
                                       
                                             
                                               
   
  
theorem EndpointEquivalentIsEquivalence
    (fieldModel : DenselyOrderedFieldModel) :
    Equivalence (EndpointEquivalent fieldModel) := by
  sorry

                                                                           
      

             

       
                                                            
                                              
   
  
def EndpointSetoid (fieldModel : DenselyOrderedFieldModel) :
    Setoid (NestedIntervalSequence fieldModel) where
  r := EndpointEquivalent fieldModel
  iseqv := EndpointEquivalentIsEquivalence fieldModel

                                                                       
abbrev Carrier (fieldModel : DenselyOrderedFieldModel) :=
  Quotient (EndpointSetoid fieldModel)

end LRA.NumberSystems.RealNumbers.Cantor
