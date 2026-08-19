-- LRA/NumberSystems/GaussianIntegers/Construction/Model.lean
-- The active Gaussian integers (over the project's active integer
-- carrier) and their first-order model.

import LRA.VolumeII.Arithmetic.Model.All
import LRA.VolumeII.Integers.Construction
import LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs

namespace LRA.NumberSystems.GaussianIntegers.Construction

open LRA.NumberSystems.Arithmetic.Model
open LRA.AlgebraicStructures
open LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs

universe u

/-!
Volume II label: gaussian-integer-active-model
Lean module: LRA.NumberSystems.GaussianIntegers.Construction.Model
Verification status: definitions accepted; algebraic proofs pending

Moved from the tail of `LRA.VolumeII.GaussianIntegers.Construction.Model`
(previously one 400-line file mixing the construction with its active
instantiation and first-order model); the construction itself moved to
`GaussianIntegers.Constructions.OrderedPairs`, split per §1.6.1. This file
holds what remains: the project's *active* Gaussian integers (over
`LRA.NumberSystems.Integers.Z`, the active integer carrier selected by
`LRA.VolumeII.Integers.Implementation`) and their first-order model,
mirroring `ComplexNumbers.Construction.Model`'s role for its sibling
system -- there `complexNumbersModel` takes its carrier as an explicit
parameter with no switch to retire; here `GaussianArithmeticRingModel`
sits downstream of Integer's still-active switch instead, unchanged.
-/

/-- The Gaussian integers over the active project integers.

Logical form:

```lean
abbrev ActiveGaussianInteger := GaussianInteger LRA.NumberSystems.Integers.Z
```
-/
abbrev ActiveGaussianInteger := GaussianInteger LRA.NumberSystems.Integers.Z

/-- Any ring-ready carrier's Gaussian integers as a first-order model
of the arithmetic ring language.

Logical form:

```lean
def gaussianArithmeticRingModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model ArithmeticRingFirstOrderSignature :=
  arithmeticRingFirstOrderModel (GaussianInteger R)
```
-/
def gaussianArithmeticRingModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model ArithmeticRingFirstOrderSignature :=
  arithmeticRingFirstOrderModel (GaussianInteger R)

/-- The active Gaussian integers as a first-order model.

Logical form:

```lean
def GaussianArithmeticRingModel :
    LRA.Logic.FirstOrder.Model ArithmeticRingFirstOrderSignature :=
  gaussianArithmeticRingModel LRA.NumberSystems.Integers.Z
```
-/
def GaussianArithmeticRingModel :
    LRA.Logic.FirstOrder.Model ArithmeticRingFirstOrderSignature :=
  gaussianArithmeticRingModel LRA.NumberSystems.Integers.Z

/-! ## Smoke tests: the active carrier gets the same theorem surface -/

example : CommutativeRingLaws ActiveGaussianInteger := inferInstance

example (a b : ActiveGaussianInteger) : a + b = b + a :=
  AddCommutative a b

end LRA.NumberSystems.GaussianIntegers.Construction
