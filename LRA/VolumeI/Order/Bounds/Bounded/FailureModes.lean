import Mathlib.Data.Set.Basic
import Mathlib.Data.Real.Basic
import LRA.VolumeI.Order.Bounds.Bounded.Definition
import LRA.VolumeI.Order.Bounds.BoundedAbove.Definition
import LRA.VolumeI.Order.Bounds.BoundedBelow.Definition
import LRA.VolumeI.Set.MathlibPredicateSet

namespace LRA.Order

open LRA.Set

universe u v

/--
`FailsBounded`

Statement: A represented subset fails boundedness when it lacks an upper or lower bound.

Logical form: `Not (Bounded relation subset)`.
-/
def FailsBounded
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Not (Bounded relation subset)

section IntegerUniverse

/--
`IntegerUniverseFailsBounded`

Statement: The integers are not bounded in their usual order.

Logical form: `FailsBounded (fun left right : Int => left ≤ right) (Set.univ : Set Int)`.
-/
theorem IntegerUniverseFailsBounded :
    FailsBounded (fun left right : Int => left ≤ right) (Set.univ : Set Int) := by
  sorry

end IntegerUniverse

/--
`ComplementDestroysTwoSidedBoundedness`

Statement: Complement destroys two-sided boundedness when the original set is
bounded but its complement is neither bounded above nor bounded below.

Logical form: `Bounded relation subset ∧ ¬ BoundedAbove relation subsetᶜ ∧ ¬ BoundedBelow relation subsetᶜ`.
-/
def ComplementDestroysTwoSidedBoundedness
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [HasComplement SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Bounded relation subset /\
    Not (BoundedAbove relation subsetᶜ) /\
    Not (BoundedBelow relation subsetᶜ)

/--
`EveryBoundedRealSetHasUnboundedComplement`

Statement: The complement of every bounded predicate subset of the real line
is unbounded both above and below.

Logical form: `Bounded (· ≤ ·) subset → ComplementDestroysTwoSidedBoundedness (· ≤ ·) subset`.
-/
theorem EveryBoundedRealSetHasUnboundedComplement
    (subset : Set Real)
    (subsetIsBounded :
      Bounded (fun left right : Real => left ≤ right) subset) :
    ComplementDestroysTwoSidedBoundedness
      (fun left right : Real => left ≤ right) subset := by
  sorry

end LRA.Order
