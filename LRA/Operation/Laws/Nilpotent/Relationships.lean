import LRA.Operation.Laws.Nilpotent.Theorems

namespace LRA.Operation.Laws.Nilpotent

open LRA.Operation

universe u

/--
`NilpotentElement.respects_element_equality` TODO

Predicate logic:

  (first = second) → NilpotentElement operation zero second

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier} {zero first second : Carrier}, (first = second ∧ Exists fun positiveExponent => LRA.Operation.Laws.Nilpotent.PositivePower operation first positiveExponent = zero) → Exists fun positiveExponent => LRA.Operation.Laws.Nilpotent.PositivePower operation second positiveExponent = zero

Logical form (Lean):

```lean
theorem NilpotentElement.respects_element_equality {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {zero first second : Carrier}
    (equal_elements : first = second)
    (law : NilpotentElement operation zero first) :
    NilpotentElement operation zero second
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
theorem NilpotentElement.respects_element_equality {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {zero first second : Carrier}
    (equal_elements : first = second)
    (law : NilpotentElement operation zero first) :
    NilpotentElement operation zero second := by
  sorry
end LRA.Operation.Laws.Nilpotent
