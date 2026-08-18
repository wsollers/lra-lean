import LRA.Relation.Definition

namespace LRA.Relation
universe u

/-- The identity relation: exactly equal elements are related. -/
def IdentityRelation (α : Type u) : Endorelation α := fun x y => x = y

end LRA.Relation
