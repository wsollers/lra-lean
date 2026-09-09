import LRA.Set.Constructions.ZFCSet.Axioms.Common

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`IsUnionOf` TODO

Predicate logic:

  ∀ (A U x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.mem U x ↔ Exists fun B => (LRA.Set.Constructions.instMembershipZFCSet.mem A B ∧ LRA.Set.Constructions.instMembershipZFCSet.mem B x)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipZFCSet.mem U x ↔ Exists fun B => (LRA.Set.Constructions.instMembershipZFCSet.mem A B ∧ LRA.Set.Constructions.instMembershipZFCSet.mem B x)

Logical form (Lean):

```lean
def IsUnionOf (A U : Set) : Prop :=
  ∀ x : Set, x ∈ U ↔ ∃ B : Set, B ∈ A ∧ x ∈ B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, use, unfold

-/
def IsUnionOf (A U : Set) : Prop :=
  ∀ x : Set, x ∈ U ↔ ∃ B : Set, B ∈ A ∧ x ∈ B

end LRA.Set.Constructions.ZFCSet.Axioms
