                                                                               
                                            

import LRA.AlgebraicStructures
import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs.Behavior
import LRA.NumberSystems.Interface.ModelTheory.Model

namespace LRA.NumberSystems.Integers.QuotientOrderedPairs

open LRA.AlgebraicStructures
open LRA.Order

noncomputable def quotient_addition
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Carrier whole_data → Carrier whole_data → Carrier whole_data :=
  Classical.choose (quotient_addition_exists whole_data)

theorem quotient_addition_spec
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∀ first second,
      quotient_addition whole_data (Quotient.mk _ first) (Quotient.mk _ second) =
        Quotient.mk _ (representative_addition whole_data first second) := by

  sorry

noncomputable def quotient_multiplication
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Carrier whole_data → Carrier whole_data → Carrier whole_data :=
  Classical.choose (quotient_multiplication_exists whole_data)

theorem quotient_multiplication_spec
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∀ first second,
      quotient_multiplication whole_data (Quotient.mk _ first) (Quotient.mk _ second) =
        Quotient.mk _ (representative_multiplication whole_data first second) := by

  sorry

noncomputable def quotient_negation
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Carrier whole_data → Carrier whole_data :=
  Quotient.lift
    (fun representative => Quotient.mk _ (representative_negation whole_data representative))
    (fun first second equivalentRepresentatives =>
      Quotient.sound
        (representative_negation_respects_equivalence whole_data
          first second equivalentRepresentatives))

noncomputable def quotient_nonstrict_order
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Carrier whole_data → Carrier whole_data → Prop :=
  Classical.choose (quotient_order_exists whole_data)

theorem quotient_nonstrict_order_spec
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∀ first second,
      quotient_nonstrict_order whole_data (Quotient.mk _ first) (Quotient.mk _ second) ↔
        representative_nonstrict_order whole_data first second := by

  sorry

def quotient_strict_order
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (first second : Carrier whole_data) : Prop :=
  quotient_nonstrict_order whole_data first second ∧ first ≠ second

noncomputable instance quotientCarrierAdd
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Add (Carrier whole_data) := ⟨quotient_addition whole_data⟩

noncomputable instance quotientCarrierMul
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Mul (Carrier whole_data) := ⟨quotient_multiplication whole_data⟩

noncomputable instance quotientCarrierNeg
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Neg (Carrier whole_data) := ⟨quotient_negation whole_data⟩

noncomputable instance quotientCarrierZero
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    OfNat (Carrier whole_data) 0 := ⟨Quotient.mk _ (zero_representative whole_data)⟩

noncomputable instance quotientCarrierOne
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    OfNat (Carrier whole_data) 1 := ⟨Quotient.mk _ (one_representative whole_data)⟩

noncomputable instance quotientCarrierLT
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LT (Carrier whole_data) := ⟨quotient_strict_order whole_data⟩

noncomputable instance quotientCarrierLE
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LE (Carrier whole_data) := ⟨quotient_nonstrict_order whole_data⟩

theorem quotient_domain_cert
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    IntegralDomainLaws (Carrier whole_data) := by
  sorry

theorem quotient_linear_order_cert
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LinearOrderLaws (Carrier whole_data) := by
  sorry

theorem quotient_strict_order_cert
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    StrictOrderCompatibilityLaw (Carrier whole_data) := by
  sorry

theorem quotient_addition_order_cert
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    AdditionRespectsOrderLaws (Carrier whole_data) := by
  sorry

theorem quotient_multiplication_order_cert
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    MultiplicationRespectsOrderLaws (Carrier whole_data) := by
  sorry

theorem quotient_discrete_order_cert
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    OrderDiscretenessLaw (Carrier whole_data) := by
  sorry

   
                                                                     
                                                                            
                                                                                                    
                                                                      
                                                                            
                                                                        
                                                                         
                                                     
  

                                                                                                   
                                                               
noncomputable def QuotientOrderedPairsRealizesIntegerModel
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.NumberSystems.Interface.ModelTheory.DiscretelyOrderedIntegralDomainModel where
  Carrier := Carrier whole_data
  addInst := quotientCarrierAdd whole_data
  mulInst := quotientCarrierMul whole_data
  negInst := quotientCarrierNeg whole_data
  zeroInst := quotientCarrierZero whole_data
  oneInst := quotientCarrierOne whole_data
  ltInst := quotientCarrierLT whole_data
  leInst := quotientCarrierLE whole_data
  domainCert := quotient_domain_cert whole_data
  orderCert := quotient_linear_order_cert whole_data
  strictCert := quotient_strict_order_cert whole_data
  addOrderCert := quotient_addition_order_cert whole_data
  mulOrderCert := quotient_multiplication_order_cert whole_data
  discreteCert := quotient_discrete_order_cert whole_data

end LRA.NumberSystems.Integers.QuotientOrderedPairs
