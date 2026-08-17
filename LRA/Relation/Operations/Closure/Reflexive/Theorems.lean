import LRA.Relation.Operations.Closure.Reflexive.Definition
import LRA.Relation.Properties

namespace LRA.Relation

universe u

/-- Every relation is contained in its reflexive closure. -/
theorem RelationIncludedInReflexiveClosure
    {Alpha : Type u} (relation : Endorelation Alpha) :
    RelationIncluded relation (ReflexiveClosure relation) := by
  intro left right related
  exact Or.inl related

/-- The reflexive closure is reflexive. -/
theorem ReflexiveClosureIsReflexive
    {Alpha : Type u} (relation : Endorelation Alpha) :
    Reflexive (ReflexiveClosure relation) := by
  intro element
  exact Or.inr rfl

/-- The reflexive closure is the least reflexive relation containing the original relation. -/
theorem ReflexiveClosureIsLeast
    {Alpha : Type u} (relation target : Endorelation Alpha)
    (relationIncluded : RelationIncluded relation target)
    (targetReflexive : Reflexive target) :
    RelationIncluded (ReflexiveClosure relation) target := by
  intro left right related
  rcases related with related | equal
  · exact relationIncluded left right related
  · rw [equal]
    exact targetReflexive right

end LRA.Relation
