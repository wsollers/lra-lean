import LRA.Set.NBG.Axioms.Choice
import LRA.Set.NBG.Definitions

namespace LRA.Set.NBG

/--
`ChoiceSetExists` TODO

Predicate logic:

  (∀ A ∈ Set), (forall B : Set, B ∈ A -> exists x : Set, x ∈ B ∧ forall B C : Set, B ∈ A -> C ∈ A -> B ≠ C -> forall x : Set, x ∈ B -> x ∉ C) → exists choiceSet : Set, IsChoiceSetFor A choiceSet

Predicate logic (unfolded):

  ∀ (A : LRA.Set.NBG.Set), (∀ (B : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 A B → Exists fun x => LRA.Set.instMembershipNBGSet.1 B x ∧ ∀ (B C : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 A B → LRA.Set.instMembershipNBGSet.1 A C → (B = C → False) → ∀ (x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 B x → LRA.Set.instMembershipNBGSet.1 C x → False) → Exists fun choiceSet => ∀ (B : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 A B → Exists fun x => ((LRA.Set.instMembershipNBGSet.1 B x ∧ LRA.Set.instMembershipNBGSet.1 choiceSet x) ∧ ∀ (other : LRA.Set.NBG.Set), (LRA.Set.instMembershipNBGSet.1 B other ∧ LRA.Set.instMembershipNBGSet.1 choiceSet other) → other = x)

Logical form (Lean):

```lean
theorem ChoiceSetExists
    (A : Set)
    (membersNonempty : forall B : Set, B ∈ A -> exists x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      forall B C : Set, B ∈ A -> C ∈ A -> B ≠ C -> forall x : Set, x ∈ B -> x ∉ C) :
    exists choiceSet : Set, IsChoiceSetFor A choiceSet
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
    (membersNonempty : forall B : Set, B ∈ A -> exists x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      forall B C : Set, B ∈ A -> C ∈ A -> B ≠ C -> forall x : Set, x ∈ B -> x ∉ C) :
    exists choiceSet : Set, IsChoiceSetFor A choiceSet := by
  sorry

/--
`TheChoiceSet` TODO

Predicate logic:

  noncomputable def TheChoiceSet
    (A : Set)
    (membersNonempty : forall B : Set, B ∈ A -> exists x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      forall B C : Set, B ∈ A -> C ∈ A -> B ≠ C -> forall x : Set, x ∈ B -> x ∉ C) :
    Set :=
  Classical.choose (ChoiceSetExists A membersNonempty membersPairwiseDisjoint)

Predicate logic (unfolded):

  noncomputable def TheChoiceSet
    (A : Set)
    (membersNonempty : forall B : Set, B ∈ A -> exists x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      forall B C : Set, B ∈ A -> C ∈ A -> B ≠ C -> forall x : Set, x ∈ B -> x ∉ C) :
    Set :=
  Classical.choose (ChoiceSetExists A membersNonempty membersPairwiseDisjoint) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TheChoiceSet
    (A : Set)
    (membersNonempty : forall B : Set, B ∈ A -> exists x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      forall B C : Set, B ∈ A -> C ∈ A -> B ≠ C -> forall x : Set, x ∈ B -> x ∉ C) :
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
    (membersNonempty : forall B : Set, B ∈ A -> exists x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      forall B C : Set, B ∈ A -> C ∈ A -> B ≠ C -> forall x : Set, x ∈ B -> x ∉ C) :
    Set :=
  Classical.choose (ChoiceSetExists A membersNonempty membersPairwiseDisjoint)

/--
`TheChoiceSetIsChoiceSetFor` TODO

Predicate logic:

  (∀ A ∈ Set), (forall B : Set, B ∈ A -> exists x : Set, x ∈ B ∧ forall B C : Set, B ∈ A -> C ∈ A -> B ≠ C -> forall x : Set, x ∈ B -> x ∉ C) → IsChoiceSetFor A (TheChoiceSet A membersNonempty membersPairwiseDisjoint)

Predicate logic (unfolded):

  ∀ (A : LRA.Set.NBG.Set) (membersNonempty : ∀ (B : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 A B → Exists fun x => LRA.Set.instMembershipNBGSet.1 B x) (membersPairwiseDisjoint : ∀ (B C : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 A B → LRA.Set.instMembershipNBGSet.1 A C → (B = C → False) → ∀ (x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 B x → LRA.Set.instMembershipNBGSet.1 C x → False) (B : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 A B → Exists fun x => ((LRA.Set.instMembershipNBGSet.1 B x ∧ LRA.Set.instMembershipNBGSet.1 (Classical.indefiniteDescription (LRA.Set.NBG.IsChoiceSetFor A) ⋯).1 x) ∧ ∀ (other : LRA.Set.NBG.Set), (LRA.Set.instMembershipNBGSet.1 B other ∧ LRA.Set.instMembershipNBGSet.1 (Classical.indefiniteDescription (LRA.Set.NBG.IsChoiceSetFor A) ⋯).1 other) → other = x)

Logical form (Lean):

```lean
theorem TheChoiceSetIsChoiceSetFor
    (A : Set)
    (membersNonempty : forall B : Set, B ∈ A -> exists x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      forall B C : Set, B ∈ A -> C ∈ A -> B ≠ C -> forall x : Set, x ∈ B -> x ∉ C) :
    IsChoiceSetFor A (TheChoiceSet A membersNonempty membersPairwiseDisjoint)
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
    (membersNonempty : forall B : Set, B ∈ A -> exists x : Set, x ∈ B)
    (membersPairwiseDisjoint :
      forall B C : Set, B ∈ A -> C ∈ A -> B ≠ C -> forall x : Set, x ∈ B -> x ∉ C) :
    IsChoiceSetFor A (TheChoiceSet A membersNonempty membersPairwiseDisjoint) := by
  sorry

end LRA.Set.NBG
