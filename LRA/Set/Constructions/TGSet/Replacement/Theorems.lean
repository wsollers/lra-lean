import LRA.Set.Constructions.TGSet.Axioms.Replacement
import LRA.Set.Constructions.TGSet.Definitions
import LRA.Set.Constructions.TGSet.Extensionality.Theorems

namespace LRA.Set.Constructions.TGSet

/--
`ReplacementImageExists` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.TGSet.Set) (relation : LRA.Set.Constructions.TGSet.Set → LRA.Set.Constructions.TGSet.Set → Prop), LRA.Set.Constructions.TGSet.IsFunctionalOn A relation → Exists fun B => LRA.Set.Constructions.TGSet.IsReplacementImageOf A relation B

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
    relation : Set -> Set -> Prop
  Prove
    (∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 A x → Exists fun y => (relation x y ∧ (∀ (other : LRA.Set.Constructions.TGSet.Set), relation x other → other = y))) → Exists fun B => ∀ (y : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 B y ↔ Exists fun x => (LRA.Set.Constructions.instMembershipTGSet.1 A x ∧ relation x y)

Logical form (Lean):

```lean
theorem ReplacementImageExists
    (A : Set) (relation : Set -> Set -> Prop)
    (functional : IsFunctionalOn A relation) :
    exists B : Set, IsReplacementImageOf A relation B
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
theorem ReplacementImageExists
    (A : Set) (relation : Set -> Set -> Prop)
    (functional : IsFunctionalOn A relation) :
    exists B : Set, IsReplacementImageOf A relation B := by
  sorry

/--
`ReplacementImageIsUnique` TODO

Predicate logic:

  ∀ {A : LRA.Set.Constructions.TGSet.Set} {relation : LRA.Set.Constructions.TGSet.Set → LRA.Set.Constructions.TGSet.Set → Prop} {B C : LRA.Set.Constructions.TGSet.Set}, (LRA.Set.Constructions.TGSet.IsReplacementImageOf A relation B ∧ LRA.Set.Constructions.TGSet.IsReplacementImageOf A relation C) → C = B

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
    relation : Set -> Set -> Prop
    B C : Set
  Prove
    ((∀ (y : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 B y ↔ Exists fun x => (LRA.Set.Constructions.instMembershipTGSet.1 A x ∧ relation x y)) ∧ (∀ (y : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 C y ↔ Exists fun x => (LRA.Set.Constructions.instMembershipTGSet.1 A x ∧ relation x y))) → C = B

Logical form (Lean):

```lean
theorem ReplacementImageIsUnique
    {A : Set} {relation : Set -> Set -> Prop} {B C : Set}
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
    {A : Set} {relation : Set -> Set -> Prop} {B C : Set}
    (BIsReplacementImageOf : IsReplacementImageOf A relation B)
    (CIsReplacementImageOf : IsReplacementImageOf A relation C) :
    C = B := by
  sorry

/--
`TheReplacementImage` TODO

Predicate logic:

  noncomputable def TheReplacementImage
      (A : Set) (relation : Set -> Set -> Prop)
      (functional : IsFunctionalOn A relation) : Set :=
    Classical.choose (ReplacementImageExists A relation functional)

Predicate logic (unfolded):

  noncomputable def TheReplacementImage
      (A : Set) (relation : Set -> Set -> Prop)
      (functional : IsFunctionalOn A relation) : Set :=
    Classical.choose (ReplacementImageExists A relation functional) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TheReplacementImage
    (A : Set) (relation : Set -> Set -> Prop)
    (functional : IsFunctionalOn A relation) : Set :=
  Classical.choose (ReplacementImageExists A relation functional)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
noncomputable def TheReplacementImage
    (A : Set) (relation : Set -> Set -> Prop)
    (functional : IsFunctionalOn A relation) : Set :=
  Classical.choose (ReplacementImageExists A relation functional)

/--
`TheReplacementImageIsReplacementImageOf` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.TGSet.Set) (relation : LRA.Set.Constructions.TGSet.Set → LRA.Set.Constructions.TGSet.Set → Prop) (functional : LRA.Set.Constructions.TGSet.IsFunctionalOn A relation), LRA.Set.Constructions.TGSet.IsReplacementImageOf A relation (LRA.Set.Constructions.TGSet.TheReplacementImage A relation functional)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
    relation : Set -> Set -> Prop
  Prove
    LRA.Set.Constructions.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TGSet.IsReplacementImageOf A relation) ⋯).1 y ↔ Exists fun x => (LRA.Set.Constructions.instMembershipTGSet.1 A x ∧ relation x y)

Logical form (Lean):

```lean
theorem TheReplacementImageIsReplacementImageOf
    (A : Set) (relation : Set -> Set -> Prop)
    (functional : IsFunctionalOn A relation) :
    IsReplacementImageOf A relation (TheReplacementImage A relation functional)
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
theorem TheReplacementImageIsReplacementImageOf
    (A : Set) (relation : Set -> Set -> Prop)
    (functional : IsFunctionalOn A relation) :
    IsReplacementImageOf A relation (TheReplacementImage A relation functional) := by
  sorry

end LRA.Set.Constructions.TGSet

