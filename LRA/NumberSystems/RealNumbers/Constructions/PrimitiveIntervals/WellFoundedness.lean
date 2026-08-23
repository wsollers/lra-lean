                                                                                      
                                                         

import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals.Equivalence

namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervals
open LRA.NumberSystems.Interface.ModelTheory

   
                                                                           
                                                                        
                                                                        
                                                                      
                                                                           
                                                      
  

                                                                         
                                                                        
                                                         

             

       
                                  
                                               
                                            
                       
                                                       
                                                
                                                  
   
  
theorem InductionOnRepresentatives
    (rational_model : DenselyOrderedFieldModel)
    (motive : Carrier rational_model → Prop)
    (onRepresentative :
      ∀ representative : Representative rational_model,
        motive (Quotient.mk _ representative)) :
    ∀ value : Carrier rational_model, motive value := by
  sorry

end LRA.NumberSystems.RealNumbers.PrimitiveIntervals
