                                                      
                                                      

import LRA.Function.Properties.Definition
import LRA.NumberSystems.Models.CanonicalEmbeddings

namespace LRA.NumberSystems.Models.UniversalProperties

universe u

   
                                     
                                                         
                                                           
                                                     

                                                                              
                                                                            
                                                                         
                              
                                                      
  

                                                                       

             

       
                                              
                                                    
                                     
                            
                                                                                    
                                                          
                                                                  
                                          
   
  
structure CompleteOrderedFieldCharacterization
    (SelectedRealModel : RealModel.{u}) : Prop where
  UniqueUpToOrderedFieldIsomorphism :
    ∀ other : RealModel.{u},
      ∃! comparison : SelectedRealModel.signature.carrier → other.signature.carrier,
        CanonicalEmbeddings.EmbeddingPreservesOrderedField
          SelectedRealModel.signature other.signature comparison ∧
        LRA.Function.Surjective comparison

end LRA.NumberSystems.Models.UniversalProperties
