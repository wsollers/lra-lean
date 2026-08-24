
import LRA.NumberSystems.Integers.Constructions.Tao.Laws

namespace LRA.NumberSystems.Integers.Tao

/--
`whole_embedding_preserves_addition` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForTaoFormalDifferences), ∀ first second : whole_data.carrier, whole_embedding whole_data (whole_data.addition first second) = Quotient.mk (setoid whole_data) (representative_addition whole_data (whole_embedding_representative whole_data first) (whole_embedding_representative whole_data second))

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.Tao.WholeNumberArithmeticForTaoFormalDifferences) (first second : whole_data.1), Quot.mk (LRA.NumberSystems.Integers.Tao.setoid whole_data).1 { minuend := whole_data.4 first second, subtrahend := whole_data.2 } = Quot.mk (LRA.NumberSystems.Integers.Tao.setoid whole_data).1 { minuend := whole_data.4 (LRA.NumberSystems.Integers.Tao.whole_embedding_representative whole_data first).1 (LRA.NumberSystems.Integers.Tao.whole_embedding_representative whole_data second).1, subtrahend := whole_data.4 (LRA.NumberSystems.Integers.Tao.whole_embedding_representative whole_data first).2 (LRA.NumberSystems.Integers.Tao.whole_embedding_representative whole_data second).2 }

Logical form (Lean):

```lean
theorem whole_embedding_preserves_addition
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    ∀ first second : whole_data.carrier,
      whole_embedding whole_data (whole_data.addition first second) =
        Quotient.mk (setoid whole_data)
          (representative_addition whole_data
            (whole_embedding_representative whole_data first)
            (whole_embedding_representative whole_data second))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem whole_embedding_preserves_addition
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    ∀ first second : whole_data.carrier,
      whole_embedding whole_data (whole_data.addition first second) =
        Quotient.mk (setoid whole_data)
          (representative_addition whole_data
            (whole_embedding_representative whole_data first)
            (whole_embedding_representative whole_data second)) := by
  sorry

/--
`whole_embedding_zero_eq_zero_representative_class` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForTaoFormalDifferences), whole_embedding whole_data whole_data.zero = Quotient.mk (setoid whole_data) (zero_representative whole_data)

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.Tao.WholeNumberArithmeticForTaoFormalDifferences), Quot.mk (LRA.NumberSystems.Integers.Tao.setoid whole_data).1 { minuend := whole_data.2, subtrahend := whole_data.2 } = Quot.mk (LRA.NumberSystems.Integers.Tao.setoid whole_data).1 { minuend := whole_data.2, subtrahend := whole_data.2 }

Logical form (Lean):

```lean
theorem whole_embedding_zero_eq_zero_representative_class
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    whole_embedding whole_data whole_data.zero =
      Quotient.mk (setoid whole_data) (zero_representative whole_data)
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
theorem whole_embedding_zero_eq_zero_representative_class
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    whole_embedding whole_data whole_data.zero =
      Quotient.mk (setoid whole_data) (zero_representative whole_data) := by
  sorry

end LRA.NumberSystems.Integers.Tao
