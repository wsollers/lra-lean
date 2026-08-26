import LRA.Set.Constructions.TGSet.Definitions
import LRA.Set.Constructions.TGSet.Separation.Theorems

namespace LRA.Set.Constructions.TGSet

/--
`TheRelativeComplement` TODO

Predicate logic:

  noncomputable def TheRelativeComplement (A B : Set) : Set :=
  TheSeparatedSubset A (fun x => x ∉ B)

Predicate logic (unfolded):

  noncomputable def TheRelativeComplement (A B : Set) : Set :=
  TheSeparatedSubset A (fun x => x ∉ B) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TheRelativeComplement (A B : Set) : Set :=
  TheSeparatedSubset A (fun x => x ∉ B)
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
noncomputable def TheRelativeComplement (A B : Set) : Set :=
  TheSeparatedSubset A (fun x => x ∉ B)

/--
`TheRelativeComplementIsRelativeComplementOf` TODO

Predicate logic:

  (∀ A B ∈ Set), IsRelativeComplementOf A B (TheRelativeComplement A B)

Predicate logic (unfolded):

  ∀ (A B x : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TGSet.IsSeparatedSubset A fun x => ¬ LRA.Set.instMembershipTGSet.mem B x) ⋯).1 x ↔ (LRA.Set.instMembershipTGSet.1 A x ∧ LRA.Set.instMembershipTGSet.1 B x → False)

Logical form (Lean):

```lean
theorem TheRelativeComplementIsRelativeComplementOf (A B : Set) :
    IsRelativeComplementOf A B (TheRelativeComplement A B)
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
theorem TheRelativeComplementIsRelativeComplementOf (A B : Set) :
    IsRelativeComplementOf A B (TheRelativeComplement A B) := by
  sorry

/--
`TheRelativeComplementMembership` TODO

Predicate logic:

  (∀ A B x ∈ Set), x ∈ TheRelativeComplement A B <-> x ∈ A ∧ x ∉ B

Predicate logic (unfolded):

  ∀ (A B x : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TGSet.IsSeparatedSubset A fun x => ¬ LRA.Set.instMembershipTGSet.mem B x) ⋯).1 x ↔ (LRA.Set.instMembershipTGSet.1 A x ∧ LRA.Set.instMembershipTGSet.1 B x → False)

Logical form (Lean):

```lean
theorem TheRelativeComplementMembership (A B x : Set) :
    x ∈ TheRelativeComplement A B <-> x ∈ A /\ x ∉ B
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
theorem TheRelativeComplementMembership (A B x : Set) :
    x ∈ TheRelativeComplement A B <-> x ∈ A /\ x ∉ B := by
  sorry

end LRA.Set.Constructions.TGSet

