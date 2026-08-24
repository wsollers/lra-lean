import LRA.Set.ZFCSet.Primitives

namespace LRA.Set.ZFC

/--
`Pairing` TODO

Predicate logic:

  (∀ A B ∈ ZFCSet), ∃ C ∈ ZFCSet, ∀ x : ZFCSet, x ∈ C ↔ x = A ∨ x = B end LRA.Set.ZFC

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.ZFCSet), Exists fun C => ∀ (x : LRA.Set.ZFCSet), LRA.Set.instMembershipZFCSet.1 C x ↔ Or (x = A)(x = B)

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

end LRA.Set.ZFC
