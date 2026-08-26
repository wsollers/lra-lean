import LRA.Identity.Constructions.Leibniz.Axioms
import LRA.Set.Constructions.NBGSet.Axioms.Axioms.Extensionality

namespace LRA.Set.Constructions.NBGSet.Axioms

/--
`SetEqualityIffSameMembers` TODO

Predicate logic:

  (∀ A B ∈ LRA.Set.Constructions.NBGSet), A = B <-> forall x : LRA.Set.Constructions.NBGSet, x ∈ A <-> x ∈ B

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.NBGSet), A = B ↔ ∀ (x : LRA.Set.Constructions.NBGSet), LRA.Set.instMembershipNBGSet.1 A x ↔ LRA.Set.instMembershipNBGSet.1 B x

Logical form (Lean):

```lean
theorem SetEqualityIffSameMembers (A B : LRA.Set.Constructions.NBGSet) :
    A = B <-> forall x : LRA.Set.Constructions.NBGSet, x ∈ A <-> x ∈ B
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
theorem SetEqualityIffSameMembers (A B : LRA.Set.Constructions.NBGSet) :
    A = B <-> forall x : LRA.Set.Constructions.NBGSet, x ∈ A <-> x ∈ B := by
  sorry

/--
`ClassEqualityIffSameMembers` TODO

Predicate logic:

  (∀ A B ∈ LRA.Set.Constructions.NBGClass), A = B <-> forall x : LRA.Set.Constructions.NBGSet, x ∈ A <-> x ∈ B

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.NBGClass), A = B ↔ ∀ (x : LRA.Set.Constructions.NBGSet), LRA.Set.instMembershipNBGSetNBGClass.1 A x ↔ LRA.Set.instMembershipNBGSetNBGClass.1 B x

Logical form (Lean):

```lean
theorem ClassEqualityIffSameMembers (A B : LRA.Set.Constructions.NBGClass) :
    A = B <-> forall x : LRA.Set.Constructions.NBGSet, x ∈ A <-> x ∈ B
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
theorem ClassEqualityIffSameMembers (A B : LRA.Set.Constructions.NBGClass) :
    A = B <-> forall x : LRA.Set.Constructions.NBGSet, x ∈ A <-> x ∈ B := by
  sorry

end LRA.Set.Constructions.NBGSet.Axioms
