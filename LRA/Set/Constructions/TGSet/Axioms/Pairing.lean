import LRA.Set.Constructions.TGSet.Primitives

namespace LRA.Set.Constructions.TGSet

/--
`Pairing` TODO

Predicate logic:

  (∀ A B ∈ TGSet), exists C : TGSet, forall x : TGSet, x ∈ C <-> x = A ∨ x = B end LRA.Set.Constructions.TG

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.TGSet), Exists fun C => ∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.instMembershipTGSet.1 C x ↔ Or (x = A)(x = B)

Logical form (Lean):

```lean
axiom Pairing (A B : TGSet) :
  exists C : TGSet, forall x : TGSet, x ∈ C <-> x = A \/ x = B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, Or.inl, Or.inr, cases, rcases, use

-/
axiom Pairing (A B : TGSet) :
  exists C : TGSet, forall x : TGSet, x ∈ C <-> x = A \/ x = B

end LRA.Set.Constructions.TGSet
