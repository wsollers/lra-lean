import LRA.Set.Constructions.NBGSet.Primitives

namespace LRA.Set.Constructions.NBGSet.Axioms

/--
`PowerSet` TODO

Predicate logic:

  (∀ A ∈ NBGSet), exists P : NBGSet, forall x : NBGSet, x ∈ P <-> forall y : NBGSet, y ∈ x -> y ∈ A end LRA.Set.Constructions.NBGSet.Axioms

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.NBGSet), Exists fun P => ∀ (x : LRA.Set.Constructions.NBGSet), LRA.Set.instMembershipNBGSet.1 P x ↔ ∀ (y : LRA.Set.Constructions.NBGSet), LRA.Set.instMembershipNBGSet.1 x y → LRA.Set.instMembershipNBGSet.1 A y

Logical form (Lean):

```lean
axiom PowerSet (A : NBGSet) :
  exists P : NBGSet, forall x : NBGSet, x ∈ P <-> forall y : NBGSet, y ∈ x -> y ∈ A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, use, rcases

-/
axiom PowerSet (A : NBGSet) :
  exists P : NBGSet, forall x : NBGSet, x ∈ P <-> forall y : NBGSet, y ∈ x -> y ∈ A

end LRA.Set.Constructions.NBGSet.Axioms
