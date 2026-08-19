import LRA.Relation.Operations.Composition.Definition
import LRA.Relation.Properties

namespace LRA.Relation

universe u

/-- Transitivity is equivalent to containing the relation's square. -/
theorem Transitive.iff_square_included
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Transitive relation ↔
      RelationIncluded (RelationComposition relation relation) relation := by
  constructor
  · intro transitive left right composed
    rcases composed with ⟨middle, leftRelatedMiddle, middleRelatedRight⟩
    exact transitive left middle right leftRelatedMiddle middleRelatedRight
  · intro squareIncluded left middle right leftRelatedMiddle middleRelatedRight
    exact squareIncluded left right ⟨middle, leftRelatedMiddle, middleRelatedRight⟩

end LRA.Relation
