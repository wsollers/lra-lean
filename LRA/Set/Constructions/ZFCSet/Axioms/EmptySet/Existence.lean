import LRA.Set.Constructions.ZFCSet.Axioms.EmptySet.Axiom
import LRA.Set.Constructions.ZFCSet.Axioms.EmptySet.Definitions

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`EmptySetExists` TODO

Predicate logic:

  Exists fun A => LRA.Set.Constructions.ZFCSet.Axioms.IsEmptySet A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun A => ∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 A x → False

Logical form (Lean):

```lean
theorem EmptySetExists :
    ∃ A : Set, IsEmptySet A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem EmptySetExists :
    ∃ A : Set, IsEmptySet A := by
  exact  EmptySet

end LRA.Set.Constructions.ZFCSet.Axioms
