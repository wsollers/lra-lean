import LRA.Relation.Definition

namespace LRA.Relation
universe u

                                                                     
def DiversityRelation (α : Type u) : Endorelation α := fun x y => x ≠ y

end LRA.Relation
