-- LRA/VolumeII/Reals/IntervalArithmetic.lean
-- Interval arithmetic over an existing real field.

import LRA.VolumeII.Reals.Extensions

namespace LRA
namespace VolumeII
namespace Reals
namespace IntervalArithmetic

/-!
Volume II label: interval-arithmetic-over-reals
Lean module: LRA.VolumeII.Reals.IntervalArithmetic
Source: docs/number-systems/gpt-08d-interval-arithmetic-over-reals.md
Verification status: statement-accepted-proof-pending
-/

open NumberSystems

structure Interval (real_model : RealModel) where
  lower : real_model.signature.carrier
  upper : real_model.signature.carrier

def valid
    (real_model : RealModel)
    (interval : Interval real_model) : Prop :=
  real_model.signature.nonstrict_order interval.lower interval.upper

def contains
    (real_model : RealModel)
    (interval : Interval real_model)
    (value : real_model.signature.carrier) : Prop :=
  real_model.signature.nonstrict_order interval.lower value ∧
    real_model.signature.nonstrict_order value interval.upper

def width
    (real_model : RealModel)
    (interval : Interval real_model) : real_model.signature.carrier :=
  real_model.signature.addition interval.upper
    (real_model.signature.negation interval.lower)

def enclosure_addition
    (real_model : RealModel)
    (first second : Interval real_model) : Interval real_model where
  lower := real_model.signature.addition first.lower second.lower
  upper := real_model.signature.addition first.upper second.upper

theorem enclosure_addition_is_valid
    (real_model : RealModel)
    (first second : Interval real_model)
    (first_valid : valid real_model first)
    (second_valid : valid real_model second) :
    valid real_model (enclosure_addition real_model first second) := by
  sorry

structure EnclosesBinaryOperation
    (real_model : RealModel)
    (interval_operation : Interval real_model → Interval real_model → Interval real_model)
    (point_operation :
      real_model.signature.carrier → real_model.signature.carrier →
        real_model.signature.carrier) : Prop where
  encloses :
    ∀ first_interval second_interval first_value second_value,
      contains real_model first_interval first_value →
      contains real_model second_interval second_value →
      valid real_model first_interval →
      valid real_model second_interval →
        contains real_model
          (interval_operation first_interval second_interval)
          (point_operation first_value second_value)

theorem addition_enclosure_is_sound
    (real_model : RealModel) :
    EnclosesBinaryOperation real_model
      (enclosure_addition real_model)
      real_model.signature.addition := by
  sorry

theorem dependency_can_make_enclosures_strict
    (real_model : RealModel) :
    ∃ interval : Interval real_model,
      ∃ expression_enclosure direct_enclosure : Interval real_model,
        (∀ value, contains real_model direct_enclosure value →
          contains real_model expression_enclosure value) ∧
        expression_enclosure ≠ direct_enclosure := by
  sorry

end IntervalArithmetic
end Reals
end VolumeII
end LRA
