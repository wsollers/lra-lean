import LRA.Set.Constructions.ZFCSet.Instances
import LRA.Set.Interface.Laws.Membership
import LRA.Set.Interface.Laws.Indexed
import LRA.Set.Interface.Laws.Families

namespace LRA.Set.Constructions.ZFCSet

/--
`SubsetIffAllMembers` TODO

Predicate logic:

  ∀ (A B : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instHasSubset.Subset A B ↔ ∀ (x : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.instMembershipZFCSet.mem A x → LRA.Set.Constructions.instMembershipZFCSet.mem B x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCSet.instHasSubset.Subset A B ↔ ∀ (x : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.instMembershipZFCSet.mem A x → LRA.Set.Constructions.instMembershipZFCSet.mem B x

Logical form (Lean):

```lean
theorem SubsetIffAllMembers :
    ∀ A B : Set, A ⊆ B ↔ ∀ x : Set, x ∈ A → x ∈ B
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
    ∀ A B : Set, A ⊆ B ↔ ∀ x : Set, x ∈ A → x ∈ B := by
  sorry

end LRA.Set.Constructions.ZFCSet
