
import LRA.NumberSystems.Integers.Constructions.Mendelson.Laws

namespace LRA.NumberSystems.Integers.Mendelson

/--
`one_one_not_positive_class` TODO

Predicate logic:

  (∀ positive_data ∈ PositiveNaturalPairData), ¬ positive_class positive_data { left := positive_data.one, right := positive_data.one }

Predicate logic (unfolded):

  ∀ (positive_data : LRA.NumberSystems.Integers.Mendelson.PositiveNaturalPairData), (positive_data.6 { left := positive_data.one, right := positive_data.one }.2 { left := positive_data.one, right := positive_data.one }.1 ∧ positive_data.4 { left := positive_data.one, right := positive_data.one }.1 { left := positive_data.one, right := positive_data.one }.2 = positive_data.4 { left := positive_data.one, right := positive_data.one }.1 { left := positive_data.one, right := positive_data.one }.2 → False) → False

Logical form (Lean):

```lean
theorem one_one_not_positive_class
    (positive_data : PositiveNaturalPairData) :
    ¬ positive_class positive_data
      { left := positive_data.one, right := positive_data.one }
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
theorem one_one_not_positive_class
    (positive_data : PositiveNaturalPairData) :
    ¬ positive_class positive_data
      { left := positive_data.one, right := positive_data.one } := by
  sorry
end LRA.NumberSystems.Integers.Mendelson
