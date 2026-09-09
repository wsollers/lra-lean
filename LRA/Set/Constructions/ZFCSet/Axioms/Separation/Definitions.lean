import LRA.Set.Constructions.ZFCSet.Axioms.Common

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`IsSeparatedSubset` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set) (property : LRA.Set.Constructions.ZFCSet.Axioms.Set → Prop) (B x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.mem B x ↔ (LRA.Set.Constructions.instMembershipZFCSet.mem A x ∧ property x)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipZFCSet.mem B x ↔ (LRA.Set.Constructions.instMembershipZFCSet.mem A x ∧ property x)

Logical form (Lean):

```lean
def IsSeparatedSubset (A : Set) (property : Set → Prop) (B : Set) : Prop :=
  ∀ x : Set, x ∈ B ↔ x ∈ A ∧ property x
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
def IsSeparatedSubset (A : Set) (property : Set → Prop) (B : Set) : Prop :=
  ∀ x : Set, x ∈ B ↔ x ∈ A ∧ property x

end LRA.Set.Constructions.ZFCSet.Axioms
