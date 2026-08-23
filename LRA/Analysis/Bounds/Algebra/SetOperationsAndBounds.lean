import LRA.Analysis.Bounds.Extrema.UpperLowerBounds

   
                                    
  

namespace LRA.Analysis.Bounds.Algebra

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

variable {S : Type*}

                                                                                        
                                                                    

             

       
                                                              
                                       
                                          
                          
   
  
theorem UnionPreservesUpperBounds [LE S] {A B : Set S} {u : S}
    (leftUpperBound : IsUpperBound u A)
    (rightUpperBound : IsUpperBound u B) :
    IsUpperBound u (A ∪ B) := by
  sorry

                                                                                        
                                                                    

             

       
                                                              
                                       
                                          
                          
   
  
theorem UnionPreservesLowerBounds [LE S] {A B : Set S} {l : S}
    (leftLowerBound : IsLowerBound l A)
    (rightLowerBound : IsLowerBound l B) :
    IsLowerBound l (A ∪ B) := by
  sorry

                                                                                                    
   

             

       
                                                                     
                                                                
   
  
theorem UnionBoundedAboveIffPiecesBoundedAbove [LE S] {A B : Set S} :
    IsBoundedAbove (A ∪ B) ↔ IsBoundedAbove A ∧ IsBoundedAbove B := by
  sorry

                                                                                                    
   

             

       
                                                                     
                                                                
   
  
theorem UnionBoundedBelowIffPiecesBoundedBelow [LE S] {A B : Set S} :
    IsBoundedBelow (A ∪ B) ↔ IsBoundedBelow A ∧ IsBoundedBelow B := by
  sorry

                                                                                         

             

       
                                                           
                                                 
   
  
theorem UnionBoundedIffPiecesBounded [LE S] {A B : Set S} :
    IsBounded (A ∪ B) ↔ IsBounded A ∧ IsBounded B := by
  sorry

                                                                                     
                                                                   

             

       
                                                                     
                              
                                               
                    
   
  
theorem SubsetsPreserveUpperBounds [Preorder S] {C A : Set S} {u : S}
    (subsetHypothesis : C ⊆ A)
    (upperBoundHypothesis : IsUpperBound u A) :
    IsUpperBound u C := by
  sorry

                                                                                     
                                                                   

             

       
                                                                     
                              
                                               
                    
   
  
theorem SubsetsPreserveLowerBounds [Preorder S] {C A : Set S} {l : S}
    (subsetHypothesis : C ⊆ A)
    (lowerBoundHypothesis : IsLowerBound l A) :
    IsLowerBound l C := by
  sorry

                                                                                                  
                         

             

       
                                                                    
                                               
                          
   
  
theorem IntersectionsInheritUpperBounds [LE S] {A B : Set S} {u : S}
    (upperBoundHypothesis : IsUpperBound u A) :
    IsUpperBound u (A ∩ B) := by
  sorry

                                                                                                  
                         

             

       
                                                                    
                                               
                          
   
  
theorem IntersectionsInheritLowerBounds [LE S] {A B : Set S} {l : S}
    (lowerBoundHypothesis : IsLowerBound l A) :
    IsLowerBound l (A ∩ B) := by
  sorry

                                                                                                  
                         

             

       
                                                                  
                                               
                          
   
  
theorem DifferencesInheritUpperBounds [LE S] {A B : Set S} {u : S}
    (upperBoundHypothesis : IsUpperBound u A) :
    IsUpperBound u (A \ B) := by
  sorry

                                                                                                  
                         

             

       
                                                                  
                                               
                          
   
  
theorem DifferencesInheritLowerBounds [LE S] {A B : Set S} {l : S}
    (lowerBoundHypothesis : IsLowerBound l A) :
    IsLowerBound l (A \ B) := by
  sorry

                                                                                                  
                         

             

       
                                                                  
                                               
                          
   
  
theorem ComplementsInheritUpperBounds [LE S] {A T : Set S} {u : S}
    (upperBoundHypothesis : IsUpperBound u T) :
    IsUpperBound u (T \ A) := by
  sorry

                                                                                                  
                         

             

       
                                                                  
                                               
                          
   
  
theorem ComplementsInheritLowerBounds [LE S] {A T : Set S} {l : S}
    (lowerBoundHypothesis : IsLowerBound l T) :
    IsLowerBound l (T \ A) := by
  sorry

end LRA.Analysis.Bounds.Algebra
