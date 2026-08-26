import LRA.Set.Constructions.NBGSet.Axioms.Axioms.Foundation
import LRA.Set.Constructions.NBGSet.Axioms.Definitions
import LRA.Set.Constructions.NBGSet.Axioms.Pairing.Theorems

namespace LRA.Set.Constructions.NBGSet.Axioms

/--
`FoundationWitnessExists` TODO

Predicate logic:

  (∀ A ∈ Set), (exists w : Set, w ∈ A) → exists x : Set, IsFoundationWitness A x

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.NBGSet.Axioms.Set), (Exists fun w => LRA.Set.instMembershipNBGSet.1 A w) → Exists fun x => (LRA.Set.instMembershipNBGSet.1 A x ∧ ∀ (y : LRA.Set.Constructions.NBGSet.Axioms.Set), LRA.Set.instMembershipNBGSet.1 x y → LRA.Set.instMembershipNBGSet.1 A y → False)

Logical form (Lean):

```lean
theorem FoundationWitnessExists (A : Set) (nonempty : exists w : Set, w ∈ A) :
    exists x : Set, IsFoundationWitness A x
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
theorem FoundationWitnessExists (A : Set) (nonempty : exists w : Set, w ∈ A) :
    exists x : Set, IsFoundationWitness A x := by
  sorry

/--
`NoSetIsMemberOfItself` TODO

Predicate logic:

  (∀ A ∈ Set), A ∉ A

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.NBGSet.Axioms.Set), LRA.Set.instMembershipNBGSet.1 A A → False

Logical form (Lean):

```lean
theorem NoSetIsMemberOfItself (A : Set) : A ∉ A
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
theorem NoSetIsMemberOfItself (A : Set) : A ∉ A := by
  sorry

end LRA.Set.Constructions.NBGSet.Axioms
