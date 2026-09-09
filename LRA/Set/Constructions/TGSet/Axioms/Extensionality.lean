import LRA.Set.Constructions.TGSet.Primitives

namespace LRA.Set.Constructions.TGSet

/--
`Extensionality` TODO

Predicate logic:

  ∀ (A B : LRA.Set.Constructions.TGSet), (∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem A x ↔ LRA.Set.Constructions.instMembershipTGSet.mem B x) → A = B

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A B : TGSet
  Prove
    (∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem A x ↔ LRA.Set.Constructions.instMembershipTGSet.mem B x) → A = B

Logical form (Lean):

```lean
axiom Extensionality (A B : TGSet) :
  (forall x : TGSet, x ∈ A <-> x ∈ B) -> A = B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
axiom Extensionality (A B : TGSet) :
  (forall x : TGSet, x ∈ A <-> x ∈ B) -> A = B

end LRA.Set.Constructions.TGSet
