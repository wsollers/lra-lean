import LRA.AlgebraicStructures
import LRA.NumberSystems.RealNumbers.Definition
import LRA.NumberSystems.RealNumbers.Constructions.EffectiveCauchy.Behavior

namespace LRA.NumberSystems.RealNumbers.EffectiveCauchy

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers
open LRA.AlgebraicStructures
open LRA.Order

noncomputable def quotient_addition
    (rationalSystem : RationalNumberSystem) :
    EffectiveCauchyReal rationalSystem →
      EffectiveCauchyReal rationalSystem → EffectiveCauchyReal rationalSystem :=
  Classical.choose (addition_is_proper rationalSystem).induced_operation_exists

noncomputable def quotient_multiplication
    (rationalSystem : RationalNumberSystem) :
    EffectiveCauchyReal rationalSystem →
      EffectiveCauchyReal rationalSystem → EffectiveCauchyReal rationalSystem :=
  Classical.choose (multiplication_is_proper rationalSystem).induced_operation_exists

noncomputable def quotient_negation
    (rationalSystem : RationalNumberSystem) :
    EffectiveCauchyReal rationalSystem → EffectiveCauchyReal rationalSystem :=
  (negation_is_proper rationalSystem).inducedOperation

noncomputable def quotient_strict_order
    (rationalSystem : RationalNumberSystem) :
    EffectiveCauchyReal rationalSystem → EffectiveCauchyReal rationalSystem → Prop :=
  Classical.choose (strict_order_is_proper rationalSystem).induced_relation_exists

def quotient_nonstrict_order
    (rationalSystem : RationalNumberSystem)
    (first second : EffectiveCauchyReal rationalSystem) : Prop :=
  quotient_strict_order rationalSystem first second ∨ first = second

def quotient_zero (rationalSystem : RationalNumberSystem) : EffectiveCauchyReal rationalSystem :=
  Quotient.mk _ (zero rationalSystem)

def quotient_one (rationalSystem : RationalNumberSystem) : EffectiveCauchyReal rationalSystem :=
  Quotient.mk _ (one rationalSystem)

noncomputable instance CarrierAdd (rationalSystem : RationalNumberSystem) :
    Add (EffectiveCauchyReal rationalSystem) := ⟨quotient_addition rationalSystem⟩

noncomputable instance CarrierMul (rationalSystem : RationalNumberSystem) :
    Mul (EffectiveCauchyReal rationalSystem) := ⟨quotient_multiplication rationalSystem⟩

noncomputable instance CarrierNeg (rationalSystem : RationalNumberSystem) :
    Neg (EffectiveCauchyReal rationalSystem) := ⟨quotient_negation rationalSystem⟩

noncomputable instance CarrierZero (rationalSystem : RationalNumberSystem) :
    OfNat (EffectiveCauchyReal rationalSystem) 0 := ⟨quotient_zero rationalSystem⟩

noncomputable instance CarrierOne (rationalSystem : RationalNumberSystem) :
    OfNat (EffectiveCauchyReal rationalSystem) 1 := ⟨quotient_one rationalSystem⟩

noncomputable instance CarrierLT (rationalSystem : RationalNumberSystem) :
    LT (EffectiveCauchyReal rationalSystem) := ⟨quotient_strict_order rationalSystem⟩

noncomputable instance CarrierLE (rationalSystem : RationalNumberSystem) :
    LE (EffectiveCauchyReal rationalSystem) := ⟨quotient_nonstrict_order rationalSystem⟩

theorem reciprocal_exists_uniquely
    (rationalSystem : RationalNumberSystem)
    (value : EffectiveCauchyReal rationalSystem)
    (value_nonzero : value ≠ (0 : EffectiveCauchyReal rationalSystem)) :
    ∃ reciprocal : EffectiveCauchyReal rationalSystem,
      value * reciprocal = (1 : EffectiveCauchyReal rationalSystem) ∧
      ∀ other, value * other = (1 : EffectiveCauchyReal rationalSystem) → other = reciprocal := by
  sorry

noncomputable def inverse
    (rationalSystem : RationalNumberSystem)
    (value : EffectiveCauchyReal rationalSystem)
    (value_nonzero : value ≠ (0 : EffectiveCauchyReal rationalSystem)) :
    EffectiveCauchyReal rationalSystem :=
  Classical.choose (reciprocal_exists_uniquely rationalSystem value value_nonzero)

open Classical in
noncomputable def totalInverse
    (rationalSystem : RationalNumberSystem)
    (value : EffectiveCauchyReal rationalSystem) : EffectiveCauchyReal rationalSystem :=
  if value_nonzero : value ≠ (0 : EffectiveCauchyReal rationalSystem)
  then inverse rationalSystem value value_nonzero
  else (0 : EffectiveCauchyReal rationalSystem)

noncomputable instance CarrierInv (rationalSystem : RationalNumberSystem) :
    Inv (EffectiveCauchyReal rationalSystem) := ⟨totalInverse rationalSystem⟩

theorem carrier_field_cert
    (rationalSystem : RationalNumberSystem) :
    OrderedFieldLaws (EffectiveCauchyReal rationalSystem) := by
  sorry

theorem carrier_strict_order_cert
    (rationalSystem : RationalNumberSystem) :
    StrictOrderCompatibilityLaw (EffectiveCauchyReal rationalSystem) := by
  sorry

theorem carrier_dense_order_cert
    (rationalSystem : RationalNumberSystem) :
    DenseOrderLaw (EffectiveCauchyReal rationalSystem) := by
  sorry

theorem carrier_completeness_cert
    (rationalSystem : RationalNumberSystem) :
    OrderCompletenessLaws (EffectiveCauchyReal rationalSystem)
      (Set (EffectiveCauchyReal rationalSystem)) := by
  sorry

noncomputable def EffectiveCauchyRealizesDenselyOrderedFieldModel
    (rationalSystem : RationalNumberSystem) :
    LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel where
  Carrier := EffectiveCauchyReal rationalSystem
  addInst := CarrierAdd rationalSystem
  mulInst := CarrierMul rationalSystem
  negInst := CarrierNeg rationalSystem
  invInst := CarrierInv rationalSystem
  zeroInst := CarrierZero rationalSystem
  oneInst := CarrierOne rationalSystem
  ltInst := CarrierLT rationalSystem
  leInst := CarrierLE rationalSystem
  fieldCert := carrier_field_cert rationalSystem
  strictCert := carrier_strict_order_cert rationalSystem
  denseCert := carrier_dense_order_cert rationalSystem

noncomputable def EffectiveCauchyRealizesRealModel
    (rationalSystem : RationalNumberSystem) :
    LRA.NumberSystems.Interface.ModelTheory.RealModel where
  Carrier := EffectiveCauchyReal rationalSystem
  addInst := CarrierAdd rationalSystem
  mulInst := CarrierMul rationalSystem
  negInst := CarrierNeg rationalSystem
  invInst := CarrierInv rationalSystem
  zeroInst := CarrierZero rationalSystem
  oneInst := CarrierOne rationalSystem
  ltInst := CarrierLT rationalSystem
  leInst := CarrierLE rationalSystem
  fieldCert := carrier_field_cert rationalSystem
  strictCert := carrier_strict_order_cert rationalSystem
  denseCert := carrier_dense_order_cert rationalSystem
  completeCert := carrier_completeness_cert rationalSystem

   
                                                                               
                                                                          
                                                                              
                                                                             
                 
  

end LRA.NumberSystems.RealNumbers.EffectiveCauchy
