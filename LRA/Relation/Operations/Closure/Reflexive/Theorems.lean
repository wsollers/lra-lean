import LRA.Relation.Operations.Closure.Reflexive.Definition
import LRA.Relation.Properties

namespace LRA.Relation

universe u

/-- Every relation is contained in its reflexive closure. -/
theorem RelationIncludedInReflexiveClosure
    {Alpha : Type u} (relation : Endorelation Alpha) :
    RelationIncluded relation (ReflexiveClosure relation) := by
  sorry

/-- The reflexive closure is reflexive. -/
theorem ReflexiveClosureIsReflexive
    {Alpha : Type u} (relation : Endorelation Alpha) :
    Reflexive (ReflexiveClosure relation) := by
  sorry

/-- The reflexive closure is the least reflexive relation containing the original relation. -/
theorem ReflexiveClosureIsLeast
    {Alpha : Type u} (relation target : Endorelation Alpha)
    (relationIncluded : RelationIncluded relation target)
    (targetReflexive : Reflexive target) :
    RelationIncluded (ReflexiveClosure relation) target := by
  sorry

end LRA.Relation
