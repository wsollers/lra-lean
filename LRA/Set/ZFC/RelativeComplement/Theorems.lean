import LRA.Set.ZFC.Definitions
import LRA.Set.ZFC.Separation.Theorems

   
                                                                         
  

namespace LRA.Set.ZFC

                                                                       
                                      
noncomputable def TheRelativeComplement (A B : Set) : Set :=
  TheSeparatedSubset A (fun x => x ∉ B)

                                                               
theorem TheRelativeComplementIsRelativeComplementOf (A B : Set) :
    IsRelativeComplementOf A B (TheRelativeComplement A B) := by
  sorry

                                                    
theorem TheRelativeComplementMembership (A B x : Set) :
    x ∈ TheRelativeComplement A B ↔ x ∈ A ∧ x ∉ B := by
  sorry

                                                       
theorem EveryRelativeComplementEqualsTheRelativeComplement
    {A B D : Set}
    (DIsRelativeComplementOf : IsRelativeComplementOf A B D) :
    D = TheRelativeComplement A B := by
  sorry

end LRA.Set.ZFC
