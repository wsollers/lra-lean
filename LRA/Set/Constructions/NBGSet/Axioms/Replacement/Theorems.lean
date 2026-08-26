import LRA.Set.Constructions.NBGSet.Axioms.Axioms.Replacement
import LRA.Set.Constructions.NBGSet.Axioms.Definitions
import LRA.Set.Constructions.NBGSet.Axioms.Extensionality.Theorems

namespace LRA.Set.Constructions.NBGSet.Axioms

/--
`ReplacementImageExists` TODO

Predicate logic:

  (∀ A ∈ Set), (IsFunctionalOn A relation) → exists B : Set, IsReplacementImageOf A relation B

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.NBGSet.Axioms.Set) (relation : LRA.Set.Constructions.NBGSet.Axioms.Set → LRA.Set.Constructions.NBGSet.Axioms.Set → Prop), (∀ (x : LRA.Set.Constructions.NBGSet.Axioms.Set), LRA.Set.instMembershipNBGSet.1 A x → Exists fun y => (relation x y ∧ ∀ (other : LRA.Set.Constructions.NBGSet.Axioms.Set), relation x other → other = y)) → Exists fun B => ∀ (y : LRA.Set.Constructions.NBGSet.Axioms.Set), LRA.Set.instMembershipNBGSet.1 B y ↔ Exists fun x => (LRA.Set.instMembershipNBGSet.1 A x ∧ relation x y)

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

  (IsReplacementImageOf A relation B ∧ IsReplacementImageOf A relation C) → C = B

Predicate logic (unfolded):

  ∀ {A : LRA.Set.Constructions.NBGSet.Axioms.Set} {relation : LRA.Set.Constructions.NBGSet.Axioms.Set → LRA.Set.Constructions.NBGSet.Axioms.Set → Prop} {B C : LRA.Set.Constructions.NBGSet.Axioms.Set}, (∀ (y : LRA.Set.Constructions.NBGSet.Axioms.Set), LRA.Set.instMembershipNBGSet.1 B y ↔ Exists fun x => (LRA.Set.instMembershipNBGSet.1 A x ∧ relation x y) ∧ ∀ (y : LRA.Set.Constructions.NBGSet.Axioms.Set), LRA.Set.instMembershipNBGSet.1 C y ↔ Exists fun x => (LRA.Set.instMembershipNBGSet.1 A x ∧ relation x y)) → C = B

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

  (∀ A ∈ Set), (IsFunctionalOn A relation) → IsReplacementImageOf A relation (TheReplacementImage A relation functional)

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.NBGSet.Axioms.Set) (relation : LRA.Set.Constructions.NBGSet.Axioms.Set → LRA.Set.Constructions.NBGSet.Axioms.Set → Prop) (functional : ∀ (x : LRA.Set.Constructions.NBGSet.Axioms.Set), LRA.Set.instMembershipNBGSet.1 A x → Exists fun y => (relation x y ∧ ∀ (other : LRA.Set.Constructions.NBGSet.Axioms.Set), relation x other → other = y)) (y : LRA.Set.Constructions.NBGSet.Axioms.Set), LRA.Set.instMembershipNBGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.NBGSet.Axioms.IsReplacementImageOf A relation) ⋯).1 y ↔ Exists fun x => (LRA.Set.instMembershipNBGSet.1 A x ∧ relation x y)

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

end LRA.Set.Constructions.NBGSet.Axioms
