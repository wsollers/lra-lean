import LRA.Operation
import LRA.Operation
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/--
`MeetSemilatticeLaws` TODO

Predicate logic:

  ∀ {Carrier : Type u} (meet : LRA.Operation.BinaryEndoOperation Carrier), (LRA.Operation.Laws.Associative.Associative meet ∧ (LRA.Operation.Laws.Commutative.Commutative meet ∧ LRA.Operation.Laws.Idempotent.Idempotent meet))

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (meet : Carrier → Carrier → Carrier), (∀ (first second third : Carrier), meet (meet first second) third = meet first (meet second third) ∧ (∀ (first second : Carrier), meet first second = meet second first ∧ ∀ (element : Carrier), meet element element = element))

Logical form (Lean):

```lean
def MeetSemilatticeLaws {Carrier : Type u}
    (meet : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  LRA.Operation.Laws.Associative.Associative meet /\
    LRA.Operation.Laws.Commutative.Commutative meet /\
    LRA.Operation.Laws.Idempotent.Idempotent meet
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
def MeetSemilatticeLaws {Carrier : Type u}
    (meet : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  LRA.Operation.Laws.Associative.Associative meet /\
    LRA.Operation.Laws.Commutative.Commutative meet /\
    LRA.Operation.Laws.Idempotent.Idempotent meet

end LRA.AlgebraicStructures
