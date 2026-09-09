import LRA.Set.Constructions.ZFCSet.Axioms.Intersection.Canonical

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`TheIntersectionMembership` TODO

Predicate logic:

  ∀ (A B x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.mem (LRA.Set.Constructions.ZFCSet.Axioms.TheIntersection A B) x ↔ (LRA.Set.Constructions.instMembershipZFCSet.mem A x ∧ LRA.Set.Constructions.instMembershipZFCSet.mem B x)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A B x : Set
  Prove
    LRA.Set.Constructions.instMembershipZFCSet.mem (LRA.Set.Constructions.ZFCSet.Axioms.TheIntersection A B) x ↔ (LRA.Set.Constructions.instMembershipZFCSet.mem A x ∧ LRA.Set.Constructions.instMembershipZFCSet.mem B x)

Logical form (Lean):

```lean
theorem TheIntersectionMembership (A B x : Set) :
    x ∈ TheIntersection A B ↔ x ∈ A ∧ x ∈ B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases

-/
theorem TheIntersectionMembership (A B x : Set) :
    x ∈ TheIntersection A B ↔ x ∈ A ∧ x ∈ B := by
  sorry

/--
`EveryIntersectionEqualsTheIntersection` TODO

Predicate logic:

  ∀ {A B D : LRA.Set.Constructions.ZFCSet.Axioms.Set}, LRA.Set.Constructions.ZFCSet.Axioms.IsIntersectionOf A B D → D = LRA.Set.Constructions.ZFCSet.Axioms.TheIntersection A B

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A B D : Set
  Prove
    (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 D x ↔ (LRA.Set.Constructions.instMembershipZFCSet.1 A x ∧ LRA.Set.Constructions.instMembershipZFCSet.1 B x)) → D = Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsSeparatedSubset A fun x => LRA.Set.Constructions.instMembershipZFCSet.mem B x) ⋯.1

Logical form (Lean):

```lean
theorem EveryIntersectionEqualsTheIntersection
    {A B D : Set}
    (DIsIntersectionOf : IsIntersectionOf A B D) :
    D = TheIntersection A B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem EveryIntersectionEqualsTheIntersection
    {A B D : Set}
    (DIsIntersectionOf : IsIntersectionOf A B D) :
    D = TheIntersection A B := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
