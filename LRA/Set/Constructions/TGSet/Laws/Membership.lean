import LRA.Set.Constructions.TGSet.Instances
import LRA.Set.Interface.Laws.Membership
import LRA.Set.Interface.Laws.Indexed
import LRA.Set.Interface.Laws.Families

namespace LRA.Set.Constructions.TGSet

/--
`SubsetIffAllMembers` TODO

Predicate logic:

  ∀ (A B : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGSet.instHasSubset.Subset A B ↔ ∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.mem A x → LRA.Set.Constructions.instMembershipTGSet.mem B x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGSet.instHasSubset.Subset A B ↔ ∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.mem A x → LRA.Set.Constructions.instMembershipTGSet.mem B x

Logical form (Lean):

```lean
theorem SubsetIffAllMembers :
    forall A B : Set, A ⊆ B <-> forall x : Set, x ∈ A -> x ∈ B
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
theorem SubsetIffAllMembers :
    forall A B : Set, A ⊆ B <-> forall x : Set, x ∈ A -> x ∈ B := by
  sorry

end LRA.Set.Constructions.TGSet

