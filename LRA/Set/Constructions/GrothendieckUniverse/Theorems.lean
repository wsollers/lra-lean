import LRA.Set.Constructions.GrothendieckUniverse.Axioms

namespace LRA.Set.Constructions.GrothendieckUniverse

universe u

variable {SetObject : Type u} [Membership SetObject SetObject]

/--
`GrothendieckUniverseExists` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject], LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseAxiom SetObject → ∀ (A : SetObject), Exists fun U => LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U

Predicate logic (unfolded):

  Ambient
    (SetObject, ∈)
  Objects
    A : SetObject
  Prove
    LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseAxiom SetObject → ∀ (A : SetObject), Exists fun U => (inst.1 U A ∧ ((∀ ⦃x y : SetObject⦄, inst.1 U x → inst.1 x y → inst.1 U y) ∧ ((∀ ⦃x y : SetObject⦄, inst.1 U x → inst.1 U y → Exists fun pair => (inst.1 U pair ∧ (∀ (x_1 : SetObject), inst.1 pair x_1 ↔ Or (x_1 = x)(x_1 = y)))) ∧ ((∀ ⦃x : SetObject⦄, inst.1 U x → Exists fun powerSet => (inst.1 U powerSet ∧ (∀ (x_1 : SetObject), inst.1 powerSet x_1 ↔ ∀ (y : SetObject), inst.1 x_1 y → inst.1 x y))) ∧ ((∀ ⦃indexSet : SetObject⦄, inst.1 U indexSet → ∀ (family : SetObject → SetObject), (∀ (i : SetObject), inst.1 indexSet i → inst.1 U (family i)) → Exists fun image => (inst.1 U image ∧ ((∀ (y : SetObject), inst.1 image y ↔ Exists fun i => (inst.1 indexSet i ∧ y = family i)) ∧ (Exists fun union => (inst.1 U union ∧ (∀ (x : SetObject), inst.1 union x ↔ Exists fun i => (inst.1 indexSet i ∧ inst.1 (family i) x))))))) ∧ (Exists fun omega => (inst.1 U omega ∧ ((Exists fun empty => (inst.1 omega empty ∧ (∀ (x : SetObject), x ∈ empty → False))) ∧ (∀ (x : SetObject), inst.1 omega x → Exists fun successor => (inst.1 omega successor ∧ (∀ (x_1 : SetObject), inst.1 successor x_1 ↔ Or (inst.1 x x_1) (x_1 = x))))))))))))

Logical form (Lean):

```lean
theorem GrothendieckUniverseExists
    [GrothendieckUniverseAxiom SetObject]
    (A : SetObject) :
    ∃ U : SetObject, IsGrothendieckUniverseFor A U
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
theorem GrothendieckUniverseExists
    [GrothendieckUniverseAxiom SetObject]
    (A : SetObject) :
    ∃ U : SetObject, IsGrothendieckUniverseFor A U := by
  sorry

/--
`TheGrothendieckUniverse` TODO

Predicate logic:

  noncomputable def TheGrothendieckUniverse
      [GrothendieckUniverseAxiom SetObject]
      (A : SetObject) : SetObject :=
    Classical.choose (GrothendieckUniverseExists A)

Predicate logic (unfolded):

  noncomputable def TheGrothendieckUniverse
      [GrothendieckUniverseAxiom SetObject]
      (A : SetObject) : SetObject :=
    Classical.choose (GrothendieckUniverseExists A) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TheGrothendieckUniverse
    [GrothendieckUniverseAxiom SetObject]
    (A : SetObject) : SetObject :=
  Classical.choose (GrothendieckUniverseExists A)
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
noncomputable def TheGrothendieckUniverse
    [GrothendieckUniverseAxiom SetObject]
    (A : SetObject) : SetObject :=
  Classical.choose (GrothendieckUniverseExists A)

/--
`TheGrothendieckUniverseIsGrothendieckUniverseFor` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] [inst_1 : LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseAxiom SetObject] (A : SetObject), LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A (LRA.Set.Constructions.GrothendieckUniverse.TheGrothendieckUniverse A)

Predicate logic (unfolded):

  Ambient
    (SetObject, ∈)
  Objects
    A : SetObject
  Prove
    (inst.1 (Classical.indefiniteDescription (LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A) ⋯).1 A ∧ ((∀ ⦃x y : SetObject⦄, inst.1 (Classical.indefiniteDescription (LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A) ⋯).val x → inst.1 x y → inst.1 (Classical.indefiniteDescription (LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A) ⋯).val y) ∧ ((∀ ⦃x y : SetObject⦄, inst.1 (Classical.indefiniteDescription (LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A) ⋯).val x → inst.1 (Classical.indefiniteDescription (LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A) ⋯).val y → Exists fun pair => (inst.1 (Classical.indefiniteDescription (LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A) ⋯).val pair ∧ (∀ (x_1 : SetObject), inst.1 pair x_1 ↔ Or (x_1 = x)(x_1 = y)))) ∧ ((∀ ⦃x : SetObject⦄, inst.1 (Classical.indefiniteDescription (LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A) ⋯).val x → Exists fun powerSet => (inst.1 (Classical.indefiniteDescription (LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A) ⋯).val powerSet ∧ (∀ (x_1 : SetObject), inst.1 powerSet x_1 ↔ ∀ (y : SetObject), inst.1 x_1 y → inst.1 x y))) ∧ ((∀ ⦃indexSet : SetObject⦄, inst.1 (Classical.indefiniteDescription (LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A) ⋯).val indexSet → ∀ (family : SetObject → SetObject), (∀ (i : SetObject), inst.1 indexSet i → inst.1 (Classical.indefiniteDescription (LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A) ⋯).val (family i)) → Exists fun image => (inst.1 (Classical.indefiniteDescription (LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A) ⋯).val image ∧ ((∀ (y : SetObject), inst.1 image y ↔ Exists fun i => (inst.1 indexSet i ∧ y = family i)) ∧ (Exists fun union => (inst.1 (Classical.indefiniteDescription (LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A) ⋯).val union ∧ (∀ (x : SetObject), inst.1 union x ↔ Exists fun i => (inst.1 indexSet i ∧ inst.1 (family i) x))))))) ∧ (Exists fun omega => (inst.1 (Classical.indefiniteDescription (LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A) ⋯).val omega ∧ ((Exists fun empty => (inst.1 omega empty ∧ (∀ (x : SetObject), x ∈ empty → False))) ∧ (∀ (x : SetObject), inst.1 omega x → Exists fun successor => (inst.1 omega successor ∧ (∀ (x_1 : SetObject), inst.1 successor x_1 ↔ Or (inst.1 x x_1) (x_1 = x))))))))))))

Logical form (Lean):

```lean
theorem TheGrothendieckUniverseIsGrothendieckUniverseFor
    [GrothendieckUniverseAxiom SetObject]
    (A : SetObject) :
    IsGrothendieckUniverseFor A (TheGrothendieckUniverse A)
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
theorem TheGrothendieckUniverseIsGrothendieckUniverseFor
    [GrothendieckUniverseAxiom SetObject]
    (A : SetObject) :
    IsGrothendieckUniverseFor A (TheGrothendieckUniverse A) := by
  sorry

/--
`GrothendieckUniverseContainsBase` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] {A U : SetObject}, LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U → A ∈ U

Predicate logic (unfolded):

  Ambient
    (SetObject, ∈)
  Objects
    A U : SetObject
  Prove
    (inst.1 U A ∧ ((∀ ⦃x y : SetObject⦄, inst.1 U x → inst.1 x y → inst.1 U y) ∧ ((∀ ⦃x y : SetObject⦄, inst.1 U x → inst.1 U y → Exists fun pair => (inst.1 U pair ∧ (∀ (x_1 : SetObject), inst.1 pair x_1 ↔ Or (x_1 = x)(x_1 = y)))) ∧ ((∀ ⦃x : SetObject⦄, inst.1 U x → Exists fun powerSet => (inst.1 U powerSet ∧ (∀ (x_1 : SetObject), inst.1 powerSet x_1 ↔ ∀ (y : SetObject), inst.1 x_1 y → inst.1 x y))) ∧ ((∀ ⦃indexSet : SetObject⦄, inst.1 U indexSet → ∀ (family : SetObject → SetObject), (∀ (i : SetObject), inst.1 indexSet i → inst.1 U (family i)) → Exists fun image => (inst.1 U image ∧ ((∀ (y : SetObject), inst.1 image y ↔ Exists fun i => (inst.1 indexSet i ∧ y = family i)) ∧ (Exists fun union => (inst.1 U union ∧ (∀ (x : SetObject), inst.1 union x ↔ Exists fun i => (inst.1 indexSet i ∧ inst.1 (family i) x))))))) ∧ (Exists fun omega => (inst.1 U omega ∧ ((Exists fun empty => (inst.1 omega empty ∧ (∀ (x : SetObject), x ∈ empty → False))) ∧ (∀ (x : SetObject), inst.1 omega x → Exists fun successor => (inst.1 omega successor ∧ (∀ (x_1 : SetObject), inst.1 successor x_1 ↔ Or (inst.1 x x_1) (x_1 = x)))))))))))) → inst.1 U A

Logical form (Lean):

```lean
theorem GrothendieckUniverseContainsBase
    {A U : SetObject}
    (universeHypothesis : IsGrothendieckUniverseFor A U) :
    A ∈ U
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
theorem GrothendieckUniverseContainsBase
    {A U : SetObject}
    (universeHypothesis : IsGrothendieckUniverseFor A U) :
    A ∈ U := by
  sorry

/--
`GrothendieckUniverseIsTransitive` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] {U : SetObject}, LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverse U → LRA.Set.Constructions.GrothendieckUniverse.IsTransitiveUniverse U

Predicate logic (unfolded):

  Ambient
    (SetObject, ∈)
  Objects
    U : SetObject
  Prove
    ((∀ ⦃x y : SetObject⦄, inst.1 U x → inst.1 x y → inst.1 U y) ∧ ((∀ ⦃x y : SetObject⦄, inst.1 U x → inst.1 U y → Exists fun pair => (inst.1 U pair ∧ (∀ (x_1 : SetObject), inst.1 pair x_1 ↔ Or (x_1 = x)(x_1 = y)))) ∧ ((∀ ⦃x : SetObject⦄, inst.1 U x → Exists fun powerSet => (inst.1 U powerSet ∧ (∀ (x_1 : SetObject), inst.1 powerSet x_1 ↔ ∀ (y : SetObject), inst.1 x_1 y → inst.1 x y))) ∧ ((∀ ⦃indexSet : SetObject⦄, inst.1 U indexSet → ∀ (family : SetObject → SetObject), (∀ (i : SetObject), inst.1 indexSet i → inst.1 U (family i)) → Exists fun image => (inst.1 U image ∧ ((∀ (y : SetObject), inst.1 image y ↔ Exists fun i => (inst.1 indexSet i ∧ y = family i)) ∧ (Exists fun union => (inst.1 U union ∧ (∀ (x : SetObject), inst.1 union x ↔ Exists fun i => (inst.1 indexSet i ∧ inst.1 (family i) x))))))) ∧ (Exists fun omega => (inst.1 U omega ∧ ((Exists fun empty => (inst.1 omega empty ∧ (∀ (x : SetObject), inst.1 empty x → False))) ∧ (∀ (x : SetObject), inst.1 omega x → Exists fun successor => (inst.1 omega successor ∧ (∀ (x_1 : SetObject), inst.1 successor x_1 ↔ Or (inst.1 x x_1) (x_1 = x))))))))))) → ∀ ⦃x y : SetObject⦄, (inst.1 U x ∧ inst.1 x y) → inst.1 U y

Logical form (Lean):

```lean
theorem GrothendieckUniverseIsTransitive
    {U : SetObject}
    (universeHypothesis : IsGrothendieckUniverse U) :
    IsTransitiveUniverse U
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
theorem GrothendieckUniverseIsTransitive
    {U : SetObject}
    (universeHypothesis : IsGrothendieckUniverse U) :
    IsTransitiveUniverse U := by
  sorry

/--
`GrothendieckUniverseClosedUnderPairing` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] {U : SetObject}, LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverse U → LRA.Set.Constructions.GrothendieckUniverse.IsClosedUnderPairing U

Predicate logic (unfolded):

  Ambient
    (SetObject, ∈)
  Objects
    U : SetObject
  Prove
    ((∀ ⦃x y : SetObject⦄, inst.1 U x → inst.1 x y → inst.1 U y) ∧ ((∀ ⦃x y : SetObject⦄, inst.1 U x → inst.1 U y → Exists fun pair => (inst.1 U pair ∧ (∀ (x_1 : SetObject), inst.1 pair x_1 ↔ Or (x_1 = x)(x_1 = y)))) ∧ ((∀ ⦃x : SetObject⦄, inst.1 U x → Exists fun powerSet => (inst.1 U powerSet ∧ (∀ (x_1 : SetObject), inst.1 powerSet x_1 ↔ ∀ (y : SetObject), inst.1 x_1 y → inst.1 x y))) ∧ ((∀ ⦃indexSet : SetObject⦄, inst.1 U indexSet → ∀ (family : SetObject → SetObject), (∀ (i : SetObject), inst.1 indexSet i → inst.1 U (family i)) → Exists fun image => (inst.1 U image ∧ ((∀ (y : SetObject), inst.1 image y ↔ Exists fun i => (inst.1 indexSet i ∧ y = family i)) ∧ (Exists fun union => (inst.1 U union ∧ (∀ (x : SetObject), inst.1 union x ↔ Exists fun i => (inst.1 indexSet i ∧ inst.1 (family i) x))))))) ∧ (Exists fun omega => (inst.1 U omega ∧ ((Exists fun empty => (inst.1 omega empty ∧ (∀ (x : SetObject), inst.1 empty x → False))) ∧ (∀ (x : SetObject), inst.1 omega x → Exists fun successor => (inst.1 omega successor ∧ (∀ (x_1 : SetObject), inst.1 successor x_1 ↔ Or (inst.1 x x_1) (x_1 = x))))))))))) → ∀ ⦃x y : SetObject⦄, (inst.1 U x ∧ inst.1 U y) → Exists fun pair => (inst.1 U pair ∧ (∀ (x_1 : SetObject), inst.1 pair x_1 ↔ Or (x_1 = x)(x_1 = y)))

Logical form (Lean):

```lean
theorem GrothendieckUniverseClosedUnderPairing
    {U : SetObject}
    (universeHypothesis : IsGrothendieckUniverse U) :
    IsClosedUnderPairing U
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
theorem GrothendieckUniverseClosedUnderPairing
    {U : SetObject}
    (universeHypothesis : IsGrothendieckUniverse U) :
    IsClosedUnderPairing U := by
  sorry

/--
`GrothendieckUniverseClosedUnderPowerSet` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] {U : SetObject}, LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverse U → LRA.Set.Constructions.GrothendieckUniverse.IsClosedUnderPowerSet U

Predicate logic (unfolded):

  Ambient
    (SetObject, ∈)
  Objects
    U : SetObject
  Prove
    ((∀ ⦃x y : SetObject⦄, inst.1 U x → inst.1 x y → inst.1 U y) ∧ ((∀ ⦃x y : SetObject⦄, inst.1 U x → inst.1 U y → Exists fun pair => (inst.1 U pair ∧ (∀ (x_1 : SetObject), inst.1 pair x_1 ↔ Or (x_1 = x)(x_1 = y)))) ∧ ((∀ ⦃x : SetObject⦄, inst.1 U x → Exists fun powerSet => (inst.1 U powerSet ∧ (∀ (x_1 : SetObject), inst.1 powerSet x_1 ↔ ∀ (y : SetObject), inst.1 x_1 y → inst.1 x y))) ∧ ((∀ ⦃indexSet : SetObject⦄, inst.1 U indexSet → ∀ (family : SetObject → SetObject), (∀ (i : SetObject), inst.1 indexSet i → inst.1 U (family i)) → Exists fun image => (inst.1 U image ∧ ((∀ (y : SetObject), inst.1 image y ↔ Exists fun i => (inst.1 indexSet i ∧ y = family i)) ∧ (Exists fun union => (inst.1 U union ∧ (∀ (x : SetObject), inst.1 union x ↔ Exists fun i => (inst.1 indexSet i ∧ inst.1 (family i) x))))))) ∧ (Exists fun omega => (inst.1 U omega ∧ ((Exists fun empty => (inst.1 omega empty ∧ (∀ (x : SetObject), inst.1 empty x → False))) ∧ (∀ (x : SetObject), inst.1 omega x → Exists fun successor => (inst.1 omega successor ∧ (∀ (x_1 : SetObject), inst.1 successor x_1 ↔ Or (inst.1 x x_1) (x_1 = x))))))))))) → ∀ ⦃x : SetObject⦄, inst.1 U x → Exists fun powerSet => (inst.1 U powerSet ∧ (∀ (x_1 : SetObject), inst.1 powerSet x_1 ↔ ∀ (y : SetObject), inst.1 x_1 y → inst.1 x y))

Logical form (Lean):

```lean
theorem GrothendieckUniverseClosedUnderPowerSet
    {U : SetObject}
    (universeHypothesis : IsGrothendieckUniverse U) :
    IsClosedUnderPowerSet U
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
theorem GrothendieckUniverseClosedUnderPowerSet
    {U : SetObject}
    (universeHypothesis : IsGrothendieckUniverse U) :
    IsClosedUnderPowerSet U := by
  sorry

/--
`GrothendieckUniverseClosedUnderIndexedUnion` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] {U : SetObject}, LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverse U → LRA.Set.Constructions.GrothendieckUniverse.IsClosedUnderIndexedUnion U

Predicate logic (unfolded):

  Ambient
    (SetObject, ∈)
  Objects
    U : SetObject
  Prove
    ((∀ ⦃x y : SetObject⦄, inst.1 U x → inst.1 x y → inst.1 U y) ∧ ((∀ ⦃x y : SetObject⦄, inst.1 U x → inst.1 U y → Exists fun pair => (inst.1 U pair ∧ (∀ (x_1 : SetObject), inst.1 pair x_1 ↔ Or (x_1 = x)(x_1 = y)))) ∧ ((∀ ⦃x : SetObject⦄, inst.1 U x → Exists fun powerSet => (inst.1 U powerSet ∧ (∀ (x_1 : SetObject), inst.1 powerSet x_1 ↔ ∀ (y : SetObject), inst.1 x_1 y → inst.1 x y))) ∧ ((∀ ⦃indexSet : SetObject⦄, inst.1 U indexSet → ∀ (family : SetObject → SetObject), (∀ (i : SetObject), inst.1 indexSet i → inst.1 U (family i)) → Exists fun image => (inst.1 U image ∧ ((∀ (y : SetObject), inst.1 image y ↔ Exists fun i => (inst.1 indexSet i ∧ y = family i)) ∧ (Exists fun union => (inst.1 U union ∧ (∀ (x : SetObject), inst.1 union x ↔ Exists fun i => (inst.1 indexSet i ∧ inst.1 (family i) x))))))) ∧ (Exists fun omega => (inst.1 U omega ∧ ((Exists fun empty => (inst.1 omega empty ∧ (∀ (x : SetObject), inst.1 empty x → False))) ∧ (∀ (x : SetObject), inst.1 omega x → Exists fun successor => (inst.1 omega successor ∧ (∀ (x_1 : SetObject), inst.1 successor x_1 ↔ Or (inst.1 x x_1) (x_1 = x))))))))))) → ∀ ⦃indexSet : SetObject⦄, inst.1 U indexSet → ∀ (family : SetObject → SetObject), (∀ (i : SetObject), inst.1 indexSet i → inst.1 U (family i)) → Exists fun image => (inst.1 U image ∧ ((∀ (y : SetObject), inst.1 image y ↔ Exists fun i => (inst.1 indexSet i ∧ y = family i)) ∧ (Exists fun union => (inst.1 U union ∧ (∀ (x : SetObject), inst.1 union x ↔ Exists fun i => (inst.1 indexSet i ∧ inst.1 (family i) x))))))

Logical form (Lean):

```lean
theorem GrothendieckUniverseClosedUnderIndexedUnion
    {U : SetObject}
    (universeHypothesis : IsGrothendieckUniverse U) :
    IsClosedUnderIndexedUnion U
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
theorem GrothendieckUniverseClosedUnderIndexedUnion
    {U : SetObject}
    (universeHypothesis : IsGrothendieckUniverse U) :
    IsClosedUnderIndexedUnion U := by
  sorry

/--
`GrothendieckUniverseContainsInductiveSet` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] {U : SetObject}, LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverse U → LRA.Set.Constructions.GrothendieckUniverse.ContainsInductiveSet U

Predicate logic (unfolded):

  Ambient
    (SetObject, ∈)
  Objects
    U : SetObject
  Prove
    ((∀ ⦃x y : SetObject⦄, inst.1 U x → inst.1 x y → inst.1 U y) ∧ ((∀ ⦃x y : SetObject⦄, inst.1 U x → inst.1 U y → Exists fun pair => (inst.1 U pair ∧ (∀ (x_1 : SetObject), inst.1 pair x_1 ↔ Or (x_1 = x)(x_1 = y)))) ∧ ((∀ ⦃x : SetObject⦄, inst.1 U x → Exists fun powerSet => (inst.1 U powerSet ∧ (∀ (x_1 : SetObject), inst.1 powerSet x_1 ↔ ∀ (y : SetObject), inst.1 x_1 y → inst.1 x y))) ∧ ((∀ ⦃indexSet : SetObject⦄, inst.1 U indexSet → ∀ (family : SetObject → SetObject), (∀ (i : SetObject), inst.1 indexSet i → inst.1 U (family i)) → Exists fun image => (inst.1 U image ∧ ((∀ (y : SetObject), inst.1 image y ↔ Exists fun i => (inst.1 indexSet i ∧ y = family i)) ∧ (Exists fun union => (inst.1 U union ∧ (∀ (x : SetObject), inst.1 union x ↔ Exists fun i => (inst.1 indexSet i ∧ inst.1 (family i) x))))))) ∧ (Exists fun omega => (inst.1 U omega ∧ ((Exists fun empty => (inst.1 omega empty ∧ (∀ (x : SetObject), inst.1 empty x → False))) ∧ (∀ (x : SetObject), inst.1 omega x → Exists fun successor => (inst.1 omega successor ∧ (∀ (x_1 : SetObject), inst.1 successor x_1 ↔ Or (inst.1 x x_1) (x_1 = x))))))))))) → Exists fun omega => (inst.1 U omega ∧ ((Exists fun empty => (inst.1 omega empty ∧ (∀ (x : SetObject), inst.1 empty x → False))) ∧ (∀ (x : SetObject), inst.1 omega x → Exists fun successor => (inst.1 omega successor ∧ (∀ (x_1 : SetObject), inst.1 successor x_1 ↔ Or (inst.1 x x_1) (x_1 = x))))))

Logical form (Lean):

```lean
theorem GrothendieckUniverseContainsInductiveSet
    {U : SetObject}
    (universeHypothesis : IsGrothendieckUniverse U) :
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

Related proof moves: TODO

-/
theorem GrothendieckUniverseContainsInductiveSet
    {U : SetObject}
    (universeHypothesis : IsGrothendieckUniverse U) :
    ContainsInductiveSet U := by
  sorry

/--
`GrothendieckUniverseContainsEmptySet` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] {U : SetObject}, LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverse U → Exists fun empty => (empty ∈ U ∧ LRA.Set.Constructions.GrothendieckUniverse.IsEmptySet empty)

Predicate logic (unfolded):

  Ambient
    (SetObject, ∈)
  Objects
    U : SetObject
  Prove
    ((∀ ⦃x y : SetObject⦄, inst.1 U x → inst.1 x y → inst.1 U y) ∧ ((∀ ⦃x y : SetObject⦄, inst.1 U x → inst.1 U y → Exists fun pair => (inst.1 U pair ∧ (∀ (x_1 : SetObject), inst.1 pair x_1 ↔ Or (x_1 = x)(x_1 = y)))) ∧ ((∀ ⦃x : SetObject⦄, inst.1 U x → Exists fun powerSet => (inst.1 U powerSet ∧ (∀ (x_1 : SetObject), inst.1 powerSet x_1 ↔ ∀ (y : SetObject), inst.1 x_1 y → inst.1 x y))) ∧ ((∀ ⦃indexSet : SetObject⦄, inst.1 U indexSet → ∀ (family : SetObject → SetObject), (∀ (i : SetObject), inst.1 indexSet i → inst.1 U (family i)) → Exists fun image => (inst.1 U image ∧ ((∀ (y : SetObject), inst.1 image y ↔ Exists fun i => (inst.1 indexSet i ∧ y = family i)) ∧ (Exists fun union => (inst.1 U union ∧ (∀ (x : SetObject), inst.1 union x ↔ Exists fun i => (inst.1 indexSet i ∧ inst.1 (family i) x))))))) ∧ (Exists fun omega => (inst.1 U omega ∧ ((Exists fun empty => (inst.1 omega empty ∧ (∀ (x : SetObject), inst.1 empty x → False))) ∧ (∀ (x : SetObject), inst.1 omega x → Exists fun successor => (inst.1 omega successor ∧ (∀ (x_1 : SetObject), inst.1 successor x_1 ↔ Or (inst.1 x x_1) (x_1 = x))))))))))) → Exists fun empty => (inst.1 U empty ∧ (∀ (x : SetObject), inst.1 empty x → False))

Logical form (Lean):

```lean
theorem GrothendieckUniverseContainsEmptySet
    {U : SetObject}
    (universeHypothesis : IsGrothendieckUniverse U) :
    ∃ empty : SetObject, empty ∈ U ∧ IsEmptySet empty
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem GrothendieckUniverseContainsEmptySet
    {U : SetObject}
    (universeHypothesis : IsGrothendieckUniverse U) :
    ∃ empty : SetObject, empty ∈ U ∧ IsEmptySet empty := by
  sorry

end LRA.Set.Constructions.GrothendieckUniverse
