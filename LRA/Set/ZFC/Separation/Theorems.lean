import LRA.Set.ZFC.Axioms.Separation
import LRA.Set.ZFC.Definitions
import LRA.Set.ZFC.Extensionality.Theorems

   
                                                       

                                                                        
                                              
  

namespace LRA.Set.ZFC

                                                            
theorem SeparatedSubsetExists (A : Set) (property : Set → Prop) :
    ∃ B : Set, IsSeparatedSubset A property B := by
  sorry

                                                                  
theorem SeparatedSubsetIsUnique
    {A : Set} {property : Set → Prop} {B C : Set}
    (BIsSeparatedSubset : IsSeparatedSubset A property B)
    (CIsSeparatedSubset : IsSeparatedSubset A property C) :
    C = B := by
  sorry

                                                     
                                                                       
theorem SeparatedSubsetExistsAndIsUnique (A : Set) (property : Set → Prop) :
    ExistsAndUnique (fun B : Set => IsSeparatedSubset A property B) := by
  sorry

                                                 
noncomputable def TheSeparatedSubset (A : Set) (property : Set → Prop) : Set :=
  Classical.choose (SeparatedSubsetExists A property)

                                                            
theorem TheSeparatedSubsetIsSeparatedSubset (A : Set) (property : Set → Prop) :
    IsSeparatedSubset A property (TheSeparatedSubset A property) := by
  sorry

                                                    
theorem EverySeparatedSubsetEqualsTheSeparatedSubset
    {A : Set} {property : Set → Prop} {B : Set}
    (BIsSeparatedSubset : IsSeparatedSubset A property B) :
    B = TheSeparatedSubset A property := by
  sorry

end LRA.Set.ZFC
