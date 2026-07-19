-- LRA/VolumeII/Reals/Computable.lean
-- Computable real numbers as effective rational approximations.

import LRA.VolumeII.NumberSystems.Models

namespace LRA
namespace VolumeII
namespace Reals
namespace Computable

/-!
Volume II label: computable-reals
Lean module: LRA.VolumeII.Reals.Computable
Source: docs/number-systems/gpt-08a-computable-reals.md
Verification status: statement-accepted-proof-pending
-/

open NumberSystems

structure EffectiveApproximation (rational_model : RationalModel) where
  approximate : Nat → rational_model.signature.carrier
  modulus : Nat → Nat
  cauchy_effective :
    ∀ precision index₁ index₂ : Nat,
      modulus precision ≤ index₁ →
      modulus precision ≤ index₂ →
        ∃ bound : rational_model.signature.carrier,
          rational_model.signature.strict_order
            (rational_model.signature.addition
              (approximate index₁)
              (rational_model.signature.negation (approximate index₂)))
            bound

def equivalent
    {rational_model : RationalModel}
    (first second : EffectiveApproximation rational_model) : Prop :=
  ∀ precision : Nat,
    ∃ index : Nat,
      first.approximate index = second.approximate index

structure ComputableReal (rational_model : RationalModel) where
  approximation : EffectiveApproximation rational_model

theorem computable_reals_closed_under_arithmetic
    (rational_model : RationalModel) :
    ∃ add mul neg :
      ComputableReal rational_model → ComputableReal rational_model → ComputableReal rational_model,
      ∀ first second, equivalent (add first second).approximation (add first second).approximation ∧
        equivalent (mul first second).approximation (mul first second).approximation ∧
        equivalent (neg first second).approximation (neg first second).approximation := by
  sorry

theorem computable_reals_are_countable
    (rational_model : RationalModel) :
    ∃ enumerate : Nat → ComputableReal rational_model,
      ∀ value : ComputableReal rational_model,
        ∃ index : Nat, enumerate index = value := by
  sorry

end Computable
end Reals
end VolumeII
end LRA
