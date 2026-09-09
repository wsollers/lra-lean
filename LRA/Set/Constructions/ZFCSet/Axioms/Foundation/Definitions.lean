import LRA.Set.Constructions.ZFCSet.Axioms.Common

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`IsFoundationWitness` TODO

Predicate logic:

  ∀ (A x : LRA.Set.Constructions.ZFCSet.Axioms.Set), (LRA.Set.Constructions.instMembershipZFCSet.mem A x ∧ (∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.mem x y → ¬ LRA.Set.Constructions.instMembershipZFCSet.mem A y))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (LRA.Set.Constructions.instMembershipZFCSet.1 A x ∧ (∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 x y → LRA.Set.Constructions.instMembershipZFCSet.1 A y → False))

Logical form (Lean):

```lean
def IsFoundationWitness (A x : Set) : Prop :=
  x ∈ A ∧ ∀ y : Set, y ∈ x → y ∉ A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def IsFoundationWitness (A x : Set) : Prop :=
  x ∈ A ∧ ∀ y : Set, y ∈ x → y ∉ A

end LRA.Set.Constructions.ZFCSet.Axioms
