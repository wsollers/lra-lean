import Mathlib.Algebra.Order.Field.Basic
import LRA.AlgebraicStructures.OrderedField.Interface.Laws.Definition
import LRA.AlgebraicStructures.Field.Constructions.Mathlib.Laws
import LRA.Order.Interop.Mathlib.Certificates

namespace LRA.AlgebraicStructures

universe u

instance {R : Type u} [_root_.Field R] [_root_.LinearOrder R]
    [_root_.IsStrictOrderedRing R] [Nonempty R] :
    OrderedFieldLaws R := by
  sorry
end LRA.AlgebraicStructures
