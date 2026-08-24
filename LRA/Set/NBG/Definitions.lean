import LRA.Set.NBGSet.Primitives
import LRA.Identity.ExistenceAndUniqueness

namespace LRA.Set.NBG

/--
`Set` TODO

Predicate logic:

  abbrev Set := LRA.Set.NBGSet

Predicate logic (unfolded):

  abbrev Set := LRA.Set.NBGSet (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Set := LRA.Set.NBGSet
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
abbrev Set := LRA.Set.NBGSet

/--
`Class` TODO

Predicate logic:

  abbrev Class := LRA.Set.NBGClass

Predicate logic (unfolded):

  abbrev Class := LRA.Set.NBGClass (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Class := LRA.Set.NBGClass
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
abbrev Class := LRA.Set.NBGClass

/--
`ExistsAndUnique` TODO

Predicate logic:

  ∀ (property : LRA.Set.NBG.Set → Prop), (Exists fun witness => property witness ∧ LRA.Identity.Unique property)

Predicate logic (unfolded):

  ∀ (property : LRA.Set.NBG.Set → Prop), (Exists fun witness => property witness ∧ ∀ (left right : LRA.Set.NBG.Set), property left → property right → left = right)

Logical form (Lean):

```lean
abbrev ExistsAndUnique (property : Set -> Prop) : Prop :=
  LRA.Identity.ExistsAndUnique property
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
abbrev ExistsAndUnique (property : Set -> Prop) : Prop :=
  LRA.Identity.ExistsAndUnique property

/--
`IsEmptySet` TODO

Predicate logic:

  ∀ (A x : LRA.Set.NBG.Set), ¬ LRA.Set.instMembershipNBGSet.mem A x

Predicate logic (unfolded):

  ∀ (A x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 A x → False

Logical form (Lean):

```lean
def IsEmptySet (A : Set) : Prop := forall x : Set, x ∉ A
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
def IsEmptySet (A : Set) : Prop := forall x : Set, x ∉ A

/--
`IsPairSet` TODO

Predicate logic:

  ∀ (x1 x2 P w : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.mem P w ↔ Or (w = x1)(w = x2)

Predicate logic (unfolded):

  ∀ (x1 x2 P w : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 P w ↔ Or (w = x1)(w = x2)

Logical form (Lean):

```lean
def IsPairSet (x1 x2 P : Set) : Prop := forall w : Set, w ∈ P <-> w = x1 \/ w = x2
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
def IsPairSet (x1 x2 P : Set) : Prop := forall w : Set, w ∈ P <-> w = x1 \/ w = x2

/--
`IsSingletonSet` TODO

Predicate logic:

  ∀ (x S w : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.mem S w ↔ w = x

Predicate logic (unfolded):

  ∀ (x S w : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 S w ↔ w = x

Logical form (Lean):

```lean
def IsSingletonSet (x S : Set) : Prop := forall w : Set, w ∈ S <-> w = x
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
def IsSingletonSet (x S : Set) : Prop := forall w : Set, w ∈ S <-> w = x

/--
`IsUnionOf` TODO

Predicate logic:

  ∀ (A U x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.mem U x ↔ Exists fun B => (LRA.Set.instMembershipNBGSet.mem A B ∧ LRA.Set.instMembershipNBGSet.mem B x)

Predicate logic (unfolded):

  ∀ (A U x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 U x ↔ Exists fun B => (LRA.Set.instMembershipNBGSet.1 A B ∧ LRA.Set.instMembershipNBGSet.1 B x)

Logical form (Lean):

```lean
def IsUnionOf (A U : Set) : Prop :=
  forall x : Set, x ∈ U <-> exists B : Set, B ∈ A /\ x ∈ B
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
  forall x : Set, x ∈ U <-> exists B : Set, B ∈ A /\ x ∈ B

/--
`IsPowerSetOf` TODO

Predicate logic:

  ∀ (A P x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.mem P x ↔ ∀ (y : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.mem x y → LRA.Set.instMembershipNBGSet.mem A y

Predicate logic (unfolded):

  ∀ (A P x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 P x ↔ ∀ (y : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 x y → LRA.Set.instMembershipNBGSet.1 A y

Logical form (Lean):

```lean
def IsPowerSetOf (A P : Set) : Prop :=
  forall x : Set, x ∈ P <-> forall y : Set, y ∈ x -> y ∈ A
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
  forall x : Set, x ∈ P <-> forall y : Set, y ∈ x -> y ∈ A

/--
`IsSeparatedSubset` TODO

Predicate logic:

  ∀ (A : LRA.Set.NBG.Set) (property : LRA.Set.NBG.Set → Prop) (B x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.mem B x ↔ (LRA.Set.instMembershipNBGSet.mem A x ∧ property x)

Predicate logic (unfolded):

  ∀ (A : LRA.Set.NBG.Set) (property : LRA.Set.NBG.Set → Prop) (B x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 B x ↔ (LRA.Set.instMembershipNBGSet.1 A x ∧ property x)

Logical form (Lean):

```lean
def IsSeparatedSubset (A : Set) (property : Set -> Prop) (B : Set) : Prop :=
  forall x : Set, x ∈ B <-> x ∈ A /\ property x
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
def IsSeparatedSubset (A : Set) (property : Set -> Prop) (B : Set) : Prop :=
  forall x : Set, x ∈ B <-> x ∈ A /\ property x

/--
`IsRelativeComplementOf` TODO

Predicate logic:

  ∀ (A B D x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.mem D x ↔ (LRA.Set.instMembershipNBGSet.mem A x ∧ ¬ LRA.Set.instMembershipNBGSet.mem B x)

Predicate logic (unfolded):

  ∀ (A B D x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 D x ↔ (LRA.Set.instMembershipNBGSet.1 A x ∧ LRA.Set.instMembershipNBGSet.1 B x → False)

Logical form (Lean):

```lean
def IsRelativeComplementOf (A B D : Set) : Prop :=
  forall x : Set, x ∈ D <-> x ∈ A /\ x ∉ B
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
def IsRelativeComplementOf (A B D : Set) : Prop :=
  forall x : Set, x ∈ D <-> x ∈ A /\ x ∉ B

/--
`IsIntersectionOf` TODO

Predicate logic:

  ∀ (A B D x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.mem D x ↔ (LRA.Set.instMembershipNBGSet.mem A x ∧ LRA.Set.instMembershipNBGSet.mem B x)

Predicate logic (unfolded):

  ∀ (A B D x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 D x ↔ (LRA.Set.instMembershipNBGSet.1 A x ∧ LRA.Set.instMembershipNBGSet.1 B x)

Logical form (Lean):

```lean
def IsIntersectionOf (A B D : Set) : Prop :=
  forall x : Set, x ∈ D <-> x ∈ A /\ x ∈ B
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
def IsIntersectionOf (A B D : Set) : Prop :=
  forall x : Set, x ∈ D <-> x ∈ A /\ x ∈ B

/--
`IsSymmetricDifferenceOf` TODO

Predicate logic:

  ∀ (A B D x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.mem D x ↔ Or ((LRA.Set.instMembershipNBGSet.mem A x ∧ ¬ LRA.Set.instMembershipNBGSet.mem B x)) ((LRA.Set.instMembershipNBGSet.mem B x ∧ ¬ LRA.Set.instMembershipNBGSet.mem A x))

Predicate logic (unfolded):

  ∀ (A B D x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 D x ↔ Or ((LRA.Set.instMembershipNBGSet.1 A x ∧ LRA.Set.instMembershipNBGSet.1 B x → False)) ((LRA.Set.instMembershipNBGSet.1 B x ∧ LRA.Set.instMembershipNBGSet.1 A x → False))

Logical form (Lean):

```lean
def IsSymmetricDifferenceOf (A B D : Set) : Prop :=
  forall x : Set, x ∈ D <-> (x ∈ A /\ x ∉ B) \/ (x ∈ B /\ x ∉ A)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, Or.inl, Or.inr, unfold

-/
def IsSymmetricDifferenceOf (A B D : Set) : Prop :=
  forall x : Set, x ∈ D <-> (x ∈ A /\ x ∉ B) \/ (x ∈ B /\ x ∉ A)

/--
`Subset` TODO

Predicate logic:

  ∀ (A B x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.mem A x → LRA.Set.instMembershipNBGSet.mem B x

Predicate logic (unfolded):

  ∀ (A B x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 A x → LRA.Set.instMembershipNBGSet.1 B x

Logical form (Lean):

```lean
def Subset (A B : Set) : Prop := forall x : Set, x ∈ A -> x ∈ B
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
def Subset (A B : Set) : Prop := forall x : Set, x ∈ A -> x ∈ B

/--
`IsFunctionalOn` TODO

Predicate logic:

  ∀ (A : LRA.Set.NBG.Set) (relation : LRA.Set.NBG.Set → LRA.Set.NBG.Set → Prop) (x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.mem A x → Exists fun y => (relation x y ∧ ∀ (other : LRA.Set.NBG.Set), relation x other → other = y)

Predicate logic (unfolded):

  ∀ (A : LRA.Set.NBG.Set) (relation : LRA.Set.NBG.Set → LRA.Set.NBG.Set → Prop) (x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 A x → Exists fun y => (relation x y ∧ ∀ (other : LRA.Set.NBG.Set), relation x other → other = y)

Logical form (Lean):

```lean
def IsFunctionalOn (A : Set) (relation : Set -> Set -> Prop) : Prop :=
  forall x : Set, x ∈ A ->
    exists y : Set, relation x y /\ forall other : Set, relation x other -> other = y
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
def IsFunctionalOn (A : Set) (relation : Set -> Set -> Prop) : Prop :=
  forall x : Set, x ∈ A ->
    exists y : Set, relation x y /\ forall other : Set, relation x other -> other = y

/--
`IsReplacementImageOf` TODO

Predicate logic:

  ∀ (A : LRA.Set.NBG.Set) (relation : LRA.Set.NBG.Set → LRA.Set.NBG.Set → Prop) (B y : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.mem B y ↔ Exists fun x => (LRA.Set.instMembershipNBGSet.mem A x ∧ relation x y)

Predicate logic (unfolded):

  ∀ (A : LRA.Set.NBG.Set) (relation : LRA.Set.NBG.Set → LRA.Set.NBG.Set → Prop) (B y : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 B y ↔ Exists fun x => (LRA.Set.instMembershipNBGSet.1 A x ∧ relation x y)

Logical form (Lean):

```lean
def IsReplacementImageOf (A : Set) (relation : Set -> Set -> Prop) (B : Set) : Prop :=
  forall y : Set, y ∈ B <-> exists x : Set, x ∈ A /\ relation x y
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
def IsReplacementImageOf (A : Set) (relation : Set -> Set -> Prop) (B : Set) : Prop :=
  forall y : Set, y ∈ B <-> exists x : Set, x ∈ A /\ relation x y

/--
`IsSuccessorOf` TODO

Predicate logic:

  ∀ (x successor w : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.mem successor w ↔ Or (LRA.Set.instMembershipNBGSet.mem x w) (w = x)

Predicate logic (unfolded):

  ∀ (x successor w : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 successor w ↔ Or (LRA.Set.instMembershipNBGSet.1 x w) (w = x)

Logical form (Lean):

```lean
def IsSuccessorOf (x successor : Set) : Prop :=
  forall w : Set, w ∈ successor <-> w ∈ x \/ w = x
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
  forall w : Set, w ∈ successor <-> w ∈ x \/ w = x

/--
`IsInductiveSet` TODO

Predicate logic:

  ∀ (A : LRA.Set.NBG.Set), (Exists fun empty => (LRA.Set.instMembershipNBGSet.mem A empty ∧ LRA.Set.NBG.IsEmptySet empty) ∧ ∀ (x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.mem A x → Exists fun successor => (LRA.Set.instMembershipNBGSet.mem A successor ∧ LRA.Set.NBG.IsSuccessorOf x successor))

Predicate logic (unfolded):

  ∀ (A : LRA.Set.NBG.Set), (Exists fun empty => (LRA.Set.instMembershipNBGSet.1 A empty ∧ ∀ (x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 empty x → False) ∧ ∀ (x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 A x → Exists fun successor => (LRA.Set.instMembershipNBGSet.1 A successor ∧ ∀ (w : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 successor w ↔ Or (LRA.Set.instMembershipNBGSet.1 x w) (w = x)))

Logical form (Lean):

```lean
def IsInductiveSet (A : Set) : Prop :=
  (exists empty : Set, empty ∈ A /\ IsEmptySet empty) /\
  forall x : Set, x ∈ A -> exists successor : Set, successor ∈ A /\ IsSuccessorOf x successor
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
  (exists empty : Set, empty ∈ A /\ IsEmptySet empty) /\
  forall x : Set, x ∈ A -> exists successor : Set, successor ∈ A /\ IsSuccessorOf x successor

/--
`IsFoundationWitness` TODO

Predicate logic:

  ∀ (A x : LRA.Set.NBG.Set), (LRA.Set.instMembershipNBGSet.mem A x ∧ ∀ (y : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.mem x y → ¬ LRA.Set.instMembershipNBGSet.mem A y)

Predicate logic (unfolded):

  ∀ (A x : LRA.Set.NBG.Set), (LRA.Set.instMembershipNBGSet.1 A x ∧ ∀ (y : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 x y → LRA.Set.instMembershipNBGSet.1 A y → False)

Logical form (Lean):

```lean
def IsFoundationWitness (A x : Set) : Prop :=
  x ∈ A /\ forall y : Set, y ∈ x -> y ∉ A
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
  x ∈ A /\ forall y : Set, y ∈ x -> y ∉ A

/--
`IsChoiceSetFor` TODO

Predicate logic:

  ∀ (A choiceSet B : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.mem A B → Exists fun x => ((LRA.Set.instMembershipNBGSet.mem B x ∧ LRA.Set.instMembershipNBGSet.mem choiceSet x) ∧ ∀ (other : LRA.Set.NBG.Set), (LRA.Set.instMembershipNBGSet.mem B other ∧ LRA.Set.instMembershipNBGSet.mem choiceSet other) → other = x)

Predicate logic (unfolded):

  ∀ (A choiceSet B : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 A B → Exists fun x => ((LRA.Set.instMembershipNBGSet.1 B x ∧ LRA.Set.instMembershipNBGSet.1 choiceSet x) ∧ ∀ (other : LRA.Set.NBG.Set), (LRA.Set.instMembershipNBGSet.1 B other ∧ LRA.Set.instMembershipNBGSet.1 choiceSet other) → other = x)

Logical form (Lean):

```lean
def IsChoiceSetFor (A choiceSet : Set) : Prop :=
  forall B : Set, B ∈ A ->
    exists x : Set,
      (x ∈ B /\ x ∈ choiceSet) /\
      forall other : Set, (other ∈ B /\ other ∈ choiceSet) -> other = x
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
def IsChoiceSetFor (A choiceSet : Set) : Prop :=
  forall B : Set, B ∈ A ->
    exists x : Set,
      (x ∈ B /\ x ∈ choiceSet) /\
      forall other : Set, (other ∈ B /\ other ∈ choiceSet) -> other = x

/--
`IsClassComprehension` TODO

Predicate logic:

  ∀ (property : LRA.Set.NBG.Set → Prop) (C : LRA.Set.NBG.Class) (x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSetNBGClass.mem C x ↔ property x

Predicate logic (unfolded):

  ∀ (property : LRA.Set.NBG.Set → Prop) (C : LRA.Set.NBG.Class) (x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSetNBGClass.1 C x ↔ property x

Logical form (Lean):

```lean
def IsClassComprehension (property : Set -> Prop) (C : Class) : Prop :=
  forall x : Set, x ∈ C <-> property x
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
def IsClassComprehension (property : Set -> Prop) (C : Class) : Prop :=
  forall x : Set, x ∈ C <-> property x

/--
`IsClassOfSet` TODO

Predicate logic:

  ∀ (A : LRA.Set.NBG.Set) (C : LRA.Set.NBG.Class) (x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSetNBGClass.mem C x ↔ LRA.Set.instMembershipNBGSet.mem A x

Predicate logic (unfolded):

  ∀ (A : LRA.Set.NBG.Set) (C : LRA.Set.NBG.Class) (x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSetNBGClass.1 C x ↔ LRA.Set.instMembershipNBGSet.1 A x

Logical form (Lean):

```lean
def IsClassOfSet (A : Set) (C : Class) : Prop :=
  forall x : Set, x ∈ C <-> x ∈ A
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
def IsClassOfSet (A : Set) (C : Class) : Prop :=
  forall x : Set, x ∈ C <-> x ∈ A

end LRA.Set.NBG
