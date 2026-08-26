import LRA.Identity.Constructions.Leibniz.Axioms
import LRA.Set.Constructions.ZFCSet.Axioms.Axioms.Extensionality

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`SetEqualityIffSameMembers` TODO

Predicate logic:

  (∀ A B ∈ LRA.Set.Constructions.ZFCSet), A = B ↔ ∀ x : LRA.Set.Constructions.ZFCSet, x ∈ A ↔ x ∈ B

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.ZFCSet), A = B ↔ ∀ (x : LRA.Set.Constructions.ZFCSet), LRA.Set.instMembershipZFCSet.1 A x ↔ LRA.Set.instMembershipZFCSet.1 B x

Logical form (Lean):

```lean
theorem SetEqualityIffSameMembers (A B : LRA.Set.Constructions.ZFCSet) :
    A = B ↔ ∀ x : LRA.Set.Constructions.ZFCSet, x ∈ A ↔ x ∈ B
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
theorem SetEqualityIffSameMembers (A B : LRA.Set.Constructions.ZFCSet) :
    A = B ↔ ∀ x : LRA.Set.Constructions.ZFCSet, x ∈ A ↔ x ∈ B := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
