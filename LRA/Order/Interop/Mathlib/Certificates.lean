import Mathlib.Algebra.Order.Field.Defs
import Mathlib.Order.ConditionallyCompleteLattice.Basic
import Mathlib.Data.Int.Basic
import Mathlib.Data.Rat.Defs
import Mathlib.Data.Real.Basic
import LRA.Order.Laws.PartialOrder.Definition
import LRA.Order.Laws.LinearOrder.Definition
import LRA.Order.Laws.StrictOrderCompatibility.Definition
import LRA.Order.Laws.OperationCompatibility.Definition
import LRA.Order.Density.DenseOrder.Definition
import LRA.Order.DiscreteOrder.Definition
import LRA.Order.Bounds.LeastUpperBoundProperty.CompletenessLaws

namespace LRA.Order

universe u

instance {R : Type u} [_root_.Preorder R] : StrictOrderCompatibilityLaw R where
  LtIffLeNotLe := fun a b => lt_iff_le_not_ge

instance {R : Type u} [_root_.PartialOrder R] : PartialOrderLaws R where
  LeRefl := le_refl
  LeAntisymm := fun _ _ h h' => le_antisymm h h'
  LeTrans := fun _ _ _ h h' => le_trans h h'

instance {R : Type u} [_root_.LinearOrder R] : TotalOrderLaw R where
  LeTotal := le_total

instance {R : Type u} [_root_.AddCommMonoid R] [_root_.PartialOrder R]
    [_root_.IsOrderedAddMonoid R] : AdditionRespectsOrderLaws R where
  AddLeAddLeft := fun _ _ h c => add_le_add_right h c
  AddLeAddRight := fun _ _ h c => add_le_add_left h c

instance {R : Type u} [_root_.Semiring R] [_root_.PartialOrder R] [_root_.IsOrderedRing R] :
    MultiplicationRespectsOrderLaws R where
  MulNonneg := fun _ _ ha hb => mul_nonneg ha hb

instance {R : Type u} [LT R] [_root_.DenselyOrdered R] : DenseOrderLaw R where
  ExistsBetween := fun _ _ h => exists_between h

instance : OrderDiscretenessLaw Int where
  NoStrictBetweenAddOne := by
    intro a h
    obtain ⟨middle, lower, upper⟩ := h
    omega

instance {R : Type u} [_root_.ConditionallyCompleteLinearOrder R] :
    OrderCompletenessLaws R (Set R) where
  Completeness := by
    intro subset ⟨w, hw⟩ ⟨b, hb⟩
    refine ⟨sSup subset, ?_, ?_⟩
    · intro x hx
      exact le_csSup ⟨b, fun y hy => hb y hy⟩ hx
    · intro c hc
      exact csSup_le ⟨w, hw⟩ fun y hy => hc y hy

example : LinearOrderLaws Int := inferInstance
example : OrderDiscretenessLaw Int := inferInstance
example : DenseOrderLaw Rat := inferInstance
example : DenseOrderLaw Real := inferInstance

end LRA.Order
