import LRA.VolumeI.Order.Lattices.MeetSemilattice.Definition

namespace LRA.Order

universe u

/--
`FailsMeetSemilattice`

Statement: A relation fails the meet-semilattice laws.

Logical form: `Not (MeetSemilattice relation)`.
-/
def FailsMeetSemilattice
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (MeetSemilattice relation)

section BooleanAntichain

/--
`BooleanEqualityFailsMeetSemilattice`

Statement: Equality on two distinct booleans has no meet for `false` and `true`.

Logical form: `FailsMeetSemilattice (fun left right : Bool => left = right)`.
-/
theorem BooleanEqualityFailsMeetSemilattice :
    FailsMeetSemilattice (fun left right : Bool => left = right) := by
  sorry

end BooleanAntichain

end LRA.Order
