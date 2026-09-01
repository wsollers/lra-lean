import LRA.AlgebraicStructures
import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs.Instances

namespace LRA.NumberSystems.Integers.QuotientOrderedPairs

open LRA.AlgebraicStructures

/-- The quotient-of-ordered-pairs construction canonically realizes integral
domain structure. -/
theorem satisfiesIntegralDomain
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    let _ : Add (Carrier whole_data) := quotientCarrierAdd whole_data
    let _ : Mul (Carrier whole_data) := quotientCarrierMul whole_data
    let _ : Neg (Carrier whole_data) := quotientCarrierNeg whole_data
    let _ : OfNat (Carrier whole_data) 0 := quotientCarrierZero whole_data
    let _ : OfNat (Carrier whole_data) 1 := quotientCarrierOne whole_data
    let _ : Nonempty (Carrier whole_data) := ⟨0⟩
    IntegralDomainLaws (Carrier whole_data) := by
  sorry

/-- The quotient-of-ordered-pairs construction canonically realizes ordered
ring structure. -/
theorem satisfiesOrderedRing
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    let _ : Add (Carrier whole_data) := quotientCarrierAdd whole_data
    let _ : Mul (Carrier whole_data) := quotientCarrierMul whole_data
    let _ : Neg (Carrier whole_data) := quotientCarrierNeg whole_data
    let _ : OfNat (Carrier whole_data) 0 := quotientCarrierZero whole_data
    let _ : OfNat (Carrier whole_data) 1 := quotientCarrierOne whole_data
    let _ : LE (Carrier whole_data) := quotientCarrierLE whole_data
    let _ : Nonempty (Carrier whole_data) := ⟨0⟩
    OrderedRingLaws (Carrier whole_data) := by
  sorry

end LRA.NumberSystems.Integers.QuotientOrderedPairs
