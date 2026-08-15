import LRA.VolumeI.Order.Lattices.DistributiveLattice.Definition

namespace LRA.Order

universe u

/--
`FailsDistributiveLattice`

Statement: A lattice relation fails when it does not satisfy distributivity.

Logical form: `Lattice relation ∧ Not (DistributiveLattice relation)`.
-/
def FailsDistributiveLattice
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Lattice relation /\ Not (DistributiveLattice relation)

/--
`M3Relation`

Statement: The five-element diamond relation `M₃` has bottom `0`, top `4`,
and three incomparable middle elements.

Logical form: `left = right ∨ left = 0 ∨ right = 4`.
-/
def M3Relation : LRA.Relation.Endorelation (Fin 5) :=
  fun left right =>
    left = right \/ left = 0 \/ right = 4

/--
`N5Relation`

Statement: The pentagon relation `N₅` augments the common bottom and top with
the comparison from `1` to `2`.

Logical form: `left = right ∨ left = 0 ∨ right = 4 ∨ (left = 1 ∧ right = 2)`.
-/
def N5Relation : LRA.Relation.Endorelation (Fin 5) :=
  fun left right =>
    left = right \/ left = 0 \/ right = 4 \/ (left = 1 /\ right = 2)

/--
`M3IsNondistributiveLattice`

Statement: The diamond `M₃` is a lattice but is not distributive.

Logical form: `FailsDistributiveLattice M3Relation`.
-/
theorem M3IsNondistributiveLattice :
    FailsDistributiveLattice M3Relation := by
  sorry

/--
`N5IsNondistributiveLattice`

Statement: The pentagon `N₅` is a lattice but is not distributive.

Logical form: `FailsDistributiveLattice N5Relation`.
-/
theorem N5IsNondistributiveLattice :
    FailsDistributiveLattice N5Relation := by
  sorry

end LRA.Order
