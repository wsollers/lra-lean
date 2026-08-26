import LRA.Set.Constructions.ZFCSet.Primitives

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`Pairing` TODO

Predicate logic:

  (∀ A B ∈ ZFCSet), ∃ C ∈ ZFCSet, ∀ x : ZFCSet, x ∈ C ↔ x = A ∨ x = B end LRA.Set.Constructions.ZFCSet.Axioms

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.ZFCSet), Exists fun C => ∀ (x : LRA.Set.Constructions.ZFCSet), LRA.Set.instMembershipZFCSet.1 C x ↔ Or (x = A)(x = B)

Logical form (Lean):

```lean
axiom Pairing (A B : ZFCSet) :
  ∃ C : ZFCSet, ∀ x : ZFCSet, x ∈ C ↔ x = A ∨ x = B
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
axiom Pairing (A B : ZFCSet) :
  ∃ C : ZFCSet, ∀ x : ZFCSet, x ∈ C ↔ x = A ∨ x = B

end LRA.Set.Constructions.ZFCSet.Axioms
