import LRA.Set.Constructions.TGSet.Union.Theorems
import LRA.Set.Constructions.TGSet.Separation.Theorems

namespace LRA.Set.Constructions.TGSet

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

  ∀ (A x : LRA.Set.Constructions.TGSet.Set), (Exists fun B => LRA.Set.Constructions.instMembershipTGSet.mem A B) → LRA.Set.Constructions.instMembershipTGSet.mem (LRA.Set.Constructions.TGSet.TheIntersectionOver A) x ↔ ∀ (B : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.mem A B → LRA.Set.Constructions.instMembershipTGSet.mem B x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A x : Set
  Prove
    (Exists fun B => LRA.Set.Constructions.instMembershipTGSet.mem A B) → LRA.Set.Constructions.instMembershipTGSet.mem (LRA.Set.Constructions.TGSet.TheIntersectionOver A) x ↔ ∀ (B : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.mem A B → LRA.Set.Constructions.instMembershipTGSet.mem B x

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

end LRA.Set.Constructions.TGSet

