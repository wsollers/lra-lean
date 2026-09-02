import Mathlib.Algebra.Order.Group.Defs
import Mathlib.Algebra.Order.Monoid.TypeTags
import LRA.AlgebraicStructures.LinearlyOrderedGroup.Interface.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

instance {R : Type u} [_root_.CommGroup R] [_root_.LinearOrder R]
    [_root_.IsOrderedMonoid R] [Nonempty R] :
    LinearlyOrderedGroupLaws R := by
  sorry
end LRA.AlgebraicStructures
