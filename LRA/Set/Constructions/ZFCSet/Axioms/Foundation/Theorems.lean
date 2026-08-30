import LRA.Set.Constructions.ZFCSet.Axioms.Foundation.Axiom
import LRA.Set.Constructions.ZFCSet.Axioms.Definitions
import LRA.Set.Constructions.ZFCSet.Axioms.Pairing.Theorems

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`FoundationWitnessExists` TODO

Predicate logic:

  (∀ A ∈ Set), (∃ w ∈ Set, w ∈ A) → ∃ x ∈ Set, IsFoundationWitness A x

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set), (Exists fun w => LRA.Set.instMembershipZFCSet.1 A w) → Exists fun x => (LRA.Set.instMembershipZFCSet.1 A x ∧ ∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 x y → LRA.Set.instMembershipZFCSet.1 A y → False)

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

/--
`NoSetIsMemberOfItself` TODO

Predicate logic:

  (∀ A ∈ Set), A ∉ A

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 A A → False

Logical form (Lean):

```lean
theorem NoSetIsMemberOfItself (A : Set) :
    A ∉ A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem NoSetIsMemberOfItself (A : Set) :
    A ∉ A := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
