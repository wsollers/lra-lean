import LRA.Relation.Properties.Definition
import LRA.Relation.Canonical.IdentityRelation.Definition
import LRA.Relation.Operations.Converse.Definition

namespace LRA.Relation

universe u v

   
                                           

                                   

             

       
                                     
                                      
   
  
theorem IdentityRelationIsReflexive
    {Alpha : Type u} :
    Reflexive (IdentityRelation Alpha) := by
  sorry

   
                                           

                                   

             

       
                                     
                                      
   
  
theorem IdentityRelationIsSymmetric
    {Alpha : Type u} :
    Symmetric (IdentityRelation Alpha) := by
  sorry

   
                                            

                                    

             

       
                                      
                                       
   
  
theorem IdentityRelationIsTransitive
    {Alpha : Type u} :
    Transitive (IdentityRelation Alpha) := by
  sorry

end LRA.Relation
