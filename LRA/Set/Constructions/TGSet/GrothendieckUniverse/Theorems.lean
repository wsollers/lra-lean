import LRA.Set.Constructions.GrothendieckUniverse.Definitions
import LRA.Set.Constructions.TGSet.Axioms.GrothendieckUniverse
import LRA.Set.Constructions.TGSet.Definitions

namespace LRA.Set.Constructions.TGSet

/--
`GrothendieckUniverseExists` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.TGSet.Set), Exists fun U => LRA.Set.Constructions.TGSet.IsGrothendieckUniverseFor A U

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
  Prove
    Exists fun U => (LRA.Set.Constructions.instMembershipTGSet.1 U A ∧ ((∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 U x → ∀ (y : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 x y → LRA.Set.Constructions.instMembershipTGSet.1 U y) ∧ ((∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 U x → Exists fun P => (LRA.Set.Constructions.instMembershipTGSet.1 U P ∧ (∀ (x_1 : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 P x_1 ↔ ∀ (y : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 x_1 y → LRA.Set.Constructions.instMembershipTGSet.1 x y))) ∧ ((∀ (I : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 U I → ∀ (family : LRA.Set.Constructions.TGSet.Set → LRA.Set.Constructions.TGSet.Set), (∀ (i : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 I i → LRA.Set.Constructions.instMembershipTGSet.1 U (family i)) → Exists fun image => (LRA.Set.Constructions.instMembershipTGSet.1 U image ∧ (∀ (y : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 image y ↔ Exists fun i => (LRA.Set.Constructions.instMembershipTGSet.1 I i ∧ y = family i)))) ∧ (∀ (I : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 U I → ∀ (family : LRA.Set.Constructions.TGSet.Set → LRA.Set.Constructions.TGSet.Set), (∀ (i : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 I i → LRA.Set.Constructions.instMembershipTGSet.1 U (family i)) → Exists fun union => (LRA.Set.Constructions.instMembershipTGSet.1 U union ∧ (∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 union x ↔ Exists fun i => (LRA.Set.Constructions.instMembershipTGSet.1 I i ∧ LRA.Set.Constructions.instMembershipTGSet.1 (family i) x))))))))

Logical form (Lean):

```lean
theorem GrothendieckUniverseExists (A : Set) :
    exists U : Set, IsGrothendieckUniverseFor A U
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
theorem GrothendieckUniverseExists (A : Set) :
    exists U : Set, IsGrothendieckUniverseFor A U := by
  sorry

/--
`TheGrothendieckUniverse` TODO

Predicate logic:

  noncomputable def TheGrothendieckUniverse (A : Set) : Set :=
    Classical.choose (GrothendieckUniverseExists A)

Predicate logic (unfolded):

  noncomputable def TheGrothendieckUniverse (A : Set) : Set :=
    Classical.choose (GrothendieckUniverseExists A) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TheGrothendieckUniverse (A : Set) : Set :=
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
noncomputable def TheGrothendieckUniverse (A : Set) : Set :=
  Classical.choose (GrothendieckUniverseExists A)

/--
`TheGrothendieckUniverseIsGrothendieckUniverseFor` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGSet.IsGrothendieckUniverseFor A (LRA.Set.Constructions.TGSet.TheGrothendieckUniverse A)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
  Prove
    (LRA.Set.Constructions.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TGSet.IsGrothendieckUniverseFor A) ⋯).1 A ∧ ((∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TGSet.IsGrothendieckUniverseFor A) ⋯).1 x → ∀ (y : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 x y → LRA.Set.Constructions.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TGSet.IsGrothendieckUniverseFor A) ⋯).1 y) ∧ ((∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TGSet.IsGrothendieckUniverseFor A) ⋯).1 x → Exists fun P => (LRA.Set.Constructions.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TGSet.IsGrothendieckUniverseFor A) ⋯).1 P ∧ (∀ (x_1 : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 P x_1 ↔ ∀ (y : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 x_1 y → LRA.Set.Constructions.instMembershipTGSet.1 x y))) ∧ ((∀ (I : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TGSet.IsGrothendieckUniverseFor A) ⋯).1 I → ∀ (family : LRA.Set.Constructions.TGSet.Set → LRA.Set.Constructions.TGSet.Set), (∀ (i : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 I i → LRA.Set.Constructions.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TGSet.IsGrothendieckUniverseFor A) ⋯).1 (family i)) → Exists fun image => (LRA.Set.Constructions.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TGSet.IsGrothendieckUniverseFor A) ⋯).1 image ∧ (∀ (y : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 image y ↔ Exists fun i => (LRA.Set.Constructions.instMembershipTGSet.1 I i ∧ y = family i)))) ∧ (∀ (I : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TGSet.IsGrothendieckUniverseFor A) ⋯).1 I → ∀ (family : LRA.Set.Constructions.TGSet.Set → LRA.Set.Constructions.TGSet.Set), (∀ (i : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 I i → LRA.Set.Constructions.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TGSet.IsGrothendieckUniverseFor A) ⋯).1 (family i)) → Exists fun union => (LRA.Set.Constructions.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TGSet.IsGrothendieckUniverseFor A) ⋯).1 union ∧ (∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 union x ↔ Exists fun i => (LRA.Set.Constructions.instMembershipTGSet.1 I i ∧ LRA.Set.Constructions.instMembershipTGSet.1 (family i) x))))))))

Logical form (Lean):

```lean
theorem TheGrothendieckUniverseIsGrothendieckUniverseFor (A : Set) :
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
theorem TheGrothendieckUniverseIsGrothendieckUniverseFor (A : Set) :
    IsGrothendieckUniverseFor A (TheGrothendieckUniverse A) := by
  sorry

/--
`GrothendieckUniverseClosedUnderUnion` TODO

Predicate logic:

  ∀ {A U X : LRA.Set.Constructions.TGSet.Set}, (LRA.Set.Constructions.TGSet.IsGrothendieckUniverseFor A U ∧ LRA.Set.Constructions.instMembershipTGSet.mem U X) → Exists fun union => (LRA.Set.Constructions.instMembershipTGSet.mem U union ∧ LRA.Set.Constructions.TGSet.IsUnionOf X union)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A U X : Set
  Prove
    ((LRA.Set.Constructions.instMembershipTGSet.1 U A ∧ ((∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 U x → ∀ (y : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 x y → LRA.Set.Constructions.instMembershipTGSet.1 U y) ∧ ((∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 U x → Exists fun P => (LRA.Set.Constructions.instMembershipTGSet.1 U P ∧ (∀ (x_1 : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 P x_1 ↔ ∀ (y : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 x_1 y → LRA.Set.Constructions.instMembershipTGSet.1 x y))) ∧ ((∀ (I : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 U I → ∀ (family : LRA.Set.Constructions.TGSet.Set → LRA.Set.Constructions.TGSet.Set), (∀ (i : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 I i → LRA.Set.Constructions.instMembershipTGSet.1 U (family i)) → Exists fun image => (LRA.Set.Constructions.instMembershipTGSet.1 U image ∧ (∀ (y : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 image y ↔ Exists fun i => (LRA.Set.Constructions.instMembershipTGSet.1 I i ∧ y = family i)))) ∧ (∀ (I : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 U I → ∀ (family : LRA.Set.Constructions.TGSet.Set → LRA.Set.Constructions.TGSet.Set), (∀ (i : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 I i → LRA.Set.Constructions.instMembershipTGSet.1 U (family i)) → Exists fun union => (LRA.Set.Constructions.instMembershipTGSet.1 U union ∧ (∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 union x ↔ Exists fun i => (LRA.Set.Constructions.instMembershipTGSet.1 I i ∧ LRA.Set.Constructions.instMembershipTGSet.1 (family i) x)))))))) ∧ LRA.Set.Constructions.instMembershipTGSet.1 U X) → Exists fun union => (LRA.Set.Constructions.instMembershipTGSet.1 U union ∧ (∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 union x ↔ Exists fun B => (LRA.Set.Constructions.instMembershipTGSet.1 X B ∧ LRA.Set.Constructions.instMembershipTGSet.1 B x)))

Logical form (Lean):

```lean
theorem GrothendieckUniverseClosedUnderUnion
    {A U X : Set}
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (XInUniverse : X ∈ U) :
    exists union : Set,
      union ∈ U /\ IsUnionOf X union
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
theorem GrothendieckUniverseClosedUnderUnion
    {A U X : Set}
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (XInUniverse : X ∈ U) :
    exists union : Set,
      union ∈ U /\ IsUnionOf X union := by
  sorry

/--
`GrothendieckUniverseExistsAsGenericUniverse` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.TGSet.Set), Exists fun U => LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
  Prove
    Exists fun U => (LRA.Set.Constructions.instMembershipTGSet.1 U A ∧ ((∀ ⦃x y : LRA.Set.Constructions.TGSet.Set⦄, LRA.Set.Constructions.instMembershipTGSet.1 U x → LRA.Set.Constructions.instMembershipTGSet.1 x y → LRA.Set.Constructions.instMembershipTGSet.1 U y) ∧ ((∀ ⦃x y : LRA.Set.Constructions.TGSet.Set⦄, LRA.Set.Constructions.instMembershipTGSet.1 U x → LRA.Set.Constructions.instMembershipTGSet.1 U y → Exists fun pair => (LRA.Set.Constructions.instMembershipTGSet.1 U pair ∧ (∀ (x_1 : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 pair x_1 ↔ Or (x_1 = x)(x_1 = y)))) ∧ ((∀ ⦃x : LRA.Set.Constructions.TGSet.Set⦄, LRA.Set.Constructions.instMembershipTGSet.1 U x → Exists fun powerSet => (LRA.Set.Constructions.instMembershipTGSet.1 U powerSet ∧ (∀ (x_1 : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 powerSet x_1 ↔ ∀ (y : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 x_1 y → LRA.Set.Constructions.instMembershipTGSet.1 x y))) ∧ ((∀ ⦃indexSet : LRA.Set.Constructions.TGSet.Set⦄, LRA.Set.Constructions.instMembershipTGSet.1 U indexSet → ∀ (family : LRA.Set.Constructions.TGSet.Set → LRA.Set.Constructions.TGSet.Set), (∀ (i : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 indexSet i → LRA.Set.Constructions.instMembershipTGSet.1 U (family i)) → Exists fun image => (LRA.Set.Constructions.instMembershipTGSet.1 U image ∧ ((∀ (y : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 image y ↔ Exists fun i => (LRA.Set.Constructions.instMembershipTGSet.1 indexSet i ∧ y = family i)) ∧ (Exists fun union => (LRA.Set.Constructions.instMembershipTGSet.1 U union ∧ (∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 union x ↔ Exists fun i => (LRA.Set.Constructions.instMembershipTGSet.1 indexSet i ∧ LRA.Set.Constructions.instMembershipTGSet.1 (family i) x))))))) ∧ (Exists fun omega => (LRA.Set.Constructions.instMembershipTGSet.1 U omega ∧ ((Exists fun empty => (LRA.Set.Constructions.instMembershipTGSet.1 omega empty ∧ (∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.mem empty x → False))) ∧ (∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 omega x → Exists fun successor => (LRA.Set.Constructions.instMembershipTGSet.1 omega successor ∧ (∀ (x_1 : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 successor x_1 ↔ Or (LRA.Set.Constructions.instMembershipTGSet.1 x x_1) (x_1 = x))))))))))))

Logical form (Lean):

```lean
theorem GrothendieckUniverseExistsAsGenericUniverse (A : Set) :
    ∃ U : Set,
      LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U
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
theorem GrothendieckUniverseExistsAsGenericUniverse (A : Set) :
    ∃ U : Set,
      LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U := by
  sorry

end LRA.Set.Constructions.TGSet

