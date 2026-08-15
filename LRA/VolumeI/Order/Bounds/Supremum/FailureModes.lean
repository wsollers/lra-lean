import Mathlib.Data.Set.Basic
import LRA.VolumeI.Order.Bounds.Supremum.Definition
import LRA.VolumeI.Order.OrderedSets.Preorder.Definition

namespace LRA.Order

universe u v

/--
`FailsSupremumUniqueness`

Statement: Supremum uniqueness fails when a subset has two distinct suprema.

Logical form: `Exists fun first => Exists fun second => first ≠ second ∧ Supremum relation subset first ∧ Supremum relation subset second`.
-/
def FailsSupremumUniqueness
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  exists first second,
    first ≠ second /\
      Supremum relation subset first /\
        Supremum relation subset second

/--
`SupremaNeedNotBeUniqueInPreorder`

Statement: Antisymmetry is necessary for uniqueness; in the universal Boolean
preorder both distinct elements are suprema of the full subset.

Logical form: `Preorder (fun _ _ : Bool => True) ∧ FailsSupremumUniqueness (fun _ _ : Bool => True) (Set.univ : Set Bool)`.
-/
theorem SupremaNeedNotBeUniqueInPreorder :
    Preorder (fun _ _ : Bool => True) /\
      FailsSupremumUniqueness
        (fun _ _ : Bool => True) (Set.univ : Set Bool) := by
  sorry

end LRA.Order
