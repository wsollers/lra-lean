import LRA.Relation.Operations.Closure.Transitive.Definition
import LRA.Relation.Properties

namespace LRA.Relation

universe u

/-- Every relation is contained in its transitive closure. -/
theorem RelationIncludedInTransitiveClosure
    {Alpha : Type u} (relation : Endorelation Alpha) :
    RelationIncluded relation (TransitiveClosure relation) := by
  sorry

/-- The transitive closure is transitive. -/
theorem TransitiveClosureIsTransitive
    {Alpha : Type u} (relation : Endorelation Alpha) :
    Transitive (TransitiveClosure relation) := by
  sorry

/-- The transitive closure is the least transitive relation containing the original relation. -/
theorem TransitiveClosureIsLeast
    {Alpha : Type u} (relation target : Endorelation Alpha)
    (relationIncluded : RelationIncluded relation target)
    (targetTransitive : Transitive target) :
    RelationIncluded (TransitiveClosure relation) target := by
  sorry

end LRA.Relation
