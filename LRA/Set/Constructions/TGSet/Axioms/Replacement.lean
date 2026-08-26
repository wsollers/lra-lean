import LRA.Set.Constructions.TGSet.Primitives

namespace LRA.Set.Constructions.TGSet

/--
`Replacement` TODO

Predicate logic:

  (∀ A ∈ TGSet), forall x ∈ TGSet, x ∈ A -> exists y : TGSet, relation x y ∧ forall other : TGSet, relation x other -> other = y -> exists B : TGSet, forall y : TGSet, y ∈ B <-> exists x : TGSet, x ∈ A ∧ relation x y end LRA.Set.Constructions.TG

Predicate logic (unfolded):

  ∀ (relation : LRA.Set.Constructions.TGSet → LRA.Set.Constructions.TGSet → Prop) (A : LRA.Set.Constructions.TGSet), (∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.instMembershipTGSet.1 A x → Exists fun y => (relation x y ∧ ∀ (other : LRA.Set.Constructions.TGSet), relation x other → other = y)) → Exists fun B => ∀ (y : LRA.Set.Constructions.TGSet), LRA.Set.instMembershipTGSet.1 B y ↔ Exists fun x => (LRA.Set.instMembershipTGSet.1 A x ∧ relation x y)

Logical form (Lean):

```lean
axiom Replacement (relation : TGSet -> TGSet -> Prop) (A : TGSet) :
  (forall x : TGSet, x ∈ A ->
    exists y : TGSet, relation x y /\
      forall other : TGSet, relation x other -> other = y) ->
    exists B : TGSet,
      forall y : TGSet, y ∈ B <-> exists x : TGSet, x ∈ A /\ relation x y
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
axiom Replacement (relation : TGSet -> TGSet -> Prop) (A : TGSet) :
  (forall x : TGSet, x ∈ A ->
    exists y : TGSet, relation x y /\
      forall other : TGSet, relation x other -> other = y) ->
    exists B : TGSet,
      forall y : TGSet, y ∈ B <-> exists x : TGSet, x ∈ A /\ relation x y

end LRA.Set.Constructions.TGSet
