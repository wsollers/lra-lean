import LRA.Identity.Axioms
import LRA.Relation.Definition
import LRA.Relation.Properties.Definition
import LRA.Relation.Canonical.IdentityRelation.Definition
import LRA.Relation.Structures.Definition
import LRA.Identity.Equality.Definition

namespace LRA.Identity

universe u

                                                                                
theorem EqualitySymmetry {Carrier : Type u} {left right : Carrier}
    (ObjectsAreEqual : left = right) :
    right = left := by
  sorry

                                                                 
theorem EqualityTransitivity {Carrier : Type u} {first second third : Carrier}
    (FirstEqualsSecond : first = second)
    (SecondEqualsThird : second = third) :
    first = third := by
  sorry

   
                                                           

             

       
                                                        
                                                     
   
  
theorem EqualityRelationIsReflexive (Carrier : Type u) :
    LRA.Relation.Reflexive (EqualityRelation Carrier) := by
  sorry

   
                                                           

             

       
                                                        
                                                     
   
  
theorem EqualityRelationIsSymmetric (Carrier : Type u) :
    LRA.Relation.Symmetric (EqualityRelation Carrier) := by
  sorry

   
                                                            

             

       
                                                         
                                                      
   
  
theorem EqualityRelationIsTransitive (Carrier : Type u) :
    LRA.Relation.Transitive (EqualityRelation Carrier) := by
  sorry

   
                                    

             

       
                                                          
                                                               
   
  
theorem EqualityRelationIsEquivalence (Carrier : Type u) :
    LRA.Relation.EquivalenceRelation (EqualityRelation Carrier) := by
  sorry

   
                                                                

             

       
                                                          
                                                               
   
  
theorem EqualityIsEquivalenceRelation (Carrier : Type u) :
    LRA.Relation.EquivalenceRelation (EqualityRelation Carrier) := by
  sorry

end LRA.Identity
