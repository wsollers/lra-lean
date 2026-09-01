import Mathlib.Algebra.Ring.Defs
import LRA.AlgebraicStructures.CommutativeSemiring.Interface.Laws.Definition
import LRA.AlgebraicStructures.Semiring.Constructions.Mathlib.Laws
import LRA.AlgebraicStructures.CommutativeSemigroup.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures

universe u

instance {R : Type u} [_root_.CommSemiring R] [Nonempty R] :
    CommutativeSemiringLaws R := by
  sorry

end LRA.AlgebraicStructures
