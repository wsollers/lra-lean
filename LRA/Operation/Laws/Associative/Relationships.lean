import LRA.Operation.Laws.Associative.Theorems

namespace LRA.Operation.Laws.Associative

open LRA.Operation

universe u

/--
`Associative.preserves_left_nested_shape` TODO

Predicate logic:

  (∀ first second third ∈ Carrier), operation (operation first second) third = operation first (operation second third)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier}, (∀ (first second third : Carrier), operation (operation first second) third = operation first (operation second third)) → ∀ (first second third : Carrier), operation (operation first second) third = operation first (operation second third)

Logical form (Lean):

```lean
theorem Associative.preserves_left_nested_shape {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Associative operation)
    (first second third : Carrier) :
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

Related proof moves: TODO

-/
theorem Associative.preserves_left_nested_shape {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Associative operation)
    (first second third : Carrier) :
    operation (operation first second) third =
      operation first (operation second third) := by
  sorry
end LRA.Operation.Laws.Associative
