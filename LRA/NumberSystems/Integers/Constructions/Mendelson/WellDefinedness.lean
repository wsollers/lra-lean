
import LRA.NumberSystems.Integers.Constructions.Mendelson.Operations

namespace LRA.NumberSystems.Integers.Mendelson

/--
`representative_operations_respect_equivalence` TODO

Predicate logic:

  (∀ positive_data ∈ PositiveNaturalPairData), (∀ first₁ first₂ second₁ second₂, equivalent positive_data first₁ first₂ → equivalent positive_data second₁ second₂ → equivalent positive_data (representative_addition positive_data first₁ second₁) (representative_addition positive_data first₂ second₂)) ∧ (∀ first second, equivalent positive_data first second → equivalent positive_data (representative_negation positive_data first) (representative_negation positive_data second)) ∧ (∀ first₁ first₂ second₁ second₂, equivalent positive_data first₁ first₂ → equivalent positive_data second₁ second₂ → equivalent positive_data (representative_multiplication positive_data first₁ second₁) (representative_multiplication positive_data first₂ second₂))

Predicate logic (unfolded):

  ∀ (positive_data : LRA.NumberSystems.Integers.Mendelson.PositiveNaturalPairData), (∀ (first₁ first₂ second₁ second₂ : LRA.NumberSystems.Integers.Mendelson.PositivePair positive_data), positive_data.4 first₁.1 first₂.2 = positive_data.4 first₂.1 first₁.2 → positive_data.4 second₁.1 second₂.2 = positive_data.4 second₂.1 second₁.2 → positive_data.4 (LRA.NumberSystems.Integers.Mendelson.representative_addition positive_data first₁ second₁).1 (LRA.NumberSystems.Integers.Mendelson.representative_addition positive_data first₂ second₂).2 = positive_data.4 (LRA.NumberSystems.Integers.Mendelson.representative_addition positive_data first₂ second₂).1 (LRA.NumberSystems.Integers.Mendelson.representative_addition positive_data first₁ second₁).2 ∧ (∀ (first second : LRA.NumberSystems.Integers.Mendelson.PositivePair positive_data), positive_data.4 first.1 second.2 = positive_data.4 second.1 first.2 → positive_data.4 (LRA.NumberSystems.Integers.Mendelson.representative_negation positive_data first).1 (LRA.NumberSystems.Integers.Mendelson.representative_negation positive_data second).2 = positive_data.4 (LRA.NumberSystems.Integers.Mendelson.representative_negation positive_data second).1 (LRA.NumberSystems.Integers.Mendelson.representative_negation positive_data first).2 ∧ ∀ (first₁ first₂ second₁ second₂ : LRA.NumberSystems.Integers.Mendelson.PositivePair positive_data), positive_data.4 first₁.1 first₂.2 = positive_data.4 first₂.1 first₁.2 → positive_data.4 second₁.1 second₂.2 = positive_data.4 second₂.1 second₁.2 → positive_data.4 (LRA.NumberSystems.Integers.Mendelson.representative_multiplication positive_data first₁ second₁).1 (LRA.NumberSystems.Integers.Mendelson.representative_multiplication positive_data first₂ second₂).2 = positive_data.4 (LRA.NumberSystems.Integers.Mendelson.representative_multiplication positive_data first₂ second₂).1 (LRA.NumberSystems.Integers.Mendelson.representative_multiplication positive_data first₁ second₁).2))

Logical form (Lean):

```lean
theorem representative_operations_respect_equivalence
    (positive_data : PositiveNaturalPairData) :
    (∀ first₁ first₂ second₁ second₂,
      equivalent positive_data first₁ first₂ →
      equivalent positive_data second₁ second₂ →
        equivalent positive_data
          (representative_addition positive_data first₁ second₁)
          (representative_addition positive_data first₂ second₂)) ∧
    (∀ first second,
      equivalent positive_data first second →
        equivalent positive_data
          (representative_negation positive_data first)
          (representative_negation positive_data second)) ∧
    (∀ first₁ first₂ second₁ second₂,
      equivalent positive_data first₁ first₂ →
      equivalent positive_data second₁ second₂ →
        equivalent positive_data
          (representative_multiplication positive_data first₁ second₁)
          (representative_multiplication positive_data first₂ second₂))
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
    (positive_data : PositiveNaturalPairData) :
    (∀ first₁ first₂ second₁ second₂,
      equivalent positive_data first₁ first₂ →
      equivalent positive_data second₁ second₂ →
        equivalent positive_data
          (representative_addition positive_data first₁ second₁)
          (representative_addition positive_data first₂ second₂)) ∧
    (∀ first second,
      equivalent positive_data first second →
        equivalent positive_data
          (representative_negation positive_data first)
          (representative_negation positive_data second)) ∧
    (∀ first₁ first₂ second₁ second₂,
      equivalent positive_data first₁ first₂ →
      equivalent positive_data second₁ second₂ →
        equivalent positive_data
          (representative_multiplication positive_data first₁ second₁)
          (representative_multiplication positive_data first₂ second₂)) := by
  sorry

end LRA.NumberSystems.Integers.Mendelson
