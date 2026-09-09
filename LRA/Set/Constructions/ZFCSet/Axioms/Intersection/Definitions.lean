import LRA.Set.Constructions.ZFCSet.Axioms.Common

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`IsIntersectionOf` TODO

Predicate logic:

  ∀ (A B D x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.mem D x ↔ (LRA.Set.Constructions.instMembershipZFCSet.mem A x ∧ LRA.Set.Constructions.instMembershipZFCSet.mem B x)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipZFCSet.mem D x ↔ (LRA.Set.Constructions.instMembershipZFCSet.mem A x ∧ LRA.Set.Constructions.instMembershipZFCSet.mem B x)

Logical form (Lean):

```lean
def IsIntersectionOf (A B D : Set) : Prop :=
  ∀ x : Set, x ∈ D ↔ x ∈ A ∧ x ∈ B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, unfold

-/
def IsIntersectionOf (A B D : Set) : Prop :=
  ∀ x : Set, x ∈ D ↔ x ∈ A ∧ x ∈ B

end LRA.Set.Constructions.ZFCSet.Axioms
