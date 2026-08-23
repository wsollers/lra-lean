import LRA.Relation.Operations.Converse.Theorems

namespace LRA.Relation

universe u v

                                       
theorem Asymmetric.implies_irreflexive
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (asymmetric : Asymmetric relation) :
    Irreflexive relation := by
  sorry

                                                        
theorem Irreflexive.transitive_implies_asymmetric
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (irreflexive : Irreflexive relation)
    (transitive : Transitive relation) :
    Asymmetric relation := by
  sorry

                                      
theorem Asymmetric.implies_antisymmetric
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (asymmetric : Asymmetric relation) :
    Antisymmetric relation := by
  sorry

   
                                                                         
         
  
theorem Symmetric.antisymmetric_related_implies_equal
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (symmetric : Symmetric relation)
    (antisymmetric : Antisymmetric relation)
    {left right : Alpha}
    (related : relation left right) :
    left = right := by
  sorry

                                                                        
theorem Reflexive.asymmetric_contradiction_at
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (reflexive : Reflexive relation)
    (asymmetric : Asymmetric relation)
    (element : Alpha) :
    False := by
  sorry

end LRA.Relation
