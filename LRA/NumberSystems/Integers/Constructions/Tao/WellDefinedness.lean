
import LRA.NumberSystems.Integers.Constructions.Tao.Operations

namespace LRA.NumberSystems.Integers.Tao

/--
`representative_operations_respect_equivalence` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForTaoFormalDifferences), (∀ first₁ first₂ second₁ second₂, equivalent whole_data first₁ first₂ → equivalent whole_data second₁ second₂ → equivalent whole_data (representative_addition whole_data first₁ second₁) (representative_addition whole_data first₂ second₂)) ∧ (∀ first second, equivalent whole_data first second → equivalent whole_data (representative_negation whole_data first) (representative_negation whole_data second)) ∧ (∀ first₁ first₂ second₁ second₂, equivalent whole_data first₁ first₂ → equivalent whole_data second₁ second₂ → equivalent whole_data (representative_multiplication whole_data first₁ second₁) (representative_multiplication whole_data first₂ second₂))

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.Tao.WholeNumberArithmeticForTaoFormalDifferences), (∀ (first₁ first₂ second₁ second₂ : LRA.NumberSystems.Integers.Tao.FormalDifference whole_data), whole_data.4 first₁.1 first₂.2 = whole_data.4 first₂.1 first₁.2 → whole_data.4 second₁.1 second₂.2 = whole_data.4 second₂.1 second₁.2 → whole_data.4 (LRA.NumberSystems.Integers.Tao.representative_addition whole_data first₁ second₁).1 (LRA.NumberSystems.Integers.Tao.representative_addition whole_data first₂ second₂).2 = whole_data.4 (LRA.NumberSystems.Integers.Tao.representative_addition whole_data first₂ second₂).1 (LRA.NumberSystems.Integers.Tao.representative_addition whole_data first₁ second₁).2 ∧ (∀ (first second : LRA.NumberSystems.Integers.Tao.FormalDifference whole_data), whole_data.4 first.1 second.2 = whole_data.4 second.1 first.2 → whole_data.4 (LRA.NumberSystems.Integers.Tao.representative_negation whole_data first).1 (LRA.NumberSystems.Integers.Tao.representative_negation whole_data second).2 = whole_data.4 (LRA.NumberSystems.Integers.Tao.representative_negation whole_data second).1 (LRA.NumberSystems.Integers.Tao.representative_negation whole_data first).2 ∧ ∀ (first₁ first₂ second₁ second₂ : LRA.NumberSystems.Integers.Tao.FormalDifference whole_data), whole_data.4 first₁.1 first₂.2 = whole_data.4 first₂.1 first₁.2 → whole_data.4 second₁.1 second₂.2 = whole_data.4 second₂.1 second₁.2 → whole_data.4 (LRA.NumberSystems.Integers.Tao.representative_multiplication whole_data first₁ second₁).1 (LRA.NumberSystems.Integers.Tao.representative_multiplication whole_data first₂ second₂).2 = whole_data.4 (LRA.NumberSystems.Integers.Tao.representative_multiplication whole_data first₂ second₂).1 (LRA.NumberSystems.Integers.Tao.representative_multiplication whole_data first₁ second₁).2))

Logical form (Lean):

```lean
theorem representative_operations_respect_equivalence
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    (∀ first₁ first₂ second₁ second₂,
      equivalent whole_data first₁ first₂ →
      equivalent whole_data second₁ second₂ →
        equivalent whole_data
          (representative_addition whole_data first₁ second₁)
          (representative_addition whole_data first₂ second₂)) ∧
    (∀ first second,
      equivalent whole_data first second →
        equivalent whole_data
          (representative_negation whole_data first)
          (representative_negation whole_data second)) ∧
    (∀ first₁ first₂ second₁ second₂,
      equivalent whole_data first₁ first₂ →
      equivalent whole_data second₁ second₂ →
        equivalent whole_data
          (representative_multiplication whole_data first₁ second₁)
          (representative_multiplication whole_data first₂ second₂))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases

-/
theorem representative_operations_respect_equivalence
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    (∀ first₁ first₂ second₁ second₂,
      equivalent whole_data first₁ first₂ →
      equivalent whole_data second₁ second₂ →
        equivalent whole_data
          (representative_addition whole_data first₁ second₁)
          (representative_addition whole_data first₂ second₂)) ∧
    (∀ first second,
      equivalent whole_data first second →
        equivalent whole_data
          (representative_negation whole_data first)
          (representative_negation whole_data second)) ∧
    (∀ first₁ first₂ second₁ second₂,
      equivalent whole_data first₁ first₂ →
      equivalent whole_data second₁ second₂ →
        equivalent whole_data
          (representative_multiplication whole_data first₁ second₁)
          (representative_multiplication whole_data first₂ second₂)) := by
  sorry

end LRA.NumberSystems.Integers.Tao
