import Mathlib.Algebra.Field.Defs
import LRA.AlgebraicStructures.DivisionRing.Interface.Laws.Definition
import LRA.AlgebraicStructures.NontrivialRing.Constructions.Mathlib.Laws
import LRA.AlgebraicStructures.Ring.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures

universe u

instance {R : Type u} [_root_.DivisionRing R] [Nonempty R] :
    DivisionRingLaws R := by
  sorry
end LRA.AlgebraicStructures
