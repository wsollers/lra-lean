import LRA.Set.Constructions.NBGSet.Primitives

namespace LRA.Set.Constructions.NBGSet.Axioms

/--
`Pairing` TODO

Predicate logic:

  (∀ A B ∈ NBGSet), exists C : NBGSet, forall x : NBGSet, x ∈ C <-> x = A ∨ x = B end LRA.Set.Constructions.NBGSet.Axioms

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.NBGSet), Exists fun C => ∀ (x : LRA.Set.Constructions.NBGSet), LRA.Set.instMembershipNBGSet.1 C x ↔ Or (x = A)(x = B)

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

end LRA.Set.Constructions.NBGSet.Axioms
