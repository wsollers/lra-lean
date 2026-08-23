                                                                            
                                                        

import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.Equivalence

namespace LRA.NumberSystems.RealNumbers.Dedekind
open LRA.NumberSystems.Models

   
                                                                         
                                                                      
                                                                  
                                                                      
                                                                         
                                                                         
                                                                
                                                                        
                                       
  

variable (rational_model : DenselyOrderedFieldModel)

                                                                        
                                                                        
                                                    

             

       
                       
                                        
                 
                                                                                          
                                    
                                          
   
  
theorem InductionOnCuts
    (motive : Cut rational_model → Prop)
    (onLowerSet :
      ∀ (lower_set : RationalSet rational_model) (isCut : IsCut rational_model lower_set),
        motive ⟨lower_set, isCut⟩) :
    ∀ cut : Cut rational_model, motive cut := by
  sorry

end LRA.NumberSystems.RealNumbers.Dedekind
