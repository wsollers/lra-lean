import LRA.Set.NBG.Axioms.Replacement
import LRA.Set.NBG.Definitions
import LRA.Set.NBG.Extensionality.Theorems

namespace LRA.Set.NBG

/--
`ReplacementImageExists` TODO

Predicate logic:

  (∀ A ∈ Set), (IsFunctionalOn A relation) → exists B : Set, IsReplacementImageOf A relation B

Predicate logic (unfolded):

  ∀ (A : LRA.Set.NBG.Set) (relation : LRA.Set.NBG.Set → LRA.Set.NBG.Set → Prop), (∀ (x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 A x → Exists fun y => (relation x y ∧ ∀ (other : LRA.Set.NBG.Set), relation x other → other = y)) → Exists fun B => ∀ (y : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 B y ↔ Exists fun x => (LRA.Set.instMembershipNBGSet.1 A x ∧ relation x y)

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

  ∀ {A : LRA.Set.NBG.Set} {relation : LRA.Set.NBG.Set → LRA.Set.NBG.Set → Prop} {B C : LRA.Set.NBG.Set}, (∀ (y : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 B y ↔ Exists fun x => (LRA.Set.instMembershipNBGSet.1 A x ∧ relation x y) ∧ ∀ (y : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 C y ↔ Exists fun x => (LRA.Set.instMembershipNBGSet.1 A x ∧ relation x y)) → C = B

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

  ∀ (A : LRA.Set.NBG.Set) (relation : LRA.Set.NBG.Set → LRA.Set.NBG.Set → Prop) (functional : ∀ (x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 A x → Exists fun y => (relation x y ∧ ∀ (other : LRA.Set.NBG.Set), relation x other → other = y)) (y : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 (Classical.indefiniteDescription (LRA.Set.NBG.IsReplacementImageOf A relation) ⋯).1 y ↔ Exists fun x => (LRA.Set.instMembershipNBGSet.1 A x ∧ relation x y)

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

end LRA.Set.NBG
