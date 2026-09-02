import LRA.AlgebraicStructures
import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions.Instances

namespace LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

open LRA.AlgebraicStructures

/-- The quotient-of-integer-fractions construction canonically realizes field structure. -/
theorem satisfiesField
    (rationalData : IntegerAndPositiveNaturalData) :
    FieldLaws (Carrier rationalData) := by
  sorry
/-- The quotient-of-integer-fractions construction canonically realizes ordered field structure. -/
theorem satisfiesOrderedField
    (rationalData : IntegerAndPositiveNaturalData) :
    OrderedFieldLaws (Carrier rationalData) := by
  sorry
end LRA.NumberSystems.RationalNumbers.RationalQuotientFractions
