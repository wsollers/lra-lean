import LRA.VolumeI.AlgebraicStructures.Group.Laws.Definition
import LRA.VolumeI.Order.Laws.PartialOrder.Definition
import LRA.VolumeI.Order.Laws.OperationCompatibility.Definition

namespace LRA.AlgebraicStructures

universe u

/-! Ordered group law certificates. -/

/-- Multiplicative translations preserve the displayed non-strict order. -/
class MultiplicativeOrderCompatibilityLaws (R : Type u)
    [Mul R] [LE R] : Prop where
  MulLeMulLeft :
    LRA.Order.LeftTranslationPreservesRelation
      (fun a b : R => a <= b) (fun a b : R => a * b)
  MulLeMulRight :
    LRA.Order.RightTranslationPreservesRelation
      (fun a b : R => a <= b) (fun a b : R => a * b)

/-- Ordered group laws. -/
class abbrev OrderedGroupLaws (R : Type u)
    [Mul R] [Inv R] [OfNat R 1] [LE R] : Prop :=
  GroupLaws R, LRA.Order.PartialOrderLaws R,
  MultiplicativeOrderCompatibilityLaws R

end LRA.AlgebraicStructures
