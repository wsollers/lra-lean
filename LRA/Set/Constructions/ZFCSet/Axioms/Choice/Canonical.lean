import LRA.Set.Constructions.ZFCSet.Axioms.Choice.Existence

namespace LRA.Set.Constructions.ZFCSet.Axioms

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

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set) (membersNonempty : ∀ (B : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.mem A B → Exists fun x => LRA.Set.Constructions.instMembershipZFCSet.mem B x) (membersPairwiseDisjoint : ∀ (B C : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.mem A B → LRA.Set.Constructions.instMembershipZFCSet.mem A C → Ne B C → ∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.mem B x → ¬ LRA.Set.Constructions.instMembershipZFCSet.mem C x), LRA.Set.Constructions.ZFCSet.Axioms.IsChoiceSetFor A (LRA.Set.Constructions.ZFCSet.Axioms.TheChoiceSet A membersNonempty membersPairwiseDisjoint)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
  Prove
    LRA.Set.Constructions.instMembershipZFCSet.1 A B → Exists fun x => ((LRA.Set.Constructions.instMembershipZFCSet.1 B x ∧ LRA.Set.Constructions.instMembershipZFCSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsChoiceSetFor A) ⋯).1 x) ∧ (∀ (other : LRA.Set.Constructions.ZFCSet.Axioms.Set), (LRA.Set.Constructions.instMembershipZFCSet.1 B other ∧ LRA.Set.Constructions.instMembershipZFCSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsChoiceSetFor A) ⋯).1 other) → other = x))

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
