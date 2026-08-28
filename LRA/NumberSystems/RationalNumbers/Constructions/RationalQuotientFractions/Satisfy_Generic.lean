import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions.Instances

namespace LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

/-- The quotient-of-integer-fractions construction satisfies the generic ℚ
interface: for any integer-and-positive-natural data, its quotient carrier
is a `RationalModel`.

Logical form:

```lean
noncomputable abbrev satisfiesGeneric
    (rationalData : IntegerAndPositiveNaturalData) :
    LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel :=
  RationalQuotientFractionsRealizesRationalModel rationalData
```
-/
noncomputable abbrev satisfiesGeneric
    (rationalData : IntegerAndPositiveNaturalData) :
    LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel :=
  RationalQuotientFractionsRealizesRationalModel rationalData

end LRA.NumberSystems.RationalNumbers.RationalQuotientFractions
