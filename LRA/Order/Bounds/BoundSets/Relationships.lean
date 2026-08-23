import LRA.Order.Bounds.BoundSets.Theorems

namespace LRA.Order

open LRA.Set

universe u v

section GaloisRelationships

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [Union SetObject] [Inter SetObject] [SDiff SetObject]
variable [EmptyCollection SetObject] [HasSubset SetObject]
variable [HasSeparation Element SetObject]
variable [HasUniversal SetObject] [HasComplement SetObject]
variable [MembershipLaws Element SetObject]
variable [SeparationLaws Element SetObject]
variable [UniversalMembershipLaws Element SetObject]
variable [ExtensionalityLaw Element SetObject]
variable [SubsetLaws SetObject]

   
                                  

                                                                           
                    

                                                                            
  
theorem SubsetOfLowerBoundsOfUpperBounds
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    subset ⊆ LowerBounds relation (UpperBounds relation subset) := by
  sorry

   
                                  

                                                                           
                    

                                                                            
  
theorem SubsetOfUpperBoundsOfLowerBounds
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    subset ⊆ UpperBounds relation (LowerBounds relation subset) := by
  sorry

   
                                   

                                                                         
                                     

                                            
  
theorem UpperBoundsLowerBoundsUpperBounds
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    UpperBounds relation
        (LowerBounds relation (UpperBounds relation subset)) =
      UpperBounds relation subset := by
  sorry

   
                                   

                                                                         
                                     

                                            
  
theorem LowerBoundsUpperBoundsLowerBounds
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    LowerBounds relation
        (UpperBounds relation (LowerBounds relation subset)) =
      LowerBounds relation subset := by
  sorry

   
                              

                                                               

                                                           
  
theorem LowerUpperClosureIsExtensive
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    subset ⊆ LowerUpperClosure relation subset := by
  sorry

   
                             

                                                                      

                                                                                                          
  
theorem LowerUpperClosureIsMonotone
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject}
    (smallerIsContained : smaller ⊆ larger) :
    LowerUpperClosure relation smaller ⊆
      LowerUpperClosure relation larger := by
  sorry

   
                               

                                                                             
        

                                                                                                                   
  
theorem LowerUpperClosureIsIdempotent
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    LowerUpperClosure relation (LowerUpperClosure relation subset) =
      LowerUpperClosure relation subset := by
  sorry

   
                              

                                                               

                                                           
  
theorem UpperLowerClosureIsExtensive
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    subset ⊆ UpperLowerClosure relation subset := by
  sorry

   
                             

                                                                      

                                                                                                          
  
theorem UpperLowerClosureIsMonotone
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject}
    (smallerIsContained : smaller ⊆ larger) :
    UpperLowerClosure relation smaller ⊆
      UpperLowerClosure relation larger := by
  sorry

   
                               

                                                                             
        

                                                                                                                   
  
theorem UpperLowerClosureIsIdempotent
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) :
    UpperLowerClosure relation (UpperLowerClosure relation subset) =
      UpperLowerClosure relation subset := by
  sorry

end GaloisRelationships

end LRA.Order
