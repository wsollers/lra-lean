import Mathlib.Algebra.Field.Defs
import LRA.AlgebraicStructures.Field.Interface.Laws.Definition
import LRA.AlgebraicStructures.CommutativeRing.Constructions.Mathlib.Laws
import LRA.AlgebraicStructures.DivisionRing.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures

universe u

instance {R : Type u} [_root_.Field R] [Nonempty R] :
    FieldLaws R := by
  sorry
end LRA.AlgebraicStructures
