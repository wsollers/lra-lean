import LRA.Set.ZFC.Axioms.Replacement
import LRA.Set.ZFC.Definitions
import LRA.Set.ZFC.Extensionality.Theorems

   
                                                        

                                                                            
                            
  

namespace LRA.Set.ZFC

                                                                            
theorem ReplacementImageExists
    (A : Set) (relation : Set → Set → Prop)
    (functional : IsFunctionalOn A relation) :
    ∃ B : Set, IsReplacementImageOf A relation B := by
  sorry

                                                                
theorem ReplacementImageIsUnique
    {A : Set} {relation : Set → Set → Prop} {B C : Set}
    (BIsReplacementImageOf : IsReplacementImageOf A relation B)
    (CIsReplacementImageOf : IsReplacementImageOf A relation C) :
    C = B := by
  sorry

                                                      
                                                  
theorem ReplacementImageExistsAndIsUnique
    (A : Set) (relation : Set → Set → Prop)
    (functional : IsFunctionalOn A relation) :
    ExistsAndUnique (fun B : Set => IsReplacementImageOf A relation B) := by
  sorry

                                    
noncomputable def TheReplacementImage
    (A : Set) (relation : Set → Set → Prop)
    (functional : IsFunctionalOn A relation) : Set :=
  Classical.choose (ReplacementImageExists A relation functional)

                                                             
theorem TheReplacementImageIsReplacementImageOf
    (A : Set) (relation : Set → Set → Prop)
    (functional : IsFunctionalOn A relation) :
    IsReplacementImageOf A relation (TheReplacementImage A relation functional) := by
  sorry

                                                     
theorem EveryReplacementImageEqualsTheReplacementImage
    {A : Set} {relation : Set → Set → Prop}
    (functional : IsFunctionalOn A relation)
    {B : Set}
    (BIsReplacementImageOf : IsReplacementImageOf A relation B) :
    B = TheReplacementImage A relation functional := by
  sorry

end LRA.Set.ZFC
