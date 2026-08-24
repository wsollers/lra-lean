                                                                    
                                                                              

import LRA.AlgebraicStructures
import LRA.NumberSystems.RationalNumbers.Definition
import LRA.NumberSystems.RealNumbers.Definition
import LRA.NumberSystems.RealNumbers.Constructions.Cantor.Behavior

namespace LRA.NumberSystems.RealNumbers.Cantor

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers
open LRA.AlgebraicStructures
open LRA.Order

noncomputable def quotient_addition
    (fieldModel : DenselyOrderedFieldModel) :
    Carrier fieldModel → Carrier fieldModel → Carrier fieldModel :=
  Classical.choose (addition_is_proper fieldModel).induced_operation_exists

noncomputable def quotient_multiplication
    (fieldModel : DenselyOrderedFieldModel) :
    Carrier fieldModel → Carrier fieldModel → Carrier fieldModel :=
  Classical.choose (multiplication_is_proper fieldModel).induced_operation_exists

noncomputable def quotient_negation
    (fieldModel : DenselyOrderedFieldModel) :
    Carrier fieldModel → Carrier fieldModel :=
  (negation_is_proper fieldModel).inducedOperation

noncomputable def quotient_strict_order
    (fieldModel : DenselyOrderedFieldModel) :
    Carrier fieldModel → Carrier fieldModel → Prop :=
  Classical.choose (strict_order_is_proper fieldModel).induced_relation_exists

def quotient_nonstrict_order
    (fieldModel : DenselyOrderedFieldModel)
    (first second : Carrier fieldModel) : Prop :=
  quotient_strict_order fieldModel first second ∨ first = second

noncomputable def quotient_zero (fieldModel : DenselyOrderedFieldModel) : Carrier fieldModel :=
  Quotient.mk _ (zero fieldModel)

noncomputable def quotient_one (fieldModel : DenselyOrderedFieldModel) : Carrier fieldModel :=
  Quotient.mk _ (one fieldModel)

noncomputable instance CarrierAdd (fieldModel : DenselyOrderedFieldModel) :
    Add (Carrier fieldModel) := ⟨quotient_addition fieldModel⟩

noncomputable instance CarrierMul (fieldModel : DenselyOrderedFieldModel) :
    Mul (Carrier fieldModel) := ⟨quotient_multiplication fieldModel⟩

noncomputable instance CarrierNeg (fieldModel : DenselyOrderedFieldModel) :
    Neg (Carrier fieldModel) := ⟨quotient_negation fieldModel⟩

noncomputable instance CarrierZero (fieldModel : DenselyOrderedFieldModel) :
    OfNat (Carrier fieldModel) 0 := ⟨quotient_zero fieldModel⟩

noncomputable instance CarrierOne (fieldModel : DenselyOrderedFieldModel) :
    OfNat (Carrier fieldModel) 1 := ⟨quotient_one fieldModel⟩

noncomputable instance CarrierLT (fieldModel : DenselyOrderedFieldModel) :
    LT (Carrier fieldModel) := ⟨quotient_strict_order fieldModel⟩

noncomputable instance CarrierLE (fieldModel : DenselyOrderedFieldModel) :
    LE (Carrier fieldModel) := ⟨quotient_nonstrict_order fieldModel⟩

theorem reciprocal_exists_uniquely
    (fieldModel : DenselyOrderedFieldModel)
    (value : Carrier fieldModel)
    (value_nonzero : value ≠ (0 : Carrier fieldModel)) :
    ∃ reciprocal : Carrier fieldModel,
      value * reciprocal = (1 : Carrier fieldModel) ∧
      ∀ other, value * other = (1 : Carrier fieldModel) → other = reciprocal := by
  sorry

noncomputable def inverse
    (fieldModel : DenselyOrderedFieldModel)
    (value : Carrier fieldModel)
    (value_nonzero : value ≠ (0 : Carrier fieldModel)) : Carrier fieldModel :=
  Classical.choose (reciprocal_exists_uniquely fieldModel value value_nonzero)

open Classical in
noncomputable def totalInverse
    (fieldModel : DenselyOrderedFieldModel)
    (value : Carrier fieldModel) : Carrier fieldModel :=
  if value_nonzero : value ≠ (0 : Carrier fieldModel)
  then inverse fieldModel value value_nonzero
  else (0 : Carrier fieldModel)

noncomputable instance CarrierInv (fieldModel : DenselyOrderedFieldModel) :
    Inv (Carrier fieldModel) := ⟨totalInverse fieldModel⟩

theorem carrier_field_cert
    (fieldModel : DenselyOrderedFieldModel) :
    OrderedFieldLaws (Carrier fieldModel) := by
  sorry

theorem carrier_strict_order_cert
    (fieldModel : DenselyOrderedFieldModel) :
    StrictOrderCompatibilityLaw (Carrier fieldModel) := by
  sorry

theorem carrier_dense_order_cert
    (fieldModel : DenselyOrderedFieldModel) :
    DenseOrderLaw (Carrier fieldModel) := by
  sorry

theorem carrier_completeness_cert
    (fieldModel : DenselyOrderedFieldModel) :
    OrderCompletenessLaws (Carrier fieldModel) (Set (Carrier fieldModel)) := by
  sorry

noncomputable def CantorRealizesDenselyOrderedFieldModel
    (fieldModel : DenselyOrderedFieldModel) :
    LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel where
  Carrier := Carrier fieldModel
  addInst := CarrierAdd fieldModel
  mulInst := CarrierMul fieldModel
  negInst := CarrierNeg fieldModel
  invInst := CarrierInv fieldModel
  zeroInst := CarrierZero fieldModel
  oneInst := CarrierOne fieldModel
  ltInst := CarrierLT fieldModel
  leInst := CarrierLE fieldModel
  fieldCert := carrier_field_cert fieldModel
  strictCert := carrier_strict_order_cert fieldModel
  denseCert := carrier_dense_order_cert fieldModel

noncomputable def CantorRealizesRealModel
    (fieldModel : DenselyOrderedFieldModel) :
    LRA.NumberSystems.Interface.ModelTheory.RealModel where
  Carrier := Carrier fieldModel
  addInst := CarrierAdd fieldModel
  mulInst := CarrierMul fieldModel
  negInst := CarrierNeg fieldModel
  invInst := CarrierInv fieldModel
  zeroInst := CarrierZero fieldModel
  oneInst := CarrierOne fieldModel
  ltInst := CarrierLT fieldModel
  leInst := CarrierLE fieldModel
  fieldCert := carrier_field_cert fieldModel
  strictCert := carrier_strict_order_cert fieldModel
  denseCert := carrier_dense_order_cert fieldModel
  completeCert := carrier_completeness_cert fieldModel

                                                                             
                                                

                                                                              
                                                                             
                                                                               
                            

             

       
                                           
                                             
                     
                                                                           
                                                                         
   
  
theorem CantorRealizesRationalRealExtension
    (rationalSystem : RationalNumberSystem) :
    ∃ realExtension :
        LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem,
      realExtension.RealModel.Carrier = Carrier rationalSystem.FieldModel := by
  sorry

end LRA.NumberSystems.RealNumbers.Cantor
