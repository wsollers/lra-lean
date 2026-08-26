import LRA.Set.Constructions.ZFCSet.Axioms.Axioms.Choice
import LRA.Set.Constructions.ZFCSet.Axioms.Definitions

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`ChoiceSetExists` TODO

Predicate logic:

  (∀ A ∈ Set), (∀ B : Set, B ∈ A → ∃ x ∈ Set, x ∈ B ∧ ∀ B C : Set, B ∈ A → C ∈ A → B ≠ C → ∀ x : Set, x ∈ B → x ∉ C) → ∃ choiceSet ∈ Set, IsChoiceSetFor A choiceSet

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set), (∀ (B : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 A B → Exists fun x => LRA.Set.instMembershipZFCSet.1 B x ∧ ∀ (B C : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 A B → LRA.Set.instMembershipZFCSet.1 A C → (B = C → False) → ∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 B x → LRA.Set.instMembershipZFCSet.1 C x → False) → Exists fun choiceSet => ∀ (B : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 A B → Exists fun x => ((LRA.Set.instMembershipZFCSet.1 B x ∧ LRA.Set.instMembershipZFCSet.1 choiceSet x) ∧ ∀ (other : LRA.Set.Constructions.ZFCSet.Axioms.Set), (LRA.Set.instMembershipZFCSet.1 B other ∧ LRA.Set.instMembershipZFCSet.1 choiceSet other) → other = x)

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

/--
`TheChoiceSet` TODO

Predicate logic:

  noncomputable def TheChoiceSet
    (A : Set)
    (membersNonempty : ∀ B : Set, B ∈ A → ∃ x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      ∀ B C : Set, B ∈ A → C ∈ A → B ≠ C → ∀ x : Set, x ∈ B → x ∉ C) :
    Set :=
  Classical.choose (ChoiceSetExists A membersNonempty membersPairwiseDisjoint)

Predicate logic (unfolded):

  noncomputable def TheChoiceSet
    (A : Set)
    (membersNonempty : ∀ B : Set, B ∈ A → ∃ x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      ∀ B C : Set, B ∈ A → C ∈ A → B ≠ C → ∀ x : Set, x ∈ B → x ∉ C) :
    Set :=
  Classical.choose (ChoiceSetExists A membersNonempty membersPairwiseDisjoint) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TheChoiceSet
    (A : Set)
    (membersNonempty : ∀ B : Set, B ∈ A → ∃ x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      ∀ B C : Set, B ∈ A → C ∈ A → B ≠ C → ∀ x : Set, x ∈ B → x ∉ C) :
    Set :=
  Classical.choose (ChoiceSetExists A membersNonempty membersPairwiseDisjoint)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
noncomputable def TheChoiceSet
    (A : Set)
    (membersNonempty : ∀ B : Set, B ∈ A → ∃ x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      ∀ B C : Set, B ∈ A → C ∈ A → B ≠ C → ∀ x : Set, x ∈ B → x ∉ C) :
    Set :=
  Classical.choose (ChoiceSetExists A membersNonempty membersPairwiseDisjoint)

/--
`TheChoiceSetIsChoiceSetFor` TODO

Predicate logic:

  (∀ A ∈ Set), (∀ B : Set, B ∈ A → ∃ x ∈ Set, x ∈ B ∧ ∀ B C : Set, B ∈ A → C ∈ A → B ≠ C → ∀ x : Set, x ∈ B → x ∉ C) → IsChoiceSetFor A (TheChoiceSet A membersNonempty membersPairwiseDisjoint)

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set) (membersNonempty : ∀ (B : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 A B → Exists fun x => LRA.Set.instMembershipZFCSet.1 B x) (membersPairwiseDisjoint : ∀ (B C : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 A B → LRA.Set.instMembershipZFCSet.1 A C → (B = C → False) → ∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 B x → LRA.Set.instMembershipZFCSet.1 C x → False) (B : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 A B → Exists fun x => ((LRA.Set.instMembershipZFCSet.1 B x ∧ LRA.Set.instMembershipZFCSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsChoiceSetFor A) ⋯).1 x) ∧ ∀ (other : LRA.Set.Constructions.ZFCSet.Axioms.Set), (LRA.Set.instMembershipZFCSet.1 B other ∧ LRA.Set.instMembershipZFCSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsChoiceSetFor A) ⋯).1 other) → other = x)

Logical form (Lean):

```lean
theorem TheChoiceSetIsChoiceSetFor
    (A : Set)
    (membersNonempty : ∀ B : Set, B ∈ A → ∃ x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      ∀ B C : Set, B ∈ A → C ∈ A → B ≠ C → ∀ x : Set, x ∈ B → x ∉ C) :
    IsChoiceSetFor A
      (TheChoiceSet A membersNonempty membersPairwiseDisjoint)
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
theorem TheChoiceSetIsChoiceSetFor
    (A : Set)
    (membersNonempty : ∀ B : Set, B ∈ A → ∃ x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      ∀ B C : Set, B ∈ A → C ∈ A → B ≠ C → ∀ x : Set, x ∈ B → x ∉ C) :
    IsChoiceSetFor A
      (TheChoiceSet A membersNonempty membersPairwiseDisjoint) := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
