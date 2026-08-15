import LRA.VolumeI.Order.Lattices.Lattice.Definition

namespace LRA.Order

universe u

/--
`FailsLattice`

Statement: A relation fails the lattice laws.

Logical form: `Not (Lattice relation)`.
-/
def FailsLattice
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (Lattice relation)

section BooleanAntichain

/--
`BooleanEqualityFailsLattice`

Statement: Equality on two distinct booleans is a partial order but not a lattice.

Logical form: `FailsLattice (fun left right : Bool => left = right)`.
-/
theorem BooleanEqualityFailsLattice :
    FailsLattice (fun left right : Bool => left = right) := by
  sorry

end BooleanAntichain

end LRA.Order
