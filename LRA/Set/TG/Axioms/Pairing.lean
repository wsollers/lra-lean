import LRA.Set.TGSet.Primitives

namespace LRA.Set.TG

/--
`Pairing` TODO

Predicate logic:

  (∀ A B ∈ TGSet), exists C : TGSet, forall x : TGSet, x ∈ C <-> x = A ∨ x = B end LRA.Set.TG

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.TGSet), Exists fun C => ∀ (x : LRA.Set.TGSet), LRA.Set.instMembershipTGSet.1 C x ↔ Or (x = A)(x = B)

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

end LRA.Set.TG
