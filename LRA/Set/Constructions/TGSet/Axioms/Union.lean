import LRA.Set.Constructions.TGSet.Primitives

namespace LRA.Set.Constructions.TGSet

/--
`Union` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.TGSet), Exists fun U => ∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem U x ↔ Exists fun B => (LRA.Set.Constructions.instMembershipTGSet.mem A B ∧ LRA.Set.Constructions.instMembershipTGSet.mem B x)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : TGSet
  Prove
    Exists fun U => ∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem U x ↔ Exists fun B => (LRA.Set.Constructions.instMembershipTGSet.mem A B ∧ LRA.Set.Constructions.instMembershipTGSet.mem B x)

Logical form (Lean):

```lean
axiom Union (A : TGSet) :
  exists U : TGSet, forall x : TGSet, x ∈ U <-> exists B : TGSet, B ∈ A /\ x ∈ B
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
axiom Union (A : TGSet) :
  exists U : TGSet, forall x : TGSet, x ∈ U <-> exists B : TGSet, B ∈ A /\ x ∈ B

end LRA.Set.Constructions.TGSet
