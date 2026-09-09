import LRA.Set.Constructions.ZFCSet.Axioms.Choice.Axiom
import LRA.Set.Constructions.ZFCSet.Axioms.Choice.Definitions

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`ChoiceSetExists` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set), ((∀ (B : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.mem A B → Exists fun x => LRA.Set.Constructions.instMembershipZFCSet.mem B x) ∧ (∀ (B C : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.mem A B → LRA.Set.Constructions.instMembershipZFCSet.mem A C → Ne B C → ∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.mem B x → ¬ LRA.Set.Constructions.instMembershipZFCSet.mem C x)) → Exists fun choiceSet => LRA.Set.Constructions.ZFCSet.Axioms.IsChoiceSetFor A choiceSet

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
  Prove
    ((∀ (B : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 A B → Exists fun x => LRA.Set.Constructions.instMembershipZFCSet.1 B x) ∧ (∀ (B C : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 A B → LRA.Set.Constructions.instMembershipZFCSet.1 A C → (B = C → False) → ∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 B x → LRA.Set.Constructions.instMembershipZFCSet.1 C x → False)) → Exists fun choiceSet => ∀ (B : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 A B → Exists fun x => ((LRA.Set.Constructions.instMembershipZFCSet.1 B x ∧ LRA.Set.Constructions.instMembershipZFCSet.1 choiceSet x) ∧ (∀ (other : LRA.Set.Constructions.ZFCSet.Axioms.Set), (LRA.Set.Constructions.instMembershipZFCSet.1 B other ∧ LRA.Set.Constructions.instMembershipZFCSet.1 choiceSet other) → other = x))

Logical form (Lean):

```lean
theorem ChoiceSetExists
    (A : Set)
    (membersNonempty : ∀ B : Set, B ∈ A → ∃ x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      ∀ B C : Set, B ∈ A → C ∈ A → B ≠ C → ∀ x : Set, x ∈ B → x ∉ C) :
    ∃ choiceSet : Set, IsChoiceSetFor A choiceSet
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem ChoiceSetExists
    (A : Set)
    (membersNonempty : ∀ B : Set, B ∈ A → ∃ x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      ∀ B C : Set, B ∈ A → C ∈ A → B ≠ C → ∀ x : Set, x ∈ B → x ∉ C) :
    ∃ choiceSet : Set, IsChoiceSetFor A choiceSet := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
