import LRA.Set.NBG.Definitions
import LRA.Set.NBG.Theorems

namespace LRA.Set.NBG

/--
`SetExtensionality` TODO

Predicate logic:

  (∀ A B ∈ LRA.Set.NBGSet), (forall x : LRA.Set.NBGSet, x ∈ A <-> x ∈ B) → A = B

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.NBGSet), (∀ (x : LRA.Set.NBGSet), LRA.Set.instMembershipNBGSet.1 A x ↔ LRA.Set.instMembershipNBGSet.1 B x) → A = B

Logical form (Lean):

```lean
theorem SetExtensionality
    (A B : LRA.Set.NBGSet)
    (sameMembers : forall x : LRA.Set.NBGSet, x ∈ A <-> x ∈ B) :
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
    (A B : LRA.Set.NBGSet)
    (sameMembers : forall x : LRA.Set.NBGSet, x ∈ A <-> x ∈ B) :
    A = B := by
  sorry

/--
`ClassExtensionalityTheorem` TODO

Predicate logic:

  (∀ A B ∈ LRA.Set.NBGClass), (forall x : LRA.Set.NBGSet, x ∈ A <-> x ∈ B) → A = B

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.NBGClass), (∀ (x : LRA.Set.NBGSet), LRA.Set.instMembershipNBGSetNBGClass.1 A x ↔ LRA.Set.instMembershipNBGSetNBGClass.1 B x) → A = B

Logical form (Lean):

```lean
theorem ClassExtensionalityTheorem
    (A B : LRA.Set.NBGClass)
    (sameMembers : forall x : LRA.Set.NBGSet, x ∈ A <-> x ∈ B) :
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
theorem ClassExtensionalityTheorem
    (A B : LRA.Set.NBGClass)
    (sameMembers : forall x : LRA.Set.NBGSet, x ∈ A <-> x ∈ B) :
    A = B := by
  sorry

end LRA.Set.NBG
