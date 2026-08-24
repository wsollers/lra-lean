import LRA.Set.ZFCSet.Primitives

namespace LRA.Set.ZFC

/--
`EmptySet` TODO

Predicate logic:

  ∃ A ∈ ZFCSet, ∀ x : ZFCSet, x ∉ A end LRA.Set.ZFC

Predicate logic (unfolded):

  Exists fun A => ∀ (x : LRA.Set.ZFCSet), LRA.Set.instMembershipZFCSet.1 A x → False

Logical form (Lean):

```lean
axiom EmptySet : ∃ A : ZFCSet, ∀ x : ZFCSet, x ∉ A
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
axiom EmptySet : ∃ A : ZFCSet, ∀ x : ZFCSet, x ∉ A

end LRA.Set.ZFC
