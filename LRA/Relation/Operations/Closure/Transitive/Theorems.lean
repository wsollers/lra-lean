import LRA.Relation.Operations.Closure.Transitive.Definition
import LRA.Relation.Properties

namespace LRA.Relation

universe u

/-- Every relation is contained in its transitive closure. -/
theorem RelationIncludedInTransitiveClosure
    {Alpha : Type u} (relation : Endorelation Alpha) :
    RelationIncluded relation (TransitiveClosure relation) := by
  intro left right related
  exact TransitiveClosure.base related

/-- The transitive closure is transitive. -/
theorem TransitiveClosureIsTransitive
    {Alpha : Type u} (relation : Endorelation Alpha) :
    Transitive (TransitiveClosure relation) := by
  intro left middle right leftToMiddle middleToRight
  exact TransitiveClosure.trans leftToMiddle middleToRight

/-- The transitive closure is the least transitive relation containing the original relation. -/
theorem TransitiveClosureIsLeast
    {Alpha : Type u} (relation target : Endorelation Alpha)
    (relationIncluded : RelationIncluded relation target)
    (targetTransitive : Transitive target) :
    RelationIncluded (TransitiveClosure relation) target := by
  intro left right path
  induction path with
  | base related =>
      exact relationIncluded _ _ related
  | trans leftToMiddle middleToRight leftToMiddleInTarget middleToRightInTarget =>
      exact targetTransitive _ _ _ leftToMiddleInTarget middleToRightInTarget

end LRA.Relation
