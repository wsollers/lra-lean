import LRA.Set.NBGSet.Primitives

namespace LRA.Set.NBG

/--
`PowerSet` TODO

Predicate logic:

  (∀ A ∈ NBGSet), exists P : NBGSet, forall x : NBGSet, x ∈ P <-> forall y : NBGSet, y ∈ x -> y ∈ A end LRA.Set.NBG

Predicate logic (unfolded):

  ∀ (A : LRA.Set.NBGSet), Exists fun P => ∀ (x : LRA.Set.NBGSet), LRA.Set.instMembershipNBGSet.1 P x ↔ ∀ (y : LRA.Set.NBGSet), LRA.Set.instMembershipNBGSet.1 x y → LRA.Set.instMembershipNBGSet.1 A y

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

end LRA.Set.NBG
