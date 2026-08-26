import LRA.Set.Constructions.ZFCSet.Primitives

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`Extensionality` TODO

Predicate logic:

  (∀ A B ∈ ZFCSet), ∀ x ∈ ZFCSet, x ∈ A ↔ x ∈ B → A = B end LRA.Set.Constructions.ZFCSet.Axioms

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.ZFCSet), (∀ (x : LRA.Set.Constructions.ZFCSet), LRA.Set.instMembershipZFCSet.1 A x ↔ LRA.Set.instMembershipZFCSet.1 B x) → A = B

Logical form (Lean):

```lean
axiom Extensionality (A B : ZFCSet) :
  (∀ x : ZFCSet, x ∈ A ↔ x ∈ B) → A = B
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
axiom Extensionality (A B : ZFCSet) :
  (∀ x : ZFCSet, x ∈ A ↔ x ∈ B) → A = B

end LRA.Set.Constructions.ZFCSet.Axioms
