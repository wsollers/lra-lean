import Mathlib.Algebra.Order.Group.Defs
import Mathlib.Algebra.Order.Monoid.TypeTags
import LRA.AlgebraicStructures.OrderedGroup.Interface.Laws.Definition
import LRA.AlgebraicStructures.Group.Constructions.Mathlib.Laws
import LRA.Order.Interop.Mathlib.Certificates

namespace LRA.AlgebraicStructures

universe u

instance {R : Type u} [_root_.CommGroup R] [_root_.PartialOrder R]
    [_root_.IsOrderedMonoid R] [Nonempty R] : OrderedGroupLaws R := by
  sorry

end LRA.AlgebraicStructures
