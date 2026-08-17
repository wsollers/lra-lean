import LRA.Set.ZFC.Axioms.Choice
import LRA.Set.ZFC.Definitions

/-!
Existence of a choice set, and one chosen witness.

Choice does not pin down a unique object, so there is no uniqueness theorem.
-/

namespace LRA.Set.ZFC

/-- If every member of `A` is nonempty and the members of `A` are pairwise
disjoint, there exists a choice set for `A`. -/
theorem ChoiceSetExists
    (A : Set)
    (membersNonempty : ∀ B : Set, B ∈ A → ∃ x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      ∀ B C : Set, B ∈ A → C ∈ A → B ≠ C → ∀ x : Set, x ∈ B → x ∉ C) :
    ∃ choiceSet : Set, IsChoiceSetFor A choiceSet := by
  sorry

/-- A choice set for `A`, chosen after its existence has been established. -/
noncomputable def TheChoiceSet
    (A : Set)
    (membersNonempty : ∀ B : Set, B ∈ A → ∃ x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      ∀ B C : Set, B ∈ A → C ∈ A → B ≠ C → ∀ x : Set, x ∈ B → x ∉ C) :
    Set :=
  Classical.choose (ChoiceSetExists A membersNonempty membersPairwiseDisjoint)

/-- The chosen choice set really is a choice set for `A`. -/
theorem TheChoiceSetIsChoiceSetFor
    (A : Set)
    (membersNonempty : ∀ B : Set, B ∈ A → ∃ x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      ∀ B C : Set, B ∈ A → C ∈ A → B ≠ C → ∀ x : Set, x ∈ B → x ∉ C) :
    IsChoiceSetFor A
      (TheChoiceSet A membersNonempty membersPairwiseDisjoint) := by
  sorry

end LRA.Set.ZFC

/-! Compatibility aliases for the historical Enderton choice names. -/
namespace LRA.Set.Enderton

abbrev ChoiceSetExists := LRA.Set.ZFC.ChoiceSetExists

noncomputable abbrev TheChoiceSet
    (A : Set)
    (membersNonempty : ∀ B : Set, B ∈ A → ∃ x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      ∀ B C : Set, B ∈ A → C ∈ A → B ≠ C → ∀ x : Set, x ∈ B → x ∉ C) : Set :=
  LRA.Set.ZFC.TheChoiceSet A membersNonempty membersPairwiseDisjoint

abbrev TheChoiceSetIsChoiceSetFor := LRA.Set.ZFC.TheChoiceSetIsChoiceSetFor

end LRA.Set.Enderton
