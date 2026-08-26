import LRA.Set.Constructions.TGSet.Primitives

namespace LRA.Set.Constructions.TG

/--
`Union` TODO

Predicate logic:

  (∀ A ∈ TGSet), exists U : TGSet, forall x : TGSet, x ∈ U <-> exists B : TGSet, B ∈ A ∧ x ∈ B end LRA.Set.Constructions.TG

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.TGSet), Exists fun U => ∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.instMembershipTGSet.1 U x ↔ Exists fun B => (LRA.Set.instMembershipTGSet.1 A B ∧ LRA.Set.instMembershipTGSet.1 B x)

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

end LRA.Set.Constructions.TG
