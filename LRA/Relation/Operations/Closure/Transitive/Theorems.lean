import LRA.Relation.Operations.Closure.Transitive.Definition
import LRA.Relation.Properties

namespace LRA.Relation

universe u

                                                             
theorem RelationIncludedInTransitiveClosure
    {Alpha : Type u} (relation : Endorelation Alpha) :
    RelationIncluded relation (TransitiveClosure relation) := by
  sorry

                                            
theorem TransitiveClosureIsTransitive
    {Alpha : Type u} (relation : Endorelation Alpha) :
    Transitive (TransitiveClosure relation) := by
  sorry

                                                                                                
theorem TransitiveClosureIsLeast
    {Alpha : Type u} (relation target : Endorelation Alpha)
    (relationIncluded : RelationIncluded relation target)
    (targetTransitive : Transitive target) :
    RelationIncluded (TransitiveClosure relation) target := by
  sorry

end LRA.Relation
