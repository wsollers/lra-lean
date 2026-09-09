import LRA.Set.Constructions.ZFCSet.Axioms.Foundation.Existence

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`NoSetIsMemberOfItself` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set), ¬ LRA.Set.Constructions.instMembershipZFCSet.mem A A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
  Prove
    LRA.Set.Constructions.instMembershipZFCSet.1 A A → False

Logical form (Lean):

```lean
theorem NoSetIsMemberOfItself (A : Set) :
    A ∉ A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem NoSetIsMemberOfItself (A : Set) :
    A ∉ A := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
