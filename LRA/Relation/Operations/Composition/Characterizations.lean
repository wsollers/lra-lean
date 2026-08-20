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
  sorry

end LRA.Relation
