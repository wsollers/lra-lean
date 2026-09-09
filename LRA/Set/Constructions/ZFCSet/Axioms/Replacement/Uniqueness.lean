import LRA.Set.Constructions.ZFCSet.Axioms.Replacement.Existence
import LRA.Set.Constructions.ZFCSet.Axioms.Extensionality.Theorems

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`ReplacementImageIsUnique` TODO

Predicate logic:

  ∀ {A : LRA.Set.Constructions.ZFCSet.Axioms.Set} {relation : LRA.Set.Constructions.ZFCSet.Axioms.Set → LRA.Set.Constructions.ZFCSet.Axioms.Set → Prop} {B C : LRA.Set.Constructions.ZFCSet.Axioms.Set}, (LRA.Set.Constructions.ZFCSet.Axioms.IsReplacementImageOf A relation B ∧ LRA.Set.Constructions.ZFCSet.Axioms.IsReplacementImageOf A relation C) → C = B

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
    relation : Set → Set → Prop
    B C : Set
  Prove
    ((∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 B y ↔ Exists fun x => (LRA.Set.Constructions.instMembershipZFCSet.1 A x ∧ relation x y)) ∧ (∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 C y ↔ Exists fun x => (LRA.Set.Constructions.instMembershipZFCSet.1 A x ∧ relation x y))) → C = B

Logical form (Lean):

```lean
theorem ReplacementImageIsUnique
    {A : Set} {relation : Set → Set → Prop} {B C : Set}
    (BIsReplacementImageOf : IsReplacementImageOf A relation B)
    (CIsReplacementImageOf : IsReplacementImageOf A relation C) :
    C = B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem ReplacementImageIsUnique
    {A : Set} {relation : Set → Set → Prop} {B C : Set}
    (BIsReplacementImageOf : IsReplacementImageOf A relation B)
    (CIsReplacementImageOf : IsReplacementImageOf A relation C) :
    C = B := by
  sorry

/--
`ReplacementImageExistsAndIsUnique` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set) (relation : LRA.Set.Constructions.ZFCSet.Axioms.Set → LRA.Set.Constructions.ZFCSet.Axioms.Set → Prop), LRA.Set.Constructions.ZFCSet.Axioms.IsFunctionalOn A relation → LRA.Set.Constructions.ZFCSet.Axioms.ExistsAndUnique fun B => LRA.Set.Constructions.ZFCSet.Axioms.IsReplacementImageOf A relation B

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
    relation : Set → Set → Prop
  Prove
    (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 A x → Exists fun y => (relation x y ∧ (∀ (other : LRA.Set.Constructions.ZFCSet.Axioms.Set), relation x other → other = y))) → ((Exists fun x => (fun B => ∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 B y ↔ Exists fun x => (LRA.Set.Constructions.instMembershipZFCSet.1 A x ∧ relation x y)) x) ∧ (∀ (left right : LRA.Set.Constructions.ZFCSet.Axioms.Set), (∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 left y ↔ Exists fun x => (LRA.Set.Constructions.instMembershipZFCSet.1 A x ∧ relation x y)) → (∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 right y ↔ Exists fun x => (LRA.Set.Constructions.instMembershipZFCSet.1 A x ∧ relation x y)) → (LRA.Identity.Constructions.Mathlib.instIdentityRelation LRA.Set.Constructions.ZFCSet.Axioms.Set).1 left right))

Logical form (Lean):

```lean
theorem ReplacementImageExistsAndIsUnique
    (A : Set) (relation : Set → Set → Prop)
    (functional : IsFunctionalOn A relation) :
    ExistsAndUnique (fun B : Set => IsReplacementImageOf A relation B)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem ReplacementImageExistsAndIsUnique
    (A : Set) (relation : Set → Set → Prop)
    (functional : IsFunctionalOn A relation) :
    ExistsAndUnique (fun B : Set => IsReplacementImageOf A relation B) := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
