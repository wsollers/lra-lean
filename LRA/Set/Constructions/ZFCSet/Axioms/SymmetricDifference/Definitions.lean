import LRA.Set.Constructions.ZFCSet.Axioms.Common

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`IsSymmetricDifferenceOf` TODO

Predicate logic:

  ∀ (A B D x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.mem D x ↔ Or ((LRA.Set.Constructions.instMembershipZFCSet.mem A x ∧ ¬ LRA.Set.Constructions.instMembershipZFCSet.mem B x)) ((LRA.Set.Constructions.instMembershipZFCSet.mem B x ∧ ¬ LRA.Set.Constructions.instMembershipZFCSet.mem A x))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipZFCSet.mem D x ↔ Or ((LRA.Set.Constructions.instMembershipZFCSet.mem A x ∧ ¬ LRA.Set.Constructions.instMembershipZFCSet.mem B x)) ((LRA.Set.Constructions.instMembershipZFCSet.mem B x ∧ ¬ LRA.Set.Constructions.instMembershipZFCSet.mem A x))

Logical form (Lean):

```lean
def IsSymmetricDifferenceOf (A B D : Set) : Prop :=
  ∀ x : Set, x ∈ D ↔ (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, Or.inl, Or.inr, unfold

-/
def IsSymmetricDifferenceOf (A B D : Set) : Prop :=
  ∀ x : Set, x ∈ D ↔ (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A)

end LRA.Set.Constructions.ZFCSet.Axioms
