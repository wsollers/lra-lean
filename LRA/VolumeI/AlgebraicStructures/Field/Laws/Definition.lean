import LRA.VolumeI.AlgebraicStructures.DivisionRing.Laws.Definition
import LRA.VolumeI.AlgebraicStructures.IntegralDomain.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

/-! Field law certificates. -/

/-- Field laws: a commutative division ring. -/
class abbrev FieldLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] : Prop :=
  DivisionRingLaws R, MultiplicativeCommutativeLaws R

end LRA.AlgebraicStructures
