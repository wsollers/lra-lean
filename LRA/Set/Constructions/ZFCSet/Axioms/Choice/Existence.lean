import LRA.Set.Constructions.ZFCSet.Axioms.Choice.Axiom
import LRA.Set.Constructions.ZFCSet.Axioms.Choice.Definitions

namespace LRA.Set.Constructions.ZFCSet.Axioms

theorem ChoiceSetExists
    (A : Set)
    (membersNonempty : ∀ B : Set, B ∈ A → ∃ x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      ∀ B C : Set, B ∈ A → C ∈ A → B ≠ C → ∀ x : Set, x ∈ B → x ∉ C) :
    ∃ choiceSet : Set, IsChoiceSetFor A choiceSet := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
