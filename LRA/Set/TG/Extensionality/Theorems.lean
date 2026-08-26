import LRA.Identity.Constructions.Leibniz.Axioms
import LRA.Set.TG.Axioms.Extensionality

namespace LRA.Set.TG

/--
`SetEqualityIffSameMembers` TODO

Predicate logic:

  (∀ A B ∈ LRA.Set.TGSet), A = B <-> forall x : LRA.Set.TGSet, x ∈ A <-> x ∈ B

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.TGSet), A = B ↔ ∀ (x : LRA.Set.TGSet), LRA.Set.instMembershipTGSet.1 A x ↔ LRA.Set.instMembershipTGSet.1 B x

Logical form (Lean):

```lean
theorem SetEqualityIffSameMembers (A B : LRA.Set.TGSet) :
    A = B <-> forall x : LRA.Set.TGSet, x ∈ A <-> x ∈ B
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
theorem SetEqualityIffSameMembers (A B : LRA.Set.TGSet) :
    A = B <-> forall x : LRA.Set.TGSet, x ∈ A <-> x ∈ B := by
  sorry

end LRA.Set.TG
