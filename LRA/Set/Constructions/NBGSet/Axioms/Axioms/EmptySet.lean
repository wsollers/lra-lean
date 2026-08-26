import LRA.Set.Constructions.NBGSet.Primitives

namespace LRA.Set.Constructions.NBGSet.Axioms

/--
`EmptySet` TODO

Predicate logic:

  exists A : NBGSet, forall x : NBGSet, x ∉ A end LRA.Set.Constructions.NBGSet.Axioms

Predicate logic (unfolded):

  Exists fun A => ∀ (x : LRA.Set.Constructions.NBGSet), LRA.Set.instMembershipNBGSet.1 A x → False

Logical form (Lean):

```lean
axiom EmptySet : exists A : NBGSet, forall x : NBGSet, x ∉ A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
axiom EmptySet : exists A : NBGSet, forall x : NBGSet, x ∉ A

end LRA.Set.Constructions.NBGSet.Axioms
