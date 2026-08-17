import LRA.Relation.Operations.Closure.Symmetric.Definition
import LRA.Relation.Properties

namespace LRA.Relation

universe u

/-- Every relation is contained in its symmetric closure. -/
theorem RelationIncludedInSymmetricClosure
    {Alpha : Type u} (relation : Endorelation Alpha) :
    RelationIncluded relation (SymmetricClosure relation) := by
  intro left right related
  exact Or.inl related

/-- The symmetric closure is symmetric. -/
theorem SymmetricClosureIsSymmetric
    {Alpha : Type u} (relation : Endorelation Alpha) :
    Symmetric (SymmetricClosure relation) := by
  intro left right related
  rcases related with related | converseRelated
  · exact Or.inr related
  · exact Or.inl converseRelated

/-- The symmetric closure is the least symmetric relation containing the original relation. -/
theorem SymmetricClosureIsLeast
    {Alpha : Type u} (relation target : Endorelation Alpha)
    (relationIncluded : RelationIncluded relation target)
    (targetSymmetric : Symmetric target) :
    RelationIncluded (SymmetricClosure relation) target := by
  intro left right related
  rcases related with related | converseRelated
  · exact relationIncluded left right related
  · exact targetSymmetric right left (relationIncluded right left converseRelated)

end LRA.Relation
