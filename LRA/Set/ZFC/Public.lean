import LRA.Set.ZFC.Definitions
import LRA.Set.ZFC.Theorems

namespace LRA.Set.ZFC

/--
`SetExtensionality` TODO

Predicate logic:

  (∀ A B ∈ LRA.Set.ZFCSet), (∀ x : LRA.Set.ZFCSet, x ∈ A ↔ x ∈ B) → A = B

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.ZFCSet), (∀ (x : LRA.Set.ZFCSet), LRA.Set.instMembershipZFCSet.1 A x ↔ LRA.Set.instMembershipZFCSet.1 B x) → A = B

Logical form (Lean):

```lean
theorem SetExtensionality
    (A B : LRA.Set.ZFCSet)
    (sameMembers : ∀ x : LRA.Set.ZFCSet, x ∈ A ↔ x ∈ B) :
    A = B
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
theorem SetExtensionality
    (A B : LRA.Set.ZFCSet)
    (sameMembers : ∀ x : LRA.Set.ZFCSet, x ∈ A ↔ x ∈ B) :
    A = B := by
  sorry

end LRA.Set.ZFC
