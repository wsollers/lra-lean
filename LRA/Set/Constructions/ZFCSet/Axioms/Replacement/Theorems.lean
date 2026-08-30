import LRA.Set.Constructions.ZFCSet.Axioms.Replacement.Axiom
import LRA.Set.Constructions.ZFCSet.Axioms.Definitions
import LRA.Set.Constructions.ZFCSet.Axioms.Extensionality.Theorems

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`ReplacementImageExists` TODO

Predicate logic:

  (∀ A ∈ Set), (Set → Set → Prop ∧ IsFunctionalOn A relation) → ∃ B ∈ Set, IsReplacementImageOf A relation B

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set) (relation : LRA.Set.Constructions.ZFCSet.Axioms.Set → LRA.Set.Constructions.ZFCSet.Axioms.Set → Prop), (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 A x → Exists fun y => (relation x y ∧ ∀ (other : LRA.Set.Constructions.ZFCSet.Axioms.Set), relation x other → other = y)) → Exists fun B => ∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 B y ↔ Exists fun x => (LRA.Set.instMembershipZFCSet.1 A x ∧ relation x y)

Logical form (Lean):

```lean
theorem ReplacementImageExists
    (A : Set) (relation : Set → Set → Prop)
    (functional : IsFunctionalOn A relation) :
    ∃ B : Set, IsReplacementImageOf A relation B
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
    (A : Set) (relation : Set → Set → Prop)
    (functional : IsFunctionalOn A relation) :
    ∃ B : Set, IsReplacementImageOf A relation B := by
  sorry

/--
`ReplacementImageIsUnique` TODO

Predicate logic:

  (IsReplacementImageOf A relation B ∧ IsReplacementImageOf A relation C) → C = B

Predicate logic (unfolded):

  ∀ {A : LRA.Set.Constructions.ZFCSet.Axioms.Set} {relation : LRA.Set.Constructions.ZFCSet.Axioms.Set → LRA.Set.Constructions.ZFCSet.Axioms.Set → Prop} {B C : LRA.Set.Constructions.ZFCSet.Axioms.Set}, (∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 B y ↔ Exists fun x => (LRA.Set.instMembershipZFCSet.1 A x ∧ relation x y) ∧ ∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 C y ↔ Exists fun x => (LRA.Set.instMembershipZFCSet.1 A x ∧ relation x y)) → C = B

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

  (∀ A ∈ Set), (Set → Set → Prop ∧ IsFunctionalOn A relation) → ExistsAndUnique fun B ∈ Set => IsReplacementImageOf A relation B

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set) (relation : LRA.Set.Constructions.ZFCSet.Axioms.Set → LRA.Set.Constructions.ZFCSet.Axioms.Set → Prop), (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 A x → Exists fun y => (relation x y ∧ ∀ (other : LRA.Set.Constructions.ZFCSet.Axioms.Set), relation x other → other = y)) → (Exists fun witness => (fun B => ∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 B y ↔ Exists fun x => (LRA.Set.instMembershipZFCSet.1 A x ∧ relation x y)) witness ∧ ∀ (left right : LRA.Set.Constructions.ZFCSet.Axioms.Set), (∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 left y ↔ Exists fun x => (LRA.Set.instMembershipZFCSet.1 A x ∧ relation x y)) → (∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 right y ↔ Exists fun x => (LRA.Set.instMembershipZFCSet.1 A x ∧ relation x y)) → left = right)

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

/--
`TheReplacementImage` TODO

Predicate logic:

  noncomputable def TheReplacementImage
    (A : Set) (relation : Set → Set → Prop)
    (functional : IsFunctionalOn A relation) : Set :=
  Classical.choose (ReplacementImageExists A relation functional)

Predicate logic (unfolded):

  noncomputable def TheReplacementImage
    (A : Set) (relation : Set → Set → Prop)
    (functional : IsFunctionalOn A relation) : Set :=
  Classical.choose (ReplacementImageExists A relation functional) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TheReplacementImage
    (A : Set) (relation : Set → Set → Prop)
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
    (A : Set) (relation : Set → Set → Prop)
    (functional : IsFunctionalOn A relation) : Set :=
  Classical.choose (ReplacementImageExists A relation functional)

/--
`TheReplacementImageIsReplacementImageOf` TODO

Predicate logic:

  (∀ A ∈ Set), (Set → Set → Prop ∧ IsFunctionalOn A relation) → IsReplacementImageOf A relation (TheReplacementImage A relation functional)

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set) (relation : LRA.Set.Constructions.ZFCSet.Axioms.Set → LRA.Set.Constructions.ZFCSet.Axioms.Set → Prop) (functional : ∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 A x → Exists fun y => (relation x y ∧ ∀ (other : LRA.Set.Constructions.ZFCSet.Axioms.Set), relation x other → other = y)) (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsReplacementImageOf A relation) ⋯).1 y ↔ Exists fun x => (LRA.Set.instMembershipZFCSet.1 A x ∧ relation x y)

Logical form (Lean):

```lean
theorem TheReplacementImageIsReplacementImageOf
    (A : Set) (relation : Set → Set → Prop)
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
    (A : Set) (relation : Set → Set → Prop)
    (functional : IsFunctionalOn A relation) :
    IsReplacementImageOf A relation (TheReplacementImage A relation functional) := by
  sorry

/--
`EveryReplacementImageEqualsTheReplacementImage` TODO

Predicate logic:

  (IsFunctionalOn A relation ∧ IsReplacementImageOf A relation B) → B = TheReplacementImage A relation functional

Predicate logic (unfolded):

  ∀ {A : LRA.Set.Constructions.ZFCSet.Axioms.Set} {relation : LRA.Set.Constructions.ZFCSet.Axioms.Set → LRA.Set.Constructions.ZFCSet.Axioms.Set → Prop} (functional : ∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 A x → Exists fun y => (relation x y ∧ ∀ (other : LRA.Set.Constructions.ZFCSet.Axioms.Set), relation x other → other = y)) {B : LRA.Set.Constructions.ZFCSet.Axioms.Set}, (∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 B y ↔ Exists fun x => (LRA.Set.instMembershipZFCSet.1 A x ∧ relation x y)) → B = Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsReplacementImageOf A relation) ⋯.1

Logical form (Lean):

```lean
theorem EveryReplacementImageEqualsTheReplacementImage
    {A : Set} {relation : Set → Set → Prop}
    (functional : IsFunctionalOn A relation)
    {B : Set}
    (BIsReplacementImageOf : IsReplacementImageOf A relation B) :
    B = TheReplacementImage A relation functional
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
theorem EveryReplacementImageEqualsTheReplacementImage
    {A : Set} {relation : Set → Set → Prop}
    (functional : IsFunctionalOn A relation)
    {B : Set}
    (BIsReplacementImageOf : IsReplacementImageOf A relation B) :
    B = TheReplacementImage A relation functional := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
