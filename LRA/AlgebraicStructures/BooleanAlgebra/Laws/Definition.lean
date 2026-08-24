import LRA.AlgebraicStructures.BoundedLattice.Laws.Definition
import LRA.AlgebraicStructures.DistributiveLattice.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

/--
`BooleanAlgebraLaws` TODO

Predicate logic:

  ∀ {Carrier : Type u} (join meet : LRA.Operation.BinaryEndoOperation Carrier) (complement : LRA.Operation.UnaryEndoOperation Carrier) (bottom top : Carrier), (LRA.AlgebraicStructures.BoundedLatticeLaws join meet bottom top ∧ (LRA.AlgebraicStructures.DistributiveLatticeLaws join meet ∧ (∀ (element : Carrier), join element (complement element) = top ∧ ∀ (element : Carrier), meet element (complement element) = bottom)))

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (join meet : Carrier → Carrier → Carrier) (complement : Carrier → Carrier) (bottom top : Carrier), ((((∀ (first second third : Carrier), join (join first second) third = join first (join second third) ∧ (∀ (first second : Carrier), join first second = join second first ∧ ∀ (element : Carrier), join element element = element)) ∧ ((∀ (first second third : Carrier), meet (meet first second) third = meet first (meet second third) ∧ (∀ (first second : Carrier), meet first second = meet second first ∧ ∀ (element : Carrier), meet element element = element)) ∧ (∀ (left right : Carrier), join left (meet left right) = left ∧ ∀ (left right : Carrier), meet left (join left right) = left))) ∧ ((∀ (element : Carrier), join bottom element = element ∧ ∀ (element : Carrier), join element bottom = element) ∧ (∀ (element : Carrier), meet top element = element ∧ ∀ (element : Carrier), meet element top = element))) ∧ ((((∀ (first second third : Carrier), join (join first second) third = join first (join second third) ∧ (∀ (first second : Carrier), join first second = join second first ∧ ∀ (element : Carrier), join element element = element)) ∧ ((∀ (first second third : Carrier), meet (meet first second) third = meet first (meet second third) ∧ (∀ (first second : Carrier), meet first second = meet second first ∧ ∀ (element : Carrier), meet element element = element)) ∧ (∀ (left right : Carrier), join left (meet left right) = left ∧ ∀ (left right : Carrier), meet left (join left right) = left))) ∧ ((∀ (left right third : Carrier), join left (meet right third) = meet (join left right) (join left third) ∧ ∀ (left right third : Carrier), join (meet left right) third = meet (join left third) (join right third)) ∧ (∀ (left right third : Carrier), meet left (join right third) = join (meet left right) (meet left third) ∧ ∀ (left right third : Carrier), meet (join left right) third = join (meet left third) (meet right third)))) ∧ (∀ (element : Carrier), join element (complement element) = top ∧ ∀ (element : Carrier), meet element (complement element) = bottom)))

Logical form (Lean):

```lean
def BooleanAlgebraLaws {Carrier : Type u}
    (join meet : LRA.Operation.BinaryEndoOperation Carrier)
    (complement : LRA.Operation.UnaryEndoOperation Carrier)
    (bottom top : Carrier) : Prop :=
  BoundedLatticeLaws join meet bottom top /\
    DistributiveLatticeLaws join meet /\
    (forall element, join element (complement element) = top) /\
    (forall element, meet element (complement element) = bottom)
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
def BooleanAlgebraLaws {Carrier : Type u}
    (join meet : LRA.Operation.BinaryEndoOperation Carrier)
    (complement : LRA.Operation.UnaryEndoOperation Carrier)
    (bottom top : Carrier) : Prop :=
  BoundedLatticeLaws join meet bottom top /\
    DistributiveLatticeLaws join meet /\
    (forall element, join element (complement element) = top) /\
    (forall element, meet element (complement element) = bottom)

end LRA.AlgebraicStructures
