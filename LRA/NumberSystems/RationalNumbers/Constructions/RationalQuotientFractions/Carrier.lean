-- LRA/NumberSystems/RationalNumbers/Constructions/RationalQuotientFractions/Carrier.lean
-- The pre-carrier: formal fractions with positive denominator, and the
-- algebraic data required of the integer/positive-natural carriers.

import LRA.NumberSystems.Integers.Definition
import LRA.UniversalAlgebra.Quotient.RepresentativeCompatibility

namespace LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

open LRA.NumberSystems.Integers

/-!
Lean module: LRA.NumberSystems.RationalNumbers.RationalQuotientFractions
Source: docs/number-systems/gpt-03-RationalNumbers.md
Verification status: definitions and final theorem statements complete; proofs pending

Moved from `LRA.VolumeII.RationalNumbers.RationalQuotientFractions` (previously
one file covering the whole pipeline); split per §1.6.1 into `Carrier` (this
file), `Equivalence`, `WellFoundedness`, `Operations`, `WellDefinedness`,
`Laws`, `Behavior`, `Instances`. See `RationalNumbers/ProofOrder.md`.
-/

/-- Data required to build quotient fractions over an actual integer number
system and a positive-natural denominator carrier.

Logical form:

```lean
structure IntegerAndPositiveNaturalData where
  integer_system : IntegerNumberSystem
  natural_carrier : Type
  one : natural_carrier
  multiplication : natural_carrier → natural_carrier → natural_carrier
  to_integer : natural_carrier → integer_system.Model.Carrier
  denominator_is_positive :
    ∀ denominator, 0 < to_integer denominator
  one_maps_to_one : to_integer one = 1
  multiplication_is_preserved :
    ∀ first second,
      to_integer (multiplication first second) =
        to_integer first * to_integer second
  absolute_numerator : integer_system.Model.Carrier → natural_carrier
  gcd : natural_carrier → natural_carrier → natural_carrier
```
-/
structure IntegerAndPositiveNaturalData where
  integer_system : IntegerNumberSystem
  natural_carrier : Type
  one : natural_carrier
  multiplication : natural_carrier → natural_carrier → natural_carrier
  to_integer : natural_carrier → integer_system.Model.Carrier
  denominator_is_positive :
    ∀ denominator, 0 < to_integer denominator
  one_maps_to_one : to_integer one = 1
  multiplication_is_preserved :
    ∀ first second,
      to_integer (multiplication first second) =
        to_integer first * to_integer second
  absolute_numerator : integer_system.Model.Carrier → natural_carrier
  gcd : natural_carrier → natural_carrier → natural_carrier

/-- Definition 1.1: a formal fraction with positive denominator.

Logical form:

```lean
structure Representative (rational_data : IntegerAndPositiveNaturalData) where
  numerator : rational_data.integer_system.Model.Carrier
  denominator : rational_data.natural_carrier
```
-/
structure Representative (rational_data : IntegerAndPositiveNaturalData) where
  numerator : rational_data.integer_system.Model.Carrier
  denominator : rational_data.natural_carrier

end LRA.NumberSystems.RationalNumbers.RationalQuotientFractions
