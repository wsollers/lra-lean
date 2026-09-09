import LRA.Set.Constructions.ZFCSet.Axioms.Common

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`IsFunctionalOn` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set) (relation : LRA.Set.Constructions.ZFCSet.Axioms.Set → LRA.Set.Constructions.ZFCSet.Axioms.Set → Prop) (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.mem A x → Exists fun y => (relation x y ∧ (∀ (other : LRA.Set.Constructions.ZFCSet.Axioms.Set), relation x other → other = y))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipZFCSet.1 A x → Exists fun y => (relation x y ∧ (∀ (other : LRA.Set.Constructions.ZFCSet.Axioms.Set), relation x other → other = y))

Logical form (Lean):

```lean
def IsFunctionalOn (A : Set) (relation : Set → Set → Prop) : Prop :=
  ∀ x : Set, x ∈ A →
    ∃ y : Set,
      relation x y ∧
      ∀ other : Set, relation x other → other = y
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
def IsFunctionalOn (A : Set) (relation : Set → Set → Prop) : Prop :=
  ∀ x : Set, x ∈ A →
    ∃ y : Set,
      relation x y ∧
      ∀ other : Set, relation x other → other = y

/--
`IsReplacementImageOf` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set) (relation : LRA.Set.Constructions.ZFCSet.Axioms.Set → LRA.Set.Constructions.ZFCSet.Axioms.Set → Prop) (B y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.mem B y ↔ Exists fun x => (LRA.Set.Constructions.instMembershipZFCSet.mem A x ∧ relation x y)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipZFCSet.mem B y ↔ Exists fun x => (LRA.Set.Constructions.instMembershipZFCSet.mem A x ∧ relation x y)

Logical form (Lean):

```lean
def IsReplacementImageOf
    (A : Set) (relation : Set → Set → Prop) (B : Set) : Prop :=
  ∀ y : Set, y ∈ B ↔ ∃ x : Set, x ∈ A ∧ relation x y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, use, unfold

-/
def IsReplacementImageOf
    (A : Set) (relation : Set → Set → Prop) (B : Set) : Prop :=
  ∀ y : Set, y ∈ B ↔ ∃ x : Set, x ∈ A ∧ relation x y

end LRA.Set.Constructions.ZFCSet.Axioms
