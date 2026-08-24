import LRA.Set.ZFC.Definitions
import LRA.Set.ZFC.Separation.Theorems

namespace LRA.Set.ZFC

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

  ∀ (A B x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 (Classical.indefiniteDescription (LRA.Set.ZFC.IsSeparatedSubset A fun x => ¬ LRA.Set.instMembershipZFCSet.mem B x) ⋯).1 x ↔ (LRA.Set.instMembershipZFCSet.1 A x ∧ LRA.Set.instMembershipZFCSet.1 B x → False)

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

  (∀ A B x ∈ Set), x ∈ TheRelativeComplement A B ↔ x ∈ A ∧ x ∉ B

Predicate logic (unfolded):

  ∀ (A B x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 (Classical.indefiniteDescription (LRA.Set.ZFC.IsSeparatedSubset A fun x => ¬ LRA.Set.instMembershipZFCSet.mem B x) ⋯).1 x ↔ (LRA.Set.instMembershipZFCSet.1 A x ∧ LRA.Set.instMembershipZFCSet.1 B x → False)

Logical form (Lean):

```lean
theorem TheRelativeComplementMembership (A B x : Set) :
    x ∈ TheRelativeComplement A B ↔ x ∈ A ∧ x ∉ B
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
theorem TheRelativeComplementMembership (A B x : Set) :
    x ∈ TheRelativeComplement A B ↔ x ∈ A ∧ x ∉ B := by
  sorry

/--
`EveryRelativeComplementEqualsTheRelativeComplement` TODO

Predicate logic:

  (IsRelativeComplementOf A B D) → D = TheRelativeComplement A B

Predicate logic (unfolded):

  ∀ {A B D : LRA.Set.ZFC.Set}, (∀ (x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 D x ↔ (LRA.Set.instMembershipZFCSet.1 A x ∧ LRA.Set.instMembershipZFCSet.1 B x → False)) → D = Classical.indefiniteDescription (LRA.Set.ZFC.IsSeparatedSubset A fun x => ¬ LRA.Set.instMembershipZFCSet.mem B x) ⋯.1

Logical form (Lean):

```lean
theorem EveryRelativeComplementEqualsTheRelativeComplement
    {A B D : Set}
    (DIsRelativeComplementOf : IsRelativeComplementOf A B D) :
    D = TheRelativeComplement A B
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
theorem EveryRelativeComplementEqualsTheRelativeComplement
    {A B D : Set}
    (DIsRelativeComplementOf : IsRelativeComplementOf A B D) :
    D = TheRelativeComplement A B := by
  sorry

end LRA.Set.ZFC
