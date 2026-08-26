import LRA.Set.Constructions.NBGSet.Primitives

namespace LRA.Set.Constructions.NBGSet.Axioms

/--
`ClassExtensionality` TODO

Predicate logic:

  (∀ A B ∈ NBGClass), forall x ∈ NBGSet, x ∈ A <-> x ∈ B -> A = B

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.NBGClass), (∀ (x : LRA.Set.Constructions.NBGSet), LRA.Set.instMembershipNBGSetNBGClass.1 A x ↔ LRA.Set.instMembershipNBGSetNBGClass.1 B x) → A = B

Logical form (Lean):

```lean
axiom ClassExtensionality (A B : NBGClass) :
  (forall x : NBGSet, x ∈ A <-> x ∈ B) -> A = B
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
axiom ClassExtensionality (A B : NBGClass) :
  (forall x : NBGSet, x ∈ A <-> x ∈ B) -> A = B

/--
`Extensionality` TODO

Predicate logic:

  (∀ A B ∈ NBGSet), forall x ∈ NBGSet, x ∈ A <-> x ∈ B -> A = B end LRA.Set.Constructions.NBGSet.Axioms

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.NBGSet), (∀ (x : LRA.Set.Constructions.NBGSet), LRA.Set.instMembershipNBGSet.1 A x ↔ LRA.Set.instMembershipNBGSet.1 B x) → A = B

Logical form (Lean):

```lean
axiom Extensionality (A B : NBGSet) :
  (forall x : NBGSet, x ∈ A <-> x ∈ B) -> A = B
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
axiom Extensionality (A B : NBGSet) :
  (forall x : NBGSet, x ∈ A <-> x ∈ B) -> A = B

end LRA.Set.Constructions.NBGSet.Axioms
