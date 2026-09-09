import LRA.AlgebraicStructures.Lattice.Interface.Laws.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/--
`DistributiveLatticeLaws` A distributive lattice: a lattice `(L, ∨, ∧)` where each of `∨`/`∧` distributes over the other. States both directions — `TwoSidedDistributive join meet` (join distributes over meet: the dual identity `x∨(y∧z)=(x∨y)∧(x∨z)`) and `TwoSidedDistributive meet join` (meet distributes over join: the user's primary identity `x∧(y∨z)=(x∧y)∨(x∧z)`) — even though the user's own spec notes these are *equivalent* given the lattice axioms (asserting either implies the other), so only one is strictly needed as an axiom. Kept both as explicit conjuncts anyway, matching this tree's general style of stating two-sided properties directly rather than hunting for a minimal axiom set (e.g. `TwoSidedIdentity`/`TwoSidedInverse` elsewhere do the same under commutativity, where one side would also follow from the other). Not a bug — a deliberate, harmless redundancy.

Predicate logic:

  ∀ {Carrier : Type u} (join meet : LRA.Operation.BinaryEndoOperation Carrier), (LRA.AlgebraicStructures.LatticeLaws join meet ∧ (LRA.Operation.Laws.Distributive.TwoSidedDistributive join meet ∧ LRA.Operation.Laws.Distributive.TwoSidedDistributive meet join))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((((∀ (first second third : Carrier), join (join first second) third = join first (join second third)) ∧ ((∀ (first second : Carrier), join first second = join second first) ∧ (∀ (element : Carrier), join element element = element))) ∧ (((∀ (first second third : Carrier), meet (meet first second) third = meet first (meet second third)) ∧ ((∀ (first second : Carrier), meet first second = meet second first) ∧ (∀ (element : Carrier), meet element element = element))) ∧ ((∀ (left right : Carrier), join left (meet left right) = left) ∧ (∀ (left right : Carrier), meet left (join left right) = left)))) ∧ (((∀ (left right third : Carrier), join left (meet right third) = meet (join left right) (join left third)) ∧ (∀ (left right third : Carrier), join (meet left right) third = meet (join left third) (join right third))) ∧ ((∀ (left right third : Carrier), meet left (join right third) = join (meet left right) (meet left third)) ∧ (∀ (left right third : Carrier), meet (join left right) third = join (meet left third) (meet right third)))))

Logical form (Lean):

```lean
def DistributiveLatticeLaws {Carrier : Type u}
    (join meet : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  LatticeLaws join meet /\
    LRA.Operation.Laws.Distributive.TwoSidedDistributive join meet /\
    LRA.Operation.Laws.Distributive.TwoSidedDistributive meet join
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def DistributiveLatticeLaws {Carrier : Type u}
    (join meet : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  LatticeLaws join meet /\
    LRA.Operation.Laws.Distributive.TwoSidedDistributive join meet /\
    LRA.Operation.Laws.Distributive.TwoSidedDistributive meet join

end LRA.AlgebraicStructures
