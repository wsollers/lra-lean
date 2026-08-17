import LRA.Relation.Definition

namespace LRA.Relation
universe u

/-- The diversity relation: exactly distinct elements are related. -/
def DiversityRelation (α : Type u) : Endorelation α := fun x y => x ≠ y

end LRA.Relation
