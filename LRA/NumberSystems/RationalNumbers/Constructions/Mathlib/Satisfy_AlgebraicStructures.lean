import LRA.AlgebraicStructures
import LRA.NumberSystems.RationalNumbers.Constructions.Mathlib

namespace LRA.NumberSystems.RationalNumbers.Constructions.Mathlib

open LRA.AlgebraicStructures

/-- The `Rat`-backed rational construction canonically realizes field structure. -/
theorem satisfiesField :
    FieldLaws Carrier := by
  sorry

/-- The `Rat`-backed rational construction canonically realizes ordered field structure. -/
theorem satisfiesOrderedField :
    OrderedFieldLaws Carrier := by
  sorry

end LRA.NumberSystems.RationalNumbers.Constructions.Mathlib
