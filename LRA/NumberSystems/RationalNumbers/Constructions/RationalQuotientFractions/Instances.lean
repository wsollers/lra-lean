-- LRA/NumberSystems/RationalNumbers/Constructions/RationalQuotientFractions/Instances.lean
-- Registration into the system's interface.

import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions.Behavior
import LRA.NumberSystems.RationalNumbers.Definition

namespace LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

/-!
The quotient-fractions construction first realizes the generic densely ordered
field interface and then the stronger rational-number-system interface. The
second package records which integer model the fractions were constructed from
and adds the fraction-generation property.
-/

/-- `Carrier rational_data` realizes the generic ordered-field
`DenselyOrderedFieldModel` interface.

Logical form:

```lean
noncomputable def RationalQuotientFractionsRealizesDenselyOrderedFieldModel
    (rational_data : IntegerAndPositiveNaturalData) :
    LRA.NumberSystems.Models.DenselyOrderedFieldModel
```
-/
noncomputable def RationalQuotientFractionsRealizesDenselyOrderedFieldModel
    (rational_data : IntegerAndPositiveNaturalData) :
    LRA.NumberSystems.Models.DenselyOrderedFieldModel := by
  sorry

/-- The quotient-fractions construction realizes a rational number system whose
chosen integer model is exactly the integer model supplied by `rational_data`.

Logical form:

```lean
noncomputable def RationalQuotientFractionsRealizesRationalNumberSystem
    (rational_data : IntegerAndPositiveNaturalData) :
    LRA.NumberSystems.RationalNumbers.RationalNumberSystem
```
-/
noncomputable def RationalQuotientFractionsRealizesRationalNumberSystem
    (rational_data : IntegerAndPositiveNaturalData) :
    LRA.NumberSystems.RationalNumbers.RationalNumberSystem where
  IntegerModel := rational_data.integer_model
  FieldModel :=
    RationalQuotientFractionsRealizesDenselyOrderedFieldModel rational_data
  IntegerEmbedding := by
    sorry
  EveryElementIsIntegerFraction := by
    sorry

end LRA.NumberSystems.RationalNumbers.RationalQuotientFractions
