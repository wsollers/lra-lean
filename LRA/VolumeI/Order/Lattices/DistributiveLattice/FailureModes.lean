import LRA.VolumeI.Order.Lattices.DistributiveLattice.Definition

namespace LRA.Order

/-- The five-element diamond relation `M₃`. -/
def M3Relation : LRA.Relation.Endorelation (Fin 5) :=
  fun left right =>
    left = right \/ left = 0 \/ right = 4

/-- The pentagon relation `N₅`. -/
def N5Relation : LRA.Relation.Endorelation (Fin 5) :=
  fun left right =>
    left = right \/ left = 0 \/ right = 4 \/ (left = 1 /\ right = 2)

/-- The diamond `M₃` is a lattice but is not distributive. -/
theorem M3IsNondistributiveLattice :
    Lattice M3Relation /\ Not (DistributiveLattice M3Relation) := by
  sorry

/-- The pentagon `N₅` is a lattice but is not distributive. -/
theorem N5IsNondistributiveLattice :
    Lattice N5Relation /\ Not (DistributiveLattice N5Relation) := by
  sorry

end LRA.Order
