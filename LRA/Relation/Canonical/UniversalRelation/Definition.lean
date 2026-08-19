import LRA.Relation.Definition

namespace LRA.Relation
universe u

/-- The universal relation: every pair is related. -/
def UniversalRelation (α : Type u) : Endorelation α := fun _ _ => True

end LRA.Relation
