import LRA.Operation
import LRA.Operation
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/--
`JoinSemilatticeLaws` TODO

Predicate logic:

  ∀ {Carrier : Type u} (join : LRA.Operation.BinaryEndoOperation Carrier), (LRA.Operation.Laws.Associative.Associative join ∧ (LRA.Operation.Laws.Commutative.Commutative join ∧ LRA.Operation.Laws.Idempotent.Idempotent join))

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (join : Carrier → Carrier → Carrier), (∀ (first second third : Carrier), join (join first second) third = join first (join second third) ∧ (∀ (first second : Carrier), join first second = join second first ∧ ∀ (element : Carrier), join element element = element))

Logical form (Lean):

```lean
def JoinSemilatticeLaws {Carrier : Type u}
    (join : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  LRA.Operation.Laws.Associative.Associative join /\
    LRA.Operation.Laws.Commutative.Commutative join /\
    LRA.Operation.Laws.Idempotent.Idempotent join
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
def JoinSemilatticeLaws {Carrier : Type u}
    (join : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  LRA.Operation.Laws.Associative.Associative join /\
    LRA.Operation.Laws.Commutative.Commutative join /\
    LRA.Operation.Laws.Idempotent.Idempotent join

end LRA.AlgebraicStructures
