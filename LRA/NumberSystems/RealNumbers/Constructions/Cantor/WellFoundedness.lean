                                                                          
                                                         

import LRA.NumberSystems.RealNumbers.Constructions.Cantor.Equivalence

namespace LRA.NumberSystems.RealNumbers.Cantor
open LRA.NumberSystems.Interface.ModelTheory

   
                                                                           
                                                                        
                                                                          
                                                                         
                                                                       
                                                                       
  

                                                                     
                                                                          
                     

             

       
                                  
                                               
                                            
                       
                                                               
                                                
                                                  
   
  
theorem InductionOnRepresentatives
    (rational_model : DenselyOrderedFieldModel)
    (motive : Carrier rational_model → Prop)
    (onRepresentative :
      ∀ representative : NestedIntervalSequence rational_model,
        motive (Quotient.mk _ representative)) :
    ∀ value : Carrier rational_model, motive value := by
  sorry

end LRA.NumberSystems.RealNumbers.Cantor
