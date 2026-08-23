import LRA.Relation.Definition

namespace LRA.Relation
universe u

                                              
def EmptyRelation (α : Type u) : Endorelation α := fun _ _ => False

end LRA.Relation
