import LRA.Set.ZFCSet.Primitives

namespace LRA.Set.ZFC

/--
`Choice` TODO

Predicate logic:

  (∀ A ∈ ZFCSet), ∀ B ∈ ZFCSet, B ∈ A → ∃ x ∈ ZFCSet, x ∈ B → ∀ B C ∈ ZFCSet, B ∈ A → C ∈ A → B ≠ C → ∀ x : ZFCSet, x ∈ B → x ∉ C → ∃ choiceSet ∈ ZFCSet, ∀ B : ZFCSet, B ∈ A → ∃ x ∈ ZFCSet, (x ∈ B ∧ x ∈ choiceSet) ∧ ∀ other : ZFCSet, (other ∈ B ∧ other ∈ choiceSet) → other = x end LRA.Set.ZFC

Predicate logic (unfolded):

  ∀ (A : LRA.Set.ZFCSet), (∀ (B : LRA.Set.ZFCSet), LRA.Set.instMembershipZFCSet.1 A B → Exists fun x => LRA.Set.instMembershipZFCSet.1 B x ∧ ∀ (B C : LRA.Set.ZFCSet), LRA.Set.instMembershipZFCSet.1 A B → LRA.Set.instMembershipZFCSet.1 A C → (B = C → False) → ∀ (x : LRA.Set.ZFCSet), LRA.Set.instMembershipZFCSet.1 B x → LRA.Set.instMembershipZFCSet.1 C x → False) → Exists fun choiceSet => ∀ (B : LRA.Set.ZFCSet), LRA.Set.instMembershipZFCSet.1 A B → Exists fun x => ((LRA.Set.instMembershipZFCSet.1 B x ∧ LRA.Set.instMembershipZFCSet.1 choiceSet x) ∧ ∀ (other : LRA.Set.ZFCSet), (LRA.Set.instMembershipZFCSet.1 B other ∧ LRA.Set.instMembershipZFCSet.1 choiceSet other) → other = x)

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

end LRA.Set.ZFC
