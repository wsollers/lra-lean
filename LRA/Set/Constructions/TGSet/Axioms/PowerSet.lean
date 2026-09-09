import LRA.Set.Constructions.TGSet.Primitives

namespace LRA.Set.Constructions.TGSet

/--
`PowerSet` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.TGSet), Exists fun P => ∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem P x ↔ ∀ (y : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem x y → LRA.Set.Constructions.instMembershipTGSet.mem A y

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : TGSet
  Prove
    Exists fun P => ∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem P x ↔ ∀ (y : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem x y → LRA.Set.Constructions.instMembershipTGSet.mem A y

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

end LRA.Set.Constructions.TGSet
