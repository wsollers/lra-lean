import LRA.Set.Constructions.TGSet.Axioms.Extensionality

namespace LRA.Set.Constructions.TGSet

/--
`SetEqualityIffSameMembers` TODO

Predicate logic:

  ∀ (A B : LRA.Set.Constructions.TGSet), A = B ↔ ∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem A x ↔ LRA.Set.Constructions.instMembershipTGSet.mem B x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A B : LRA.Set.Constructions.TGSet
  Prove
    A = B ↔ ∀ (x : LRA.Set.Constructions.TGSet), LRA.Set.Constructions.instMembershipTGSet.mem A x ↔ LRA.Set.Constructions.instMembershipTGSet.mem B x

Logical form (Lean):

```lean
theorem SetEqualityIffSameMembers (A B : LRA.Set.Constructions.TGSet) :
    A = B <-> forall x : LRA.Set.Constructions.TGSet, x ∈ A <-> x ∈ B
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
theorem SetEqualityIffSameMembers (A B : LRA.Set.Constructions.TGSet) :
    A = B <-> forall x : LRA.Set.Constructions.TGSet, x ∈ A <-> x ∈ B := by
  sorry

end LRA.Set.Constructions.TGSet

