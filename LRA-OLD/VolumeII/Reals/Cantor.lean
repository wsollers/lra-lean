-- LRA/VolumeII/Reals/Cantor.lean
-- Cantor reals through nested rational endpoint intervals.

import LRA.VolumeII.Reals.Cauchy

namespace LRA
namespace VolumeII
namespace Reals
namespace Cantor

/-!
Volume II label: cantor-nested-interval-reals
Lean module: LRA.VolumeII.Reals.Cantor
Source: docs/number-systems/gpt-06-reals-cantor.md
Verification status: statement-accepted-proof-pending
-/

open NumberSystems

structure EndpointInterval (rational_model : RationalModel) where
  lower : rational_model.signature.carrier
  upper : rational_model.signature.carrier
  lower_le_upper :
    rational_model.signature.nonstrict_order lower upper

structure NestedIntervalSequence (rational_model : RationalModel) where
  interval : Nat → EndpointInterval rational_model
  nested :
    ∀ index : Nat,
      rational_model.signature.nonstrict_order
        (interval index).lower ((interval (index + 1)).lower) ∧
      rational_model.signature.nonstrict_order
        ((interval (index + 1)).upper) (interval index).upper
  widths_converge_to_zero :
    ∀ positive_tolerance : rational_model.signature.carrier,
      rational_model.signature.strict_order rational_model.signature.zero positive_tolerance →
        ∃ index : Nat,
          rational_model.signature.strict_order
            (rational_model.signature.addition
              (interval index).upper
              (rational_model.signature.negation (interval index).lower))
            positive_tolerance

def endpoint_equivalent
    (rational_model : RationalModel)
    (first second : NestedIntervalSequence rational_model) : Prop :=
  ∀ tolerance : rational_model.signature.carrier,
    rational_model.signature.strict_order rational_model.signature.zero tolerance →
      ∃ index : Nat,
        rational_model.signature.strict_order
          (rational_model.signature.addition
            (first.interval index).lower
            (rational_model.signature.negation (second.interval index).upper))
          tolerance

theorem endpoint_equivalent_is_equivalence
    (rational_model : RationalModel) :
    Equivalence (endpoint_equivalent rational_model) := by
  sorry

def setoid (rational_model : RationalModel) :
    Setoid (NestedIntervalSequence rational_model) where
  r := endpoint_equivalent rational_model
  iseqv := endpoint_equivalent_is_equivalence rational_model

abbrev Carrier (rational_model : RationalModel) :=
  Quotient (setoid rational_model)

theorem cantor_reals_are_isomorphic_to_cauchy_reals
    (rational_model : RationalModel)
    (metric_data : Cauchy.RationalMetricData rational_model) :
    ∃ comparison :
      Carrier rational_model → Cauchy.Carrier rational_model metric_data,
      ∀ first second,
        comparison first = comparison second → first = second := by
  sorry

end Cantor
end Reals
end VolumeII
end LRA
