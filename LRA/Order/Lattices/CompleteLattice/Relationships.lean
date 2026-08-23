import LRA.Relation.Operations.Converse.Definition
import LRA.Order.Lattices.CompleteLattice.Definition

namespace LRA.Order

universe u v

                                                                   
theorem ConverseIsCompleteLatticeIff
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) :
    CompleteLattice SetObject (LRA.Relation.Converse relation) ↔
      CompleteLattice SetObject relation := by
  sorry

end LRA.Order
