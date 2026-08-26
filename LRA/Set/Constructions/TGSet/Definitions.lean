import LRA.Set.Constructions.TGSet.Definition
import LRA.Identity.Constructions.Leibniz.Definitions.ExistenceAndUniqueness

namespace LRA.Set.Constructions.TGSet

/--
`ExistsAndUnique` TODO

Predicate logic:

  ∀ (property : LRA.Set.Constructions.TGSet.Set → Prop), (Exists fun witness => property witness ∧ LRA.Identity.Unique property)

Predicate logic (unfolded):

  ∀ (property : LRA.Set.Constructions.TGSet.Set → Prop), (Exists fun witness => property witness ∧ ∀ (left right : LRA.Set.Constructions.TGSet.Set), property left → property right → left = right)

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

  ∀ (A x : LRA.Set.Constructions.TGSet.Set), ¬ LRA.Set.instMembershipTGSet.mem A x

Predicate logic (unfolded):

  ∀ (A x : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 A x → False

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

  ∀ (x1 x2 P w : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.mem P w ↔ Or (w = x1)(w = x2)

Predicate logic (unfolded):

  ∀ (x1 x2 P w : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 P w ↔ Or (w = x1)(w = x2)

Logical form (Lean):

```lean
def IsPairSet (x1 x2 P : Set) : Prop :=
  forall w : Set, w ∈ P <-> w = x1 \/ w = x2
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
def IsPairSet (x1 x2 P : Set) : Prop :=
  forall w : Set, w ∈ P <-> w = x1 \/ w = x2

/--
`IsSingletonSet` TODO

Predicate logic:

  ∀ (x S w : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.mem S w ↔ w = x

Predicate logic (unfolded):

  ∀ (x S w : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 S w ↔ w = x

Logical form (Lean):

```lean
def IsSingletonSet (x S : Set) : Prop :=
  forall w : Set, w ∈ S <-> w = x
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
def IsSingletonSet (x S : Set) : Prop :=
  forall w : Set, w ∈ S <-> w = x

/--
`IsUnionOf` TODO

Predicate logic:

  ∀ (A U x : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.mem U x ↔ Exists fun B => (LRA.Set.instMembershipTGSet.mem A B ∧ LRA.Set.instMembershipTGSet.mem B x)

Predicate logic (unfolded):

  ∀ (A U x : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 U x ↔ Exists fun B => (LRA.Set.instMembershipTGSet.1 A B ∧ LRA.Set.instMembershipTGSet.1 B x)

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

  ∀ (A P x : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.mem P x ↔ ∀ (y : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.mem x y → LRA.Set.instMembershipTGSet.mem A y

Predicate logic (unfolded):

  ∀ (A P x : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 P x ↔ ∀ (y : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 x y → LRA.Set.instMembershipTGSet.1 A y

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

  ∀ (A : LRA.Set.Constructions.TGSet.Set) (property : LRA.Set.Constructions.TGSet.Set → Prop) (B x : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.mem B x ↔ (LRA.Set.instMembershipTGSet.mem A x ∧ property x)

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.TGSet.Set) (property : LRA.Set.Constructions.TGSet.Set → Prop) (B x : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 B x ↔ (LRA.Set.instMembershipTGSet.1 A x ∧ property x)

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

  ∀ (A B D x : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.mem D x ↔ (LRA.Set.instMembershipTGSet.mem A x ∧ ¬ LRA.Set.instMembershipTGSet.mem B x)

Predicate logic (unfolded):

  ∀ (A B D x : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 D x ↔ (LRA.Set.instMembershipTGSet.1 A x ∧ LRA.Set.instMembershipTGSet.1 B x → False)

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

  ∀ (A B D x : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.mem D x ↔ (LRA.Set.instMembershipTGSet.mem A x ∧ LRA.Set.instMembershipTGSet.mem B x)

Predicate logic (unfolded):

  ∀ (A B D x : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 D x ↔ (LRA.Set.instMembershipTGSet.1 A x ∧ LRA.Set.instMembershipTGSet.1 B x)

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

  ∀ (A B D x : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.mem D x ↔ Or ((LRA.Set.instMembershipTGSet.mem A x ∧ ¬ LRA.Set.instMembershipTGSet.mem B x)) ((LRA.Set.instMembershipTGSet.mem B x ∧ ¬ LRA.Set.instMembershipTGSet.mem A x))

Predicate logic (unfolded):

  ∀ (A B D x : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 D x ↔ Or ((LRA.Set.instMembershipTGSet.1 A x ∧ LRA.Set.instMembershipTGSet.1 B x → False)) ((LRA.Set.instMembershipTGSet.1 B x ∧ LRA.Set.instMembershipTGSet.1 A x → False))

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

  ∀ (A B x : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.mem A x → LRA.Set.instMembershipTGSet.mem B x

Predicate logic (unfolded):

  ∀ (A B x : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 A x → LRA.Set.instMembershipTGSet.1 B x

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

  ∀ (A : LRA.Set.Constructions.TGSet.Set) (relation : LRA.Set.Constructions.TGSet.Set → LRA.Set.Constructions.TGSet.Set → Prop) (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.mem A x → Exists fun y => (relation x y ∧ ∀ (other : LRA.Set.Constructions.TGSet.Set), relation x other → other = y)

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.TGSet.Set) (relation : LRA.Set.Constructions.TGSet.Set → LRA.Set.Constructions.TGSet.Set → Prop) (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 A x → Exists fun y => (relation x y ∧ ∀ (other : LRA.Set.Constructions.TGSet.Set), relation x other → other = y)

Logical form (Lean):

```lean
def IsFunctionalOn (A : Set) (relation : Set -> Set -> Prop) : Prop :=
  forall x : Set, x ∈ A ->
    exists y : Set,
      relation x y /\
      forall other : Set, relation x other -> other = y
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
    exists y : Set,
      relation x y /\
      forall other : Set, relation x other -> other = y

/--
`IsReplacementImageOf` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.TGSet.Set) (relation : LRA.Set.Constructions.TGSet.Set → LRA.Set.Constructions.TGSet.Set → Prop) (B y : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.mem B y ↔ Exists fun x => (LRA.Set.instMembershipTGSet.mem A x ∧ relation x y)

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.TGSet.Set) (relation : LRA.Set.Constructions.TGSet.Set → LRA.Set.Constructions.TGSet.Set → Prop) (B y : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 B y ↔ Exists fun x => (LRA.Set.instMembershipTGSet.1 A x ∧ relation x y)

Logical form (Lean):

```lean
def IsReplacementImageOf
    (A : Set) (relation : Set -> Set -> Prop) (B : Set) : Prop :=
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
def IsReplacementImageOf
    (A : Set) (relation : Set -> Set -> Prop) (B : Set) : Prop :=
  forall y : Set, y ∈ B <-> exists x : Set, x ∈ A /\ relation x y

/--
`IsSuccessorOf` TODO

Predicate logic:

  ∀ (x successor w : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.mem successor w ↔ Or (LRA.Set.instMembershipTGSet.mem x w) (w = x)

Predicate logic (unfolded):

  ∀ (x successor w : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 successor w ↔ Or (LRA.Set.instMembershipTGSet.1 x w) (w = x)

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

  ∀ (A : LRA.Set.Constructions.TGSet.Set), (Exists fun empty => (LRA.Set.instMembershipTGSet.mem A empty ∧ LRA.Set.Constructions.TGSet.IsEmptySet empty) ∧ ∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.mem A x → Exists fun successor => (LRA.Set.instMembershipTGSet.mem A successor ∧ LRA.Set.Constructions.TGSet.IsSuccessorOf x successor))

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.TGSet.Set), (Exists fun empty => (LRA.Set.instMembershipTGSet.1 A empty ∧ ∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 empty x → False) ∧ ∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 A x → Exists fun successor => (LRA.Set.instMembershipTGSet.1 A successor ∧ ∀ (w : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 successor w ↔ Or (LRA.Set.instMembershipTGSet.1 x w) (w = x)))

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

  ∀ (A x : LRA.Set.Constructions.TGSet.Set), (LRA.Set.instMembershipTGSet.mem A x ∧ ∀ (y : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.mem x y → ¬ LRA.Set.instMembershipTGSet.mem A y)

Predicate logic (unfolded):

  ∀ (A x : LRA.Set.Constructions.TGSet.Set), (LRA.Set.instMembershipTGSet.1 A x ∧ ∀ (y : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 x y → LRA.Set.instMembershipTGSet.1 A y → False)

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

  ∀ (A choiceSet B : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.mem A B → Exists fun x => ((LRA.Set.instMembershipTGSet.mem B x ∧ LRA.Set.instMembershipTGSet.mem choiceSet x) ∧ ∀ (other : LRA.Set.Constructions.TGSet.Set), (LRA.Set.instMembershipTGSet.mem B other ∧ LRA.Set.instMembershipTGSet.mem choiceSet other) → other = x)

Predicate logic (unfolded):

  ∀ (A choiceSet B : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 A B → Exists fun x => ((LRA.Set.instMembershipTGSet.1 B x ∧ LRA.Set.instMembershipTGSet.1 choiceSet x) ∧ ∀ (other : LRA.Set.Constructions.TGSet.Set), (LRA.Set.instMembershipTGSet.1 B other ∧ LRA.Set.instMembershipTGSet.1 choiceSet other) → other = x)

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
`IsGrothendieckUniverseFor` TODO

Predicate logic:

  ∀ (A U : LRA.Set.Constructions.TGSet.Set), (LRA.Set.instMembershipTGSet.mem U A ∧ (∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.mem U x → ∀ (y : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.mem x y → LRA.Set.instMembershipTGSet.mem U y ∧ (∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.mem U x → Exists fun P => (LRA.Set.instMembershipTGSet.mem U P ∧ LRA.Set.Constructions.TGSet.IsPowerSetOf x P) ∧ (∀ (I : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.mem U I → ∀ (family : LRA.Set.Constructions.TGSet.Set → LRA.Set.Constructions.TGSet.Set), (∀ (i : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.mem I i → LRA.Set.instMembershipTGSet.mem U (family i)) → Exists fun image => (LRA.Set.instMembershipTGSet.mem U image ∧ ∀ (y : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.mem image y ↔ Exists fun i => (LRA.Set.instMembershipTGSet.mem I i ∧ y = family i)) ∧ ∀ (I : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.mem U I → ∀ (family : LRA.Set.Constructions.TGSet.Set → LRA.Set.Constructions.TGSet.Set), (∀ (i : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.mem I i → LRA.Set.instMembershipTGSet.mem U (family i)) → Exists fun union => (LRA.Set.instMembershipTGSet.mem U union ∧ ∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.mem union x ↔ Exists fun i => (LRA.Set.instMembershipTGSet.mem I i ∧ LRA.Set.instMembershipTGSet.mem (family i) x))))))

Predicate logic (unfolded):

  ∀ (A U : LRA.Set.Constructions.TGSet.Set), (LRA.Set.instMembershipTGSet.1 U A ∧ (∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 U x → ∀ (y : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 x y → LRA.Set.instMembershipTGSet.1 U y ∧ (∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 U x → Exists fun P => (LRA.Set.instMembershipTGSet.1 U P ∧ ∀ (x_1 : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 P x_1 ↔ ∀ (y : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 x_1 y → LRA.Set.instMembershipTGSet.1 x y) ∧ (∀ (I : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 U I → ∀ (family : LRA.Set.Constructions.TGSet.Set → LRA.Set.Constructions.TGSet.Set), (∀ (i : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 I i → LRA.Set.instMembershipTGSet.1 U (family i)) → Exists fun image => (LRA.Set.instMembershipTGSet.1 U image ∧ ∀ (y : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 image y ↔ Exists fun i => (LRA.Set.instMembershipTGSet.1 I i ∧ y = family i)) ∧ ∀ (I : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 U I → ∀ (family : LRA.Set.Constructions.TGSet.Set → LRA.Set.Constructions.TGSet.Set), (∀ (i : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 I i → LRA.Set.instMembershipTGSet.1 U (family i)) → Exists fun union => (LRA.Set.instMembershipTGSet.1 U union ∧ ∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 union x ↔ Exists fun i => (LRA.Set.instMembershipTGSet.1 I i ∧ LRA.Set.instMembershipTGSet.1 (family i) x))))))

Logical form (Lean):

```lean
def IsGrothendieckUniverseFor (A U : Set) : Prop :=
  A ∈ U /\
  (forall x : Set, x ∈ U -> forall y : Set, y ∈ x -> y ∈ U) /\
  (forall x : Set, x ∈ U -> exists P : Set,
    P ∈ U /\ IsPowerSetOf x P) /\
  (forall I : Set, I ∈ U ->
    forall family : Set -> Set,
      (forall i : Set, i ∈ I -> family i ∈ U) ->
        exists image : Set,
          image ∈ U /\
          forall y : Set, y ∈ image <-> exists i : Set, i ∈ I /\ y = family i) /\
  (forall I : Set, I ∈ U ->
    forall family : Set -> Set,
      (forall i : Set, i ∈ I -> family i ∈ U) ->
        exists union : Set,
          union ∈ U /\
          forall x : Set, x ∈ union <-> exists i : Set, i ∈ I /\ x ∈ family i)
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
def IsGrothendieckUniverseFor (A U : Set) : Prop :=
  A ∈ U /\
  (forall x : Set, x ∈ U -> forall y : Set, y ∈ x -> y ∈ U) /\
  (forall x : Set, x ∈ U -> exists P : Set,
    P ∈ U /\ IsPowerSetOf x P) /\
  (forall I : Set, I ∈ U ->
    forall family : Set -> Set,
      (forall i : Set, i ∈ I -> family i ∈ U) ->
        exists image : Set,
          image ∈ U /\
          forall y : Set, y ∈ image <-> exists i : Set, i ∈ I /\ y = family i) /\
  (forall I : Set, I ∈ U ->
    forall family : Set -> Set,
      (forall i : Set, i ∈ I -> family i ∈ U) ->
        exists union : Set,
          union ∈ U /\
          forall x : Set, x ∈ union <-> exists i : Set, i ∈ I /\ x ∈ family i)

end LRA.Set.Constructions.TGSet
