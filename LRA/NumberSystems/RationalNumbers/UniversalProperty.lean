import LRA.NumberSystems.RationalNumbers.Definition
import LRA.NumberSystems.Interface.ModelTheory.CanonicalEmbeddings

namespace LRA.NumberSystems.RationalNumbers

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.Interface.ModelTheory.CanonicalEmbeddings

universe u

                                                                         

                                                                        
                                                                              
                                                               

             

       
                                      
                                               
                                           
                                                                              
                            
                                   
                                                    
                                               
                     
                                                                        
                                    
                                                                            
                                                                    
                     
                                                                      
                                   
   
  
theorem FractionFieldUniversalProperty
    (rationalSystem : RationalNumberSystem.{u})
    (target : DenselyOrderedFieldModel.{u})
    (integerMap : rationalSystem.IntegerSystem.Model.Carrier → target.Carrier)
    (integerMapIsEmbedding :
      EmbeddingPreservesOrderedRing
        rationalSystem.IntegerSystem.Model.signature
        target.signature.toOrderedRingSignature
        integerMap) :
    ∃! rationalMap : rationalSystem.FieldModel.Carrier → target.Carrier,
      EmbeddingPreservesOrderedField
          rationalSystem.FieldModel.signature target.signature rationalMap ∧
        ∀ integerValue : rationalSystem.IntegerSystem.Model.Carrier,
          rationalMap
              (rationalSystem.IntegerEmbedding.ToField integerValue) =
            integerMap integerValue := by
  sorry

end LRA.NumberSystems.RationalNumbers
