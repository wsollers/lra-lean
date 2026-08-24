import LRA.Identity.Axioms
import LRA.Set.NBG.Axioms.Extensionality

namespace LRA.Set.NBG

/--
`SetEqualityIffSameMembers` TODO

Predicate logic:

  (∀ A B ∈ LRA.Set.NBGSet), A = B <-> forall x : LRA.Set.NBGSet, x ∈ A <-> x ∈ B

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.NBGSet), A = B ↔ ∀ (x : LRA.Set.NBGSet), LRA.Set.instMembershipNBGSet.1 A x ↔ LRA.Set.instMembershipNBGSet.1 B x

Logical form (Lean):

```lean
theorem SetEqualityIffSameMembers (A B : LRA.Set.NBGSet) :
    A = B <-> forall x : LRA.Set.NBGSet, x ∈ A <-> x ∈ B
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
theorem SetEqualityIffSameMembers (A B : LRA.Set.NBGSet) :
    A = B <-> forall x : LRA.Set.NBGSet, x ∈ A <-> x ∈ B := by
  sorry

/--
`ClassEqualityIffSameMembers` TODO

Predicate logic:

  (∀ A B ∈ LRA.Set.NBGClass), A = B <-> forall x : LRA.Set.NBGSet, x ∈ A <-> x ∈ B

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.NBGClass), A = B ↔ ∀ (x : LRA.Set.NBGSet), LRA.Set.instMembershipNBGSetNBGClass.1 A x ↔ LRA.Set.instMembershipNBGSetNBGClass.1 B x

Logical form (Lean):

```lean
theorem ClassEqualityIffSameMembers (A B : LRA.Set.NBGClass) :
    A = B <-> forall x : LRA.Set.NBGSet, x ∈ A <-> x ∈ B
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
theorem ClassEqualityIffSameMembers (A B : LRA.Set.NBGClass) :
    A = B <-> forall x : LRA.Set.NBGSet, x ∈ A <-> x ∈ B := by
  sorry

end LRA.Set.NBG
