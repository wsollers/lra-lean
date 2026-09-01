import LRA.Set.Constructions.ZFCSet.Axioms.Common

namespace LRA.Set.Constructions.ZFCSet.Axioms

def IsChoiceSetFor (A choiceSet : Set) : Prop :=
  ∀ B : Set, B ∈ A →
    ∃ x : Set,
      (x ∈ B ∧ x ∈ choiceSet) ∧
      ∀ other : Set, (other ∈ B ∧ other ∈ choiceSet) → other = x

end LRA.Set.Constructions.ZFCSet.Axioms
