import LRA.Set.TG.Axioms.Choice
import LRA.Set.TG.Definitions

namespace LRA.Set.TG

theorem ChoiceSetExists
    (A : Set)
    (membersNonempty : forall B : Set, B ∈ A -> exists x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      forall B C : Set, B ∈ A -> C ∈ A -> B ≠ C -> forall x : Set, x ∈ B -> x ∉ C) :
    exists choiceSet : Set, IsChoiceSetFor A choiceSet := by
  sorry

noncomputable def TheChoiceSet
    (A : Set)
    (membersNonempty : forall B : Set, B ∈ A -> exists x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      forall B C : Set, B ∈ A -> C ∈ A -> B ≠ C -> forall x : Set, x ∈ B -> x ∉ C) :
    Set :=
  Classical.choose (ChoiceSetExists A membersNonempty membersPairwiseDisjoint)

theorem TheChoiceSetIsChoiceSetFor
    (A : Set)
    (membersNonempty : forall B : Set, B ∈ A -> exists x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      forall B C : Set, B ∈ A -> C ∈ A -> B ≠ C -> forall x : Set, x ∈ B -> x ∉ C) :
    IsChoiceSetFor A (TheChoiceSet A membersNonempty membersPairwiseDisjoint) := by
  sorry

end LRA.Set.TG
