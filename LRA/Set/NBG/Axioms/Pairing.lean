import LRA.Set.NBGSet.Primitives

namespace LRA.Set.NBG

/--
`Pairing` TODO

Predicate logic:

  (∀ A B ∈ NBGSet), exists C : NBGSet, forall x : NBGSet, x ∈ C <-> x = A ∨ x = B end LRA.Set.NBG

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.NBGSet), Exists fun C => ∀ (x : LRA.Set.NBGSet), LRA.Set.instMembershipNBGSet.1 C x ↔ Or (x = A)(x = B)

Logical form (Lean):

```lean
axiom Pairing (A B : NBGSet) :
  exists C : NBGSet, forall x : NBGSet, x ∈ C <-> x = A \/ x = B
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
axiom Pairing (A B : NBGSet) :
  exists C : NBGSet, forall x : NBGSet, x ∈ C <-> x = A \/ x = B

end LRA.Set.NBG
