import Mathlib.Data.Set.Basic
import LRA.VolumeI.Order.Bounds.LeastUpperBoundProperty.Definition
import LRA.VolumeI.Order.Lattices.CompleteLattice.Definition

namespace LRA.Order

universe u v

/--
`FailsCompleteLattice`

Statement: A relation fails completeness when some represented subset lacks a
supremum or infimum.

Logical form: `Not (CompleteLattice SetObject relation)`.
-/
def FailsCompleteLattice
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (CompleteLattice SetObject relation)

/--
`IntegerLeastUpperBoundPropertyDoesNotImplyCompleteLattice`

Statement: The integers have the least-upper-bound property for nonempty
bounded-above subsets but are not a complete lattice.

Logical form: `LeastUpperBoundProperty (Set Int) (fun left right : Int => left ≤ right) ∧ FailsCompleteLattice (Set Int) (fun left right : Int => left ≤ right)`.
-/
theorem IntegerLeastUpperBoundPropertyDoesNotImplyCompleteLattice :
    LeastUpperBoundProperty (Set Int) (fun left right : Int => left ≤ right) /\
      FailsCompleteLattice (Set Int)
        (fun left right : Int => left ≤ right) := by
  sorry

end LRA.Order
