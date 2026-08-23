import LRA.Set.ZFC.Union.Theorems
import LRA.Set.ZFC.RelativeComplement.Theorems

   
                                                                          
             
  

namespace LRA.Set.ZFC

                                                                            
                        
noncomputable def TheSymmetricDifference (A B : Set) : Set :=
  TheUnion (TheRelativeComplement A B) (TheRelativeComplement B A)

                                                                
theorem TheSymmetricDifferenceIsSymmetricDifferenceOf (A B : Set) :
    IsSymmetricDifferenceOf A B (TheSymmetricDifference A B) := by
  sorry

                                                     
theorem TheSymmetricDifferenceMembership (A B x : Set) :
    x ∈ TheSymmetricDifference A B ↔
      (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A) := by
  sorry

                                                        
theorem EverySymmetricDifferenceEqualsTheSymmetricDifference
    {A B D : Set}
    (DIsSymmetricDifferenceOf : IsSymmetricDifferenceOf A B D) :
    D = TheSymmetricDifference A B := by
  sorry

end LRA.Set.ZFC
