-- LRA/NumberSystems/ComplexNumbers/Constructions/OrderedPairs/Carrier.lean
-- The pre-carrier: an ordered pair of the base carrier, plus its
-- distinguished zero, one, and imaginary unit.

import LRA.AlgebraicStructures

namespace LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

open LRA.AlgebraicStructures
open LRA.Order

universe u

/-!
Lean module: LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs
Source: LRA.VolumeII.ComplexNumbers.Construction.Construction
Verification status: definitions accepted; algebraic proofs pending

Moved from `LRA.VolumeII.ComplexNumbers.Construction.Construction`
(previously one 636-line file covering the whole construction); split per
§1.6.1 into `Carrier` (this file), `Equivalence`, `WellFoundedness`,
`Operations`, `WellDefinedness`, `Laws`, `Behavior`, `Instances`. See
`ComplexNumbers/ProofOrder.md`.

The source declared `namespace LRA.NumberSystems.ComplexNumbers.Construction`
then a nested `namespace ComplexNumber` around everything but the carrier
structure itself -- stacked one-component namespaces used purely as a
Lean convenience for grouping the type's related declarations, not
meaningful mathematical structure. Flattened here into the single flat
namespace this whole pipeline declares (matching every other construction
in this migration, e.g. `RealNumbers.Cauchy`), per the repo's
no-stacked-namespaces convention; no declaration name or reference
changes.

The standard construction of complex numbers, now over *any* carrier
`R`: the carrier is `R × R` (as a structure), operations are
coordinatewise in the instance notation of `R`, and each operation asks
for exactly the real capabilities it uses. Instantiating `R` at the
project reals, Mathlib's `ℝ`, `ℚ` (giving `ℚ(i)`), or even `ℤ` (giving
the Gaussian integers as a ring) is zero additional work — the
certificates flow whenever `R`'s do.

Capability honesty in the certificates: the *ring* certificates need
only `CommutativeRingLaws R`, but the *field* certificates (inverses)
need `R` ordered — over an arbitrary field the norm `a² + b²` can
vanish on nonzero elements (over `ℂ` itself, `1² + i² = 0`), and it is
the ordering of `R` that rules this out.
-/

/-- A complex number over the carrier `R`: a formal pair
`real_part + imaginary_part · i`.

Logical form:

```lean
structure ComplexNumber (R : Type u) where
  real_part : R
  imaginary_part : R
```
-/
structure ComplexNumber (R : Type u) where
  real_part : R
  imaginary_part : R

variable {R : Type u}

/-! ## Machines: each operation asks only for what it uses -/

instance [OfNat R 0] : OfNat (ComplexNumber R) 0 := ⟨⟨0, 0⟩⟩

instance [OfNat R 0] [OfNat R 1] : OfNat (ComplexNumber R) 1 := ⟨⟨1, 0⟩⟩

/-- The imaginary unit `i`.

Logical form:

```lean
def imaginaryUnit [OfNat R 0] [OfNat R 1] : ComplexNumber R := ⟨0, 1⟩
```
-/
def imaginaryUnit [OfNat R 0] [OfNat R 1] : ComplexNumber R := ⟨0, 1⟩

end LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs
