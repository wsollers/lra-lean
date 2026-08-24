import LRA.Set.TGSet.Primitives

namespace LRA.Set.TG

/--
`PowerSet` TODO

Predicate logic:

  (∀ A ∈ TGSet), exists P : TGSet, forall x : TGSet, x ∈ P <-> forall y : TGSet, y ∈ x -> y ∈ A end LRA.Set.TG

Predicate logic (unfolded):

  ∀ (A : LRA.Set.TGSet), Exists fun P => ∀ (x : LRA.Set.TGSet), LRA.Set.instMembershipTGSet.1 P x ↔ ∀ (y : LRA.Set.TGSet), LRA.Set.instMembershipTGSet.1 x y → LRA.Set.instMembershipTGSet.1 A y

Logical form (Lean):

```lean
axiom PowerSet (A : TGSet) :
  exists P : TGSet, forall x : TGSet, x ∈ P <-> forall y : TGSet, y ∈ x -> y ∈ A
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
axiom PowerSet (A : TGSet) :
  exists P : TGSet, forall x : TGSet, x ∈ P <-> forall y : TGSet, y ∈ x -> y ∈ A

end LRA.Set.TG
