import LRA.Operation.Laws.Idempotent.Theorems

namespace LRA.Operation.Laws.Idempotent

open LRA.Operation

universe u

/--
`Idempotent.fixed_by_self_operation` TODO

Predicate logic:

  ∀ {Carrier : Type u} {operation : LRA.Operation.BinaryEndoOperation Carrier}, LRA.Operation.Laws.Idempotent.Idempotent operation → ∀ (element : Carrier), operation element element = element

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    operation : BinaryEndoOperation Carrier
    law : Idempotent operation
    element : Carrier
  Prove
    (∀ (element : Carrier), operation element element = element) → ∀ (element : Carrier), operation element element = element

Logical form (Lean):

```lean
theorem Idempotent.fixed_by_self_operation {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Idempotent operation)
    (element : Carrier) :
    operation element element = element
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
theorem Idempotent.fixed_by_self_operation {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Idempotent operation)
    (element : Carrier) :
    operation element element = element := by
  sorry
end LRA.Operation.Laws.Idempotent
