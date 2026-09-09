import LRA.Set.Constructions.ZFCSet.Axioms.Common

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`IsChoiceSetFor` TODO

Predicate logic:

  ∀ (A choiceSet B : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.mem A B → Exists fun x => ((LRA.Set.Constructions.instMembershipZFCSet.mem B x ∧ LRA.Set.Constructions.instMembershipZFCSet.mem choiceSet x) ∧ (∀ (other : LRA.Set.Constructions.ZFCSet.Axioms.Set), (LRA.Set.Constructions.instMembershipZFCSet.mem B other ∧ LRA.Set.Constructions.instMembershipZFCSet.mem choiceSet other) → other = x))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipZFCSet.1 A B → Exists fun x => ((LRA.Set.Constructions.instMembershipZFCSet.1 B x ∧ LRA.Set.Constructions.instMembershipZFCSet.1 choiceSet x) ∧ (∀ (other : LRA.Set.Constructions.ZFCSet.Axioms.Set), (LRA.Set.Constructions.instMembershipZFCSet.1 B other ∧ LRA.Set.Constructions.instMembershipZFCSet.1 choiceSet other) → other = x))

Logical form (Lean):

```lean
def IsChoiceSetFor (A choiceSet : Set) : Prop :=
  ∀ B : Set, B ∈ A →
    ∃ x : Set,
      (x ∈ B ∧ x ∈ choiceSet) ∧
      ∀ other : Set, (other ∈ B ∧ other ∈ choiceSet) → other = x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def IsChoiceSetFor (A choiceSet : Set) : Prop :=
  ∀ B : Set, B ∈ A →
    ∃ x : Set,
      (x ∈ B ∧ x ∈ choiceSet) ∧
      ∀ other : Set, (other ∈ B ∧ other ∈ choiceSet) → other = x

end LRA.Set.Constructions.ZFCSet.Axioms
