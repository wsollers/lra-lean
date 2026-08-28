import LRA.NumberSystems.Integers.Interface.ModelTheory.Model

namespace LRA.NumberSystems.Integers

open LRA.NumberSystems.Integers.Interface.ModelTheory

universe u

/-- `NaturalNumeral model n` is the image of the natural number `n` in
`model.Carrier` under the unique semiring homomorphism from `Nat`: `0 ↦ 0` and
`n + 1 ↦ NaturalNumeral model n + 1`.

Logical form:

```lean
def NaturalNumeral (model : IntegerModel) : Nat → model.Carrier
  | 0 => 0
  | n + 1 => NaturalNumeral model n + 1
```
-/
def NaturalNumeral (model : IntegerModel) : Nat → model.Carrier
  | 0 => 0
  | n + 1 => NaturalNumeral model n + 1

/-- `IntegerNumeral model n` is the image of the integer `n` in
`model.Carrier` under the unique ring homomorphism from `Int`: nonnegative
integers via `NaturalNumeral`, negative integers via `neg`.

Logical form:

```lean
def IntegerNumeral (model : IntegerModel) : Int → model.Carrier
  | Int.ofNat n => NaturalNumeral model n
  | Int.negSucc n => -(NaturalNumeral model (n + 1))
```
-/
def IntegerNumeral (model : IntegerModel) : Int → model.Carrier
  | Int.ofNat n => NaturalNumeral model n
  | Int.negSucc n => -(NaturalNumeral model (n + 1))

/-- An `IntegerNumberSystem` is an `IntegerModel` in which every element is
the image of some integer under `IntegerNumeral` — the model realizes ℤ and
nothing more.

Logical form:

```lean
structure IntegerNumberSystem : Type (u + 1) where
  Model : IntegerModel.{u}
  EveryElementIsIntegerNumeral :
    ∀ value : Model.Carrier, ∃ integer : Int, IntegerNumeral Model integer = value
```
-/
structure IntegerNumberSystem : Type (u + 1) where
  Model : IntegerModel.{u}
  EveryElementIsIntegerNumeral :
    ∀ value : Model.Carrier,
      ∃ integer : Int, IntegerNumeral Model integer = value

/-- `IntegerNumeral` is surjective onto any `IntegerNumberSystem`'s carrier. -/
theorem IntegerNumeralIsSurjective
    (integerSystem : IntegerNumberSystem.{u}) :
    ∀ value : integerSystem.Model.Carrier,
      ∃ integer : Int,
        IntegerNumeral integerSystem.Model integer = value := by
  sorry

/-- `IntegerNumeral` is injective on any `IntegerNumberSystem`'s carrier. -/
theorem IntegerNumeralIsInjective
    (integerSystem : IntegerNumberSystem.{u}) :
    ∀ first second : Int,
      IntegerNumeral integerSystem.Model first =
          IntegerNumeral integerSystem.Model second →
        first = second := by
  sorry

end LRA.NumberSystems.Integers
