import LRA.Operation.Definition

namespace LRA.Operation.Laws.Associative

open LRA.Operation

universe u

/--
`Associative` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier) (first second third : Carrier), operation (operation first second) third = operation first (operation second third)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier) (first second third : Carrier), operation (operation first second) third = operation first (operation second third)

Logical form (Lean):

```lean
def Associative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  ∀ first second third,
    operation (operation first second) third =
      operation first (operation second third)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def Associative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  ∀ first second third,
    operation (operation first second) third =
      operation first (operation second third)

end LRA.Operation.Laws.Associative
