import LRA.VolumeI.Order.Lattices.CompleteLattice.Definition

namespace LRA.VolumeI.Order

universe u v

/-- Complete-lattice structure is invariant under order duality. -/
theorem ConverseIsCompleteLatticeIff
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.VolumeI.Relations.Endorelation Element) :
    CompleteLattice SetObject (LRA.VolumeI.Relations.Converse relation) ↔
      CompleteLattice SetObject relation := by
  sorry

end LRA.VolumeI.Order
