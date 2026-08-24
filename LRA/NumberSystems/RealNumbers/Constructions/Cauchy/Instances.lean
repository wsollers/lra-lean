                                                                    
                                                                       

import LRA.AlgebraicStructures
import LRA.NumberSystems.RationalNumbers.Definition
import LRA.NumberSystems.RealNumbers.Definition
import LRA.NumberSystems.RealNumbers.Constructions.Cauchy.Behavior

namespace LRA.NumberSystems.RealNumbers.Cauchy

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers
open LRA.AlgebraicStructures
open LRA.Order

noncomputable def quotient_addition
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data :=
  Classical.choose
    (addition_is_proper rationalSystem absolute_value_data).induced_operation_exists

theorem quotient_addition_spec
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    ∀ first second,
      quotient_addition rationalSystem absolute_value_data
          (Quotient.mk _ first) (Quotient.mk _ second) =
        Quotient.mk _ (addition rationalSystem absolute_value_data first second) := by
  sorry

noncomputable def quotient_multiplication
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data :=
  Classical.choose
    (multiplication_is_proper rationalSystem absolute_value_data).induced_operation_exists

theorem quotient_multiplication_spec
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    ∀ first second,
      quotient_multiplication rationalSystem absolute_value_data
          (Quotient.mk _ first) (Quotient.mk _ second) =
        Quotient.mk _ (multiplication rationalSystem absolute_value_data first second) := by
  sorry

noncomputable def quotient_negation
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data :=
  (negation_is_proper rationalSystem absolute_value_data).inducedOperation

noncomputable def quotient_inverse
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data :=
  (inverse_is_proper rationalSystem absolute_value_data).inducedOperation

noncomputable def quotient_strict_order
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data → Prop :=
  Classical.choose
    (strict_order_is_proper rationalSystem absolute_value_data).induced_relation_exists

theorem quotient_strict_order_spec
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    ∀ first second,
      quotient_strict_order rationalSystem absolute_value_data
          (Quotient.mk _ first) (Quotient.mk _ second) ↔
        representative_strict_order rationalSystem absolute_value_data first second := by
  sorry

def quotient_nonstrict_order
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Carrier rationalSystem absolute_value_data) : Prop :=
  quotient_strict_order rationalSystem absolute_value_data first second ∨ first = second

noncomputable instance quotientCarrierAdd
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Add (Carrier rationalSystem absolute_value_data) :=
  ⟨quotient_addition rationalSystem absolute_value_data⟩

noncomputable instance quotientCarrierMul
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Mul (Carrier rationalSystem absolute_value_data) :=
  ⟨quotient_multiplication rationalSystem absolute_value_data⟩

noncomputable instance quotientCarrierNeg
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Neg (Carrier rationalSystem absolute_value_data) :=
  ⟨quotient_negation rationalSystem absolute_value_data⟩

noncomputable instance quotientCarrierInv
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Inv (Carrier rationalSystem absolute_value_data) :=
  ⟨quotient_inverse rationalSystem absolute_value_data⟩

noncomputable instance quotientCarrierZero
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    OfNat (Carrier rationalSystem absolute_value_data) 0 :=
  ⟨Quotient.mk _ (zero rationalSystem absolute_value_data)⟩

noncomputable instance quotientCarrierOne
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    OfNat (Carrier rationalSystem absolute_value_data) 1 :=
  ⟨Quotient.mk _ (one rationalSystem absolute_value_data)⟩

noncomputable instance quotientCarrierLT
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LT (Carrier rationalSystem absolute_value_data) :=
  ⟨quotient_strict_order rationalSystem absolute_value_data⟩

noncomputable instance quotientCarrierLE
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LE (Carrier rationalSystem absolute_value_data) :=
  ⟨quotient_nonstrict_order rationalSystem absolute_value_data⟩

theorem quotient_field_cert
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    OrderedFieldLaws (Carrier rationalSystem absolute_value_data) := by
  sorry

theorem quotient_strict_order_cert
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    StrictOrderCompatibilityLaw (Carrier rationalSystem absolute_value_data) := by
  sorry

theorem quotient_dense_order_cert
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    DenseOrderLaw (Carrier rationalSystem absolute_value_data) := by
  sorry

theorem quotient_completeness_cert
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    OrderCompletenessLaws (Carrier rationalSystem absolute_value_data)
      (Set (Carrier rationalSystem absolute_value_data)) := by
  sorry

noncomputable def CauchyRealizesDenselyOrderedFieldModel
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel where
  Carrier := Carrier rationalSystem absolute_value_data
  addInst := quotientCarrierAdd rationalSystem absolute_value_data
  mulInst := quotientCarrierMul rationalSystem absolute_value_data
  negInst := quotientCarrierNeg rationalSystem absolute_value_data
  invInst := quotientCarrierInv rationalSystem absolute_value_data
  zeroInst := quotientCarrierZero rationalSystem absolute_value_data
  oneInst := quotientCarrierOne rationalSystem absolute_value_data
  ltInst := quotientCarrierLT rationalSystem absolute_value_data
  leInst := quotientCarrierLE rationalSystem absolute_value_data
  fieldCert := quotient_field_cert rationalSystem absolute_value_data
  strictCert := quotient_strict_order_cert rationalSystem absolute_value_data
  denseCert := quotient_dense_order_cert rationalSystem absolute_value_data

noncomputable def CauchyRealizesRealModel
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.NumberSystems.Interface.ModelTheory.RealModel where
  Carrier := Carrier rationalSystem absolute_value_data
  addInst := quotientCarrierAdd rationalSystem absolute_value_data
  mulInst := quotientCarrierMul rationalSystem absolute_value_data
  negInst := quotientCarrierNeg rationalSystem absolute_value_data
  invInst := quotientCarrierInv rationalSystem absolute_value_data
  zeroInst := quotientCarrierZero rationalSystem absolute_value_data
  oneInst := quotientCarrierOne rationalSystem absolute_value_data
  ltInst := quotientCarrierLT rationalSystem absolute_value_data
  leInst := quotientCarrierLE rationalSystem absolute_value_data
  fieldCert := quotient_field_cert rationalSystem absolute_value_data
  strictCert := quotient_strict_order_cert rationalSystem absolute_value_data
  denseCert := quotient_dense_order_cert rationalSystem absolute_value_data
  completeCert := quotient_completeness_cert rationalSystem absolute_value_data

                                                                        
                                     

                                                                             
                                                                         
                                                                    
                                                                           
                                                                            
                                                                              
                                                        

             

       
                                           
                                           
                                                             
                     
                                                                           
                                       
                                                
   
  
theorem CauchyRealizesRationalRealExtension
    (rationalSystem : RationalNumberSystem)
    (absoluteValueData : RationalMetricData rationalSystem) :
    ∃ realExtension :
        LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem,
      realExtension.RealModel.Carrier =
        Carrier rationalSystem absoluteValueData := by
  sorry

end LRA.NumberSystems.RealNumbers.Cauchy
