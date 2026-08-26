import LRA.Set.Constructions.NBGSet.Axioms.Union.Theorems
import LRA.Set.Constructions.NBGSet.Axioms.Separation.Theorems

namespace LRA.Set.Constructions.NBGSet.Axioms

/--
`TheIntersectionOver` TODO

Predicate logic:

  noncomputable def TheIntersectionOver (A : Set) : Set :=
  TheSeparatedSubset (TheUnionOver A) (fun x => forall B : Set, B ∈ A -> x ∈ B)

Predicate logic (unfolded):

  noncomputable def TheIntersectionOver (A : Set) : Set :=
  TheSeparatedSubset (TheUnionOver A) (fun x => forall B : Set, B ∈ A -> x ∈ B) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TheIntersectionOver (A : Set) : Set :=
  TheSeparatedSubset (TheUnionOver A) (fun x => forall B : Set, B ∈ A -> x ∈ B)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
noncomputable def TheIntersectionOver (A : Set) : Set :=
  TheSeparatedSubset (TheUnionOver A) (fun x => forall B : Set, B ∈ A -> x ∈ B)

/--
`TheIntersectionOverMembership` TODO

Predicate logic:

  (∀ A x ∈ Set), (exists B : Set, B ∈ A) → x ∈ TheIntersectionOver A <-> forall B : Set, B ∈ A -> x ∈ B

Predicate logic (unfolded):

  ∀ (A x : LRA.Set.Constructions.NBGSet.Axioms.Set), (Exists fun B => LRA.Set.instMembershipNBGSet.1 A B) → LRA.Set.instMembershipNBGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.NBGSet.Axioms.IsSeparatedSubset (LRA.Set.Constructions.NBGSet.Axioms.TheUnionOver A) fun x => ∀ (B : LRA.Set.Constructions.NBGSet.Axioms.Set), LRA.Set.instMembershipNBGSet.mem A B → LRA.Set.instMembershipNBGSet.mem B x) ⋯).1 x ↔ ∀ (B : LRA.Set.Constructions.NBGSet.Axioms.Set), LRA.Set.instMembershipNBGSet.1 A B → LRA.Set.instMembershipNBGSet.1 B x

Logical form (Lean):

```lean
theorem TheIntersectionOverMembership (A x : Set)
    (collectionNonempty : exists B : Set, B ∈ A) :
    x ∈ TheIntersectionOver A <-> forall B : Set, B ∈ A -> x ∈ B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, use, rcases

-/
theorem TheIntersectionOverMembership (A x : Set)
    (collectionNonempty : exists B : Set, B ∈ A) :
    x ∈ TheIntersectionOver A <-> forall B : Set, B ∈ A -> x ∈ B := by
  sorry

end LRA.Set.Constructions.NBGSet.Axioms
