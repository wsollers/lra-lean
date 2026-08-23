import LRA.Relation.Operations.Closure.Symmetric.Definition
import LRA.Relation.Properties

namespace LRA.Relation

universe u

                                                            
theorem RelationIncludedInSymmetricClosure
    {Alpha : Type u} (relation : Endorelation Alpha) :
    RelationIncluded relation (SymmetricClosure relation) := by
  sorry

                                          
theorem SymmetricClosureIsSymmetric
    {Alpha : Type u} (relation : Endorelation Alpha) :
    Symmetric (SymmetricClosure relation) := by
  sorry

                                                                                              
theorem SymmetricClosureIsLeast
    {Alpha : Type u} (relation target : Endorelation Alpha)
    (relationIncluded : RelationIncluded relation target)
    (targetSymmetric : Symmetric target) :
    RelationIncluded (SymmetricClosure relation) target := by
  sorry

end LRA.Relation
