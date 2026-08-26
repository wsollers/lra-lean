import LRA.Set.Constructions.TG.Definitions
import LRA.Set.Constructions.TG.Separation.Theorems

namespace LRA.Set.Constructions.TG

/--
`TheIntersection` TODO

Predicate logic:

  noncomputable def TheIntersection (A B : Set) : Set :=
  TheSeparatedSubset A (fun x => x ∈ B)

Predicate logic (unfolded):

  noncomputable def TheIntersection (A B : Set) : Set :=
  TheSeparatedSubset A (fun x => x ∈ B) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TheIntersection (A B : Set) : Set :=
  TheSeparatedSubset A (fun x => x ∈ B)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
noncomputable def TheIntersection (A B : Set) : Set :=
  TheSeparatedSubset A (fun x => x ∈ B)

/--
`TheIntersectionIsIntersectionOf` TODO

Predicate logic:

  (∀ A B ∈ Set), IsIntersectionOf A B (TheIntersection A B)

Predicate logic (unfolded):

  ∀ (A B x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TG.IsSeparatedSubset A fun x => LRA.Set.instMembershipTGSet.mem B x) ⋯).1 x ↔ (LRA.Set.instMembershipTGSet.1 A x ∧ LRA.Set.instMembershipTGSet.1 B x)

Logical form (Lean):

```lean
theorem TheIntersectionIsIntersectionOf (A B : Set) :
    IsIntersectionOf A B (TheIntersection A B)
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
theorem TheIntersectionIsIntersectionOf (A B : Set) :
    IsIntersectionOf A B (TheIntersection A B) := by
  sorry

/--
`TheIntersectionMembership` TODO

Predicate logic:

  (∀ A B x ∈ Set), x ∈ TheIntersection A B <-> x ∈ A ∧ x ∈ B

Predicate logic (unfolded):

  ∀ (A B x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TG.IsSeparatedSubset A fun x => LRA.Set.instMembershipTGSet.mem B x) ⋯).1 x ↔ (LRA.Set.instMembershipTGSet.1 A x ∧ LRA.Set.instMembershipTGSet.1 B x)

Logical form (Lean):

```lean
theorem TheIntersectionMembership (A B x : Set) :
    x ∈ TheIntersection A B <-> x ∈ A /\ x ∈ B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
theorem TheIntersectionMembership (A B x : Set) :
    x ∈ TheIntersection A B <-> x ∈ A /\ x ∈ B := by
  sorry

end LRA.Set.Constructions.TG
