import Mathlib.Algebra.Ring.Defs
import LRA.AlgebraicStructures.CommutativeRing.Interface.Laws.Definition
import LRA.AlgebraicStructures.CommutativeSemigroup.Constructions.Mathlib.Laws
import LRA.AlgebraicStructures.Ring.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures

universe u

instance {R : Type u} [_root_.CommRing R] [Nonempty R] :
    CommutativeRingLaws R := by
  sorry

end LRA.AlgebraicStructures
