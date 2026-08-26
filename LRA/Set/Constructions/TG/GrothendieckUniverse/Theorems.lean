import LRA.Set.Constructions.GrothendieckUniverse.Definitions
import LRA.Set.Constructions.TG.Axioms.GrothendieckUniverse
import LRA.Set.Constructions.TG.Definitions

namespace LRA.Set.Constructions.TG

/--
`GrothendieckUniverseExists` TODO

Predicate logic:

  (∀ A ∈ Set), exists U : Set, IsGrothendieckUniverseFor A U

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.TG.Set), Exists fun U => (LRA.Set.instMembershipTGSet.1 U A ∧ (∀ (x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 U x → ∀ (y : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 x y → LRA.Set.instMembershipTGSet.1 U y ∧ (∀ (x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 U x → Exists fun P => (LRA.Set.instMembershipTGSet.1 U P ∧ ∀ (x_1 : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 P x_1 ↔ ∀ (y : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 x_1 y → LRA.Set.instMembershipTGSet.1 x y) ∧ (∀ (I : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 U I → ∀ (family : LRA.Set.Constructions.TG.Set → LRA.Set.Constructions.TG.Set), (∀ (i : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 I i → LRA.Set.instMembershipTGSet.1 U (family i)) → Exists fun image => (LRA.Set.instMembershipTGSet.1 U image ∧ ∀ (y : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 image y ↔ Exists fun i => (LRA.Set.instMembershipTGSet.1 I i ∧ y = family i)) ∧ ∀ (I : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 U I → ∀ (family : LRA.Set.Constructions.TG.Set → LRA.Set.Constructions.TG.Set), (∀ (i : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 I i → LRA.Set.instMembershipTGSet.1 U (family i)) → Exists fun union => (LRA.Set.instMembershipTGSet.1 U union ∧ ∀ (x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 union x ↔ Exists fun i => (LRA.Set.instMembershipTGSet.1 I i ∧ LRA.Set.instMembershipTGSet.1 (family i) x))))))

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

  (∀ A ∈ Set), IsGrothendieckUniverseFor A (TheGrothendieckUniverse A)

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.TG.Set), (LRA.Set.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TG.IsGrothendieckUniverseFor A) ⋯).1 A ∧ (∀ (x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TG.IsGrothendieckUniverseFor A) ⋯).1 x → ∀ (y : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 x y → LRA.Set.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TG.IsGrothendieckUniverseFor A) ⋯).1 y ∧ (∀ (x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TG.IsGrothendieckUniverseFor A) ⋯).1 x → Exists fun P => (LRA.Set.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TG.IsGrothendieckUniverseFor A) ⋯).1 P ∧ ∀ (x_1 : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 P x_1 ↔ ∀ (y : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 x_1 y → LRA.Set.instMembershipTGSet.1 x y) ∧ (∀ (I : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TG.IsGrothendieckUniverseFor A) ⋯).1 I → ∀ (family : LRA.Set.Constructions.TG.Set → LRA.Set.Constructions.TG.Set), (∀ (i : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 I i → LRA.Set.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TG.IsGrothendieckUniverseFor A) ⋯).1 (family i)) → Exists fun image => (LRA.Set.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TG.IsGrothendieckUniverseFor A) ⋯).1 image ∧ ∀ (y : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 image y ↔ Exists fun i => (LRA.Set.instMembershipTGSet.1 I i ∧ y = family i)) ∧ ∀ (I : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TG.IsGrothendieckUniverseFor A) ⋯).1 I → ∀ (family : LRA.Set.Constructions.TG.Set → LRA.Set.Constructions.TG.Set), (∀ (i : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 I i → LRA.Set.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TG.IsGrothendieckUniverseFor A) ⋯).1 (family i)) → Exists fun union => (LRA.Set.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TG.IsGrothendieckUniverseFor A) ⋯).1 union ∧ ∀ (x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 union x ↔ Exists fun i => (LRA.Set.instMembershipTGSet.1 I i ∧ LRA.Set.instMembershipTGSet.1 (family i) x))))))

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

  (IsGrothendieckUniverseFor A U ∧ X ∈ U) → exists union : Set, union ∈ U ∧ IsUnionOf X union

Predicate logic (unfolded):

  ∀ {A U X : LRA.Set.Constructions.TG.Set}, ((LRA.Set.instMembershipTGSet.1 U A ∧ (∀ (x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 U x → ∀ (y : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 x y → LRA.Set.instMembershipTGSet.1 U y ∧ (∀ (x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 U x → Exists fun P => (LRA.Set.instMembershipTGSet.1 U P ∧ ∀ (x_1 : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 P x_1 ↔ ∀ (y : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 x_1 y → LRA.Set.instMembershipTGSet.1 x y) ∧ (∀ (I : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 U I → ∀ (family : LRA.Set.Constructions.TG.Set → LRA.Set.Constructions.TG.Set), (∀ (i : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 I i → LRA.Set.instMembershipTGSet.1 U (family i)) → Exists fun image => (LRA.Set.instMembershipTGSet.1 U image ∧ ∀ (y : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 image y ↔ Exists fun i => (LRA.Set.instMembershipTGSet.1 I i ∧ y = family i)) ∧ ∀ (I : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 U I → ∀ (family : LRA.Set.Constructions.TG.Set → LRA.Set.Constructions.TG.Set), (∀ (i : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 I i → LRA.Set.instMembershipTGSet.1 U (family i)) → Exists fun union => (LRA.Set.instMembershipTGSet.1 U union ∧ ∀ (x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 union x ↔ Exists fun i => (LRA.Set.instMembershipTGSet.1 I i ∧ LRA.Set.instMembershipTGSet.1 (family i) x)))))) ∧ LRA.Set.instMembershipTGSet.1 U X) → Exists fun union => (LRA.Set.instMembershipTGSet.1 U union ∧ ∀ (x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 union x ↔ Exists fun B => (LRA.Set.instMembershipTGSet.1 X B ∧ LRA.Set.instMembershipTGSet.1 B x))

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

theorem GrothendieckUniverseExistsAsGenericUniverse (A : Set) :
    ∃ U : Set,
      LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U := by
  sorry

end LRA.Set.Constructions.TG
