-- LRA/NumberSystems/GaussianIntegers/Constructions/OrderedPairs/Operations.lean
-- Addition, negation, subtraction, multiplication, conjugation, and
-- squared norm -- each instance asking for exactly the base-carrier
-- capabilities it uses.

import LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.WellFoundedness

namespace LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs

variable {R : Type u}

instance [Add R] : Add (GaussianInteger R) :=
  ⟨fun first second =>
    ⟨first.realPart + second.realPart,
     first.imaginaryPart + second.imaginaryPart⟩⟩

instance [Neg R] : Neg (GaussianInteger R) :=
  ⟨fun value => ⟨-value.realPart, -value.imaginaryPart⟩⟩

instance [Add R] [Neg R] : Sub (GaussianInteger R) :=
  ⟨fun first second => first + -second⟩

instance [Add R] [Mul R] [Neg R] : Mul (GaussianInteger R) :=
  ⟨fun first second =>
    ⟨first.realPart * second.realPart +
       -(first.imaginaryPart * second.imaginaryPart),
     first.realPart * second.imaginaryPart +
       first.imaginaryPart * second.realPart⟩⟩

/-- Gaussian conjugation: `a + b·i ↦ a - b·i`.

Logical form:

```lean
def conjugation [Neg R] (value : GaussianInteger R) : GaussianInteger R :=
  ⟨value.realPart, -value.imaginaryPart⟩
```
-/
def conjugation [Neg R] (value : GaussianInteger R) : GaussianInteger R :=
  ⟨value.realPart, -value.imaginaryPart⟩

/-- Squared Gaussian norm `a² + b²`, valued in the base carrier.

Logical form:

```lean
def normSquared [Add R] [Mul R] (value : GaussianInteger R) : R :=
  value.realPart * value.realPart +
    value.imaginaryPart * value.imaginaryPart
```
-/
def normSquared [Add R] [Mul R] (value : GaussianInteger R) : R :=
  value.realPart * value.realPart +
    value.imaginaryPart * value.imaginaryPart

end LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs
