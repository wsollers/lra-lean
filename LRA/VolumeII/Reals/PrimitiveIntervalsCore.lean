-- Proof-ready primitive interval quotient core.

import LRA.VolumeII.NumberSystems.Models

namespace LRA.VolumeII.Reals.PrimitiveIntervalsCore

open NumberSystems

structure RationalInterval (rational_model : RationalModel) where
  left : rational_model.signature.carrier
  right : rational_model.signature.carrier
  ordered : rational_model.signature.nonstrict_order left right

def contains (rational_model : RationalModel)
    (interval : RationalInterval rational_model)
    (value : rational_model.signature.carrier) : Prop :=
  rational_model.signature.nonstrict_order interval.left value ∧
  rational_model.signature.nonstrict_order value interval.right

def overlaps (rational_model : RationalModel)
    (first second : RationalInterval rational_model) : Prop :=
  ∃ value, contains rational_model first value ∧ contains rational_model second value

def subset (rational_model : RationalModel)
    (inner outer : RationalInterval rational_model) : Prop :=
  rational_model.signature.nonstrict_order outer.left inner.left ∧
  rational_model.signature.nonstrict_order inner.right outer.right

def width (rational_model : RationalModel)
    (interval : RationalInterval rational_model) :=
  rational_model.signature.subtraction interval.right interval.left

structure Representative (rational_model : RationalModel) where
  interval : Nat → RationalInterval rational_model
  nested : ∀ n, subset rational_model (interval (n + 1)) (interval n)
  shrinking :
    ∀ epsilon,
      rational_model.signature.strict_order rational_model.signature.zero epsilon →
      ∃ N, ∀ n, N ≤ n →
        rational_model.signature.strict_order (width rational_model (interval n)) epsilon

def equivalent (rational_model : RationalModel)
    (first second : Representative rational_model) : Prop :=
  ∀ m n, overlaps rational_model (first.interval m) (second.interval n)

theorem equivalent_is_equivalence (rational_model : RationalModel) :
    Equivalence (equivalent rational_model) := by
  sorry

def setoid (rational_model : RationalModel) : Setoid (Representative rational_model) where
  r := equivalent rational_model
  iseqv := equivalent_is_equivalence rational_model

abbrev Carrier (rational_model : RationalModel) := Quotient (setoid rational_model)

theorem interval_addition_exists (rational_model : RationalModel) :
    ∀ first second : RationalInterval rational_model,
      ∃ result : RationalInterval rational_model,
        result.left = rational_model.signature.addition first.left second.left ∧
        result.right = rational_model.signature.addition first.right second.right := by
  sorry

theorem interval_negation_exists (rational_model : RationalModel) :
    ∀ interval : RationalInterval rational_model,
      ∃ result : RationalInterval rational_model,
        result.left = rational_model.signature.negation interval.right ∧
        result.right = rational_model.signature.negation interval.left := by
  sorry

theorem interval_product_exists (rational_model : RationalModel) :
    ∀ first second : RationalInterval rational_model,
      ∃ result : RationalInterval rational_model,
        ∀ corner,
          (corner = rational_model.signature.multiplication first.left second.left ∨
           corner = rational_model.signature.multiplication first.left second.right ∨
           corner = rational_model.signature.multiplication first.right second.left ∨
           corner = rational_model.signature.multiplication first.right second.right) →
          rational_model.signature.nonstrict_order result.left corner ∧
          rational_model.signature.nonstrict_order corner result.right := by
  sorry

theorem raw_multiplication_is_subdistributive (rational_model : RationalModel) :
    ∀ first second third : RationalInterval rational_model,
      ∃ left right : RationalInterval rational_model,
        subset rational_model left right := by
  sorry

theorem raw_distributivity_can_fail (rational_model : RationalModel) :
    ∃ first second third left right : RationalInterval rational_model,
      subset rational_model left right ∧ ¬ subset rational_model right left := by
  sorry

end LRA.VolumeII.Reals.PrimitiveIntervalsCore
