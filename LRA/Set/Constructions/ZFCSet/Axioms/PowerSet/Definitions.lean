import LRA.Set.Constructions.ZFCSet.Axioms.Common

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`IsPowerSetOf` TODO

Predicate logic:

  ∀ (A P x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.mem P x ↔ ∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.mem x y → LRA.Set.Constructions.instMembershipZFCSet.mem A y

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipZFCSet.mem P x ↔ ∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.mem x y → LRA.Set.Constructions.instMembershipZFCSet.mem A y

Logical form (Lean):

```lean
def IsPowerSetOf (A P : Set) : Prop :=
  ∀ x : Set, x ∈ P ↔ ∀ y : Set, y ∈ x → y ∈ A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, unfold

-/
def IsPowerSetOf (A P : Set) : Prop :=
  ∀ x : Set, x ∈ P ↔ ∀ y : Set, y ∈ x → y ∈ A

end LRA.Set.Constructions.ZFCSet.Axioms
