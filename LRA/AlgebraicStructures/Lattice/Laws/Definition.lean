import LRA.AlgebraicStructures.JoinSemilattice.Laws.Definition
import LRA.AlgebraicStructures.MeetSemilattice.Laws.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/--
`LatticeLaws` TODO

Predicate logic:

  ∀ {Carrier : Type u} (join meet : LRA.Operation.BinaryEndoOperation Carrier), (LRA.AlgebraicStructures.JoinSemilatticeLaws join ∧ (LRA.AlgebraicStructures.MeetSemilatticeLaws meet ∧ LRA.Operation.Laws.Absorption.MutualAbsorptionLaw join meet))

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (join meet : Carrier → Carrier → Carrier), ((∀ (first second third : Carrier), join (join first second) third = join first (join second third) ∧ (∀ (first second : Carrier), join first second = join second first ∧ ∀ (element : Carrier), join element element = element)) ∧ ((∀ (first second third : Carrier), meet (meet first second) third = meet first (meet second third) ∧ (∀ (first second : Carrier), meet first second = meet second first ∧ ∀ (element : Carrier), meet element element = element)) ∧ (∀ (left right : Carrier), join left (meet left right) = left ∧ ∀ (left right : Carrier), meet left (join left right) = left)))

Logical form (Lean):

```lean
def LatticeLaws {Carrier : Type u}
    (join meet : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  JoinSemilatticeLaws join /\
    MeetSemilatticeLaws meet /\
    LRA.Operation.Laws.Absorption.MutualAbsorptionLaw join meet
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
def LatticeLaws {Carrier : Type u}
    (join meet : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  JoinSemilatticeLaws join /\
    MeetSemilatticeLaws meet /\
    LRA.Operation.Laws.Absorption.MutualAbsorptionLaw join meet

end LRA.AlgebraicStructures
