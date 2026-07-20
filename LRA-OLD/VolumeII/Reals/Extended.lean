-- LRA/VolumeII/Reals/Extended.lean
-- The extended real line over a selected real model.

import LRA.VolumeII.Reals.Extensions

namespace LRA
namespace VolumeII
namespace Reals
namespace Extended

/-!
Volume II label: extended-real-line
Lean module: LRA.VolumeII.Reals.Extended
Source: docs/number-systems/gpt-08c-extended-reals.md
Verification status: statement-accepted-proof-pending
-/

open NumberSystems

inductive ExtendedReal (real_model : RealModel) where
  | negativeInfinity
  | finite (value : real_model.signature.carrier)
  | positiveInfinity

def nonstrict_order
    (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model → Prop
  | .negativeInfinity, _ => True
  | _, .positiveInfinity => True
  | .finite first, .finite second => real_model.signature.nonstrict_order first second
  | _, _ => False

def negation
    (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model
  | .negativeInfinity => .positiveInfinity
  | .positiveInfinity => .negativeInfinity
  | .finite value => .finite (real_model.signature.negation value)

def supremum
    (real_model : RealModel)
    (subset : ExtendedReal real_model → Prop)
    (candidate : ExtendedReal real_model) : Prop :=
  (∀ member, subset member → nonstrict_order real_model member candidate) ∧
    ∀ upper_bound,
      (∀ member, subset member → nonstrict_order real_model member upper_bound) →
        nonstrict_order real_model candidate upper_bound

theorem every_subset_has_supremum
    (real_model : RealModel)
    (subset : ExtendedReal real_model → Prop) :
    ∃ candidate : ExtendedReal real_model,
      supremum real_model subset candidate := by
  sorry

structure PartialOperation
    (real_model : RealModel)
    (operation : ExtendedReal real_model → ExtendedReal real_model → ExtendedReal real_model) where
  defined_at : ExtendedReal real_model → ExtendedReal real_model → Prop
  respects_finite_values :
    ∀ first second,
      defined_at (.finite first) (.finite second) →
        operation (.finite first) (.finite second) =
          .finite (real_model.signature.addition first second) ∨
        operation (.finite first) (.finite second) =
          .finite (real_model.signature.multiplication first second)

end Extended
end Reals
end VolumeII
end LRA
