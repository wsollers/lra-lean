import LRA.Set.Constructions.NBGSet.Definition

namespace LRA.Set.Constructions.NBG.Axioms

open LRA.Set.Constructions
open LRA.Set.Constructions.NBG

noncomputable section

/--
`Set` TODO

Predicate logic:

  abbrev Set := NBGSet

Predicate logic (unfolded):

  abbrev Set := NBGSet (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Set := NBGSet
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev Set := NBGSet

/--
`Class` TODO

Predicate logic:

  abbrev Class := NBGClass

Predicate logic (unfolded):

  abbrev Class := NBGClass (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Class := NBGClass
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev Class := NBGClass

/--
`ClassOfSet` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Set → LRA.Set.Constructions.NBG.Class

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Set → LRA.Set.Constructions.NBG.Class

Logical form (Lean):

```lean
axiom ClassOfSet : Set → Class
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
abbrev ClassOfSet := LRA.Set.Constructions.NBG.ClassOfSet

/--
`OrderedPair` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Set → LRA.Set.Constructions.NBG.Set → LRA.Set.Constructions.NBG.Set

Predicate logic (unfolded):

  LRA.Set.Constructions.NBG.Set → LRA.Set.Constructions.NBG.Set → LRA.Set.Constructions.NBG.Set (compiled unfold unavailable; showing predicate logic)

Logical form (Lean):

```lean
axiom OrderedPair : Set → Set → Set
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
abbrev OrderedPair := LRA.Set.Constructions.NBG.OrderedPair

/--
`EncodedTriple` TODO

Predicate logic:

  def EncodedTriple (x y z : Set) : Set :=
    OrderedPair x (OrderedPair y z)

Predicate logic (unfolded):

  def EncodedTriple (x y z : Set) : Set :=
    OrderedPair x (OrderedPair y z) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def EncodedTriple (x y z : Set) : Set :=
  OrderedPair x (OrderedPair y z)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def EncodedTriple (x y z : Set) : Set :=
  OrderedPair x (OrderedPair y z)

/--
`IsSetClass` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.NBG.Axioms.Set) (X : LRA.Set.Constructions.NBG.Axioms.Class) (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem X x ↔ LRA.Set.Constructions.instMembershipNBGSet.mem A x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem X x ↔ LRA.Set.Constructions.instMembershipNBGSet.mem A x

Logical form (Lean):

```lean
def IsSetClass (A : Set) (X : Class) : Prop :=
  ∀ x : Set, x ∈ X ↔ x ∈ A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, unfold

-/
def IsSetClass (A : Set) (X : Class) : Prop :=
  ∀ x : Set, x ∈ X ↔ x ∈ A

/--
`IsEmptySet` TODO

Predicate logic:

  ∀ (A x : LRA.Set.Constructions.NBG.Axioms.Set), ¬ LRA.Set.Constructions.instMembershipNBGSet.mem A x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipNBGSet.1 A x → False

Logical form (Lean):

```lean
def IsEmptySet (A : Set) : Prop :=
  ∀ x : Set, x ∉ A
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
def IsEmptySet (A : Set) : Prop :=
  ∀ x : Set, x ∉ A

/--
`IsPairSet` TODO

Predicate logic:

  ∀ (x y P w : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.mem P w ↔ Or (w = x)(w = y)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipNBGSet.mem P w ↔ Or (w = x)(w = y)

Logical form (Lean):

```lean
def IsPairSet (x y P : Set) : Prop :=
  ∀ w : Set, w ∈ P ↔ w = x ∨ w = y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, Or.inl, Or.inr, cases, rcases, unfold

-/
def IsPairSet (x y P : Set) : Prop :=
  ∀ w : Set, w ∈ P ↔ w = x ∨ w = y

/--
`IsUnionOf` TODO

Predicate logic:

  ∀ (A U x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.mem U x ↔ Exists fun B => (LRA.Set.Constructions.instMembershipNBGSet.mem A B ∧ LRA.Set.Constructions.instMembershipNBGSet.mem B x)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipNBGSet.mem U x ↔ Exists fun B => (LRA.Set.Constructions.instMembershipNBGSet.mem A B ∧ LRA.Set.Constructions.instMembershipNBGSet.mem B x)

Logical form (Lean):

```lean
def IsUnionOf (A U : Set) : Prop :=
  ∀ x : Set, x ∈ U ↔ ∃ B : Set, B ∈ A ∧ x ∈ B
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
def IsUnionOf (A U : Set) : Prop :=
  ∀ x : Set, x ∈ U ↔ ∃ B : Set, B ∈ A ∧ x ∈ B

/--
`IsPowerSetOf` TODO

Predicate logic:

  ∀ (A P x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.mem P x ↔ ∀ (y : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.mem x y → LRA.Set.Constructions.instMembershipNBGSet.mem A y

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipNBGSet.mem P x ↔ ∀ (y : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.mem x y → LRA.Set.Constructions.instMembershipNBGSet.mem A y

Logical form (Lean):

```lean
def IsPowerSetOf (A P : Set) : Prop :=
  ∀ x : Set, x ∈ P ↔ ∀ y : Set, y ∈ x → y ∈ A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, unfold

-/
def IsPowerSetOf (A P : Set) : Prop :=
  ∀ x : Set, x ∈ P ↔ ∀ y : Set, y ∈ x → y ∈ A

/--
`IsSuccessorOf` TODO

Predicate logic:

  ∀ (x successor w : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.mem successor w ↔ Or (LRA.Set.Constructions.instMembershipNBGSet.mem x w) (w = x)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipNBGSet.mem successor w ↔ Or (LRA.Set.Constructions.instMembershipNBGSet.mem x w) (w = x)

Logical form (Lean):

```lean
def IsSuccessorOf (x successor : Set) : Prop :=
  ∀ w : Set, w ∈ successor ↔ w ∈ x ∨ w = x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, Or.inl, Or.inr, cases, rcases, unfold

-/
def IsSuccessorOf (x successor : Set) : Prop :=
  ∀ w : Set, w ∈ successor ↔ w ∈ x ∨ w = x

/--
`IsInductiveSet` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.NBG.Axioms.Set), ((Exists fun empty => (LRA.Set.Constructions.instMembershipNBGSet.mem A empty ∧ LRA.Set.Constructions.NBG.Axioms.IsEmptySet empty)) ∧ (∀ (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.mem A x → Exists fun successor => (LRA.Set.Constructions.instMembershipNBGSet.mem A successor ∧ LRA.Set.Constructions.NBG.Axioms.IsSuccessorOf x successor)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((Exists fun empty => (LRA.Set.Constructions.instMembershipNBGSet.1 A empty ∧ (∀ (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.1 empty x → False))) ∧ (∀ (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.1 A x → Exists fun successor => (LRA.Set.Constructions.instMembershipNBGSet.1 A successor ∧ (∀ (w : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.1 successor w ↔ Or (LRA.Set.Constructions.instMembershipNBGSet.1 x w) (w = x)))))

Logical form (Lean):

```lean
def IsInductiveSet (A : Set) : Prop :=
  (∃ empty : Set, empty ∈ A ∧ IsEmptySet empty) ∧
  ∀ x : Set, x ∈ A → ∃ successor : Set, successor ∈ A ∧ IsSuccessorOf x successor
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
def IsInductiveSet (A : Set) : Prop :=
  (∃ empty : Set, empty ∈ A ∧ IsEmptySet empty) ∧
  ∀ x : Set, x ∈ A → ∃ successor : Set, successor ∈ A ∧ IsSuccessorOf x successor

/--
`IsFoundationWitness` TODO

Predicate logic:

  ∀ (A x : LRA.Set.Constructions.NBG.Axioms.Set), (LRA.Set.Constructions.instMembershipNBGSet.mem A x ∧ (∀ (y : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.mem x y → ¬ LRA.Set.Constructions.instMembershipNBGSet.mem A y))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (LRA.Set.Constructions.instMembershipNBGSet.1 A x ∧ (∀ (y : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.1 x y → LRA.Set.Constructions.instMembershipNBGSet.1 A y → False))

Logical form (Lean):

```lean
def IsFoundationWitness (A x : Set) : Prop :=
  x ∈ A ∧ ∀ y : Set, y ∈ x → y ∉ A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def IsFoundationWitness (A x : Set) : Prop :=
  x ∈ A ∧ ∀ y : Set, y ∈ x → y ∉ A

/--
`IsFunctionalOn` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.NBG.Axioms.Set) (relation : LRA.Set.Constructions.NBG.Axioms.Set → LRA.Set.Constructions.NBG.Axioms.Set → Prop) (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.mem A x → Exists fun y => (relation x y ∧ (∀ (other : LRA.Set.Constructions.NBG.Axioms.Set), relation x other → other = y))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipNBGSet.1 A x → Exists fun y => (relation x y ∧ (∀ (other : LRA.Set.Constructions.NBG.Axioms.Set), relation x other → other = y))

Logical form (Lean):

```lean
def IsFunctionalOn (A : Set) (relation : Set → Set → Prop) : Prop :=
  ∀ x : Set, x ∈ A →
    ∃ y : Set, relation x y ∧ ∀ other : Set, relation x other → other = y
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
    ∃ y : Set, relation x y ∧ ∀ other : Set, relation x other → other = y

/--
`IsReplacementImageOf` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.NBG.Axioms.Set) (relation : LRA.Set.Constructions.NBG.Axioms.Set → LRA.Set.Constructions.NBG.Axioms.Set → Prop) (B y : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.mem B y ↔ Exists fun x => (LRA.Set.Constructions.instMembershipNBGSet.mem A x ∧ relation x y)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipNBGSet.mem B y ↔ Exists fun x => (LRA.Set.Constructions.instMembershipNBGSet.mem A x ∧ relation x y)

Logical form (Lean):

```lean
def IsReplacementImageOf (A : Set) (relation : Set → Set → Prop) (B : Set) : Prop :=
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
def IsReplacementImageOf (A : Set) (relation : Set → Set → Prop) (B : Set) : Prop :=
  ∀ y : Set, y ∈ B ↔ ∃ x : Set, x ∈ A ∧ relation x y

/--
`IsClassComprehension` TODO

Predicate logic:

  ∀ (property : LRA.Set.Constructions.NBG.Axioms.Set → Prop) (C : LRA.Set.Constructions.NBG.Axioms.Class) (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem C x ↔ property x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem C x ↔ property x

Logical form (Lean):

```lean
def IsClassComprehension (property : Set → Prop) (C : Class) : Prop :=
  ∀ x : Set, x ∈ C ↔ property x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, unfold

-/
def IsClassComprehension (property : Set → Prop) (C : Class) : Prop :=
  ∀ x : Set, x ∈ C ↔ property x

/--
`IsUniversalClass` TODO

Predicate logic:

  ∀ (V : LRA.Set.Constructions.NBG.Axioms.Class) (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem V x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 V x

Logical form (Lean):

```lean
def IsUniversalClass (V : Class) : Prop :=
  ∀ x : Set, x ∈ V
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
def IsUniversalClass (V : Class) : Prop :=
  ∀ x : Set, x ∈ V

/--
`IsElementhoodClass` TODO

Predicate logic:

  ∀ (E : LRA.Set.Constructions.NBG.Axioms.Class) (x y : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem E (LRA.Set.Constructions.NBG.Axioms.OrderedPair x y) ↔ LRA.Set.Constructions.instMembershipNBGSet.mem y x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem E (LRA.Set.Constructions.NBG.Axioms.OrderedPair x y) ↔ LRA.Set.Constructions.instMembershipNBGSet.mem y x

Logical form (Lean):

```lean
def IsElementhoodClass (E : Class) : Prop :=
  ∀ x y : Set, OrderedPair x y ∈ E ↔ x ∈ y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, unfold

-/
def IsElementhoodClass (E : Class) : Prop :=
  ∀ x y : Set, OrderedPair x y ∈ E ↔ x ∈ y

/--
`IsIntersectionClass` TODO

Predicate logic:

  ∀ (X Y Z : LRA.Set.Constructions.NBG.Axioms.Class) (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem Z x ↔ (LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem X x ∧ LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem Y x)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem Z x ↔ (LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem X x ∧ LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem Y x)

Logical form (Lean):

```lean
def IsIntersectionClass (X Y Z : Class) : Prop :=
  ∀ x : Set, x ∈ Z ↔ x ∈ X ∧ x ∈ Y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, unfold

-/
def IsIntersectionClass (X Y Z : Class) : Prop :=
  ∀ x : Set, x ∈ Z ↔ x ∈ X ∧ x ∈ Y

/--
`IsComplementClass` TODO

Predicate logic:

  ∀ (X Z : LRA.Set.Constructions.NBG.Axioms.Class) (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem Z x ↔ ¬ LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem X x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem Z x ↔ ¬ LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem X x

Logical form (Lean):

```lean
def IsComplementClass (X Z : Class) : Prop :=
  ∀ x : Set, x ∈ Z ↔ x ∉ X
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, unfold

-/
def IsComplementClass (X Z : Class) : Prop :=
  ∀ x : Set, x ∈ Z ↔ x ∉ X

/--
`IsDomainClass` TODO

Predicate logic:

  ∀ (X D : LRA.Set.Constructions.NBG.Axioms.Class) (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem D x ↔ Exists fun y => LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem X (LRA.Set.Constructions.NBG.Axioms.OrderedPair x y)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem D x ↔ Exists fun y => LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem X (LRA.Set.Constructions.NBG.Axioms.OrderedPair x y)

Logical form (Lean):

```lean
def IsDomainClass (X D : Class) : Prop :=
  ∀ x : Set, x ∈ D ↔ ∃ y : Set, OrderedPair x y ∈ X
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, use, rcases, unfold

-/
def IsDomainClass (X D : Class) : Prop :=
  ∀ x : Set, x ∈ D ↔ ∃ y : Set, OrderedPair x y ∈ X

/--
`IsCartesianExtensionClass` TODO

Predicate logic:

  ∀ (X Z : LRA.Set.Constructions.NBG.Axioms.Class) (x y : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem Z (LRA.Set.Constructions.NBG.Axioms.OrderedPair x y) ↔ LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem X x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem Z (LRA.Set.Constructions.NBG.Axioms.OrderedPair x y) ↔ LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem X x

Logical form (Lean):

```lean
def IsCartesianExtensionClass (X Z : Class) : Prop :=
  ∀ x y : Set, OrderedPair x y ∈ Z ↔ x ∈ X
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, unfold

-/
def IsCartesianExtensionClass (X Z : Class) : Prop :=
  ∀ x y : Set, OrderedPair x y ∈ Z ↔ x ∈ X

/--
`IsPermutationClass` TODO

Predicate logic:

  ∀ (X Z : LRA.Set.Constructions.NBG.Axioms.Class) (x y z : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem Z (LRA.Set.Constructions.NBG.Axioms.EncodedTriple x y z) ↔ LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem X (LRA.Set.Constructions.NBG.Axioms.EncodedTriple y z x)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem Z (LRA.Set.Constructions.NBG.Axioms.EncodedTriple x y z) ↔ LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem X (LRA.Set.Constructions.NBG.Axioms.EncodedTriple y z x)

Logical form (Lean):

```lean
def IsPermutationClass (X Z : Class) : Prop :=
  ∀ x y z : Set, EncodedTriple x y z ∈ Z ↔ EncodedTriple y z x ∈ X
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, unfold

-/
def IsPermutationClass (X Z : Class) : Prop :=
  ∀ x y z : Set, EncodedTriple x y z ∈ Z ↔ EncodedTriple y z x ∈ X

/--
`IsTranspositionClass` TODO

Predicate logic:

  ∀ (X Z : LRA.Set.Constructions.NBG.Axioms.Class) (x y z : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem Z (LRA.Set.Constructions.NBG.Axioms.EncodedTriple x y z) ↔ LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem X (LRA.Set.Constructions.NBG.Axioms.EncodedTriple x z y)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem Z (LRA.Set.Constructions.NBG.Axioms.EncodedTriple x y z) ↔ LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem X (LRA.Set.Constructions.NBG.Axioms.EncodedTriple x z y)

Logical form (Lean):

```lean
def IsTranspositionClass (X Z : Class) : Prop :=
  ∀ x y z : Set, EncodedTriple x y z ∈ Z ↔ EncodedTriple x z y ∈ X
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, unfold

-/
def IsTranspositionClass (X Z : Class) : Prop :=
  ∀ x y z : Set, EncodedTriple x y z ∈ Z ↔ EncodedTriple x z y ∈ X

/--
`IsGlobalChoiceClass` TODO

Predicate logic:

  ∀ (G : LRA.Set.Constructions.NBG.Axioms.Class) (A : LRA.Set.Constructions.NBG.Axioms.Set), (Exists fun x => LRA.Set.Constructions.instMembershipNBGSet.mem A x) → Exists fun y => (LRA.Set.Constructions.instMembershipNBGSet.mem A y ∧ (LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem G (LRA.Set.Constructions.NBG.Axioms.OrderedPair A y) ∧ (∀ (other : LRA.Set.Constructions.NBG.Axioms.Set), (LRA.Set.Constructions.instMembershipNBGSet.mem A other ∧ LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem G (LRA.Set.Constructions.NBG.Axioms.OrderedPair A other)) → other = y)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Exists fun x => LRA.Set.Constructions.instMembershipNBGSet.1 A x) → Exists fun y => (LRA.Set.Constructions.instMembershipNBGSet.1 A y ∧ (LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 G (LRA.Set.Constructions.NBG.OrderedPair A y) ∧ (∀ (other : LRA.Set.Constructions.NBG.Axioms.Set), (LRA.Set.Constructions.instMembershipNBGSet.1 A other ∧ LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 G (LRA.Set.Constructions.NBG.OrderedPair A other)) → other = y)))

Logical form (Lean):

```lean
def IsGlobalChoiceClass (G : Class) : Prop :=
  ∀ A : Set, (∃ x : Set, x ∈ A) →
    ∃ y : Set,
      y ∈ A ∧ OrderedPair A y ∈ G ∧
      ∀ other : Set, other ∈ A ∧ OrderedPair A other ∈ G → other = y
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
def IsGlobalChoiceClass (G : Class) : Prop :=
  ∀ A : Set, (∃ x : Set, x ∈ A) →
    ∃ y : Set,
      y ∈ A ∧ OrderedPair A y ∈ G ∧
      ∀ other : Set, other ∈ A ∧ OrderedPair A other ∈ G → other = y

end

end LRA.Set.Constructions.NBG.Axioms
