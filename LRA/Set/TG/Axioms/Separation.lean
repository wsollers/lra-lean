import LRA.Set.TGSet.Primitives

namespace LRA.Set.TG

/--
`Separation` TODO

Predicate logic:

  (∀ A ∈ TGSet), exists B : TGSet, forall x : TGSet, x ∈ B <-> x ∈ A ∧ property x end LRA.Set.TG

Predicate logic (unfolded):

  ∀ (property : LRA.Set.TGSet → Prop) (A : LRA.Set.TGSet), Exists fun B => ∀ (x : LRA.Set.TGSet), LRA.Set.instMembershipTGSet.1 B x ↔ (LRA.Set.instMembershipTGSet.1 A x ∧ property x)

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

end LRA.Set.TG
