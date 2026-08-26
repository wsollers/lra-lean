import LRA.Set.Constructions.TGSet.Primitives

namespace LRA.Set.Constructions.TGSet

/--
`EmptySet` TODO

Predicate logic:

  exists A : TGSet, forall x : TGSet, x ∉ A end LRA.Set.Constructions.TG

Predicate logic (unfolded):

  Exists fun A => ∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.instMembershipTGSet.1 A x → False

Logical form (Lean):

```lean
axiom EmptySet : exists A : TGSet, forall x : TGSet, x ∉ A
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
axiom EmptySet : exists A : TGSet, forall x : TGSet, x ∉ A

end LRA.Set.Constructions.TGSet
