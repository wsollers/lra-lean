import LRA.Set.Constructions.ZFCSet.Axioms.IntersectionOver.Canonical

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`TheIntersectionOverMembership` TODO

Predicate logic:

  ∀ (A x : LRA.Set.Constructions.ZFCSet.Axioms.Set), (Exists fun B => LRA.Set.Constructions.instMembershipZFCSet.mem A B) → LRA.Set.Constructions.instMembershipZFCSet.mem (LRA.Set.Constructions.ZFCSet.Axioms.TheIntersectionOver A) x ↔ ∀ (B : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.mem A B → LRA.Set.Constructions.instMembershipZFCSet.mem B x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A x : Set
  Prove
    (Exists fun B => LRA.Set.Constructions.instMembershipZFCSet.mem A B) → LRA.Set.Constructions.instMembershipZFCSet.mem (LRA.Set.Constructions.ZFCSet.Axioms.TheIntersectionOver A) x ↔ ∀ (B : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.mem A B → LRA.Set.Constructions.instMembershipZFCSet.mem B x

Logical form (Lean):

```lean
theorem TheIntersectionOverMembership (A x : Set)
    (collectionNonempty : ∃ B : Set, B ∈ A) :
    x ∈ TheIntersectionOver A ↔ ∀ B : Set, B ∈ A → x ∈ B
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
    (collectionNonempty : ∃ B : Set, B ∈ A) :
    x ∈ TheIntersectionOver A ↔ ∀ B : Set, B ∈ A → x ∈ B := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
