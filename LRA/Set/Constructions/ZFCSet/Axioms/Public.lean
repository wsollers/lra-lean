import LRA.Set.Constructions.ZFCSet.Axioms.Definitions
import LRA.Set.Constructions.ZFCSet.Axioms.Theorems

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`SetExtensionality` TODO

Predicate logic:

  ∀ (A B : LRA.Set.Constructions.ZFCSet), (∀ (x : LRA.Set.Constructions.ZFCSet), LRA.Set.Constructions.instMembershipZFCSet.mem A x ↔ LRA.Set.Constructions.instMembershipZFCSet.mem B x) → A = B

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A B : LRA.Set.Constructions.ZFCSet
  Prove
    (∀ (x : LRA.Set.Constructions.ZFCSet), LRA.Set.Constructions.instMembershipZFCSet.mem A x ↔ LRA.Set.Constructions.instMembershipZFCSet.mem B x) → A = B

Logical form (Lean):

```lean
theorem SetExtensionality
    (A B : LRA.Set.Constructions.ZFCSet)
    (sameMembers : ∀ x : LRA.Set.Constructions.ZFCSet, x ∈ A ↔ x ∈ B) :
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
    (A B : LRA.Set.Constructions.ZFCSet)
    (sameMembers : ∀ x : LRA.Set.Constructions.ZFCSet, x ∈ A ↔ x ∈ B) :
    A = B := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
