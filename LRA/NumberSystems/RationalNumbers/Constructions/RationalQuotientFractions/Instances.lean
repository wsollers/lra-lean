                                                                                           
                                             

import LRA.AlgebraicStructures
import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions.Behavior
import LRA.NumberSystems.RationalNumbers.Definition
import LRA.NumberSystems.Models

namespace LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

open LRA.AlgebraicStructures
open LRA.Order
open LRA.NumberSystems.Models

noncomputable instance rationalCarrierAdd
    (rationalData : IntegerAndPositiveNaturalData) :
    Add (Carrier rationalData) := ⟨addition rationalData⟩

noncomputable instance rationalCarrierMul
    (rationalData : IntegerAndPositiveNaturalData) :
    Mul (Carrier rationalData) := ⟨multiplication rationalData⟩

noncomputable instance rationalCarrierNeg
    (rationalData : IntegerAndPositiveNaturalData) :
    Neg (Carrier rationalData) := ⟨negation rationalData⟩

noncomputable def quotient_inverse
    (rationalData : IntegerAndPositiveNaturalData) :
    Carrier rationalData → Carrier rationalData := by
  classical
  intro value
  by_cases valueIsZero : value = zero rationalData
  · exact zero rationalData
  · exact inverse rationalData value valueIsZero

noncomputable instance rationalCarrierInv
    (rationalData : IntegerAndPositiveNaturalData) :
    Inv (Carrier rationalData) := ⟨quotient_inverse rationalData⟩

noncomputable instance rationalCarrierZero
    (rationalData : IntegerAndPositiveNaturalData) :
    OfNat (Carrier rationalData) 0 := ⟨zero rationalData⟩

noncomputable instance rationalCarrierOne
    (rationalData : IntegerAndPositiveNaturalData) :
    OfNat (Carrier rationalData) 1 := ⟨one rationalData⟩

noncomputable instance rationalCarrierLT
    (rationalData : IntegerAndPositiveNaturalData) :
    LT (Carrier rationalData) := ⟨strict_order rationalData⟩

noncomputable instance rationalCarrierLE
    (rationalData : IntegerAndPositiveNaturalData) :
    LE (Carrier rationalData) := ⟨nonstrict_order rationalData⟩

theorem RationalFieldCert
    (rationalData : IntegerAndPositiveNaturalData) :
    OrderedFieldLaws (Carrier rationalData) := by
  sorry

theorem RationalStrictOrderCert
    (rationalData : IntegerAndPositiveNaturalData) :
    StrictOrderCompatibilityLaw (Carrier rationalData) := by
  sorry

theorem RationalDenseOrderCert
    (rationalData : IntegerAndPositiveNaturalData) :
    DenseOrderLaw (Carrier rationalData) := by
  sorry

   
                                                                              
                                                                           
                                                                                
                                                           
  

                                                                            

             

       
                                                                           
                                                    
                                                     
   
  
noncomputable def RationalQuotientFractionsRealizesDenselyOrderedFieldModel
    (rationalData : IntegerAndPositiveNaturalData) :
    LRA.NumberSystems.Models.DenselyOrderedFieldModel where
  Carrier := Carrier rationalData
  addInst := rationalCarrierAdd rationalData
  mulInst := rationalCarrierMul rationalData
  negInst := rationalCarrierNeg rationalData
  invInst := rationalCarrierInv rationalData
  zeroInst := rationalCarrierZero rationalData
  oneInst := rationalCarrierOne rationalData
  ltInst := rationalCarrierLT rationalData
  leInst := rationalCarrierLE rationalData
  fieldCert := RationalFieldCert rationalData
  strictCert := RationalStrictOrderCert rationalData
  denseCert := RationalDenseOrderCert rationalData

theorem RationalIntegerEmbeddingPreservesNegation
    (rationalData : IntegerAndPositiveNaturalData) :
    ∀ value : rationalData.integer_system.Model.Carrier,
      integer_embedding rationalData (-value) = -(integer_embedding rationalData value) := by
  sorry

theorem RationalIntegerEmbeddingPreservesOrder
    (rationalData : IntegerAndPositiveNaturalData) :
    ∀ first second : rationalData.integer_system.Model.Carrier,
      integer_embedding rationalData first ≤ integer_embedding rationalData second ↔
        first ≤ second := by
  sorry

noncomputable def RationalIntegerEmbedding
    (rationalData : IntegerAndPositiveNaturalData) :
    OrderedRingEmbeddingIntoDenseOrderedField
      rationalData.integer_system.Model
      (RationalQuotientFractionsRealizesDenselyOrderedFieldModel rationalData) where
  ToField := integer_embedding rationalData
  injective := (integer_embedding_properties rationalData).1
  PreservesZero := (integer_embedding_properties rationalData).2.1
  PreservesOne := (integer_embedding_properties rationalData).2.2.1
  PreservesAddition := (integer_embedding_properties rationalData).2.2.2.1
  PreservesNegation := RationalIntegerEmbeddingPreservesNegation rationalData
  PreservesMultiplication := (integer_embedding_properties rationalData).2.2.2.2.1
  PreservesAndReflectsOrder := RationalIntegerEmbeddingPreservesOrder rationalData

theorem RationalEveryElementIsIntegerFraction
    (rationalData : IntegerAndPositiveNaturalData) :
    ∀ q : (RationalQuotientFractionsRealizesDenselyOrderedFieldModel rationalData).Carrier,
      ∃ numerator denominator : rationalData.integer_system.Model.Carrier,
        denominator ≠ 0 ∧
        q =
          (RationalIntegerEmbedding rationalData).ToField numerator *
            ((RationalIntegerEmbedding rationalData).ToField denominator)⁻¹ := by
  sorry

                                                                               
                                                                      

             

       
                                                                       
                                                    
                                                          
   
  
noncomputable def RationalQuotientFractionsRealizesRationalNumberSystem
    (rationalData : IntegerAndPositiveNaturalData) :
    LRA.NumberSystems.RationalNumbers.RationalNumberSystem where
  IntegerSystem := rationalData.integer_system
  FieldModel :=
    RationalQuotientFractionsRealizesDenselyOrderedFieldModel rationalData
  IntegerEmbedding := RationalIntegerEmbedding rationalData
  EveryElementIsIntegerFraction := RationalEveryElementIsIntegerFraction rationalData

end LRA.NumberSystems.RationalNumbers.RationalQuotientFractions
