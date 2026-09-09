import LRA.Set.Constructions.ZFCSet.Primitives

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`EmptySet` TODO

Predicate logic:

  Exists fun A => ∀ (x : LRA.Set.Constructions.ZFCSet), ¬ LRA.Set.Constructions.instMembershipZFCSet.mem A x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun A => ∀ (x : LRA.Set.Constructions.ZFCSet), LRA.Set.Constructions.instMembershipZFCSet.1 A x → False

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

end LRA.Set.Constructions.ZFCSet.Axioms
