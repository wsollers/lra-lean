import LRA.Set.ZFC.Union.Theorems
import LRA.Set.ZFC.Separation.Theorems

   
                                                                        
                                  
  

namespace LRA.Set.ZFC

                                                                      
                                
noncomputable def TheIntersectionOver (A : Set) : Set :=
  TheSeparatedSubset (TheUnionOver A)
    (fun x => ∀ B : Set, B ∈ A → x ∈ B)

                                                                        
                              
theorem TheIntersectionOverMembership (A x : Set)
    (collectionNonempty : ∃ B : Set, B ∈ A) :
    x ∈ TheIntersectionOver A ↔ ∀ B : Set, B ∈ A → x ∈ B := by
  sorry

end LRA.Set.ZFC
