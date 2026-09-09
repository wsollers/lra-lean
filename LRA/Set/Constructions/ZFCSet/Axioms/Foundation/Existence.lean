import LRA.Set.Constructions.ZFCSet.Axioms.Foundation.Axiom
import LRA.Set.Constructions.ZFCSet.Axioms.Foundation.Definitions

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`FoundationWitnessExists` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set), (Exists fun w => LRA.Set.Constructions.instMembershipZFCSet.mem A w) → Exists fun x => LRA.Set.Constructions.ZFCSet.Axioms.IsFoundationWitness A x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
  Prove
    (Exists fun w => LRA.Set.Constructions.instMembershipZFCSet.1 A w) → Exists fun x => (LRA.Set.Constructions.instMembershipZFCSet.1 A x ∧ (∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 x y → LRA.Set.Constructions.instMembershipZFCSet.1 A y → False))

Logical form (Lean):

```lean
theorem FoundationWitnessExists
    (A : Set) (nonempty : ∃ w : Set, w ∈ A) :
    ∃ x : Set, IsFoundationWitness A x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem FoundationWitnessExists
    (A : Set) (nonempty : ∃ w : Set, w ∈ A) :
    ∃ x : Set, IsFoundationWitness A x := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
