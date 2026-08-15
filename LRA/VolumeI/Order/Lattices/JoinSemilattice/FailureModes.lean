import LRA.VolumeI.Order.Lattices.JoinSemilattice.Definition

namespace LRA.Order

universe u

/--
`FailsJoinSemilattice`

Statement: A relation fails the join-semilattice laws.

Logical form: `Not (JoinSemilattice relation)`.
-/
def FailsJoinSemilattice
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (JoinSemilattice relation)

section BooleanAntichain

/--
`BooleanEqualityFailsJoinSemilattice`

Statement: Equality on two distinct booleans has no join for `false` and `true`.

Logical form: `FailsJoinSemilattice (fun left right : Bool => left = right)`.
-/
theorem BooleanEqualityFailsJoinSemilattice :
    FailsJoinSemilattice (fun left right : Bool => left = right) := by
  sorry

end BooleanAntichain

end LRA.Order
