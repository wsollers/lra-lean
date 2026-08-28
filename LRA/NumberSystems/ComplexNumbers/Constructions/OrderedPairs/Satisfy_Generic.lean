import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.Instances
import LRA.NumberSystems.ComplexNumbers.Interface.ModelTheory.Model

namespace LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

open LRA.NumberSystems.ComplexNumbers.Interface.ModelTheory
open LRA.AlgebraicStructures

universe u

/-- The ordered-pairs (`a + bi`) construction satisfies the generic ℂ
interface: for any ordered field `R`, pairs over `R` form a
`ComplexNumberModel`.

Logical form:

```lean
def genericModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
    [CommutativeRingLaws R] [OrderedFieldLaws R] : ComplexNumberModel :=
  ComplexNumberModel.ofCarrier (ComplexNumber R)
```
-/
def genericModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
    [CommutativeRingLaws R] [OrderedFieldLaws R] : ComplexNumberModel :=
  ComplexNumberModel.ofCarrier (ComplexNumber R)

abbrev satisfiesGeneric (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
    [CommutativeRingLaws R] [OrderedFieldLaws R] : ComplexNumberModel :=
  genericModel R

end LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs
