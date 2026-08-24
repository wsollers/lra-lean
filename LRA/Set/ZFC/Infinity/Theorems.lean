import LRA.Set.ZFC.Axioms.Infinity
import LRA.Set.ZFC.Definitions

namespace LRA.Set.ZFC

/--
`InductiveSetExists` TODO

Predicate logic:

  ∃ A ∈ Set, IsInductiveSet A

Predicate logic (unfolded):

  Exists fun A => (Exists fun empty => (LRA.Set.instMembershipZFCSet.1 A empty ∧ ∀ (x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 empty x → False) ∧ ∀ (x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 A x → Exists fun successor => (LRA.Set.instMembershipZFCSet.1 A successor ∧ ∀ (w : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 successor w ↔ Or (LRA.Set.instMembershipZFCSet.1 x w) (w = x)))

Logical form (Lean):

```lean
theorem InductiveSetExists :
    ∃ A : Set, IsInductiveSet A
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
theorem InductiveSetExists :
    ∃ A : Set, IsInductiveSet A := by
  sorry

end LRA.Set.ZFC
