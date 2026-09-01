import Mathlib.Algebra.Ring.Basic
import LRA.AlgebraicStructures.IntegralDomain.Interface.Laws.Definition
import LRA.AlgebraicStructures.CommutativeRing.Constructions.Mathlib.Laws
import LRA.AlgebraicStructures.NontrivialRing.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures

universe u

instance {R : Type u} [_root_.CommRing R] [_root_.IsDomain R] [Nonempty R] :
    IntegralDomainLaws R := by
  sorry

end LRA.AlgebraicStructures
