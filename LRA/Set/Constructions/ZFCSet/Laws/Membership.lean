import LRA.Set.Constructions.ZFCSet.Instances
import LRA.Set.Interface.Membership
import LRA.Set.Interface.Indexed
import LRA.Set.Interface.Families

namespace LRA.Set.Constructions.ZFCSet

/--
`SubsetIffAllMembers` TODO

Predicate logic:

  ∀ A B : Set, A ⊆ B ↔ ∀ x : Set, x ∈ A → x ∈ B

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instHasSubset.1 A B ↔ ∀ (x : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.instMembershipZFCSet.1 A x → LRA.Set.instMembershipZFCSet.1 B x

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
