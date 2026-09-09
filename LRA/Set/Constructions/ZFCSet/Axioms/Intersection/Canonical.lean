import LRA.Set.Constructions.ZFCSet.Axioms.Intersection.Definitions
import LRA.Set.Constructions.ZFCSet.Axioms.Separation.Theorems

namespace LRA.Set.Constructions.ZFCSet.Axioms

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

  ∀ (A B : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.ZFCSet.Axioms.IsIntersectionOf A B (LRA.Set.Constructions.ZFCSet.Axioms.TheIntersection A B)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A B : Set
  Prove
    LRA.Set.Constructions.instMembershipZFCSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsSeparatedSubset A fun x => LRA.Set.Constructions.instMembershipZFCSet.mem B x) ⋯).1 x ↔ (LRA.Set.Constructions.instMembershipZFCSet.1 A x ∧ LRA.Set.Constructions.instMembershipZFCSet.1 B x)

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

end LRA.Set.Constructions.ZFCSet.Axioms
