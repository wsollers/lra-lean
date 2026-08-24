
import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.Carrier

namespace LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

variable {R : Type u}

/--
`ext` TODO

Predicate logic:

  (first.real_part = second.real_part ∧ first.imaginary_part = second.imaginary_part) → first = second

Predicate logic (unfolded):

  ∀ {R : Type u} {first second : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R}, (first.1 = second.1 ∧ first.2 = second.2) → first = second

Logical form (Lean):

```lean
theorem ext {first second : ComplexNumber R}
    (real_parts_equal : first.real_part = second.real_part)
    (imaginary_parts_equal :
      first.imaginary_part = second.imaginary_part) :
    first = second
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
theorem ext {first second : ComplexNumber R}
    (real_parts_equal : first.real_part = second.real_part)
    (imaginary_parts_equal :
      first.imaginary_part = second.imaginary_part) :
    first = second := by
  sorry

end LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs
