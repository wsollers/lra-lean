import LRA.Set.Constructions.NBGSet.Primitives

namespace LRA.Set.Constructions.NBGSet.Axioms

/--
`Replacement` TODO

Predicate logic:

  (∀ A ∈ NBGSet), forall x ∈ NBGSet, x ∈ A -> exists y : NBGSet, relation x y ∧ forall other : NBGSet, relation x other -> other = y -> exists B : NBGSet, forall y : NBGSet, y ∈ B <-> exists x : NBGSet, x ∈ A ∧ relation x y end LRA.Set.Constructions.NBGSet.Axioms

Predicate logic (unfolded):

  ∀ (relation : LRA.Set.Constructions.NBGSet → LRA.Set.Constructions.NBGSet → Prop) (A : LRA.Set.Constructions.NBGSet), (∀ (x : LRA.Set.Constructions.NBGSet), LRA.Set.instMembershipNBGSet.1 A x → Exists fun y => (relation x y ∧ ∀ (other : LRA.Set.Constructions.NBGSet), relation x other → other = y)) → Exists fun B => ∀ (y : LRA.Set.Constructions.NBGSet), LRA.Set.instMembershipNBGSet.1 B y ↔ Exists fun x => (LRA.Set.instMembershipNBGSet.1 A x ∧ relation x y)

Logical form (Lean):

```lean
axiom Replacement (relation : NBGSet -> NBGSet -> Prop) (A : NBGSet) :
  (forall x : NBGSet, x ∈ A ->
    exists y : NBGSet, relation x y /\
      forall other : NBGSet, relation x other -> other = y) ->
    exists B : NBGSet,
      forall y : NBGSet, y ∈ B <-> exists x : NBGSet, x ∈ A /\ relation x y
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
axiom Replacement (relation : NBGSet -> NBGSet -> Prop) (A : NBGSet) :
  (forall x : NBGSet, x ∈ A ->
    exists y : NBGSet, relation x y /\
      forall other : NBGSet, relation x other -> other = y) ->
    exists B : NBGSet,
      forall y : NBGSet, y ∈ B <-> exists x : NBGSet, x ∈ A /\ relation x y

end LRA.Set.Constructions.NBGSet.Axioms
