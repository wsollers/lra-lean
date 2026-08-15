import LRA.VolumeI.Order.Bounds.Infimum.Definition
import LRA.VolumeI.Order.Bounds.Supremum.Definition
import LRA.VolumeI.Set.MathlibPredicateSet

namespace LRA.Order

open LRA.Set

universe u v

/--
Statement: Indexed union is the supremum of a family in the powerset order.

Logical form: `Supremum (· ⊆ ·) (Set.range family) (indexedUnion family)`.
-/
example
    {Element : Type u} {Index : Type v}
    (family : Index -> Set Element) :
    Supremum
      (fun left right : Set Element => left ⊆ right)
      (Set.range family)
      (HasIndexedUnion.indexedUnion family) := by
  sorry

/--
Statement: Indexed intersection is the infimum of a family in the powerset
order.

Logical form: `Infimum (· ⊆ ·) (Set.range family) (indexedIntersection family)`.
-/
example
    {Element : Type u} {Index : Type v}
    (family : Index -> Set Element) :
    Infimum
      (fun left right : Set Element => left ⊆ right)
      (Set.range family)
      (HasIndexedIntersection.indexedIntersection family) := by
  sorry

end LRA.Order
