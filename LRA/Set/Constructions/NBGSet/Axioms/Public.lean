import LRA.Set.Constructions.NBGSet.Axioms.Definitions

namespace LRA.Set.Constructions.NBG.Axioms

/--
`SetExtensionality` TODO

Predicate logic:

  ∀ (A B : LRA.Set.Constructions.NBG.Axioms.Set), (∀ (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.mem A x ↔ LRA.Set.Constructions.instMembershipNBGSet.mem B x) → A = B

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A B : Set
  Prove
    (∀ (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.mem A x ↔ LRA.Set.Constructions.instMembershipNBGSet.mem B x) → A = B

Logical form (Lean):

```lean
axiom SetExtensionality
    (A B : Set)
    (sameMembers : ∀ x : Set, x ∈ A ↔ x ∈ B) :
    A = B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
axiom SetExtensionality
    (A B : Set)
    (sameMembers : ∀ x : Set, x ∈ A ↔ x ∈ B) :
    A = B

/--
`ClassExtensionalityTheorem` TODO

Predicate logic:

  ∀ (A B : LRA.Set.Constructions.NBG.Axioms.Class), (∀ (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem A x ↔ LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem B x) → A = B

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A B : Class
  Prove
    (∀ (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem A x ↔ LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem B x) → A = B

Logical form (Lean):

```lean
axiom ClassExtensionalityTheorem
    (A B : Class)
    (sameMembers : ∀ x : Set, x ∈ A ↔ x ∈ B) :
    A = B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
axiom ClassExtensionalityTheorem
    (A B : Class)
    (sameMembers : ∀ x : Set, x ∈ A ↔ x ∈ B) :
    A = B

/--
`ClassOfSetMembership` TODO

Predicate logic:

  ∀ (A x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem (LRA.Set.Constructions.NBG.Axioms.ClassOfSet A) x ↔ LRA.Set.Constructions.instMembershipNBGSet.mem A x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A x : Set
  Prove
    LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem (LRA.Set.Constructions.NBG.Axioms.ClassOfSet A) x ↔ LRA.Set.Constructions.instMembershipNBGSet.mem A x

Logical form (Lean):

```lean
axiom ClassOfSetMembership
    (A x : Set) :
    x ∈ ClassOfSet A ↔ x ∈ A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
axiom ClassOfSetMembership
    (A x : Set) :
    x ∈ ClassOfSet A ↔ x ∈ A

/--
`ClassComprehensionExists` TODO

Predicate logic:

  ∀ (property : LRA.Set.Constructions.NBG.Axioms.Set → Prop), Exists fun C => LRA.Set.Constructions.NBG.Axioms.IsClassComprehension property C

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    property : Set → Prop
  Prove
    Exists fun C => ∀ (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 C x ↔ property x

Logical form (Lean):

```lean
axiom ClassComprehensionExists
    (property : Set → Prop) :
    ∃ C : Class, IsClassComprehension property C
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
axiom ClassComprehensionExists
    (property : Set → Prop) :
    ∃ C : Class, IsClassComprehension property C

/--
`EmptySetExists` TODO

Predicate logic:

  Exists fun A => LRA.Set.Constructions.NBG.Axioms.IsEmptySet A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun A => ∀ (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.1 A x → False

Logical form (Lean):

```lean
axiom EmptySetExists : ∃ A : Set, IsEmptySet A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
axiom EmptySetExists : ∃ A : Set, IsEmptySet A

/--
`TheEmptySet` TODO

Predicate logic:

  noncomputable def TheEmptySet : Set :=
    Classical.choose EmptySetExists

Predicate logic (unfolded):

  noncomputable def TheEmptySet : Set :=
    Classical.choose EmptySetExists (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TheEmptySet : Set :=
  Classical.choose EmptySetExists
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
noncomputable def TheEmptySet : Set :=
  Classical.choose EmptySetExists

/--
`TheEmptySetIsEmpty` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Axioms.IsEmptySet LRA.Set.Constructions.NBG.Axioms.TheEmptySet

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipNBGSet.1 LRA.Set.Constructions.NBG.Axioms.TheEmptySet x → False

Logical form (Lean):

```lean
theorem TheEmptySetIsEmpty : IsEmptySet TheEmptySet
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem TheEmptySetIsEmpty : IsEmptySet TheEmptySet := by
  sorry

/--
`PairSetExists` TODO

Predicate logic:

  ∀ (x y : LRA.Set.Constructions.NBG.Axioms.Set), Exists fun P => LRA.Set.Constructions.NBG.Axioms.IsPairSet x y P

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x y : Set
  Prove
    Exists fun P => ∀ (w : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.1 P w ↔ Or (w = x)(w = y)

Logical form (Lean):

```lean
axiom PairSetExists
    (x y : Set) :
    ∃ P : Set, IsPairSet x y P
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
axiom PairSetExists
    (x y : Set) :
    ∃ P : Set, IsPairSet x y P

/--
`UnionOverExists` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.NBG.Axioms.Set), Exists fun U => LRA.Set.Constructions.NBG.Axioms.IsUnionOf A U

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
  Prove
    Exists fun U => ∀ (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.1 U x ↔ Exists fun B => (LRA.Set.Constructions.instMembershipNBGSet.1 A B ∧ LRA.Set.Constructions.instMembershipNBGSet.1 B x)

Logical form (Lean):

```lean
axiom UnionOverExists
    (A : Set) :
    ∃ U : Set, IsUnionOf A U
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
axiom UnionOverExists
    (A : Set) :
    ∃ U : Set, IsUnionOf A U

/--
`PowerSetOfExists` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.NBG.Axioms.Set), Exists fun P => LRA.Set.Constructions.NBG.Axioms.IsPowerSetOf A P

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
  Prove
    Exists fun P => ∀ (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.1 P x ↔ ∀ (y : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.1 x y → LRA.Set.Constructions.instMembershipNBGSet.1 A y

Logical form (Lean):

```lean
axiom PowerSetOfExists
    (A : Set) :
    ∃ P : Set, IsPowerSetOf A P
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
axiom PowerSetOfExists
    (A : Set) :
    ∃ P : Set, IsPowerSetOf A P

/--
`InductiveSetExists` TODO

Predicate logic:

  Exists fun A => LRA.Set.Constructions.NBG.Axioms.IsInductiveSet A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun A => ((Exists fun empty => (LRA.Set.Constructions.instMembershipNBGSet.1 A empty ∧ (∀ (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.1 empty x → False))) ∧ (∀ (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.1 A x → Exists fun successor => (LRA.Set.Constructions.instMembershipNBGSet.1 A successor ∧ (∀ (w : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.1 successor w ↔ Or (LRA.Set.Constructions.instMembershipNBGSet.1 x w) (w = x)))))

Logical form (Lean):

```lean
axiom InductiveSetExists : ∃ A : Set, IsInductiveSet A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
axiom InductiveSetExists : ∃ A : Set, IsInductiveSet A

/--
`ClassRegularityWitnessExists` TODO

Predicate logic:

  ∀ (X : LRA.Set.Constructions.NBG.Axioms.Class), (Exists fun x => LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem X x) → Exists fun y => (LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem X y ∧ (∀ (z : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.mem y z → ¬ LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem X z))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    X : Class
  Prove
    (Exists fun x => LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 X x) → Exists fun y => (LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 X y ∧ (∀ (z : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.1 y z → LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 X z → False))

Logical form (Lean):

```lean
axiom ClassRegularityWitnessExists
    (X : Class)
    (nonempty : ∃ x : Set, x ∈ X) :
    ∃ y : Set, y ∈ X ∧ ∀ z : Set, z ∈ y → z ∉ X
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
axiom ClassRegularityWitnessExists
    (X : Class)
    (nonempty : ∃ x : Set, x ∈ X) :
    ∃ y : Set, y ∈ X ∧ ∀ z : Set, z ∈ y → z ∉ X

/--
`UniversalClassExists` TODO

Predicate logic:

  Exists fun V => LRA.Set.Constructions.NBG.Axioms.IsUniversalClass V

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun V => ∀ (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 V x

Logical form (Lean):

```lean
axiom UniversalClassExists : ∃ V : Class, IsUniversalClass V
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
axiom UniversalClassExists : ∃ V : Class, IsUniversalClass V

/--
`ElementhoodClassExists` TODO

Predicate logic:

  Exists fun E => LRA.Set.Constructions.NBG.Axioms.IsElementhoodClass E

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun E => ∀ (x y : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 E (LRA.Set.Constructions.NBG.OrderedPair x y) ↔ LRA.Set.Constructions.instMembershipNBGSet.1 y x

Logical form (Lean):

```lean
axiom ElementhoodClassExists : ∃ E : Class, IsElementhoodClass E
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
axiom ElementhoodClassExists : ∃ E : Class, IsElementhoodClass E

/--
`IntersectionClassExists` TODO

Predicate logic:

  ∀ (X Y : LRA.Set.Constructions.NBG.Axioms.Class), Exists fun Z => LRA.Set.Constructions.NBG.Axioms.IsIntersectionClass X Y Z

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    X Y : Class
  Prove
    Exists fun Z => ∀ (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 Z x ↔ (LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 X x ∧ LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 Y x)

Logical form (Lean):

```lean
axiom IntersectionClassExists
    (X Y : Class) :
    ∃ Z : Class, IsIntersectionClass X Y Z
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
axiom IntersectionClassExists
    (X Y : Class) :
    ∃ Z : Class, IsIntersectionClass X Y Z

/--
`ComplementClassExists` TODO

Predicate logic:

  ∀ (X : LRA.Set.Constructions.NBG.Axioms.Class), Exists fun Z => LRA.Set.Constructions.NBG.Axioms.IsComplementClass X Z

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    X : Class
  Prove
    Exists fun Z => ∀ (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 Z x ↔ LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 X x → False

Logical form (Lean):

```lean
axiom ComplementClassExists
    (X : Class) :
    ∃ Z : Class, IsComplementClass X Z
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
axiom ComplementClassExists
    (X : Class) :
    ∃ Z : Class, IsComplementClass X Z

/--
`DomainClassExists` TODO

Predicate logic:

  ∀ (X : LRA.Set.Constructions.NBG.Axioms.Class), Exists fun D => LRA.Set.Constructions.NBG.Axioms.IsDomainClass X D

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    X : Class
  Prove
    Exists fun D => ∀ (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 D x ↔ Exists fun y => LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 X (LRA.Set.Constructions.NBG.OrderedPair x y)

Logical form (Lean):

```lean
axiom DomainClassExists
    (X : Class) :
    ∃ D : Class, IsDomainClass X D
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
axiom DomainClassExists
    (X : Class) :
    ∃ D : Class, IsDomainClass X D

/--
`CartesianExtensionClassExists` TODO

Predicate logic:

  ∀ (X : LRA.Set.Constructions.NBG.Axioms.Class), Exists fun Z => LRA.Set.Constructions.NBG.Axioms.IsCartesianExtensionClass X Z

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    X : Class
  Prove
    Exists fun Z => ∀ (x y : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 Z (LRA.Set.Constructions.NBG.OrderedPair x y) ↔ LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 X x

Logical form (Lean):

```lean
axiom CartesianExtensionClassExists
    (X : Class) :
    ∃ Z : Class, IsCartesianExtensionClass X Z
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
axiom CartesianExtensionClassExists
    (X : Class) :
    ∃ Z : Class, IsCartesianExtensionClass X Z

/--
`PermutationClassExists` TODO

Predicate logic:

  ∀ (X : LRA.Set.Constructions.NBG.Axioms.Class), Exists fun Z => LRA.Set.Constructions.NBG.Axioms.IsPermutationClass X Z

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    X : Class
  Prove
    Exists fun Z => ∀ (x y z : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 Z (LRA.Set.Constructions.NBG.OrderedPair x (LRA.Set.Constructions.NBG.OrderedPair y z)) ↔ LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 X (LRA.Set.Constructions.NBG.OrderedPair y (LRA.Set.Constructions.NBG.OrderedPair z x))

Logical form (Lean):

```lean
axiom PermutationClassExists
    (X : Class) :
    ∃ Z : Class, IsPermutationClass X Z
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
axiom PermutationClassExists
    (X : Class) :
    ∃ Z : Class, IsPermutationClass X Z

/--
`TranspositionClassExists` TODO

Predicate logic:

  ∀ (X : LRA.Set.Constructions.NBG.Axioms.Class), Exists fun Z => LRA.Set.Constructions.NBG.Axioms.IsTranspositionClass X Z

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    X : Class
  Prove
    Exists fun Z => ∀ (x y z : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 Z (LRA.Set.Constructions.NBG.OrderedPair x (LRA.Set.Constructions.NBG.OrderedPair y z)) ↔ LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 X (LRA.Set.Constructions.NBG.OrderedPair x (LRA.Set.Constructions.NBG.OrderedPair z y))

Logical form (Lean):

```lean
axiom TranspositionClassExists
    (X : Class) :
    ∃ Z : Class, IsTranspositionClass X Z
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
axiom TranspositionClassExists
    (X : Class) :
    ∃ Z : Class, IsTranspositionClass X Z

/--
`ReplacementImageExists` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.NBG.Axioms.Set) (relation : LRA.Set.Constructions.NBG.Axioms.Set → LRA.Set.Constructions.NBG.Axioms.Set → Prop), LRA.Set.Constructions.NBG.Axioms.IsFunctionalOn A relation → Exists fun B => LRA.Set.Constructions.NBG.Axioms.IsReplacementImageOf A relation B

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
    relation : Set → Set → Prop
  Prove
    (∀ (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.1 A x → Exists fun y => (relation x y ∧ (∀ (other : LRA.Set.Constructions.NBG.Axioms.Set), relation x other → other = y))) → Exists fun B => ∀ (y : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.1 B y ↔ Exists fun x => (LRA.Set.Constructions.instMembershipNBGSet.1 A x ∧ relation x y)

Logical form (Lean):

```lean
axiom ReplacementImageExists
    (A : Set)
    (relation : Set → Set → Prop)
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
axiom ReplacementImageExists
    (A : Set)
    (relation : Set → Set → Prop)
    (functional : IsFunctionalOn A relation) :
    ∃ B : Set, IsReplacementImageOf A relation B

/--
`FoundationWitnessExists` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.NBG.Axioms.Set), (Exists fun w => LRA.Set.Constructions.instMembershipNBGSet.mem A w) → Exists fun x => LRA.Set.Constructions.NBG.Axioms.IsFoundationWitness A x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
  Prove
    (Exists fun w => LRA.Set.Constructions.instMembershipNBGSet.1 A w) → Exists fun x => (LRA.Set.Constructions.instMembershipNBGSet.1 A x ∧ (∀ (y : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.1 x y → LRA.Set.Constructions.instMembershipNBGSet.1 A y → False))

Logical form (Lean):

```lean
axiom FoundationWitnessExists
    (A : Set)
    (nonempty : ∃ w : Set, w ∈ A) :
    ∃ x : Set, IsFoundationWitness A x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
axiom FoundationWitnessExists
    (A : Set)
    (nonempty : ∃ w : Set, w ∈ A) :
    ∃ x : Set, IsFoundationWitness A x

/--
`GlobalChoiceClassExists` TODO

Predicate logic:

  Exists fun G => LRA.Set.Constructions.NBG.Axioms.IsGlobalChoiceClass G

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun G => ∀ (A : LRA.Set.Constructions.NBG.Axioms.Set), (Exists fun x => LRA.Set.Constructions.instMembershipNBGSet.1 A x) → Exists fun y => (LRA.Set.Constructions.instMembershipNBGSet.1 A y ∧ (LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 G (LRA.Set.Constructions.NBG.OrderedPair A y) ∧ (∀ (other : LRA.Set.Constructions.NBG.Axioms.Set), (LRA.Set.Constructions.instMembershipNBGSet.1 A other ∧ LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 G (LRA.Set.Constructions.NBG.OrderedPair A other)) → other = y)))

Logical form (Lean):

```lean
axiom GlobalChoiceClassExists : ∃ G : Class, IsGlobalChoiceClass G
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
axiom GlobalChoiceClassExists : ∃ G : Class, IsGlobalChoiceClass G

/--
`ClassOfSetIsSetClass` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.NBG.Axioms.IsSetClass A (LRA.Set.Constructions.NBG.Axioms.ClassOfSet A)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
  Prove
    LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 (LRA.Set.Constructions.NBG.ClassOfSet A) x ↔ LRA.Set.Constructions.instMembershipNBGSet.1 A x

Logical form (Lean):

```lean
theorem ClassOfSetIsSetClass (A : Set) : IsSetClass A (ClassOfSet A)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem ClassOfSetIsSetClass (A : Set) : IsSetClass A (ClassOfSet A) := by
  sorry

end LRA.Set.Constructions.NBG.Axioms
