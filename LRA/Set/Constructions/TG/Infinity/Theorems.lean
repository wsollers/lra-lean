import LRA.Set.Constructions.TG.Axioms.Infinity
import LRA.Set.Constructions.TG.Definitions

namespace LRA.Set.Constructions.TG

/--
`InductiveSetExists` TODO

Predicate logic:

  exists A : Set, IsInductiveSet A

Predicate logic (unfolded):

  Exists fun A => (Exists fun empty => (LRA.Set.instMembershipTGSet.1 A empty ∧ ∀ (x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 empty x → False) ∧ ∀ (x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 A x → Exists fun successor => (LRA.Set.instMembershipTGSet.1 A successor ∧ ∀ (w : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 successor w ↔ Or (LRA.Set.instMembershipTGSet.1 x w) (w = x)))

Logical form (Lean):

```lean
theorem InductiveSetExists : exists A : Set, IsInductiveSet A
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
theorem InductiveSetExists : exists A : Set, IsInductiveSet A := by
  sorry

end LRA.Set.Constructions.TG
