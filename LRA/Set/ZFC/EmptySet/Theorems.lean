import LRA.Set.ZFC.Axioms.EmptySet
import LRA.Set.ZFC.Definitions
import LRA.Set.ZFC.Extensionality.Theorems

   
                                                    
  

namespace LRA.Set.ZFC

                                 
theorem EmptySetExists :
    ∃ A : Set, IsEmptySet A := by
  sorry

                                                     
theorem EmptySetIsUnique
    {A B : Set}
    (AIsEmpty : IsEmptySet A)
    (BIsEmpty : IsEmptySet B) :
    B = A := by
  sorry

                                    
theorem EmptySetsAreEqual
    {A B : Set}
    (AIsEmpty : IsEmptySet A)
    (BIsEmpty : IsEmptySet B) :
    A = B := by
  sorry

                                             
                                      
theorem EmptySetExistsAndIsUnique :
    ExistsAndUnique IsEmptySet := by
  sorry

                                                                     
noncomputable def TheEmptySet : Set :=
  Classical.choose EmptySetExists

                                           
theorem TheEmptySetIsEmpty :
    IsEmptySet TheEmptySet := by
  sorry

                                                        
theorem EveryEmptySetEqualsTheEmptySet
    {A : Set}
    (AIsEmpty : IsEmptySet A) :
    A = TheEmptySet := by
  sorry

end LRA.Set.ZFC
