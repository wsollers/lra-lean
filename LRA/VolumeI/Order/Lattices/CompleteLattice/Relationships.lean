import LRA.VolumeI.Order.Lattices.CompleteLattice.Definition

namespace LRA.Order

universe u v

/-- Complete-lattice structure is invariant under order duality. -/
theorem ConverseIsCompleteLatticeIff
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) :
    CompleteLattice SetObject (LRA.Relation.Converse relation) ↔
      CompleteLattice SetObject relation := by
  sorry

end LRA.Order
