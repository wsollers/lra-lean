import LRA.AlgebraicStructures.Lattice.Interface.Laws.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/--
`BoundedLatticeLaws` TODO

Predicate logic:

  ∀ {Carrier : Type u} (join meet : LRA.Operation.BinaryEndoOperation Carrier) (bottom top : Carrier), (LRA.AlgebraicStructures.LatticeLaws join meet ∧ (LRA.Operation.Laws.Identity.TwoSidedIdentity join bottom ∧ LRA.Operation.Laws.Identity.TwoSidedIdentity meet top))

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (join meet : Carrier → Carrier → Carrier) (bottom top : Carrier), (((∀ (first second third : Carrier), join (join first second) third = join first (join second third) ∧ (∀ (first second : Carrier), join first second = join second first ∧ ∀ (element : Carrier), join element element = element)) ∧ ((∀ (first second third : Carrier), meet (meet first second) third = meet first (meet second third) ∧ (∀ (first second : Carrier), meet first second = meet second first ∧ ∀ (element : Carrier), meet element element = element)) ∧ (∀ (left right : Carrier), join left (meet left right) = left ∧ ∀ (left right : Carrier), meet left (join left right) = left))) ∧ ((∀ (element : Carrier), join bottom element = element ∧ ∀ (element : Carrier), join element bottom = element) ∧ (∀ (element : Carrier), meet top element = element ∧ ∀ (element : Carrier), meet element top = element)))

Logical form (Lean):

```lean
def BoundedLatticeLaws {Carrier : Type u}
    (join meet : LRA.Operation.BinaryEndoOperation Carrier)
    (bottom top : Carrier) : Prop :=
  LatticeLaws join meet /\
    LRA.Operation.Laws.Identity.TwoSidedIdentity join bottom /\
    LRA.Operation.Laws.Identity.TwoSidedIdentity meet top
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
def BoundedLatticeLaws {Carrier : Type u}
    (join meet : LRA.Operation.BinaryEndoOperation Carrier)
    (bottom top : Carrier) : Prop :=
  LatticeLaws join meet /\
    LRA.Operation.Laws.Identity.TwoSidedIdentity join bottom /\
    LRA.Operation.Laws.Identity.TwoSidedIdentity meet top

end LRA.AlgebraicStructures
