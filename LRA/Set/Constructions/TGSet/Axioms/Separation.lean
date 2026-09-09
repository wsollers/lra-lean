import LRA.Set.Constructions.TGSet.Primitives

namespace LRA.Set.Constructions.TGSet

/--
`Separation` TODO

Predicate logic:

  ∀ (property : LRA.Set.Constructions.TGSet → Prop) (A : LRA.Set.Constructions.TGSet), Exists fun B => ∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem B x ↔ (LRA.Set.Constructions.instMembershipTGSet.mem A x ∧ property x)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    property : TGSet -> Prop
    A : TGSet
  Prove
    Exists fun B => ∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem B x ↔ (LRA.Set.Constructions.instMembershipTGSet.mem A x ∧ property x)

Logical form (Lean):

```lean
axiom Separation (property : TGSet -> Prop) (A : TGSet) :
  exists B : TGSet, forall x : TGSet, x ∈ B <-> x ∈ A /\ property x
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
axiom Separation (property : TGSet -> Prop) (A : TGSet) :
  exists B : TGSet, forall x : TGSet, x ∈ B <-> x ∈ A /\ property x

end LRA.Set.Constructions.TGSet
