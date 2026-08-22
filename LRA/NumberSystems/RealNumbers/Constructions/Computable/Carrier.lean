-- LRA/NumberSystems/RealNumbers/Constructions/Computable/Carrier.lean
-- Effective (modulus-tracked) rational approximations, and the computable
-- real carrier that wraps a single such approximation.

import LRA.VolumeII.NumberSystems.Models

namespace LRA.NumberSystems.RealNumbers.Computable

open LRA.NumberSystems.Models

/-!
Lean module: LRA.NumberSystems.RealNumbers.Computable
Source: LRA/VolumeII/RealNumbers/Computable.lean
Verification status: statement-accepted-proof-pending

Moved from `LRA.VolumeII.RealNumbers.Computable` (previously one 150-line
file) and split into the §1.6.1 pipeline: `Carrier` (this file),
`Equivalence`, `WellFoundedness`, `Operations`, `WellDefinedness`, `Laws`,
`Behavior`, `Instances`. See `RealNumbers/ProofOrder.md`.
-/

/--
**[Structure — EffectiveApproximation]**

Mathematical statement (Lean): `structure EffectiveApproximation (rational_model : DenselyOrderedFieldModel)`.


Logical form:

```lean
structure EffectiveApproximation (rational_model : DenselyOrderedFieldModel) where
  approximate : Nat → rational_model.signature.carrier
  modulus : Nat → Nat
  cauchy_effective :
    ∀ precision index₁ index₂ : Nat,
      modulus precision ≤ index₁ →
      modulus precision ≤ index₂ →
        ∃ bound : rational_model.signature.carrier,
          rational_model.signature.StrictOrder
            (rational_model.signature.add
              (approximate index₁)
              (rational_model.signature.neg (approximate index₂)))
            bound
```
-/
structure EffectiveApproximation (rational_model : DenselyOrderedFieldModel) where
  approximate : Nat → rational_model.signature.carrier
  modulus : Nat → Nat
  cauchy_effective :
    ∀ precision index₁ index₂ : Nat,
      modulus precision ≤ index₁ →
      modulus precision ≤ index₂ →
        ∃ bound : rational_model.signature.carrier,
          rational_model.signature.StrictOrder
            (rational_model.signature.add
              (approximate index₁)
              (rational_model.signature.neg (approximate index₂)))
            bound

/--
**[Structure — ComputableReal]**

Mathematical statement (Lean): `structure ComputableReal (rational_model : DenselyOrderedFieldModel)`.


Logical form:

```lean
structure ComputableReal (rational_model : DenselyOrderedFieldModel) where
  approximation : EffectiveApproximation rational_model
```
-/
structure ComputableReal (rational_model : DenselyOrderedFieldModel) where
  approximation : EffectiveApproximation rational_model

end LRA.NumberSystems.RealNumbers.Computable
