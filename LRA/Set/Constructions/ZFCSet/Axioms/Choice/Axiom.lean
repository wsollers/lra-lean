import LRA.Set.Constructions.ZFCSet.Primitives

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`Choice` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.ZFCSet), ((∀ (B : LRA.Set.Constructions.ZFCSet), LRA.Set.Constructions.instMembershipZFCSet.mem A B → Exists fun x => LRA.Set.Constructions.instMembershipZFCSet.mem B x) ∧ (∀ (B C : LRA.Set.Constructions.ZFCSet), LRA.Set.Constructions.instMembershipZFCSet.mem A B → LRA.Set.Constructions.instMembershipZFCSet.mem A C → Ne B C → ∀ (x : LRA.Set.Constructions.ZFCSet), LRA.Set.Constructions.instMembershipZFCSet.mem B x → ¬ LRA.Set.Constructions.instMembershipZFCSet.mem C x)) → Exists fun choiceSet => ∀ (B : LRA.Set.Constructions.ZFCSet), LRA.Set.Constructions.instMembershipZFCSet.mem A B → Exists fun x => ((LRA.Set.Constructions.instMembershipZFCSet.mem B x ∧ LRA.Set.Constructions.instMembershipZFCSet.mem choiceSet x) ∧ (∀ (other : LRA.Set.Constructions.ZFCSet), (LRA.Set.Constructions.instMembershipZFCSet.mem B other ∧ LRA.Set.Constructions.instMembershipZFCSet.mem choiceSet other) → other = x))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : ZFCSet
  Prove
    ((∀ (B : LRA.Set.Constructions.ZFCSet), LRA.Set.Constructions.instMembershipZFCSet.1 A B → Exists fun x => LRA.Set.Constructions.instMembershipZFCSet.1 B x) ∧ (∀ (B C : LRA.Set.Constructions.ZFCSet), LRA.Set.Constructions.instMembershipZFCSet.1 A B → LRA.Set.Constructions.instMembershipZFCSet.1 A C → (B = C → False) → ∀ (x : LRA.Set.Constructions.ZFCSet), LRA.Set.Constructions.instMembershipZFCSet.1 B x → LRA.Set.Constructions.instMembershipZFCSet.1 C x → False)) → Exists fun choiceSet => ∀ (B : LRA.Set.Constructions.ZFCSet), LRA.Set.Constructions.instMembershipZFCSet.1 A B → Exists fun x => ((LRA.Set.Constructions.instMembershipZFCSet.1 B x ∧ LRA.Set.Constructions.instMembershipZFCSet.1 choiceSet x) ∧ (∀ (other : LRA.Set.Constructions.ZFCSet), (LRA.Set.Constructions.instMembershipZFCSet.1 B other ∧ LRA.Set.Constructions.instMembershipZFCSet.1 choiceSet other) → other = x))

Logical form (Lean):

```lean
axiom Choice (A : ZFCSet) :
  (∀ B : ZFCSet, B ∈ A → ∃ x : ZFCSet, x ∈ B) →
  (∀ B C : ZFCSet,
    B ∈ A → C ∈ A → B ≠ C →
      ∀ x : ZFCSet, x ∈ B → x ∉ C) →
    ∃ choiceSet : ZFCSet,
      ∀ B : ZFCSet, B ∈ A →
        ∃ x : ZFCSet,
          (x ∈ B ∧ x ∈ choiceSet) ∧
          ∀ other : ZFCSet,
            (other ∈ B ∧ other ∈ choiceSet) → other = x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
axiom Choice (A : ZFCSet) :
  (∀ B : ZFCSet, B ∈ A → ∃ x : ZFCSet, x ∈ B) →
  (∀ B C : ZFCSet,
    B ∈ A → C ∈ A → B ≠ C →
      ∀ x : ZFCSet, x ∈ B → x ∉ C) →
    ∃ choiceSet : ZFCSet,
      ∀ B : ZFCSet, B ∈ A →
        ∃ x : ZFCSet,
          (x ∈ B ∧ x ∈ choiceSet) ∧
          ∀ other : ZFCSet,
            (other ∈ B ∧ other ∈ choiceSet) → other = x

end LRA.Set.Constructions.ZFCSet.Axioms
