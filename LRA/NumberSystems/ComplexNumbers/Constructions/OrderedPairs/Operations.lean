-- LRA/NumberSystems/ComplexNumbers/Constructions/OrderedPairs/Operations.lean
-- Addition, negation, subtraction, multiplication, conjugation, squared
-- modulus, totalized inverse, and the real-axis embedding -- each
-- instance asking for exactly the base-carrier capabilities it uses.

import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.WellFoundedness

namespace LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

variable {R : Type u}

instance [Add R] : Add (ComplexNumber R) :=
  ⟨fun first second =>
    ⟨first.real_part + second.real_part,
     first.imaginary_part + second.imaginary_part⟩⟩

instance [Neg R] : Neg (ComplexNumber R) :=
  ⟨fun value => ⟨-value.real_part, -value.imaginary_part⟩⟩

instance [Add R] [Neg R] : Sub (ComplexNumber R) :=
  ⟨fun first second => first + -second⟩

instance [Add R] [Mul R] [Neg R] : Mul (ComplexNumber R) :=
  ⟨fun first second =>
    ⟨first.real_part * second.real_part +
       -(first.imaginary_part * second.imaginary_part),
     first.real_part * second.imaginary_part +
       first.imaginary_part * second.real_part⟩⟩

/-- Complex conjugation: `a + b·i ↦ a - b·i`.

Logical form:

```lean
def conjugation [Neg R] (value : ComplexNumber R) : ComplexNumber R :=
  ⟨value.real_part, -value.imaginary_part⟩
```
-/
def conjugation [Neg R] (value : ComplexNumber R) : ComplexNumber R :=
  ⟨value.real_part, -value.imaginary_part⟩

/-- Squared modulus `a² + b²`, valued in the base carrier.

Logical form:

```lean
def normSquared [Add R] [Mul R] (value : ComplexNumber R) : R :=
  value.real_part * value.real_part +
    value.imaginary_part * value.imaginary_part
```
-/
def normSquared [Add R] [Mul R] (value : ComplexNumber R) : R :=
  value.real_part * value.real_part +
    value.imaginary_part * value.imaginary_part

/-- Totalized inverse through the base carrier's totalized inverse
(under the field convention `0⁻¹ = 0`, the complex zero maps to
zero). -/
instance [Add R] [Mul R] [Neg R] [Inv R] : Inv (ComplexNumber R) :=
  ⟨fun value =>
    ⟨value.real_part * (normSquared value)⁻¹,
     -(value.imaginary_part * (normSquared value)⁻¹)⟩⟩

/-- Embed the base carrier on the real axis.

Logical form:

```lean
def of_real [OfNat R 0] (value : R) : ComplexNumber R := ⟨value, 0⟩
```
-/
def of_real [OfNat R 0] (value : R) : ComplexNumber R := ⟨value, 0⟩

end LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs
