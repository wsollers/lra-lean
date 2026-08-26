import LRA.Set.Constructions.NBGSet.Primitives

namespace LRA.Set.Constructions.NBGSet.Axioms

/--
`Separation` TODO

Predicate logic:

  (∀ A ∈ NBGSet), exists B : NBGSet, forall x : NBGSet, x ∈ B <-> x ∈ A ∧ property x end LRA.Set.Constructions.NBGSet.Axioms

Predicate logic (unfolded):

  ∀ (property : LRA.Set.Constructions.NBGSet → Prop) (A : LRA.Set.Constructions.NBGSet), Exists fun B => ∀ (x : LRA.Set.Constructions.NBGSet), LRA.Set.instMembershipNBGSet.1 B x ↔ (LRA.Set.instMembershipNBGSet.1 A x ∧ property x)

Logical form (Lean):

```lean
axiom Separation (property : NBGSet -> Prop) (A : NBGSet) :
  exists B : NBGSet, forall x : NBGSet, x ∈ B <-> x ∈ A /\ property x
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
axiom Separation (property : NBGSet -> Prop) (A : NBGSet) :
  exists B : NBGSet, forall x : NBGSet, x ∈ B <-> x ∈ A /\ property x

end LRA.Set.Constructions.NBGSet.Axioms
