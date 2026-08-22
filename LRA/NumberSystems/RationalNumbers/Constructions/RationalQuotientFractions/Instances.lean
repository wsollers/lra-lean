-- LRA/NumberSystems/RationalNumbers/Constructions/RationalQuotientFractions/Instances.lean
-- Registration into the system's interfaces.

import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions.Behavior
import LRA.NumberSystems.RationalNumbers.Definition

namespace LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

/-!
The quotient-fractions construction first realizes the generic densely ordered
field interface and then the stronger rational-number-system interface. The
second package records the actual integer number system from which the fractions
were constructed and adds the fraction-generation property.
-/

/-- `Carrier rationalData` realizes the generic densely ordered field model.

Logical form:

```lean
noncomputable def RationalQuotientFractionsRealizesDenselyOrderedFieldModel
    (rationalData : IntegerAndPositiveNaturalData) :
    LRA.NumberSystems.Models.DenselyOrderedFieldModel
```
-/
noncomputable def RationalQuotientFractionsRealizesDenselyOrderedFieldModel
    (rationalData : IntegerAndPositiveNaturalData) :
    LRA.NumberSystems.Models.DenselyOrderedFieldModel := by
  sorry

/-- The quotient-fractions construction realizes a rational number system whose
selected integer system is exactly the one supplied by `rationalData`.

Logical form:

```lean
noncomputable def RationalQuotientFractionsRealizesRationalNumberSystem
    (rationalData : IntegerAndPositiveNaturalData) :
    LRA.NumberSystems.RationalNumbers.RationalNumberSystem
```
-/
noncomputable def RationalQuotientFractionsRealizesRationalNumberSystem
    (rationalData : IntegerAndPositiveNaturalData) :
    LRA.NumberSystems.RationalNumbers.RationalNumberSystem where
  IntegerSystem := rationalData.integer_system
  FieldModel :=
    RationalQuotientFractionsRealizesDenselyOrderedFieldModel rationalData
  IntegerEmbedding := by
    sorry
  EveryElementIsIntegerFraction := by
    sorry

end LRA.NumberSystems.RationalNumbers.RationalQuotientFractions
