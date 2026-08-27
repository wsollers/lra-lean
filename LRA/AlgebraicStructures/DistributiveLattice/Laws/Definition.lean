import LRA.AlgebraicStructures.Lattice.Interface.Laws.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/--
`DistributiveLatticeLaws` TODO

Predicate logic:

  ∀ {Carrier : Type u} (join meet : LRA.Operation.BinaryEndoOperation Carrier), (LRA.AlgebraicStructures.LatticeLaws join meet ∧ (LRA.Operation.Laws.Distributive.TwoSidedDistributive join meet ∧ LRA.Operation.Laws.Distributive.TwoSidedDistributive meet join))

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (join meet : Carrier → Carrier → Carrier), (((∀ (first second third : Carrier), join (join first second) third = join first (join second third) ∧ (∀ (first second : Carrier), join first second = join second first ∧ ∀ (element : Carrier), join element element = element)) ∧ ((∀ (first second third : Carrier), meet (meet first second) third = meet first (meet second third) ∧ (∀ (first second : Carrier), meet first second = meet second first ∧ ∀ (element : Carrier), meet element element = element)) ∧ (∀ (left right : Carrier), join left (meet left right) = left ∧ ∀ (left right : Carrier), meet left (join left right) = left))) ∧ ((∀ (left right third : Carrier), join left (meet right third) = meet (join left right) (join left third) ∧ ∀ (left right third : Carrier), join (meet left right) third = meet (join left third) (join right third)) ∧ (∀ (left right third : Carrier), meet left (join right third) = join (meet left right) (meet left third) ∧ ∀ (left right third : Carrier), meet (join left right) third = join (meet left third) (meet right third))))

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
