import LRA.NumberSystems.Integers.Definition
import LRA.NumberSystems.Models

namespace LRA.NumberSystems.RationalNumbers

open LRA.NumberSystems.Models
open LRA.NumberSystems.Integers

universe u

                                                                        
                                                                         
                                                                   

                                                                    
                                                                    
                                                                          
                        

             

       
                                                   
                                         
                                           
                    
                                                                            
                                 
                             
                                                            
                         
           
                                              
                                                    
   
  
structure RationalNumberSystem : Type (u + 1) where
  IntegerSystem : IntegerNumberSystem.{u}
  FieldModel : DenselyOrderedFieldModel.{u}
  IntegerEmbedding :
    OrderedRingEmbeddingIntoDenseOrderedField IntegerSystem.Model FieldModel
  EveryElementIsIntegerFraction :
    ∀ q : FieldModel.Carrier,
      ∃ numerator denominator : IntegerSystem.Model.Carrier,
        denominator ≠ 0 ∧
        q =
          IntegerEmbedding.ToField numerator *
            (IntegerEmbedding.ToField denominator)⁻¹

end LRA.NumberSystems.RationalNumbers
