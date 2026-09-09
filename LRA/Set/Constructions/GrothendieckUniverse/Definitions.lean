namespace LRA.Set.Constructions.GrothendieckUniverse

universe u

variable {SetObject : Type u} [Membership SetObject SetObject]

/--
`IsEmptySet` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (A x : SetObject), ¬ x ∈ A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    inst.1 A x → False

Logical form (Lean):

```lean
def IsEmptySet (A : SetObject) : Prop :=
  ∀ x : SetObject, x ∉ A
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
def IsEmptySet (A : SetObject) : Prop :=
  ∀ x : SetObject, x ∉ A

/--
`IsPairSet` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (left right pair x : SetObject), x ∈ pair ↔ Or (x = left)(x = right)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    x ∈ pair ↔ Or (x = left)(x = right)

Logical form (Lean):

```lean
def IsPairSet (left right pair : SetObject) : Prop :=
  ∀ x : SetObject, x ∈ pair ↔ x = left ∨ x = right
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
def IsPairSet (left right pair : SetObject) : Prop :=
  ∀ x : SetObject, x ∈ pair ↔ x = left ∨ x = right

/--
`IsUnionOf` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (A union x : SetObject), x ∈ union ↔ Exists fun B => (B ∈ A ∧ x ∈ B)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    x ∈ union ↔ Exists fun B => (B ∈ A ∧ x ∈ B)

Logical form (Lean):

```lean
def IsUnionOf (A union : SetObject) : Prop :=
  ∀ x : SetObject, x ∈ union ↔ ∃ B : SetObject, B ∈ A ∧ x ∈ B
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
def IsUnionOf (A union : SetObject) : Prop :=
  ∀ x : SetObject, x ∈ union ↔ ∃ B : SetObject, B ∈ A ∧ x ∈ B

/--
`IsPowerSetOf` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (A powerSet x : SetObject), x ∈ powerSet ↔ ∀ (y : SetObject), y ∈ x → y ∈ A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    x ∈ powerSet ↔ ∀ (y : SetObject), y ∈ x → y ∈ A

Logical form (Lean):

```lean
def IsPowerSetOf (A powerSet : SetObject) : Prop :=
  ∀ x : SetObject, x ∈ powerSet ↔ ∀ y : SetObject, y ∈ x → y ∈ A
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
def IsPowerSetOf (A powerSet : SetObject) : Prop :=
  ∀ x : SetObject, x ∈ powerSet ↔ ∀ y : SetObject, y ∈ x → y ∈ A

/--
`IsSuccessorOf` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (A successor x : SetObject), x ∈ successor ↔ Or (x) ∈ A(x = A)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    x ∈ successor ↔ Or (x) ∈ A(x = A)

Logical form (Lean):

```lean
def IsSuccessorOf (A successor : SetObject) : Prop :=
  ∀ x : SetObject, x ∈ successor ↔ x ∈ A ∨ x = A
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
def IsSuccessorOf (A successor : SetObject) : Prop :=
  ∀ x : SetObject, x ∈ successor ↔ x ∈ A ∨ x = A

/--
`IsInductiveSet` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (A : SetObject), ((Exists fun empty => (empty ∈ A ∧ LRA.Set.Constructions.GrothendieckUniverse.IsEmptySet empty)) ∧ (∀ (x : SetObject), x ∈ A → Exists fun successor => (successor ∈ A ∧ LRA.Set.Constructions.GrothendieckUniverse.IsSuccessorOf x successor)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((Exists fun empty => (inst.1 A empty ∧ (∀ (x : SetObject), inst.1 empty x → False))) ∧ (∀ (x : SetObject), inst.1 A x → Exists fun successor => (inst.1 A successor ∧ (∀ (x_1 : SetObject), inst.1 successor x_1 ↔ Or (inst.1 x x_1) (x_1 = x)))))

Logical form (Lean):

```lean
def IsInductiveSet (A : SetObject) : Prop :=
  (∃ empty : SetObject, empty ∈ A ∧ IsEmptySet empty) ∧
  ∀ x : SetObject, x ∈ A → ∃ successor : SetObject, successor ∈ A ∧ IsSuccessorOf x successor
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
def IsInductiveSet (A : SetObject) : Prop :=
  (∃ empty : SetObject, empty ∈ A ∧ IsEmptySet empty) ∧
  ∀ x : SetObject, x ∈ A → ∃ successor : SetObject, successor ∈ A ∧ IsSuccessorOf x successor

/--
`IsImageOfFamilyOn` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (indexSet : SetObject) (family : SetObject → SetObject) (image y : SetObject), y ∈ image ↔ Exists fun i => (i ∈ indexSet ∧ y = family i)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    y ∈ image ↔ Exists fun i => (i ∈ indexSet ∧ y = family i)

Logical form (Lean):

```lean
def IsImageOfFamilyOn
    (indexSet : SetObject)
    (family : SetObject → SetObject)
    (image : SetObject) : Prop :=
  ∀ y : SetObject, y ∈ image ↔ ∃ i : SetObject, i ∈ indexSet ∧ y = family i
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
def IsImageOfFamilyOn
    (indexSet : SetObject)
    (family : SetObject → SetObject)
    (image : SetObject) : Prop :=
  ∀ y : SetObject, y ∈ image ↔ ∃ i : SetObject, i ∈ indexSet ∧ y = family i

/--
`IsIndexedUnionOfFamilyOn` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (indexSet : SetObject) (family : SetObject → SetObject) (union x : SetObject), x ∈ union ↔ Exists fun i => (i ∈ indexSet ∧ x ∈ family i)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    x ∈ union ↔ Exists fun i => (i ∈ indexSet ∧ x ∈ family i)

Logical form (Lean):

```lean
def IsIndexedUnionOfFamilyOn
    (indexSet : SetObject)
    (family : SetObject → SetObject)
    (union : SetObject) : Prop :=
  ∀ x : SetObject, x ∈ union ↔ ∃ i : SetObject, i ∈ indexSet ∧ x ∈ family i
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
def IsIndexedUnionOfFamilyOn
    (indexSet : SetObject)
    (family : SetObject → SetObject)
    (union : SetObject) : Prop :=
  ∀ x : SetObject, x ∈ union ↔ ∃ i : SetObject, i ∈ indexSet ∧ x ∈ family i

/--
`IsTransitiveUniverse` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (U : SetObject) ⦃x y : SetObject⦄, (x ∈ U ∧ y ∈ x) → y ∈ U

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (inst.1 U x ∧ inst.1 x y) → inst.1 U y

Logical form (Lean):

```lean
def IsTransitiveUniverse (U : SetObject) : Prop :=
  ∀ ⦃x y : SetObject⦄, x ∈ U → y ∈ x → y ∈ U
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
def IsTransitiveUniverse (U : SetObject) : Prop :=
  ∀ ⦃x y : SetObject⦄, x ∈ U → y ∈ x → y ∈ U

/--
`IsClosedUnderPairing` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (U : SetObject) ⦃x y : SetObject⦄, (x ∈ U ∧ y ∈ U) → Exists fun pair => (pair ∈ U ∧ LRA.Set.Constructions.GrothendieckUniverse.IsPairSet x y pair)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (inst.1 U x ∧ inst.1 U y) → Exists fun pair => (inst.1 U pair ∧ (∀ (x_1 : SetObject), inst.1 pair x_1 ↔ Or (x_1 = x)(x_1 = y)))

Logical form (Lean):

```lean
def IsClosedUnderPairing (U : SetObject) : Prop :=
  ∀ ⦃x y : SetObject⦄, x ∈ U → y ∈ U →
    ∃ pair : SetObject, pair ∈ U ∧ IsPairSet x y pair
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
def IsClosedUnderPairing (U : SetObject) : Prop :=
  ∀ ⦃x y : SetObject⦄, x ∈ U → y ∈ U →
    ∃ pair : SetObject, pair ∈ U ∧ IsPairSet x y pair

/--
`IsClosedUnderPowerSet` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (U : SetObject) ⦃x : SetObject⦄, x ∈ U → Exists fun powerSet => (powerSet ∈ U ∧ LRA.Set.Constructions.GrothendieckUniverse.IsPowerSetOf x powerSet)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    inst.1 U x → Exists fun powerSet => (inst.1 U powerSet ∧ (∀ (x_1 : SetObject), inst.1 powerSet x_1 ↔ ∀ (y : SetObject), inst.1 x_1 y → inst.1 x y))

Logical form (Lean):

```lean
def IsClosedUnderPowerSet (U : SetObject) : Prop :=
  ∀ ⦃x : SetObject⦄, x ∈ U →
    ∃ powerSet : SetObject, powerSet ∈ U ∧ IsPowerSetOf x powerSet
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
def IsClosedUnderPowerSet (U : SetObject) : Prop :=
  ∀ ⦃x : SetObject⦄, x ∈ U →
    ∃ powerSet : SetObject, powerSet ∈ U ∧ IsPowerSetOf x powerSet

/--
`IsClosedUnderIndexedUnion` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (U : SetObject) ⦃indexSet : SetObject⦄, indexSet ∈ U → ∀ (family : SetObject → SetObject), (∀ (i : SetObject), i ∈ indexSet → family i ∈ U) → Exists fun image => (image ∈ U ∧ (LRA.Set.Constructions.GrothendieckUniverse.IsImageOfFamilyOn indexSet family image ∧ (Exists fun union => (union ∈ U ∧ LRA.Set.Constructions.GrothendieckUniverse.IsIndexedUnionOfFamilyOn indexSet family union))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    inst.1 U indexSet → ∀ (family : SetObject → SetObject), (∀ (i : SetObject), inst.1 indexSet i → inst.1 U (family i)) → Exists fun image => (inst.1 U image ∧ ((∀ (y : SetObject), inst.1 image y ↔ Exists fun i => (inst.1 indexSet i ∧ y = family i)) ∧ (Exists fun union => (inst.1 U union ∧ (∀ (x : SetObject), inst.1 union x ↔ Exists fun i => (inst.1 indexSet i ∧ inst.1 (family i) x))))))

Logical form (Lean):

```lean
def IsClosedUnderIndexedUnion (U : SetObject) : Prop :=
  ∀ ⦃indexSet : SetObject⦄, indexSet ∈ U →
    ∀ family : SetObject → SetObject,
      (∀ i : SetObject, i ∈ indexSet → family i ∈ U) →
        ∃ image : SetObject,
          image ∈ U ∧
          IsImageOfFamilyOn indexSet family image ∧
          ∃ union : SetObject,
            union ∈ U ∧ IsIndexedUnionOfFamilyOn indexSet family union
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
def IsClosedUnderIndexedUnion (U : SetObject) : Prop :=
  ∀ ⦃indexSet : SetObject⦄, indexSet ∈ U →
    ∀ family : SetObject → SetObject,
      (∀ i : SetObject, i ∈ indexSet → family i ∈ U) →
        ∃ image : SetObject,
          image ∈ U ∧
          IsImageOfFamilyOn indexSet family image ∧
          ∃ union : SetObject,
            union ∈ U ∧ IsIndexedUnionOfFamilyOn indexSet family union

/--
`ContainsInductiveSet` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (U : SetObject), Exists fun omega => (omega ∈ U ∧ LRA.Set.Constructions.GrothendieckUniverse.IsInductiveSet omega)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun omega => (inst.1 U omega ∧ ((Exists fun empty => (inst.1 omega empty ∧ (∀ (x : SetObject), inst.1 empty x → False))) ∧ (∀ (x : SetObject), inst.1 omega x → Exists fun successor => (inst.1 omega successor ∧ (∀ (x_1 : SetObject), inst.1 successor x_1 ↔ Or (inst.1 x x_1) (x_1 = x))))))

Logical form (Lean):

```lean
def ContainsInductiveSet (U : SetObject) : Prop :=
  ∃ omega : SetObject, omega ∈ U ∧ IsInductiveSet omega
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use, unfold

-/
def ContainsInductiveSet (U : SetObject) : Prop :=
  ∃ omega : SetObject, omega ∈ U ∧ IsInductiveSet omega

/--
`IsGrothendieckUniverse` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (U : SetObject), (LRA.Set.Constructions.GrothendieckUniverse.IsTransitiveUniverse U ∧ (LRA.Set.Constructions.GrothendieckUniverse.IsClosedUnderPairing U ∧ (LRA.Set.Constructions.GrothendieckUniverse.IsClosedUnderPowerSet U ∧ (LRA.Set.Constructions.GrothendieckUniverse.IsClosedUnderIndexedUnion U ∧ LRA.Set.Constructions.GrothendieckUniverse.ContainsInductiveSet U))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ ⦃x y : SetObject⦄, inst.1 U x → inst.1 x y → inst.1 U y) ∧ ((∀ ⦃x y : SetObject⦄, inst.1 U x → inst.1 U y → Exists fun pair => (inst.1 U pair ∧ (∀ (x_1 : SetObject), inst.1 pair x_1 ↔ Or (x_1 = x)(x_1 = y)))) ∧ ((∀ ⦃x : SetObject⦄, inst.1 U x → Exists fun powerSet => (inst.1 U powerSet ∧ (∀ (x_1 : SetObject), inst.1 powerSet x_1 ↔ ∀ (y : SetObject), inst.1 x_1 y → inst.1 x y))) ∧ ((∀ ⦃indexSet : SetObject⦄, inst.1 U indexSet → ∀ (family : SetObject → SetObject), (∀ (i : SetObject), inst.1 indexSet i → inst.1 U (family i)) → Exists fun image => (inst.1 U image ∧ ((∀ (y : SetObject), inst.1 image y ↔ Exists fun i => (inst.1 indexSet i ∧ y = family i)) ∧ (Exists fun union => (inst.1 U union ∧ (∀ (x : SetObject), inst.1 union x ↔ Exists fun i => (inst.1 indexSet i ∧ inst.1 (family i) x))))))) ∧ (Exists fun omega => (inst.1 U omega ∧ ((Exists fun empty => (inst.1 omega empty ∧ (∀ (x : SetObject), inst.1 empty x → False))) ∧ (∀ (x : SetObject), inst.1 omega x → Exists fun successor => (inst.1 omega successor ∧ (∀ (x_1 : SetObject), inst.1 successor x_1 ↔ Or (inst.1 x x_1) (x_1 = x)))))))))))

Logical form (Lean):

```lean
def IsGrothendieckUniverse (U : SetObject) : Prop :=
  IsTransitiveUniverse U ∧
  IsClosedUnderPairing U ∧
  IsClosedUnderPowerSet U ∧
  IsClosedUnderIndexedUnion U ∧
  ContainsInductiveSet U
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
def IsGrothendieckUniverse (U : SetObject) : Prop :=
  IsTransitiveUniverse U ∧
  IsClosedUnderPairing U ∧
  IsClosedUnderPowerSet U ∧
  IsClosedUnderIndexedUnion U ∧
  ContainsInductiveSet U

/--
`IsGrothendieckUniverseFor` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (A U : SetObject), (A ∈ U ∧ LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverse U)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (inst.1 U A ∧ ((∀ ⦃x y : SetObject⦄, inst.1 U x → inst.1 x y → inst.1 U y) ∧ ((∀ ⦃x y : SetObject⦄, inst.1 U x → inst.1 U y → Exists fun pair => (inst.1 U pair ∧ (∀ (x_1 : SetObject), inst.1 pair x_1 ↔ Or (x_1 = x)(x_1 = y)))) ∧ ((∀ ⦃x : SetObject⦄, inst.1 U x → Exists fun powerSet => (inst.1 U powerSet ∧ (∀ (x_1 : SetObject), inst.1 powerSet x_1 ↔ ∀ (y : SetObject), inst.1 x_1 y → inst.1 x y))) ∧ ((∀ ⦃indexSet : SetObject⦄, inst.1 U indexSet → ∀ (family : SetObject → SetObject), (∀ (i : SetObject), inst.1 indexSet i → inst.1 U (family i)) → Exists fun image => (inst.1 U image ∧ ((∀ (y : SetObject), inst.1 image y ↔ Exists fun i => (inst.1 indexSet i ∧ y = family i)) ∧ (Exists fun union => (inst.1 U union ∧ (∀ (x : SetObject), inst.1 union x ↔ Exists fun i => (inst.1 indexSet i ∧ inst.1 (family i) x))))))) ∧ (Exists fun omega => (inst.1 U omega ∧ ((Exists fun empty => (inst.1 omega empty ∧ (∀ (x : SetObject), inst.1 empty x → False))) ∧ (∀ (x : SetObject), inst.1 omega x → Exists fun successor => (inst.1 omega successor ∧ (∀ (x_1 : SetObject), inst.1 successor x_1 ↔ Or (inst.1 x x_1) (x_1 = x))))))))))))

Logical form (Lean):

```lean
def IsGrothendieckUniverseFor (A U : SetObject) : Prop :=
  A ∈ U ∧ IsGrothendieckUniverse U
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
def IsGrothendieckUniverseFor (A U : SetObject) : Prop :=
  A ∈ U ∧ IsGrothendieckUniverse U

end LRA.Set.Constructions.GrothendieckUniverse
