import LRA.Set.Constructions.ZFCSet.Primitives

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`Replacement` TODO

Predicate logic:

  ∀ (relation : LRA.Set.Constructions.ZFCSet → LRA.Set.Constructions.ZFCSet → Prop) (A : LRA.Set.Constructions.ZFCSet), (∀ (x : LRA.Set.Constructions.ZFCSet), LRA.Set.Constructions.instMembershipZFCSet.mem A x → Exists fun y => (relation x y ∧ (∀ (other : LRA.Set.Constructions.ZFCSet), relation x other → other = y))) → Exists fun B => ∀ (y : LRA.Set.Constructions.ZFCSet), LRA.Set.Constructions.instMembershipZFCSet.mem B y ↔ Exists fun x => (LRA.Set.Constructions.instMembershipZFCSet.mem A x ∧ relation x y)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    relation : ZFCSet → ZFCSet → Prop
    A : ZFCSet
  Prove
    (∀ (x : LRA.Set.Constructions.ZFCSet), LRA.Set.Constructions.instMembershipZFCSet.mem A x → Exists fun y => (relation x y ∧ (∀ (other : LRA.Set.Constructions.ZFCSet), relation x other → other = y))) → Exists fun B => ∀ (y : LRA.Set.Constructions.ZFCSet), LRA.Set.Constructions.instMembershipZFCSet.mem B y ↔ Exists fun x => (LRA.Set.Constructions.instMembershipZFCSet.mem A x ∧ relation x y)

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

end LRA.Set.Constructions.ZFCSet.Axioms
