import LRA.Relation.Operations.Closure.Reflexive.Definition
import LRA.Relation.Properties

namespace LRA.Relation

universe u

                                                            
theorem RelationIncludedInReflexiveClosure
    {Alpha : Type u} (relation : Endorelation Alpha) :
    RelationIncluded relation (ReflexiveClosure relation) := by
  sorry

                                          
theorem ReflexiveClosureIsReflexive
    {Alpha : Type u} (relation : Endorelation Alpha) :
    Reflexive (ReflexiveClosure relation) := by
  sorry

                                                                                              
theorem ReflexiveClosureIsLeast
    {Alpha : Type u} (relation target : Endorelation Alpha)
    (relationIncluded : RelationIncluded relation target)
    (targetReflexive : Reflexive target) :
    RelationIncluded (ReflexiveClosure relation) target := by
  sorry

end LRA.Relation
