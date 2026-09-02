import LRA.Operation.Laws.Associative.Definition

namespace LRA.Operation.Laws.Associative

open LRA.Operation

universe u

/--
`Associative.apply` TODO

Predicate logic:

  (∀ first second third ∈ Carrier), operation (operation first second) third = operation first (operation second third)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier}, (∀ (first second third : Carrier), operation (operation first second) third = operation first (operation second third)) → ∀ (first second third : Carrier), operation (operation first second) third = operation first (operation second third)

Logical form (Lean):

```lean
theorem Associative.apply {Carrier : Type u}
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
theorem Associative.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Associative operation)
    (first second third : Carrier) :
    operation (operation first second) third =
      operation first (operation second third) := by
  sorry
/--
`Associative.reassociate_left` TODO

Predicate logic:

  (∀ first second third ∈ Carrier), operation (operation first second) third = operation first (operation second third)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier}, (∀ (first second third : Carrier), operation (operation first second) third = operation first (operation second third)) → ∀ (first second third : Carrier), operation (operation first second) third = operation first (operation second third)

Logical form (Lean):

```lean
theorem Associative.reassociate_left {Carrier : Type u}
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
theorem Associative.reassociate_left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Associative operation)
    (first second third : Carrier) :
    operation (operation first second) third =
      operation first (operation second third) := by
  sorry
/--
`Associative.reassociate_right` TODO

Predicate logic:

  (∀ first second third ∈ Carrier), operation first (operation second third) = operation (operation first second) third

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier}, (∀ (first second third : Carrier), operation (operation first second) third = operation first (operation second third)) → ∀ (first second third : Carrier), operation first (operation second third) = operation (operation first second) third

Logical form (Lean):

```lean
theorem Associative.reassociate_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Associative operation)
    (first second third : Carrier) :
    operation first (operation second third) =
      operation (operation first second) third
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
theorem Associative.reassociate_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Associative operation)
    (first second third : Carrier) :
    operation first (operation second third) =
      operation (operation first second) third := by
  sorry
/--
`Associative.four_left` TODO

Predicate logic:

  (∀ first second third fourth ∈ Carrier), operation (operation (operation first second) third) fourth = operation first (operation second (operation third fourth))

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier}, (∀ (first second third : Carrier), operation (operation first second) third = operation first (operation second third)) → ∀ (first second third fourth : Carrier), operation (operation (operation first second) third) fourth = operation first (operation second (operation third fourth))

Logical form (Lean):

```lean
theorem Associative.four_left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Associative operation)
    (first second third fourth : Carrier) :
    operation (operation (operation first second) third) fourth =
      operation first (operation second (operation third fourth))
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
theorem Associative.four_left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Associative operation)
    (first second third fourth : Carrier) :
    operation (operation (operation first second) third) fourth =
      operation first (operation second (operation third fourth)) := by
  sorry
/--
`Associative.four_right` TODO

Predicate logic:

  (∀ first second third fourth ∈ Carrier), operation first (operation second (operation third fourth)) = operation (operation (operation first second) third) fourth

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier}, (∀ (first second third : Carrier), operation (operation first second) third = operation first (operation second third)) → ∀ (first second third fourth : Carrier), operation first (operation second (operation third fourth)) = operation (operation (operation first second) third) fourth

Logical form (Lean):

```lean
theorem Associative.four_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Associative operation)
    (first second third fourth : Carrier) :
    operation first (operation second (operation third fourth)) =
      operation (operation (operation first second) third) fourth
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
theorem Associative.four_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Associative operation)
    (first second third fourth : Carrier) :
    operation first (operation second (operation third fourth)) =
      operation (operation (operation first second) third) fourth := by
  sorry
end LRA.Operation.Laws.Associative
