import LRA.Set.ZFCSet.Primitives
import LRA.Identity.Constructions.Leibniz.Definitions.ExistenceAndUniqueness

namespace LRA.Set.ZFC

/--
`Set` TODO

Predicate logic:

  abbrev Set := LRA.Set.ZFCSet

Predicate logic (unfolded):

  abbrev Set := LRA.Set.ZFCSet (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Set := LRA.Set.ZFCSet
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
abbrev Set := LRA.Set.ZFCSet

/--
`ExistsAndUnique` TODO

Predicate logic:

  ∀ (property : LRA.Set.ZFC.Set → Prop), (Exists fun witness => property witness ∧ LRA.Identity.Unique property)

Predicate logic (unfolded):

  ∀ (property : LRA.Set.ZFC.Set → Prop), (Exists fun witness => property witness ∧ ∀ (left right : LRA.Set.ZFC.Set), property left → property right → left = right)

Logical form (Lean):

```lean
abbrev ExistsAndUnique (property : Set → Prop) : Prop :=
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
abbrev ExistsAndUnique (property : Set → Prop) : Prop :=
  LRA.Identity.ExistsAndUnique property

/--
`IsEmptySet` TODO

Predicate logic:

  ∀ (A x : LRA.Set.ZFC.Set), ¬ LRA.Set.instMembershipZFCSet.mem A x

Predicate logic (unfolded):

  ∀ (A x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 A x → False

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

  ∀ (x1 x2 P w : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.mem P w ↔ Or (w = x1)(w = x2)

Predicate logic (unfolded):

  ∀ (x1 x2 P w : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 P w ↔ Or (w = x1)(w = x2)

Logical form (Lean):

```lean
def IsPairSet (x1 x2 P : Set) : Prop :=
  ∀ w : Set, w ∈ P ↔ w = x1 ∨ w = x2
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
  ∀ w : Set, w ∈ P ↔ w = x1 ∨ w = x2

/--
`IsSingletonSet` TODO

Predicate logic:

  ∀ (x S w : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.mem S w ↔ w = x

Predicate logic (unfolded):

  ∀ (x S w : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 S w ↔ w = x

Logical form (Lean):

```lean
def IsSingletonSet (x S : Set) : Prop :=
  ∀ w : Set, w ∈ S ↔ w = x
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
  ∀ w : Set, w ∈ S ↔ w = x

/--
`IsUnionOf` TODO

Predicate logic:

  ∀ (A U x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.mem U x ↔ Exists fun B => (LRA.Set.instMembershipZFCSet.mem A B ∧ LRA.Set.instMembershipZFCSet.mem B x)

Predicate logic (unfolded):

  ∀ (A U x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 U x ↔ Exists fun B => (LRA.Set.instMembershipZFCSet.1 A B ∧ LRA.Set.instMembershipZFCSet.1 B x)

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

  ∀ (A P x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.mem P x ↔ ∀ (y : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.mem x y → LRA.Set.instMembershipZFCSet.mem A y

Predicate logic (unfolded):

  ∀ (A P x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 P x ↔ ∀ (y : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 x y → LRA.Set.instMembershipZFCSet.1 A y

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
`IsSeparatedSubset` TODO

Predicate logic:

  ∀ (A : LRA.Set.ZFC.Set) (property : LRA.Set.ZFC.Set → Prop) (B x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.mem B x ↔ (LRA.Set.instMembershipZFCSet.mem A x ∧ property x)

Predicate logic (unfolded):

  ∀ (A : LRA.Set.ZFC.Set) (property : LRA.Set.ZFC.Set → Prop) (B x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 B x ↔ (LRA.Set.instMembershipZFCSet.1 A x ∧ property x)

Logical form (Lean):

```lean
def IsSeparatedSubset (A : Set) (property : Set → Prop) (B : Set) : Prop :=
  ∀ x : Set, x ∈ B ↔ x ∈ A ∧ property x
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
def IsSeparatedSubset (A : Set) (property : Set → Prop) (B : Set) : Prop :=
  ∀ x : Set, x ∈ B ↔ x ∈ A ∧ property x

/--
`IsRelativeComplementOf` TODO

Predicate logic:

  ∀ (A B D x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.mem D x ↔ (LRA.Set.instMembershipZFCSet.mem A x ∧ ¬ LRA.Set.instMembershipZFCSet.mem B x)

Predicate logic (unfolded):

  ∀ (A B D x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 D x ↔ (LRA.Set.instMembershipZFCSet.1 A x ∧ LRA.Set.instMembershipZFCSet.1 B x → False)

Logical form (Lean):

```lean
def IsRelativeComplementOf (A B D : Set) : Prop :=
  ∀ x : Set, x ∈ D ↔ x ∈ A ∧ x ∉ B
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
  ∀ x : Set, x ∈ D ↔ x ∈ A ∧ x ∉ B

/--
`IsIntersectionOf` TODO

Predicate logic:

  ∀ (A B D x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.mem D x ↔ (LRA.Set.instMembershipZFCSet.mem A x ∧ LRA.Set.instMembershipZFCSet.mem B x)

Predicate logic (unfolded):

  ∀ (A B D x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 D x ↔ (LRA.Set.instMembershipZFCSet.1 A x ∧ LRA.Set.instMembershipZFCSet.1 B x)

Logical form (Lean):

```lean
def IsIntersectionOf (A B D : Set) : Prop :=
  ∀ x : Set, x ∈ D ↔ x ∈ A ∧ x ∈ B
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
  ∀ x : Set, x ∈ D ↔ x ∈ A ∧ x ∈ B

/--
`IsSymmetricDifferenceOf` TODO

Predicate logic:

  ∀ (A B D x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.mem D x ↔ Or ((LRA.Set.instMembershipZFCSet.mem A x ∧ ¬ LRA.Set.instMembershipZFCSet.mem B x)) ((LRA.Set.instMembershipZFCSet.mem B x ∧ ¬ LRA.Set.instMembershipZFCSet.mem A x))

Predicate logic (unfolded):

  ∀ (A B D x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 D x ↔ Or ((LRA.Set.instMembershipZFCSet.1 A x ∧ LRA.Set.instMembershipZFCSet.1 B x → False)) ((LRA.Set.instMembershipZFCSet.1 B x ∧ LRA.Set.instMembershipZFCSet.1 A x → False))

Logical form (Lean):

```lean
def IsSymmetricDifferenceOf (A B D : Set) : Prop :=
  ∀ x : Set, x ∈ D ↔ (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A)
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
  ∀ x : Set, x ∈ D ↔ (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A)

/--
`Subset` TODO

Predicate logic:

  ∀ (A B x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.mem A x → LRA.Set.instMembershipZFCSet.mem B x

Predicate logic (unfolded):

  ∀ (A B x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 A x → LRA.Set.instMembershipZFCSet.1 B x

Logical form (Lean):

```lean
def Subset (A B : Set) : Prop :=
  ∀ x : Set, x ∈ A → x ∈ B
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
def Subset (A B : Set) : Prop :=
  ∀ x : Set, x ∈ A → x ∈ B

/--
`IsFunctionalOn` TODO

Predicate logic:

  ∀ (A : LRA.Set.ZFC.Set) (relation : LRA.Set.ZFC.Set → LRA.Set.ZFC.Set → Prop) (x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.mem A x → Exists fun y => (relation x y ∧ ∀ (other : LRA.Set.ZFC.Set), relation x other → other = y)

Predicate logic (unfolded):

  ∀ (A : LRA.Set.ZFC.Set) (relation : LRA.Set.ZFC.Set → LRA.Set.ZFC.Set → Prop) (x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 A x → Exists fun y => (relation x y ∧ ∀ (other : LRA.Set.ZFC.Set), relation x other → other = y)

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

  ∀ (A : LRA.Set.ZFC.Set) (relation : LRA.Set.ZFC.Set → LRA.Set.ZFC.Set → Prop) (B y : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.mem B y ↔ Exists fun x => (LRA.Set.instMembershipZFCSet.mem A x ∧ relation x y)

Predicate logic (unfolded):

  ∀ (A : LRA.Set.ZFC.Set) (relation : LRA.Set.ZFC.Set → LRA.Set.ZFC.Set → Prop) (B y : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 B y ↔ Exists fun x => (LRA.Set.instMembershipZFCSet.1 A x ∧ relation x y)

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

/--
`IsSuccessorOf` TODO

Predicate logic:

  ∀ (x successor w : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.mem successor w ↔ Or (LRA.Set.instMembershipZFCSet.mem x w) (w = x)

Predicate logic (unfolded):

  ∀ (x successor w : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 successor w ↔ Or (LRA.Set.instMembershipZFCSet.1 x w) (w = x)

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

  ∀ (A : LRA.Set.ZFC.Set), (Exists fun empty => (LRA.Set.instMembershipZFCSet.mem A empty ∧ LRA.Set.ZFC.IsEmptySet empty) ∧ ∀ (x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.mem A x → Exists fun successor => (LRA.Set.instMembershipZFCSet.mem A successor ∧ LRA.Set.ZFC.IsSuccessorOf x successor))

Predicate logic (unfolded):

  ∀ (A : LRA.Set.ZFC.Set), (Exists fun empty => (LRA.Set.instMembershipZFCSet.1 A empty ∧ ∀ (x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 empty x → False) ∧ ∀ (x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 A x → Exists fun successor => (LRA.Set.instMembershipZFCSet.1 A successor ∧ ∀ (w : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 successor w ↔ Or (LRA.Set.instMembershipZFCSet.1 x w) (w = x)))

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

  ∀ (A x : LRA.Set.ZFC.Set), (LRA.Set.instMembershipZFCSet.mem A x ∧ ∀ (y : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.mem x y → ¬ LRA.Set.instMembershipZFCSet.mem A y)

Predicate logic (unfolded):

  ∀ (A x : LRA.Set.ZFC.Set), (LRA.Set.instMembershipZFCSet.1 A x ∧ ∀ (y : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 x y → LRA.Set.instMembershipZFCSet.1 A y → False)

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
`IsChoiceSetFor` TODO

Predicate logic:

  ∀ (A choiceSet B : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.mem A B → Exists fun x => ((LRA.Set.instMembershipZFCSet.mem B x ∧ LRA.Set.instMembershipZFCSet.mem choiceSet x) ∧ ∀ (other : LRA.Set.ZFC.Set), (LRA.Set.instMembershipZFCSet.mem B other ∧ LRA.Set.instMembershipZFCSet.mem choiceSet other) → other = x)

Predicate logic (unfolded):

  ∀ (A choiceSet B : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 A B → Exists fun x => ((LRA.Set.instMembershipZFCSet.1 B x ∧ LRA.Set.instMembershipZFCSet.1 choiceSet x) ∧ ∀ (other : LRA.Set.ZFC.Set), (LRA.Set.instMembershipZFCSet.1 B other ∧ LRA.Set.instMembershipZFCSet.1 choiceSet other) → other = x)

Logical form (Lean):

```lean
def IsChoiceSetFor (A choiceSet : Set) : Prop :=
  ∀ B : Set, B ∈ A →
    ∃ x : Set,
      (x ∈ B ∧ x ∈ choiceSet) ∧
      ∀ other : Set, (other ∈ B ∧ other ∈ choiceSet) → other = x
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
  ∀ B : Set, B ∈ A →
    ∃ x : Set,
      (x ∈ B ∧ x ∈ choiceSet) ∧
      ∀ other : Set, (other ∈ B ∧ other ∈ choiceSet) → other = x

end LRA.Set.ZFC
