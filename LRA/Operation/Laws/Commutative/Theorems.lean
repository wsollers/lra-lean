import LRA.Operation.Laws.Commutative.Definition

namespace LRA.Operation.Laws.Commutative

open LRA.Operation

universe u

/--
`Commutative.apply` TODO

Predicate logic:

  (∀ first second ∈ Carrier), operation first second = operation second first

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier}, (∀ (first second : Carrier), operation first second = operation second first) → ∀ (first second : Carrier), operation first second = operation second first

Logical form (Lean):

```lean
theorem Commutative.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Commutative operation)
    (first second : Carrier) :
    operation first second = operation second first
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
theorem Commutative.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Commutative operation)
    (first second : Carrier) :
    operation first second = operation second first := by
  sorry
/--
`Commutative.symm_apply` TODO

Predicate logic:

  (∀ first second ∈ Carrier), operation second first = operation first second

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier}, (∀ (first second : Carrier), operation first second = operation second first) → ∀ (first second : Carrier), operation second first = operation first second

Logical form (Lean):

```lean
theorem Commutative.symm_apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Commutative operation)
    (first second : Carrier) :
    operation second first = operation first second
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
theorem Commutative.symm_apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Commutative operation)
    (first second : Carrier) :
    operation second first = operation first second := by
  sorry
end LRA.Operation.Laws.Commutative
