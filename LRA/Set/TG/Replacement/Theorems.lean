import LRA.Set.TG.Axioms.Replacement
import LRA.Set.TG.Definitions
import LRA.Set.TG.Extensionality.Theorems

namespace LRA.Set.TG

theorem ReplacementImageExists
    (A : Set) (relation : Set -> Set -> Prop)
    (functional : IsFunctionalOn A relation) :
    exists B : Set, IsReplacementImageOf A relation B := by
  sorry


theorem ReplacementImageIsUnique
    {A : Set} {relation : Set -> Set -> Prop} {B C : Set}
    (BIsReplacementImageOf : IsReplacementImageOf A relation B)
    (CIsReplacementImageOf : IsReplacementImageOf A relation C) :
    C = B := by
  sorry

noncomputable def TheReplacementImage
    (A : Set) (relation : Set -> Set -> Prop)
    (functional : IsFunctionalOn A relation) : Set :=
  Classical.choose (ReplacementImageExists A relation functional)

theorem TheReplacementImageIsReplacementImageOf
    (A : Set) (relation : Set -> Set -> Prop)
    (functional : IsFunctionalOn A relation) :
    IsReplacementImageOf A relation (TheReplacementImage A relation functional) := by
  sorry

end LRA.Set.TG
