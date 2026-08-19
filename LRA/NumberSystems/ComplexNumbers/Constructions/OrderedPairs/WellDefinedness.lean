-- LRA/NumberSystems/ComplexNumbers/Constructions/OrderedPairs/WellDefinedness.lean
-- The raw Inv instance is only mathematically meaningful when the norm
-- it divides by cannot vanish on a nonzero input; this is where that
-- gets established.

import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.Operations

namespace LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

variable {R : Type u}

section FieldTheorems

variable [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
variable [OrderedFieldLaws R]

/-- Over an *ordered* base field the norm is anisotropic: it vanishes
only at zero. This is where the ordering is genuinely used.

*Proof status:* proof pending

Logical form:

```lean
theorem norm_squared_ne_zero_of_nonzero
    (value : ComplexNumber R) (value_nonzero : value ≠ 0) :
    normSquared value ≠ (0 : R)
```
-/
theorem norm_squared_ne_zero_of_nonzero
    (value : ComplexNumber R) (value_nonzero : value ≠ 0) :
    normSquared value ≠ (0 : R) := by
  sorry

end FieldTheorems

end LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs
