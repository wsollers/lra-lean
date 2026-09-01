import Mathlib.Algebra.Order.Field.Basic
import Mathlib.Order.ConditionallyCompleteLattice.Basic
import LRA.AlgebraicStructures.CompleteOrderedField.Interface.Laws.Definition
import LRA.AlgebraicStructures.OrderedField.Constructions.Mathlib.Laws
import LRA.Order.Interop.Mathlib.Certificates

namespace LRA.AlgebraicStructures

universe u

theorem ofConditionallyCompleteLinearOrder {R : Type u} [_root_.Field R]
    [_root_.ConditionallyCompleteLinearOrder R]
    [_root_.IsStrictOrderedRing R] [Nonempty R] :
    CompleteOrderedFieldLaws R (Set R) := by
  sorry

end LRA.AlgebraicStructures
