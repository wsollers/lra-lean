-- LRA/NumberSystems/ComplexNumbers/Constructions/OrderedPairs/Equivalence.lean
-- Extensionality: this construction's answer to "when are two carrier
-- elements the same". ComplexNumber is a plain structure, not built from
-- a coarser representative type quotiented by an equivalence relation --
-- so unlike the quotient-based constructions elsewhere in this migration
-- (Cauchy, RationalQuotientFractions, ...), there is no separate
-- equivalence relation to state and prove. Coordinatewise equality is
-- the carrier's actual notion of sameness; `ext` records it.

import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.Carrier

namespace LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

variable {R : Type u}

/-- Complex equality is coordinatewise equality.

Logical form:

```lean
theorem ext {first second : ComplexNumber R}
    (real_parts_equal : first.real_part = second.real_part)
    (imaginary_parts_equal :
      first.imaginary_part = second.imaginary_part) :
    first = second
```
-/
theorem ext {first second : ComplexNumber R}
    (real_parts_equal : first.real_part = second.real_part)
    (imaginary_parts_equal :
      first.imaginary_part = second.imaginary_part) :
    first = second := by
  sorry

end LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs
