import LRA.Set.Constructions.TGSet.Axioms.Infinity
import LRA.Set.Constructions.TGSet.Definitions

namespace LRA.Set.Constructions.TGSet

/--
`InductiveSetExists` TODO

Predicate logic:

  Exists fun A => LRA.Set.Constructions.TGSet.IsInductiveSet A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun A => ((Exists fun empty => (LRA.Set.Constructions.instMembershipTGSet.1 A empty ∧ (∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 empty x → False))) ∧ (∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 A x → Exists fun successor => (LRA.Set.Constructions.instMembershipTGSet.1 A successor ∧ (∀ (w : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 successor w ↔ Or (LRA.Set.Constructions.instMembershipTGSet.1 x w) (w = x)))))

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

end LRA.Set.Constructions.TGSet

