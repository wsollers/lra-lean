import LRA.NumberSystems.RealNumbers.Constructions.EffectiveCauchy.WellFoundedness

namespace LRA.NumberSystems.RealNumbers.EffectiveCauchy
open LRA.NumberSystems.RationalNumbers

variable {rationalSystem : RationalNumberSystem}

/-- Pointwise sum; the combined modulus asks for one extra bit of
precision from each input to absorb the sum's error. -/
def representative_addition
    (first second : EffectiveCauchyApproximation rationalSystem) :
    EffectiveCauchyApproximation rationalSystem where
  Approximate := fun index => first.Approximate index + second.Approximate index
  Modulus := fun precision => max (first.Modulus (precision + 1)) (second.Modulus (precision + 1))
  CauchyAtPrecision := by sorry

def representative_negation
    (representative : EffectiveCauchyApproximation rationalSystem) :
    EffectiveCauchyApproximation rationalSystem where
  Approximate := fun index => -representative.Approximate index
  Modulus := representative.Modulus
  CauchyAtPrecision := by sorry

/-- Pointwise product; the combined modulus needs to additionally bound
both inputs away from growing without control, standard for effective
Cauchy-sequence multiplication — left to the `sorry`'d closure proof
rather than spelled out explicitly here. -/
def representative_multiplication
    (first second : EffectiveCauchyApproximation rationalSystem) :
    EffectiveCauchyApproximation rationalSystem where
  Approximate := fun index => first.Approximate index * second.Approximate index
  Modulus := fun precision => max (first.Modulus (precision + 1)) (second.Modulus (precision + 1))
  CauchyAtPrecision := by sorry

end LRA.NumberSystems.RealNumbers.EffectiveCauchy
