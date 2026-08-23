import LRA.Set.ZFC.Definitions
import LRA.Set.ZFC.Separation.Theorems

   
                                             
  

namespace LRA.Set.ZFC

                                                                           
                        
noncomputable def TheIntersection (A B : Set) : Set :=
  TheSeparatedSubset A (fun x => x ∈ B)

                                                        
theorem TheIntersectionIsIntersectionOf (A B : Set) :
    IsIntersectionOf A B (TheIntersection A B) := by
  sorry

                                             
theorem TheIntersectionMembership (A B x : Set) :
    x ∈ TheIntersection A B ↔ x ∈ A ∧ x ∈ B := by
  sorry

                                                
theorem EveryIntersectionEqualsTheIntersection
    {A B D : Set}
    (DIsIntersectionOf : IsIntersectionOf A B D) :
    D = TheIntersection A B := by
  sorry

end LRA.Set.ZFC
