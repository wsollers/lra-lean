import LRA.Relation.Definition

namespace LRA.Relation
universe u

/-- The empty relation: no pair is related. -/
def EmptyRelation (α : Type u) : Endorelation α := fun _ _ => False

end LRA.Relation
