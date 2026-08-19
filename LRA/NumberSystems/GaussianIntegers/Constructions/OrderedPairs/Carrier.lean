-- LRA/NumberSystems/GaussianIntegers/Constructions/OrderedPairs/Carrier.lean
-- The pre-carrier: an ordered pair of the base carrier, plus its
-- distinguished zero, one, and imaginary unit.

import LRA.AlgebraicStructures

namespace LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs

open LRA.AlgebraicStructures

universe u

/-!
Lean module: LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs
Source: LRA.VolumeII.GaussianIntegers.Construction.Model
Verification status: definitions accepted; algebraic proofs pending

Moved from `LRA.VolumeII.GaussianIntegers.Construction.Model` (previously
one 400-line file covering the construction, its "active" instantiation,
and its first-order model); split per §1.6.1 into `Carrier` (this file),
`Equivalence`, `WellFoundedness`, `Operations`, `WellDefinedness`, `Laws`,
`Behavior`, `Instances` for the construction itself. Unlike
`ComplexNumbers`, the source did not separate the construction from its
"active" instantiation and first-order model wrapper into their own file
-- that split is done here too, matching `ComplexNumbers`' architecture:
`ActiveGaussianInteger`, `gaussianArithmeticRingModel`,
`GaussianArithmeticRingModel`, and the smoke tests that reference them
move to `GaussianIntegers/Construction.lean` /
`GaussianIntegers/Construction/Model.lean` instead. See
`GaussianIntegers/ProofOrder.md`.

The Gaussian integers `a + b·i`, now over *any* commutative-ring
carrier `R` — the active project integers `Z`, Mathlib's `Int`, or any
other certified ring. Operations are the usual coordinate formulas in
the instance notation of `R`; the certificates flow whenever `R`'s do.
-/

/-- A Gaussian integer over the carrier `R`.

Logical form:

```lean
structure GaussianInteger (R : Type u) where
  realPart : R
  imaginaryPart : R
```
-/
structure GaussianInteger (R : Type u) where
  realPart : R
  imaginaryPart : R

variable {R : Type u}

/-! ## Machines -/

instance [OfNat R 0] : OfNat (GaussianInteger R) 0 := ⟨⟨0, 0⟩⟩

instance [OfNat R 0] [OfNat R 1] : OfNat (GaussianInteger R) 1 := ⟨⟨1, 0⟩⟩

/-- The Gaussian imaginary unit `0 + 1·i`.

Logical form:

```lean
def imaginaryUnit [OfNat R 0] [OfNat R 1] : GaussianInteger R := ⟨0, 1⟩
```
-/
def imaginaryUnit [OfNat R 0] [OfNat R 1] : GaussianInteger R := ⟨0, 1⟩

end LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs
