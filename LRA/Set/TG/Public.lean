import LRA.Set.TG.Definitions
import LRA.Set.TG.Theorems

namespace LRA.Set.TG

/--
`SetExtensionality` TODO

Predicate logic:

  (∀ A B ∈ LRA.Set.TGSet), (forall x : LRA.Set.TGSet, x ∈ A <-> x ∈ B) → A = B

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.TGSet), (∀ (x : LRA.Set.TGSet), LRA.Set.instMembershipTGSet.1 A x ↔ LRA.Set.instMembershipTGSet.1 B x) → A = B

Logical form (Lean):

```lean
theorem SetExtensionality
    (A B : LRA.Set.TGSet)
    (sameMembers : forall x : LRA.Set.TGSet, x ∈ A <-> x ∈ B) :
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
    (A B : LRA.Set.TGSet)
    (sameMembers : forall x : LRA.Set.TGSet, x ∈ A <-> x ∈ B) :
    A = B := by
  sorry

end LRA.Set.TG
