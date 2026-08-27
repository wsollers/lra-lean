import LRA.Set.Constructions.TypeSet.Instances
import LRA.Set.Interface.Membership
import LRA.Set.Interface.Indexed
import LRA.Set.Interface.Families

namespace LRA.Set.Constructions.TypeSet

universe u

variable {Alpha : Type u}

/--
`NotMemberOfEmpty` TODO

Predicate logic:

  ∀ x : Alpha, x ∉ ∅ ∈ LRA.Set.Constructions.TypeSet Alpha

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (x : Alpha), LRA.Set.instMembershipTypeSet.1 LRA.Set.Constructions.TypeSet.instEmptyCollection.1 x → False

Logical form (Lean):

```lean
theorem NotMemberOfEmpty :
    ∀ x : Alpha, x ∉ (∅ : LRA.Set.Constructions.TypeSet Alpha)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem NotMemberOfEmpty :
    ∀ x : Alpha, x ∉ (∅ : LRA.Set.Constructions.TypeSet Alpha) := by
  sorry

end LRA.Set.Constructions.TypeSet
