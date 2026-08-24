
import LRA.NumberSystems.Integers.Definition
import LRA.UniversalAlgebra.Quotient.RepresentativeCompatibility

namespace LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

open LRA.NumberSystems.Integers

/--
`IntegerAndPositiveNaturalData` TODO

Predicate logic:

  structure IntegerAndPositiveNaturalData where
  integer_system : IntegerNumberSystem
  natural_carrier : Type
  one : natural_carrier
  multiplication : natural_carrier → natural_carrier → natural_carrier
  to_integer : natural_carrier → integer_system.Model.Carrier
  denominator_is_positive :
    ∀ denominator, 0 < to_integer denominator
  every_positive_integer_has_denominator :
    ∀ integer : integer_system.Model.Carrier,
      0 < integer →
      ∃ denominator : natural_carrier,
        to_integer denominator = integer
  one_maps_to_one : to_integer one = 1
  multiplication_is_preserved :
    ∀ first second,
      to_integer (multiplication first second) =
        to_integer first * to_integer second

Predicate logic (unfolded):

  structure IntegerAndPositiveNaturalData where
  integer_system : IntegerNumberSystem
  natural_carrier : Type
  one : natural_carrier
  multiplication : natural_carrier → natural_carrier → natural_carrier
  to_integer : natural_carrier → integer_system.Model.Carrier
  denominator_is_positive :
    ∀ denominator, 0 < to_integer denominator
  every_positive_integer_has_denominator :
    ∀ integer : integer_system.Model.Carrier,
      0 < integer →
      ∃ denominator : natural_carrier,
        to_integer denominator = integer
  one_maps_to_one : to_integer one = 1
  multiplication_is_preserved :
    ∀ first second,
      to_integer (multiplication first second) =
        to_integer first * to_integer second (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure IntegerAndPositiveNaturalData where
  integer_system : IntegerNumberSystem
  natural_carrier : Type
  one : natural_carrier
  multiplication : natural_carrier → natural_carrier → natural_carrier
  to_integer : natural_carrier → integer_system.Model.Carrier
  denominator_is_positive :
    ∀ denominator, 0 < to_integer denominator
  every_positive_integer_has_denominator :
    ∀ integer : integer_system.Model.Carrier,
      0 < integer →
      ∃ denominator : natural_carrier,
        to_integer denominator = integer
  one_maps_to_one : to_integer one = 1
  multiplication_is_preserved :
    ∀ first second,
      to_integer (multiplication first second) =
        to_integer first * to_integer second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
structure IntegerAndPositiveNaturalData where
  integer_system : IntegerNumberSystem
  natural_carrier : Type
  one : natural_carrier
  multiplication : natural_carrier → natural_carrier → natural_carrier
  to_integer : natural_carrier → integer_system.Model.Carrier
  denominator_is_positive :
    ∀ denominator, 0 < to_integer denominator
  every_positive_integer_has_denominator :
    ∀ integer : integer_system.Model.Carrier,
      0 < integer →
      ∃ denominator : natural_carrier,
        to_integer denominator = integer
  one_maps_to_one : to_integer one = 1
  multiplication_is_preserved :
    ∀ first second,
      to_integer (multiplication first second) =
        to_integer first * to_integer second

/--
`IntegerAndPositiveNaturalReductionData` TODO

Predicate logic:

  structure IntegerAndPositiveNaturalReductionData
    extends IntegerAndPositiveNaturalData where
  absolute_numerator : integer_system.Model.Carrier → natural_carrier
  gcd : natural_carrier → natural_carrier → natural_carrier

Predicate logic (unfolded):

  structure IntegerAndPositiveNaturalReductionData
    extends IntegerAndPositiveNaturalData where
  absolute_numerator : integer_system.Model.Carrier → natural_carrier
  gcd : natural_carrier → natural_carrier → natural_carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure IntegerAndPositiveNaturalReductionData
    extends IntegerAndPositiveNaturalData where
  absolute_numerator : integer_system.Model.Carrier → natural_carrier
  gcd : natural_carrier → natural_carrier → natural_carrier
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
structure IntegerAndPositiveNaturalReductionData
    extends IntegerAndPositiveNaturalData where
  absolute_numerator : integer_system.Model.Carrier → natural_carrier
  gcd : natural_carrier → natural_carrier → natural_carrier

/--
`Representative` TODO

Predicate logic:

  structure Representative (rational_data : IntegerAndPositiveNaturalData) where
  numerator : rational_data.integer_system.Model.Carrier
  denominator : rational_data.natural_carrier

Predicate logic (unfolded):

  structure Representative (rational_data : IntegerAndPositiveNaturalData) where
  numerator : rational_data.integer_system.Model.Carrier
  denominator : rational_data.natural_carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure Representative (rational_data : IntegerAndPositiveNaturalData) where
  numerator : rational_data.integer_system.Model.Carrier
  denominator : rational_data.natural_carrier
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
structure Representative (rational_data : IntegerAndPositiveNaturalData) where
  numerator : rational_data.integer_system.Model.Carrier
  denominator : rational_data.natural_carrier

end LRA.NumberSystems.RationalNumbers.RationalQuotientFractions
