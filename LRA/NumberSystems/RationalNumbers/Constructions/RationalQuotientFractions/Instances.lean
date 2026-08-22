-- LRA/NumberSystems/RationalNumbers/Constructions/RationalQuotientFractions/Instances.lean
-- Registration into the system's interface.

import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions.Behavior

namespace LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

/-!
New content: the source never registered `Carrier rational_data` as an
instance of `LRA.NumberSystems.Models.DenselyOrderedFieldModel`, the generic
field-and-order interface this construction realizes. Assembling the
instance from the (mostly `sorry`) law lemmas above is itself new work
under this migration's policy, so it is stated whole, `sorry`, rather than
composed field-by-field without a toolchain to check the composition.
Tracked in `RationalNumbers/ProofOrder.md`.
-/

/-- `Carrier rational_data` realizes the generic ordered-field
`DenselyOrderedFieldModel` interface. -/
noncomputable def RationalQuotientFractionsRealizesDenselyOrderedFieldModel
    (rational_data : IntegerAndPositiveNaturalData) :
    LRA.NumberSystems.Models.DenselyOrderedFieldModel := by
  sorry

end LRA.NumberSystems.RationalNumbers.RationalQuotientFractions
