import LRA.Set.Constructions.TGSet.Primitives

namespace LRA.Set.Constructions.TG

/--
`GrothendieckUniverse` TODO

Predicate logic:

  (∀ A ∈ TGSet), exists U : TGSet, A ∈ U ∧ forall x ∈ TGSet, x ∈ U -> forall y : TGSet, y ∈ x -> y ∈ U ∧ forall x ∈ TGSet, x ∈ U -> exists P : TGSet, P ∈ U ∧ forall y : TGSet, y ∈ P <-> forall z : TGSet, z ∈ y -> z ∈ x ∧ forall I ∈ TGSet, I ∈ U -> forall family : TGSet -> TGSet, forall i ∈ TGSet, i ∈ I -> family i ∈ U -> exists image : TGSet, image ∈ U ∧ forall y : TGSet, y ∈ image <-> exists i : TGSet, i ∈ I ∧ y = family i ∧ forall I ∈ TGSet, I ∈ U -> forall family : TGSet -> TGSet, forall i ∈ TGSet, i ∈ I -> family i ∈ U -> exists union : TGSet, union ∈ U ∧ forall x : TGSet, x ∈ union <-> exists i : TGSet, i ∈ I ∧ x ∈ family i end LRA.Set.Constructions.TG

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.TGSet), Exists fun U => (LRA.Set.instMembershipTGSet.1 U A ∧ (∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.instMembershipTGSet.1 U x → ∀ (y : LRA.Set.Constructions.TGSet), LRA.Set.instMembershipTGSet.1 x y → LRA.Set.instMembershipTGSet.1 U y ∧ (∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.instMembershipTGSet.1 U x → Exists fun P => (LRA.Set.instMembershipTGSet.1 U P ∧ ∀ (y : LRA.Set.Constructions.TGSet), LRA.Set.instMembershipTGSet.1 P y ↔ ∀ (z : LRA.Set.Constructions.TGSet), LRA.Set.instMembershipTGSet.1 y z → LRA.Set.instMembershipTGSet.1 x z) ∧ (∀ (I : LRA.Set.Constructions.TGSet), LRA.Set.instMembershipTGSet.1 U I → ∀ (family : LRA.Set.Constructions.TGSet → LRA.Set.Constructions.TGSet), (∀ (i : LRA.Set.Constructions.TGSet), LRA.Set.instMembershipTGSet.1 I i → LRA.Set.instMembershipTGSet.1 U (family i)) → Exists fun image => (LRA.Set.instMembershipTGSet.1 U image ∧ ∀ (y : LRA.Set.Constructions.TGSet), LRA.Set.instMembershipTGSet.1 image y ↔ Exists fun i => (LRA.Set.instMembershipTGSet.1 I i ∧ y = family i)) ∧ ∀ (I : LRA.Set.Constructions.TGSet), LRA.Set.instMembershipTGSet.1 U I → ∀ (family : LRA.Set.Constructions.TGSet → LRA.Set.Constructions.TGSet), (∀ (i : LRA.Set.Constructions.TGSet), LRA.Set.instMembershipTGSet.1 I i → LRA.Set.instMembershipTGSet.1 U (family i)) → Exists fun union => (LRA.Set.instMembershipTGSet.1 U union ∧ ∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.instMembershipTGSet.1 union x ↔ Exists fun i => (LRA.Set.instMembershipTGSet.1 I i ∧ LRA.Set.instMembershipTGSet.1 (family i) x))))))

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

end LRA.Set.Constructions.TG
