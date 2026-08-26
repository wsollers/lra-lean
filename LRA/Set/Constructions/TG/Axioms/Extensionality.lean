import LRA.Set.Constructions.TGSet.Primitives

namespace LRA.Set.Constructions.TG

/--
`Extensionality` TODO

Predicate logic:

  (∀ A B ∈ TGSet), forall x ∈ TGSet, x ∈ A <-> x ∈ B -> A = B end LRA.Set.Constructions.TG

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.TGSet), (∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.instMembershipTGSet.1 A x ↔ LRA.Set.instMembershipTGSet.1 B x) → A = B

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

end LRA.Set.Constructions.TG
