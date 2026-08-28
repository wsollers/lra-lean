import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs.Instances

namespace LRA.NumberSystems.Integers.QuotientOrderedPairs

/-- The quotient-of-ordered-pairs construction satisfies the generic ℤ
interface: for any whole-number arithmetic data, its quotient carrier is an
`IntegerModel`.

Logical form:

```lean
noncomputable abbrev satisfiesGeneric
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.NumberSystems.Integers.Interface.ModelTheory.IntegerModel :=
  QuotientOrderedPairsRealizesIntegerModel whole_data
```
-/
noncomputable abbrev satisfiesGeneric
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.NumberSystems.Integers.Interface.ModelTheory.IntegerModel :=
  QuotientOrderedPairsRealizesIntegerModel whole_data

end LRA.NumberSystems.Integers.QuotientOrderedPairs
