import LRA.Set.ZFC.Axioms.Choice
import LRA.Set.ZFC.Definitions

   
                                                  

                                                                            
  

namespace LRA.Set.ZFC

                                                                          
                                               
theorem ChoiceSetExists
    (A : Set)
    (membersNonempty : ∀ B : Set, B ∈ A → ∃ x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      ∀ B C : Set, B ∈ A → C ∈ A → B ≠ C → ∀ x : Set, x ∈ B → x ∉ C) :
    ∃ choiceSet : Set, IsChoiceSetFor A choiceSet := by
  sorry

                                                                             
noncomputable def TheChoiceSet
    (A : Set)
    (membersNonempty : ∀ B : Set, B ∈ A → ∃ x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      ∀ B C : Set, B ∈ A → C ∈ A → B ≠ C → ∀ x : Set, x ∈ B → x ∉ C) :
    Set :=
  Classical.choose (ChoiceSetExists A membersNonempty membersPairwiseDisjoint)

                                                            
theorem TheChoiceSetIsChoiceSetFor
    (A : Set)
    (membersNonempty : ∀ B : Set, B ∈ A → ∃ x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      ∀ B C : Set, B ∈ A → C ∈ A → B ≠ C → ∀ x : Set, x ∈ B → x ∉ C) :
    IsChoiceSetFor A
      (TheChoiceSet A membersNonempty membersPairwiseDisjoint) := by
  sorry

end LRA.Set.ZFC
