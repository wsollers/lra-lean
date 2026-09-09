import LRA.Set.Constructions.TGSet.Primitives

namespace LRA.Set.Constructions.TGSet

/--
`GrothendieckUniverse` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.TGSet), Exists fun U => (LRA.Set.Constructions.instMembershipTGSet.mem U A ∧ ((∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem U x → ∀ (y : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem x y → LRA.Set.Constructions.instMembershipTGSet.mem U y) ∧ ((∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem U x → Exists fun P => (LRA.Set.Constructions.instMembershipTGSet.mem U P ∧ (∀ (y : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem P y ↔ ∀ (z : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem y z → LRA.Set.Constructions.instMembershipTGSet.mem x z))) ∧ ((∀ (I : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem U I → ∀ (family : LRA.Set.Constructions.TGSet → LRA.Set.Constructions.TGSet), (∀ (i : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem I i → LRA.Set.Constructions.instMembershipTGSet.mem U (family i)) → Exists fun image => (LRA.Set.Constructions.instMembershipTGSet.mem U image ∧ (∀ (y : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem image y ↔ Exists fun i => (LRA.Set.Constructions.instMembershipTGSet.mem I i ∧ y = family i)))) ∧ (∀ (I : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem U I → ∀ (family : LRA.Set.Constructions.TGSet → LRA.Set.Constructions.TGSet), (∀ (i : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem I i → LRA.Set.Constructions.instMembershipTGSet.mem U (family i)) → Exists fun union => (LRA.Set.Constructions.instMembershipTGSet.mem U union ∧ (∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem union x ↔ Exists fun i => (LRA.Set.Constructions.instMembershipTGSet.mem I i ∧ LRA.Set.Constructions.instMembershipTGSet.mem (family i) x))))))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : TGSet
  Prove
    Exists fun U => (LRA.Set.Constructions.instMembershipTGSet.mem U A ∧ ((∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem U x → ∀ (y : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem x y → LRA.Set.Constructions.instMembershipTGSet.mem U y) ∧ ((∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem U x → Exists fun P => (LRA.Set.Constructions.instMembershipTGSet.mem U P ∧ (∀ (y : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem P y ↔ ∀ (z : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem y z → LRA.Set.Constructions.instMembershipTGSet.mem x z))) ∧ ((∀ (I : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem U I → ∀ (family : LRA.Set.Constructions.TGSet → LRA.Set.Constructions.TGSet), (∀ (i : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem I i → LRA.Set.Constructions.instMembershipTGSet.mem U (family i)) → Exists fun image => (LRA.Set.Constructions.instMembershipTGSet.mem U image ∧ (∀ (y : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem image y ↔ Exists fun i => (LRA.Set.Constructions.instMembershipTGSet.mem I i ∧ y = family i)))) ∧ (∀ (I : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem U I → ∀ (family : LRA.Set.Constructions.TGSet → LRA.Set.Constructions.TGSet), (∀ (i : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem I i → LRA.Set.Constructions.instMembershipTGSet.mem U (family i)) → Exists fun union => (LRA.Set.Constructions.instMembershipTGSet.mem U union ∧ (∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem union x ↔ Exists fun i => (LRA.Set.Constructions.instMembershipTGSet.mem I i ∧ LRA.Set.Constructions.instMembershipTGSet.mem (family i) x))))))))

Logical form (Lean):

```lean
axiom GrothendieckUniverse (A : TGSet) :
  exists U : TGSet,
    A ∈ U /\
    (forall x : TGSet, x ∈ U -> forall y : TGSet, y ∈ x -> y ∈ U) /\
    (forall x : TGSet, x ∈ U -> exists P : TGSet,
      P ∈ U /\ forall y : TGSet, y ∈ P <-> forall z : TGSet, z ∈ y -> z ∈ x) /\
    (forall I : TGSet, I ∈ U ->
      forall family : TGSet -> TGSet,
        (forall i : TGSet, i ∈ I -> family i ∈ U) ->
          exists image : TGSet,
            image ∈ U /\
            forall y : TGSet, y ∈ image <-> exists i : TGSet, i ∈ I /\ y = family i) /\
    (forall I : TGSet, I ∈ U ->
      forall family : TGSet -> TGSet,
        (forall i : TGSet, i ∈ I -> family i ∈ U) ->
          exists union : TGSet,
            union ∈ U /\
            forall x : TGSet, x ∈ union <-> exists i : TGSet, i ∈ I /\ x ∈ family i)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, use

-/
axiom GrothendieckUniverse (A : TGSet) :
  exists U : TGSet,
    A ∈ U /\
    (forall x : TGSet, x ∈ U -> forall y : TGSet, y ∈ x -> y ∈ U) /\
    (forall x : TGSet, x ∈ U -> exists P : TGSet,
      P ∈ U /\ forall y : TGSet, y ∈ P <-> forall z : TGSet, z ∈ y -> z ∈ x) /\
    (forall I : TGSet, I ∈ U ->
      forall family : TGSet -> TGSet,
        (forall i : TGSet, i ∈ I -> family i ∈ U) ->
          exists image : TGSet,
            image ∈ U /\
            forall y : TGSet, y ∈ image <-> exists i : TGSet, i ∈ I /\ y = family i) /\
    (forall I : TGSet, I ∈ U ->
      forall family : TGSet -> TGSet,
        (forall i : TGSet, i ∈ I -> family i ∈ U) ->
          exists union : TGSet,
            union ∈ U /\
            forall x : TGSet, x ∈ union <-> exists i : TGSet, i ∈ I /\ x ∈ family i)

end LRA.Set.Constructions.TGSet
