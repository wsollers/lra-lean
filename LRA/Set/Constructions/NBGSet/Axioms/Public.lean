import LRA.Set.Constructions.NBGSet.Axioms.Definitions
import LRA.Set.Constructions.NBGSet.Axioms.Theorems

namespace LRA.Set.Constructions.NBGSet.Axioms

/--
`SetExtensionality` TODO

Predicate logic:

  (∀ A B ∈ LRA.Set.Constructions.NBGSet), (forall x : LRA.Set.Constructions.NBGSet, x ∈ A <-> x ∈ B) → A = B

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.NBGSet), (∀ (x : LRA.Set.Constructions.NBGSet), LRA.Set.instMembershipNBGSet.1 A x ↔ LRA.Set.instMembershipNBGSet.1 B x) → A = B

Logical form (Lean):

```lean
theorem SetExtensionality
    (A B : LRA.Set.Constructions.NBGSet)
    (sameMembers : forall x : LRA.Set.Constructions.NBGSet, x ∈ A <-> x ∈ B) :
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
    (A B : LRA.Set.Constructions.NBGSet)
    (sameMembers : forall x : LRA.Set.Constructions.NBGSet, x ∈ A <-> x ∈ B) :
    A = B := by
  sorry

/--
`ClassExtensionalityTheorem` TODO

Predicate logic:

  (∀ A B ∈ LRA.Set.Constructions.NBGClass), (forall x : LRA.Set.Constructions.NBGSet, x ∈ A <-> x ∈ B) → A = B

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.NBGClass), (∀ (x : LRA.Set.Constructions.NBGSet), LRA.Set.instMembershipNBGSetNBGClass.1 A x ↔ LRA.Set.instMembershipNBGSetNBGClass.1 B x) → A = B

Logical form (Lean):

```lean
theorem ClassExtensionalityTheorem
    (A B : LRA.Set.Constructions.NBGClass)
    (sameMembers : forall x : LRA.Set.Constructions.NBGSet, x ∈ A <-> x ∈ B) :
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
    (A B : LRA.Set.Constructions.NBGClass)
    (sameMembers : forall x : LRA.Set.Constructions.NBGSet, x ∈ A <-> x ∈ B) :
    A = B := by
  sorry

end LRA.Set.Constructions.NBGSet.Axioms
