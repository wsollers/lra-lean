import LRA.Set.ZFCSet.Primitives

namespace LRA.Set.ZFC

/--
`Replacement` TODO

Predicate logic:

  (∀ A ∈ ZFCSet), (ZFCSet → ZFCSet → Prop) → ∀ x ∈ ZFCSet, x ∈ A → ∃ y ∈ ZFCSet, relation x y ∧ ∀ other : ZFCSet, relation x other → other = y → ∃ B ∈ ZFCSet, ∀ y : ZFCSet, y ∈ B ↔ ∃ x ∈ ZFCSet, x ∈ A ∧ relation x y end LRA.Set.ZFC

Predicate logic (unfolded):

  ∀ (relation : LRA.Set.ZFCSet → LRA.Set.ZFCSet → Prop) (A : LRA.Set.ZFCSet), (∀ (x : LRA.Set.ZFCSet), LRA.Set.instMembershipZFCSet.1 A x → Exists fun y => (relation x y ∧ ∀ (other : LRA.Set.ZFCSet), relation x other → other = y)) → Exists fun B => ∀ (y : LRA.Set.ZFCSet), LRA.Set.instMembershipZFCSet.1 B y ↔ Exists fun x => (LRA.Set.instMembershipZFCSet.1 A x ∧ relation x y)

Logical form (Lean):

```lean
axiom Replacement (relation : ZFCSet → ZFCSet → Prop) (A : ZFCSet) :
  (∀ x : ZFCSet, x ∈ A →
    ∃ y : ZFCSet, relation x y ∧
      ∀ other : ZFCSet, relation x other → other = y) →
    ∃ B : ZFCSet,
      ∀ y : ZFCSet, y ∈ B ↔ ∃ x : ZFCSet, x ∈ A ∧ relation x y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, use

-/
axiom Replacement (relation : ZFCSet → ZFCSet → Prop) (A : ZFCSet) :
  (∀ x : ZFCSet, x ∈ A →
    ∃ y : ZFCSet, relation x y ∧
      ∀ other : ZFCSet, relation x other → other = y) →
    ∃ B : ZFCSet,
      ∀ y : ZFCSet, y ∈ B ↔ ∃ x : ZFCSet, x ∈ A ∧ relation x y

end LRA.Set.ZFC
