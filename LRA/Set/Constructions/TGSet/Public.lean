import LRA.Set.Constructions.TGSet.Definitions
import LRA.Set.Constructions.TGSet.Theorems

namespace LRA.Set.Constructions.TGSet

/--
`SetExtensionality` TODO

Predicate logic:

  ∀ (A B : LRA.Set.Constructions.TGSet), (∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem A x ↔ LRA.Set.Constructions.instMembershipTGSet.mem B x) → A = B

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A B : LRA.Set.Constructions.TGSet
  Prove
    (∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem A x ↔ LRA.Set.Constructions.instMembershipTGSet.mem B x) → A = B

Logical form (Lean):

```lean
theorem SetExtensionality
    (A B : LRA.Set.Constructions.TGSet)
    (sameMembers : forall x : LRA.Set.Constructions.TGSet, x ∈ A <-> x ∈ B) :
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
    (A B : LRA.Set.Constructions.TGSet)
    (sameMembers : forall x : LRA.Set.Constructions.TGSet, x ∈ A <-> x ∈ B) :
    A = B := by
  sorry

end LRA.Set.Constructions.TGSet

