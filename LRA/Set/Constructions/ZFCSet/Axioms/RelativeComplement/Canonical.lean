import LRA.Set.Constructions.ZFCSet.Axioms.RelativeComplement.Definitions
import LRA.Set.Constructions.ZFCSet.Axioms.Separation.Theorems

namespace LRA.Set.Constructions.ZFCSet.Axioms

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

  ∀ (A B : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.ZFCSet.Axioms.IsRelativeComplementOf A B (LRA.Set.Constructions.ZFCSet.Axioms.TheRelativeComplement A B)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A B : Set
  Prove
    LRA.Set.Constructions.instMembershipZFCSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsSeparatedSubset A fun x => ¬ LRA.Set.Constructions.instMembershipZFCSet.mem B x) ⋯).1 x ↔ (LRA.Set.Constructions.instMembershipZFCSet.1 A x ∧ (LRA.Set.Constructions.instMembershipZFCSet.1 B x → False))

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

end LRA.Set.Constructions.ZFCSet.Axioms
