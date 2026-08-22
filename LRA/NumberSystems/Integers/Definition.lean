import LRA.VolumeII.NumberSystems.Models

namespace LRA.NumberSystems.Integers

open LRA.NumberSystems.Models

universe u

/-- The natural numeral inside a discretely ordered integral-domain model.

Logical form:

```lean
def NaturalNumeral
    (model : DiscretelyOrderedIntegralDomainModel.{u}) :
    Nat → model.Carrier
  | 0 => 0
  | n + 1 => NaturalNumeral model n + 1
```
-/
def NaturalNumeral
    (model : DiscretelyOrderedIntegralDomainModel.{u}) :
    Nat → model.Carrier
  | 0 => 0
  | n + 1 => NaturalNumeral model n + 1

/-- The canonical integer numeral inside a discretely ordered
integral-domain model.

`Int.ofNat n` is interpreted by repeated addition of one, while
`Int.negSucc n = -(n+1)` is interpreted by negating the corresponding
positive numeral.

Logical form:

```lean
def IntegerNumeral
    (model : DiscretelyOrderedIntegralDomainModel.{u}) :
    Int → model.Carrier
  | Int.ofNat n => NaturalNumeral model n
  | Int.negSucc n => -(NaturalNumeral model (n + 1))
```
-/
def IntegerNumeral
    (model : DiscretelyOrderedIntegralDomainModel.{u}) :
    Int → model.Carrier
  | Int.ofNat n => NaturalNumeral model n
  | Int.negSucc n => -(NaturalNumeral model (n + 1))

/-- An integer number system is a discretely ordered integral domain whose
elements are exactly the integer numerals generated from `0` and `1`.

The generation clause is the missing categorical content in the broader
`DiscretelyOrderedIntegralDomainModel`: it rules out larger discretely ordered
integral domains that merely share the same local algebra/order laws.

Logical form:

```lean
structure IntegerNumberSystem : Type (u + 1) where
  Model : DiscretelyOrderedIntegralDomainModel.{u}
  EveryElementIsIntegerNumeral :
    ∀ value : Model.Carrier,
      ∃ integer : Int, IntegerNumeral Model integer = value
```
-/
structure IntegerNumberSystem : Type (u + 1) where
  Model : DiscretelyOrderedIntegralDomainModel.{u}
  EveryElementIsIntegerNumeral :
    ∀ value : Model.Carrier,
      ∃ integer : Int, IntegerNumeral Model integer = value

/-- The canonical integer-numeral map of an integer number system is
surjective.

Logical form:

```lean
theorem IntegerNumeralIsSurjective
    (integerSystem : IntegerNumberSystem.{u}) :
    ∀ value : integerSystem.Model.Carrier,
      ∃ integer : Int,
        IntegerNumeral integerSystem.Model integer = value
```
-/
theorem IntegerNumeralIsSurjective
    (integerSystem : IntegerNumberSystem.{u}) :
    ∀ value : integerSystem.Model.Carrier,
      ∃ integer : Int,
        IntegerNumeral integerSystem.Model integer = value := by
  exact integerSystem.EveryElementIsIntegerNumeral

/-- Distinct ordinary integers have distinct numerals in an integer number
system.

This follows from the ordered integral-domain laws, which force
characteristic zero and preserve the strict order of successive numerals.

Logical form:

```lean
theorem IntegerNumeralIsInjective
    (integerSystem : IntegerNumberSystem.{u}) :
    ∀ first second : Int,
      IntegerNumeral integerSystem.Model first =
          IntegerNumeral integerSystem.Model second →
        first = second
```
-/
theorem IntegerNumeralIsInjective
    (integerSystem : IntegerNumberSystem.{u}) :
    ∀ first second : Int,
      IntegerNumeral integerSystem.Model first =
          IntegerNumeral integerSystem.Model second →
        first = second := by
  sorry

end LRA.NumberSystems.Integers
