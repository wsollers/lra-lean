import LRA.Set.Constructions.NBGSet.Axioms

namespace LRA.Set.Constructions.NBG.Interface.ModelTheory

open LRA.Set.Constructions.NBG.Axioms

/--
`SetObject` TODO

Predicate logic:

  Type

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Type

Logical form (Lean):

```lean
axiom NBGSet : Type
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
abbrev SetObject := LRA.Set.Constructions.NBGSet

/--
`ClassObject` TODO

Predicate logic:

  Type

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Type

Logical form (Lean):

```lean
axiom NBGClass : Type
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
abbrev ClassObject := LRA.Set.Constructions.NBGClass

/--
`FiniteNBGAxiomName` TODO

Predicate logic:

  inductive FiniteNBGAxiomName where
    | classExtensionality
    | classRegularity
    | pairing
    | union
    | powerSet
    | infinity
    | universalClass
    | elementhoodClass
    | intersectionClass
    | complementClass
    | domainClass
    | cartesianExtensionClass
    | permutationClass
    | transpositionClass
    | replacement
    | globalChoice
    deriving DecidableEq

Predicate logic (unfolded):

  inductive FiniteNBGAxiomName where
    | classExtensionality
    | classRegularity
    | pairing
    | union
    | powerSet
    | infinity
    | universalClass
    | elementhoodClass
    | intersectionClass
    | complementClass
    | domainClass
    | cartesianExtensionClass
    | permutationClass
    | transpositionClass
    | replacement
    | globalChoice
    deriving DecidableEq (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive FiniteNBGAxiomName where
  | classExtensionality
  | classRegularity
  | pairing
  | union
  | powerSet
  | infinity
  | universalClass
  | elementhoodClass
  | intersectionClass
  | complementClass
  | domainClass
  | cartesianExtensionClass
  | permutationClass
  | transpositionClass
  | replacement
  | globalChoice
  deriving DecidableEq
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
inductive FiniteNBGAxiomName where
  | classExtensionality
  | classRegularity
  | pairing
  | union
  | powerSet
  | infinity
  | universalClass
  | elementhoodClass
  | intersectionClass
  | complementClass
  | domainClass
  | cartesianExtensionClass
  | permutationClass
  | transpositionClass
  | replacement
  | globalChoice
  deriving DecidableEq

/--
`SupportsSingleSortedPresentation` TODO

Predicate logic:

  ∀ (A x : LRA.Set.Constructions.NBG.Interface.ModelTheory.SetObject), LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem (LRA.Set.Constructions.NBG.ClassOfSet A) x ↔ LRA.Set.Constructions.instMembershipNBGSet.mem A x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem (LRA.Set.Constructions.NBG.ClassOfSet A) x ↔ LRA.Set.Constructions.instMembershipNBGSet.mem A x

Logical form (Lean):

```lean
def SupportsSingleSortedPresentation : Prop :=
  ∀ A x : SetObject, x ∈ LRA.Set.Constructions.NBG.ClassOfSet A ↔ x ∈ A
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
def SupportsSingleSortedPresentation : Prop :=
  ∀ A x : SetObject, x ∈ LRA.Set.Constructions.NBG.ClassOfSet A ↔ x ∈ A

/--
`SupportsTwoSortedPresentation` TODO

Predicate logic:

  structure SupportsTwoSortedPresentation : Prop where
    classOfSetMembership :
      ∀ A x : SetObject, x ∈ LRA.Set.Constructions.NBG.ClassOfSet A ↔ x ∈ A

Predicate logic (unfolded):

  structure SupportsTwoSortedPresentation : Prop where
    classOfSetMembership :
      ∀ A x : SetObject, x ∈ LRA.Set.Constructions.NBG.ClassOfSet A ↔ x ∈ A (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure SupportsTwoSortedPresentation : Prop where
  classOfSetMembership :
    ∀ A x : SetObject, x ∈ LRA.Set.Constructions.NBG.ClassOfSet A ↔ x ∈ A
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
structure SupportsTwoSortedPresentation : Prop where
  classOfSetMembership :
    ∀ A x : SetObject, x ∈ LRA.Set.Constructions.NBG.ClassOfSet A ↔ x ∈ A

/--
`SupportsClassExtensionality` TODO

Predicate logic:

  ∀ (X Y : LRA.Set.Constructions.NBG.Interface.ModelTheory.ClassObject), (∀ (x : LRA.Set.Constructions.NBG.Interface.ModelTheory.SetObject), LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem X x ↔ LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem Y x) → X = Y

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (x : LRA.Set.Constructions.NBG.Interface.ModelTheory.SetObject), LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem X x ↔ LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem Y x) → X = Y

Logical form (Lean):

```lean
def SupportsClassExtensionality : Prop :=
  ∀ X Y : ClassObject,
    (∀ x : SetObject, x ∈ X ↔ x ∈ Y) →
      X = Y
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
def SupportsClassExtensionality : Prop :=
  ∀ X Y : ClassObject,
    (∀ x : SetObject, x ∈ X ↔ x ∈ Y) →
      X = Y

/--
`SupportsClassRegularity` TODO

Predicate logic:

  ∀ (X : LRA.Set.Constructions.NBG.Interface.ModelTheory.ClassObject), (Exists fun x => LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem X x) → Exists fun y => (LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem X y ∧ (∀ (z : LRA.Set.Constructions.NBG.Interface.ModelTheory.SetObject), LRA.Set.Constructions.instMembershipNBGSet.mem y z → ¬ LRA.Set.Constructions.instMembershipNBGSetNBGClass.mem X z))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Exists fun x => LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 X x) → Exists fun y => (LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 X y ∧ (∀ (z : LRA.Set.Constructions.NBG.Interface.ModelTheory.SetObject), LRA.Set.Constructions.instMembershipNBGSet.1 y z → LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 X z → False))

Logical form (Lean):

```lean
def SupportsClassRegularity : Prop :=
  ∀ X : ClassObject,
    (∃ x : SetObject, x ∈ X) →
      ∃ y : SetObject, y ∈ X ∧ ∀ z : SetObject, z ∈ y → z ∉ X
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
def SupportsClassRegularity : Prop :=
  ∀ X : ClassObject,
    (∃ x : SetObject, x ∈ X) →
      ∃ y : SetObject, y ∈ X ∧ ∀ z : SetObject, z ∈ y → z ∉ X

/--
`SupportsPairing` TODO

Predicate logic:

  ∀ (x y : LRA.Set.Constructions.NBG.Interface.ModelTheory.SetObject), Exists fun P => LRA.Set.Constructions.NBG.Axioms.IsPairSet x y P

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun P => ∀ (w : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.1 P w ↔ Or (w = x)(w = y)

Logical form (Lean):

```lean
def SupportsPairing : Prop :=
  ∀ x y : SetObject,
    ∃ P : SetObject, IsPairSet x y P
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def SupportsPairing : Prop :=
  ∀ x y : SetObject,
    ∃ P : SetObject, IsPairSet x y P

/--
`SupportsUnion` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.NBG.Interface.ModelTheory.SetObject), Exists fun U => LRA.Set.Constructions.NBG.Axioms.IsUnionOf A U

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun U => ∀ (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.1 U x ↔ Exists fun B => (LRA.Set.Constructions.instMembershipNBGSet.1 A B ∧ LRA.Set.Constructions.instMembershipNBGSet.1 B x)

Logical form (Lean):

```lean
def SupportsUnion : Prop :=
  ∀ A : SetObject,
    ∃ U : SetObject, IsUnionOf A U
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def SupportsUnion : Prop :=
  ∀ A : SetObject,
    ∃ U : SetObject, IsUnionOf A U

/--
`SupportsPowerSet` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.NBG.Interface.ModelTheory.SetObject), Exists fun P => LRA.Set.Constructions.NBG.Axioms.IsPowerSetOf A P

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun P => ∀ (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.1 P x ↔ ∀ (y : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.1 x y → LRA.Set.Constructions.instMembershipNBGSet.1 A y

Logical form (Lean):

```lean
def SupportsPowerSet : Prop :=
  ∀ A : SetObject,
    ∃ P : SetObject, IsPowerSetOf A P
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def SupportsPowerSet : Prop :=
  ∀ A : SetObject,
    ∃ P : SetObject, IsPowerSetOf A P

/--
`SupportsInfinity` TODO

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
def SupportsInfinity : Prop :=
  ∃ A : SetObject, IsInductiveSet A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
def SupportsInfinity : Prop :=
  ∃ A : SetObject, IsInductiveSet A

/--
`SupportsUniversalClass` TODO

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
def SupportsUniversalClass : Prop :=
  ∃ V : ClassObject, IsUniversalClass V
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
def SupportsUniversalClass : Prop :=
  ∃ V : ClassObject, IsUniversalClass V

/--
`SupportsElementhoodClass` TODO

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
def SupportsElementhoodClass : Prop :=
  ∃ E : ClassObject, IsElementhoodClass E
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
def SupportsElementhoodClass : Prop :=
  ∃ E : ClassObject, IsElementhoodClass E

/--
`SupportsIntersectionClass` TODO

Predicate logic:

  ∀ (X Y : LRA.Set.Constructions.NBG.Interface.ModelTheory.ClassObject), Exists fun Z => LRA.Set.Constructions.NBG.Axioms.IsIntersectionClass X Y Z

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun Z => ∀ (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 Z x ↔ (LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 X x ∧ LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 Y x)

Logical form (Lean):

```lean
def SupportsIntersectionClass : Prop :=
  ∀ X Y : ClassObject,
    ∃ Z : ClassObject, IsIntersectionClass X Y Z
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def SupportsIntersectionClass : Prop :=
  ∀ X Y : ClassObject,
    ∃ Z : ClassObject, IsIntersectionClass X Y Z

/--
`SupportsComplementClass` TODO

Predicate logic:

  ∀ (X : LRA.Set.Constructions.NBG.Interface.ModelTheory.ClassObject), Exists fun Z => LRA.Set.Constructions.NBG.Axioms.IsComplementClass X Z

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun Z => ∀ (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 Z x ↔ LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 X x → False

Logical form (Lean):

```lean
def SupportsComplementClass : Prop :=
  ∀ X : ClassObject,
    ∃ Z : ClassObject, IsComplementClass X Z
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def SupportsComplementClass : Prop :=
  ∀ X : ClassObject,
    ∃ Z : ClassObject, IsComplementClass X Z

/--
`SupportsDomainClass` TODO

Predicate logic:

  ∀ (X : LRA.Set.Constructions.NBG.Interface.ModelTheory.ClassObject), Exists fun D => LRA.Set.Constructions.NBG.Axioms.IsDomainClass X D

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun D => ∀ (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 D x ↔ Exists fun y => LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 X (LRA.Set.Constructions.NBG.OrderedPair x y)

Logical form (Lean):

```lean
def SupportsDomainClass : Prop :=
  ∀ X : ClassObject,
    ∃ D : ClassObject, IsDomainClass X D
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def SupportsDomainClass : Prop :=
  ∀ X : ClassObject,
    ∃ D : ClassObject, IsDomainClass X D

/--
`SupportsCartesianExtensionClass` TODO

Predicate logic:

  ∀ (X : LRA.Set.Constructions.NBG.Interface.ModelTheory.ClassObject), Exists fun Z => LRA.Set.Constructions.NBG.Axioms.IsCartesianExtensionClass X Z

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun Z => ∀ (x y : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 Z (LRA.Set.Constructions.NBG.OrderedPair x y) ↔ LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 X x

Logical form (Lean):

```lean
def SupportsCartesianExtensionClass : Prop :=
  ∀ X : ClassObject,
    ∃ Z : ClassObject, IsCartesianExtensionClass X Z
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def SupportsCartesianExtensionClass : Prop :=
  ∀ X : ClassObject,
    ∃ Z : ClassObject, IsCartesianExtensionClass X Z

/--
`SupportsPermutationClass` TODO

Predicate logic:

  ∀ (X : LRA.Set.Constructions.NBG.Interface.ModelTheory.ClassObject), Exists fun Z => LRA.Set.Constructions.NBG.Axioms.IsPermutationClass X Z

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun Z => ∀ (x y z : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 Z (LRA.Set.Constructions.NBG.OrderedPair x (LRA.Set.Constructions.NBG.OrderedPair y z)) ↔ LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 X (LRA.Set.Constructions.NBG.OrderedPair y (LRA.Set.Constructions.NBG.OrderedPair z x))

Logical form (Lean):

```lean
def SupportsPermutationClass : Prop :=
  ∀ X : ClassObject,
    ∃ Z : ClassObject, IsPermutationClass X Z
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def SupportsPermutationClass : Prop :=
  ∀ X : ClassObject,
    ∃ Z : ClassObject, IsPermutationClass X Z

/--
`SupportsTranspositionClass` TODO

Predicate logic:

  ∀ (X : LRA.Set.Constructions.NBG.Interface.ModelTheory.ClassObject), Exists fun Z => LRA.Set.Constructions.NBG.Axioms.IsTranspositionClass X Z

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun Z => ∀ (x y z : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 Z (LRA.Set.Constructions.NBG.OrderedPair x (LRA.Set.Constructions.NBG.OrderedPair y z)) ↔ LRA.Set.Constructions.instMembershipNBGSetNBGClass.1 X (LRA.Set.Constructions.NBG.OrderedPair x (LRA.Set.Constructions.NBG.OrderedPair z y))

Logical form (Lean):

```lean
def SupportsTranspositionClass : Prop :=
  ∀ X : ClassObject,
    ∃ Z : ClassObject, IsTranspositionClass X Z
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def SupportsTranspositionClass : Prop :=
  ∀ X : ClassObject,
    ∃ Z : ClassObject, IsTranspositionClass X Z

/--
`SupportsReplacement` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.NBG.Interface.ModelTheory.SetObject) (relation : LRA.Set.Constructions.NBG.Interface.ModelTheory.SetObject → LRA.Set.Constructions.NBG.Interface.ModelTheory.SetObject → Prop), LRA.Set.Constructions.NBG.Axioms.IsFunctionalOn A relation → Exists fun B => LRA.Set.Constructions.NBG.Axioms.IsReplacementImageOf A relation B

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (x : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.1 A x → Exists fun y => (relation x y ∧ (∀ (other : LRA.Set.Constructions.NBG.Axioms.Set), relation x other → other = y))) → Exists fun B => ∀ (y : LRA.Set.Constructions.NBG.Axioms.Set), LRA.Set.Constructions.instMembershipNBGSet.1 B y ↔ Exists fun x => (LRA.Set.Constructions.instMembershipNBGSet.1 A x ∧ relation x y)

Logical form (Lean):

```lean
def SupportsReplacement : Prop :=
  ∀ (A : SetObject) (relation : SetObject → SetObject → Prop),
    IsFunctionalOn A relation →
      ∃ B : SetObject, IsReplacementImageOf A relation B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def SupportsReplacement : Prop :=
  ∀ (A : SetObject) (relation : SetObject → SetObject → Prop),
    IsFunctionalOn A relation →
      ∃ B : SetObject, IsReplacementImageOf A relation B

/--
`SupportsGlobalChoice` TODO

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
def SupportsGlobalChoice : Prop :=
  ∃ G : ClassObject, IsGlobalChoiceClass G
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
def SupportsGlobalChoice : Prop :=
  ∃ G : ClassObject, IsGlobalChoiceClass G

/--
`FiniteNBGAxiomHolds` TODO

Predicate logic:

  ∀ (a : LRA.Set.Constructions.NBG.Interface.ModelTheory.FiniteNBGAxiomName), LRA.Set.Constructions.NBG.Interface.ModelTheory.FiniteNBGAxiomName.rec ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsClassExtensionality) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsClassRegularity) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsPairing) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsUnion) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsPowerSet) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsInfinity) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsUniversalClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsElementhoodClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsIntersectionClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsComplementClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsDomainClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsCartesianExtensionClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsPermutationClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsTranspositionClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsReplacement) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsGlobalChoice) Unit.unit) a

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.FiniteNBGAxiomName.rec ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsClassExtensionality) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsClassRegularity) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsPairing) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsUnion) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsPowerSet) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsInfinity) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsUniversalClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsElementhoodClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsIntersectionClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsComplementClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsDomainClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsCartesianExtensionClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsPermutationClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsTranspositionClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsReplacement) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsGlobalChoice) Unit.unit) a

Logical form (Lean):

```lean
def FiniteNBGAxiomHolds : FiniteNBGAxiomName → Prop
  | .classExtensionality => SupportsClassExtensionality
  | .classRegularity => SupportsClassRegularity
  | .pairing => SupportsPairing
  | .union => SupportsUnion
  | .powerSet => SupportsPowerSet
  | .infinity => SupportsInfinity
  | .universalClass => SupportsUniversalClass
  | .elementhoodClass => SupportsElementhoodClass
  | .intersectionClass => SupportsIntersectionClass
  | .complementClass => SupportsComplementClass
  | .domainClass => SupportsDomainClass
  | .cartesianExtensionClass => SupportsCartesianExtensionClass
  | .permutationClass => SupportsPermutationClass
  | .transpositionClass => SupportsTranspositionClass
  | .replacement => SupportsReplacement
  | .globalChoice => SupportsGlobalChoice
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
def FiniteNBGAxiomHolds : FiniteNBGAxiomName → Prop
  | .classExtensionality => SupportsClassExtensionality
  | .classRegularity => SupportsClassRegularity
  | .pairing => SupportsPairing
  | .union => SupportsUnion
  | .powerSet => SupportsPowerSet
  | .infinity => SupportsInfinity
  | .universalClass => SupportsUniversalClass
  | .elementhoodClass => SupportsElementhoodClass
  | .intersectionClass => SupportsIntersectionClass
  | .complementClass => SupportsComplementClass
  | .domainClass => SupportsDomainClass
  | .cartesianExtensionClass => SupportsCartesianExtensionClass
  | .permutationClass => SupportsPermutationClass
  | .transpositionClass => SupportsTranspositionClass
  | .replacement => SupportsReplacement
  | .globalChoice => SupportsGlobalChoice

/--
`SatisfiesFiniteNBGAxiomatization` TODO

Predicate logic:

  ∀ (axiomName : LRA.Set.Constructions.NBG.Interface.ModelTheory.FiniteNBGAxiomName), LRA.Set.Constructions.NBG.Interface.ModelTheory.FiniteNBGAxiomHolds axiomName

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.FiniteNBGAxiomName.rec ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsClassExtensionality) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsClassRegularity) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsPairing) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsUnion) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsPowerSet) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsInfinity) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsUniversalClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsElementhoodClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsIntersectionClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsComplementClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsDomainClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsCartesianExtensionClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsPermutationClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsTranspositionClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsReplacement) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsGlobalChoice) Unit.unit) axiomName

Logical form (Lean):

```lean
def SatisfiesFiniteNBGAxiomatization : Prop :=
  ∀ axiomName : FiniteNBGAxiomName, FiniteNBGAxiomHolds axiomName
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
def SatisfiesFiniteNBGAxiomatization : Prop :=
  ∀ axiomName : FiniteNBGAxiomName, FiniteNBGAxiomHolds axiomName

/--
`SatisfiesNBG` TODO

Predicate logic:

  (LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsSingleSortedPresentation ∧ (LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsTwoSortedPresentation ∧ LRA.Set.Constructions.NBG.Interface.ModelTheory.SatisfiesFiniteNBGAxiomatization))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsSingleSortedPresentation ∧ (LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsTwoSortedPresentation ∧ LRA.Set.Constructions.NBG.Interface.ModelTheory.SatisfiesFiniteNBGAxiomatization))

Logical form (Lean):

```lean
def SatisfiesNBG : Prop :=
  SupportsSingleSortedPresentation ∧
  SupportsTwoSortedPresentation ∧
  SatisfiesFiniteNBGAxiomatization
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def SatisfiesNBG : Prop :=
  SupportsSingleSortedPresentation ∧
  SupportsTwoSortedPresentation ∧
  SatisfiesFiniteNBGAxiomatization

/--
`nbgSupportsSingleSortedPresentation` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsSingleSortedPresentation

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsSingleSortedPresentation

Logical form (Lean):

```lean
theorem nbgSupportsSingleSortedPresentation : SupportsSingleSortedPresentation
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
theorem nbgSupportsSingleSortedPresentation : SupportsSingleSortedPresentation := by
  sorry

/--
`nbgSupportsTwoSortedPresentation` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsTwoSortedPresentation

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsTwoSortedPresentation

Logical form (Lean):

```lean
theorem nbgSupportsTwoSortedPresentation : SupportsTwoSortedPresentation
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
theorem nbgSupportsTwoSortedPresentation : SupportsTwoSortedPresentation := by
  sorry

/--
`nbgSupportsClassExtensionality` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsClassExtensionality

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsClassExtensionality

Logical form (Lean):

```lean
theorem nbgSupportsClassExtensionality : SupportsClassExtensionality
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
theorem nbgSupportsClassExtensionality : SupportsClassExtensionality := by
  sorry

/--
`nbgSupportsClassRegularity` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsClassRegularity

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsClassRegularity

Logical form (Lean):

```lean
theorem nbgSupportsClassRegularity : SupportsClassRegularity
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
theorem nbgSupportsClassRegularity : SupportsClassRegularity := by
  sorry

/--
`nbgSupportsPairing` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsPairing

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsPairing

Logical form (Lean):

```lean
theorem nbgSupportsPairing : SupportsPairing
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
theorem nbgSupportsPairing : SupportsPairing := by
  sorry

/--
`nbgSupportsUnion` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsUnion

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsUnion

Logical form (Lean):

```lean
theorem nbgSupportsUnion : SupportsUnion
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
theorem nbgSupportsUnion : SupportsUnion := by
  sorry

/--
`nbgSupportsPowerSet` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsPowerSet

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsPowerSet

Logical form (Lean):

```lean
theorem nbgSupportsPowerSet : SupportsPowerSet
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
theorem nbgSupportsPowerSet : SupportsPowerSet := by
  sorry

/--
`nbgSupportsInfinity` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsInfinity

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsInfinity

Logical form (Lean):

```lean
theorem nbgSupportsInfinity : SupportsInfinity
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
theorem nbgSupportsInfinity : SupportsInfinity := by
  sorry

/--
`nbgSupportsUniversalClass` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsUniversalClass

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsUniversalClass

Logical form (Lean):

```lean
theorem nbgSupportsUniversalClass : SupportsUniversalClass
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
theorem nbgSupportsUniversalClass : SupportsUniversalClass := by
  sorry

/--
`nbgSupportsElementhoodClass` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsElementhoodClass

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsElementhoodClass

Logical form (Lean):

```lean
theorem nbgSupportsElementhoodClass : SupportsElementhoodClass
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
theorem nbgSupportsElementhoodClass : SupportsElementhoodClass := by
  sorry

/--
`nbgSupportsIntersectionClass` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsIntersectionClass

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsIntersectionClass

Logical form (Lean):

```lean
theorem nbgSupportsIntersectionClass : SupportsIntersectionClass
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
theorem nbgSupportsIntersectionClass : SupportsIntersectionClass := by
  sorry

/--
`nbgSupportsComplementClass` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsComplementClass

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsComplementClass

Logical form (Lean):

```lean
theorem nbgSupportsComplementClass : SupportsComplementClass
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
theorem nbgSupportsComplementClass : SupportsComplementClass := by
  sorry

/--
`nbgSupportsDomainClass` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsDomainClass

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsDomainClass

Logical form (Lean):

```lean
theorem nbgSupportsDomainClass : SupportsDomainClass
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
theorem nbgSupportsDomainClass : SupportsDomainClass := by
  sorry

/--
`nbgSupportsCartesianExtensionClass` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsCartesianExtensionClass

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsCartesianExtensionClass

Logical form (Lean):

```lean
theorem nbgSupportsCartesianExtensionClass : SupportsCartesianExtensionClass
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
theorem nbgSupportsCartesianExtensionClass : SupportsCartesianExtensionClass := by
  sorry

/--
`nbgSupportsPermutationClass` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsPermutationClass

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsPermutationClass

Logical form (Lean):

```lean
theorem nbgSupportsPermutationClass : SupportsPermutationClass
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
theorem nbgSupportsPermutationClass : SupportsPermutationClass := by
  sorry

/--
`nbgSupportsTranspositionClass` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsTranspositionClass

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsTranspositionClass

Logical form (Lean):

```lean
theorem nbgSupportsTranspositionClass : SupportsTranspositionClass
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
theorem nbgSupportsTranspositionClass : SupportsTranspositionClass := by
  sorry

/--
`nbgSupportsReplacement` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsReplacement

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsReplacement

Logical form (Lean):

```lean
theorem nbgSupportsReplacement : SupportsReplacement
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
theorem nbgSupportsReplacement : SupportsReplacement := by
  sorry

/--
`nbgSupportsGlobalChoice` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsGlobalChoice

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsGlobalChoice

Logical form (Lean):

```lean
theorem nbgSupportsGlobalChoice : SupportsGlobalChoice
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
theorem nbgSupportsGlobalChoice : SupportsGlobalChoice := by
  sorry

/--
`nbgFiniteNBGAxiomHolds` TODO

Predicate logic:

  ∀ (axiomName : LRA.Set.Constructions.NBG.Interface.ModelTheory.FiniteNBGAxiomName), LRA.Set.Constructions.NBG.Interface.ModelTheory.FiniteNBGAxiomHolds axiomName

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    axiomName : FiniteNBGAxiomName
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.FiniteNBGAxiomName.rec ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsClassExtensionality) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsClassRegularity) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsPairing) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsUnion) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsPowerSet) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsInfinity) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsUniversalClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsElementhoodClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsIntersectionClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsComplementClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsDomainClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsCartesianExtensionClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsPermutationClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsTranspositionClass) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsReplacement) Unit.unit) ((fun _ => LRA.Set.Constructions.NBG.Interface.ModelTheory.SupportsGlobalChoice) Unit.unit) axiomName

Logical form (Lean):

```lean
theorem nbgFiniteNBGAxiomHolds
    (axiomName : FiniteNBGAxiomName) :
    FiniteNBGAxiomHolds axiomName
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
theorem nbgFiniteNBGAxiomHolds
    (axiomName : FiniteNBGAxiomName) :
    FiniteNBGAxiomHolds axiomName := by
  sorry

/--
`nbgSatisfiesFiniteNBGAxiomatization` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SatisfiesFiniteNBGAxiomatization

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SatisfiesFiniteNBGAxiomatization

Logical form (Lean):

```lean
theorem nbgSatisfiesFiniteNBGAxiomatization : SatisfiesFiniteNBGAxiomatization
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
theorem nbgSatisfiesFiniteNBGAxiomatization : SatisfiesFiniteNBGAxiomatization := by
  sorry

/--
`nbgSatisfiesNBG` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Interface.ModelTheory.SatisfiesNBG

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.SatisfiesNBG

Logical form (Lean):

```lean
theorem nbgSatisfiesNBG : SatisfiesNBG
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
theorem nbgSatisfiesNBG : SatisfiesNBG := by
  sorry

end LRA.Set.Constructions.NBG.Interface.ModelTheory
