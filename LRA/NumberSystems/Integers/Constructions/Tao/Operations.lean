
import LRA.NumberSystems.Integers.Constructions.Tao.WellFoundedness

namespace LRA.NumberSystems.Integers.Tao

/--
`zero_representative` TODO

Predicate logic:

  def zero_representative
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    FormalDifference whole_data where
  minuend := whole_data.zero
  subtrahend := whole_data.zero

Predicate logic (unfolded):

  def zero_representative
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    FormalDifference whole_data where
  minuend := whole_data.zero
  subtrahend := whole_data.zero (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def zero_representative
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    FormalDifference whole_data where
  minuend := whole_data.zero
  subtrahend := whole_data.zero
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def zero_representative
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    FormalDifference whole_data where
  minuend := whole_data.zero
  subtrahend := whole_data.zero

/--
`whole_embedding_representative` TODO

Predicate logic:

  def whole_embedding_representative
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (value : whole_data.carrier) : FormalDifference whole_data where
  minuend := value
  subtrahend := whole_data.zero

Predicate logic (unfolded):

  def whole_embedding_representative
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (value : whole_data.carrier) : FormalDifference whole_data where
  minuend := value
  subtrahend := whole_data.zero (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def whole_embedding_representative
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (value : whole_data.carrier) : FormalDifference whole_data where
  minuend := value
  subtrahend := whole_data.zero
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def whole_embedding_representative
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (value : whole_data.carrier) : FormalDifference whole_data where
  minuend := value
  subtrahend := whole_data.zero

/--
`whole_embedding` TODO

Predicate logic:

  def whole_embedding
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    whole_data.carrier → Carrier whole_data :=
  fun value => Quotient.mk (setoid whole_data)
    (whole_embedding_representative whole_data value)

Predicate logic (unfolded):

  def whole_embedding
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    whole_data.carrier → Carrier whole_data :=
  fun value => Quotient.mk (setoid whole_data)
    (whole_embedding_representative whole_data value) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def whole_embedding
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    whole_data.carrier → Carrier whole_data :=
  fun value => Quotient.mk (setoid whole_data)
    (whole_embedding_representative whole_data value)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def whole_embedding
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    whole_data.carrier → Carrier whole_data :=
  fun value => Quotient.mk (setoid whole_data)
    (whole_embedding_representative whole_data value)

/--
`whole_embedding_is_injective` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForTaoFormalDifferences), ∀ first second, whole_embedding whole_data first = whole_embedding whole_data second → first = second

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.Tao.WholeNumberArithmeticForTaoFormalDifferences) (first second : whole_data.1), Quot.mk (LRA.NumberSystems.Integers.Tao.setoid whole_data).1 { minuend := first, subtrahend := whole_data.2 } = Quot.mk (LRA.NumberSystems.Integers.Tao.setoid whole_data).1 { minuend := second, subtrahend := whole_data.2 } → first = second

Logical form (Lean):

```lean
theorem whole_embedding_is_injective
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    ∀ first second,
      whole_embedding whole_data first = whole_embedding whole_data second →
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

Related proof moves: intro

-/
theorem whole_embedding_is_injective
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    ∀ first second,
      whole_embedding whole_data first = whole_embedding whole_data second →
        first = second := by
  sorry

/--
`representative_addition` TODO

Predicate logic:

  def representative_addition
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : FormalDifference whole_data where
  minuend := whole_data.addition first.minuend second.minuend
  subtrahend := whole_data.addition first.subtrahend second.subtrahend

Predicate logic (unfolded):

  def representative_addition
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : FormalDifference whole_data where
  minuend := whole_data.addition first.minuend second.minuend
  subtrahend := whole_data.addition first.subtrahend second.subtrahend (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def representative_addition
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : FormalDifference whole_data where
  minuend := whole_data.addition first.minuend second.minuend
  subtrahend := whole_data.addition first.subtrahend second.subtrahend
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def representative_addition
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : FormalDifference whole_data where
  minuend := whole_data.addition first.minuend second.minuend
  subtrahend := whole_data.addition first.subtrahend second.subtrahend

/--
`representative_negation` TODO

Predicate logic:

  def representative_negation
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (value : FormalDifference whole_data) : FormalDifference whole_data where
  minuend := value.subtrahend
  subtrahend := value.minuend

Predicate logic (unfolded):

  def representative_negation
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (value : FormalDifference whole_data) : FormalDifference whole_data where
  minuend := value.subtrahend
  subtrahend := value.minuend (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def representative_negation
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (value : FormalDifference whole_data) : FormalDifference whole_data where
  minuend := value.subtrahend
  subtrahend := value.minuend
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def representative_negation
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (value : FormalDifference whole_data) : FormalDifference whole_data where
  minuend := value.subtrahend
  subtrahend := value.minuend

/--
`representative_multiplication` TODO

Predicate logic:

  def representative_multiplication
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : FormalDifference whole_data where
  minuend :=
    whole_data.addition
      (whole_data.multiplication first.minuend second.minuend)
      (whole_data.multiplication first.subtrahend second.subtrahend)
  subtrahend :=
    whole_data.addition
      (whole_data.multiplication first.minuend second.subtrahend)
      (whole_data.multiplication first.subtrahend second.minuend)

Predicate logic (unfolded):

  def representative_multiplication
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : FormalDifference whole_data where
  minuend :=
    whole_data.addition
      (whole_data.multiplication first.minuend second.minuend)
      (whole_data.multiplication first.subtrahend second.subtrahend)
  subtrahend :=
    whole_data.addition
      (whole_data.multiplication first.minuend second.subtrahend)
      (whole_data.multiplication first.subtrahend second.minuend) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def representative_multiplication
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : FormalDifference whole_data where
  minuend :=
    whole_data.addition
      (whole_data.multiplication first.minuend second.minuend)
      (whole_data.multiplication first.subtrahend second.subtrahend)
  subtrahend :=
    whole_data.addition
      (whole_data.multiplication first.minuend second.subtrahend)
      (whole_data.multiplication first.subtrahend second.minuend)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def representative_multiplication
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : FormalDifference whole_data where
  minuend :=
    whole_data.addition
      (whole_data.multiplication first.minuend second.minuend)
      (whole_data.multiplication first.subtrahend second.subtrahend)
  subtrahend :=
    whole_data.addition
      (whole_data.multiplication first.minuend second.subtrahend)
      (whole_data.multiplication first.subtrahend second.minuend)

/--
`nonnegative` TODO

Predicate logic:

  ∀ (whole_data : LRA.NumberSystems.Integers.Tao.WholeNumberArithmeticForTaoFormalDifferences) (value : LRA.NumberSystems.Integers.Tao.FormalDifference whole_data), whole_data.6 value.subtrahend value.minuend

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.Tao.WholeNumberArithmeticForTaoFormalDifferences) (value : LRA.NumberSystems.Integers.Tao.FormalDifference whole_data), whole_data.6 value.2 value.1

Logical form (Lean):

```lean
def nonnegative
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (value : FormalDifference whole_data) : Prop :=
  whole_data.nonstrict_order value.subtrahend value.minuend
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def nonnegative
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (value : FormalDifference whole_data) : Prop :=
  whole_data.nonstrict_order value.subtrahend value.minuend

/--
`representative_strict_order` TODO

Predicate logic:

  ∀ (whole_data : LRA.NumberSystems.Integers.Tao.WholeNumberArithmeticForTaoFormalDifferences) (first second : LRA.NumberSystems.Integers.Tao.FormalDifference whole_data), (whole_data.nonstrict_order (whole_data.addition first.minuend second.subtrahend) (whole_data.addition second.minuend first.subtrahend) ∧ ¬ LRA.NumberSystems.Integers.Tao.equivalent whole_data first second)

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.Tao.WholeNumberArithmeticForTaoFormalDifferences) (first second : LRA.NumberSystems.Integers.Tao.FormalDifference whole_data), (whole_data.6 (whole_data.4 first.1 second.2) (whole_data.4 second.1 first.2) ∧ whole_data.4 first.1 second.2 = whole_data.4 second.1 first.2 → False)

Logical form (Lean):

```lean
def representative_strict_order
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : Prop :=
  whole_data.nonstrict_order
    (whole_data.addition first.minuend second.subtrahend)
    (whole_data.addition second.minuend first.subtrahend) ∧
  ¬ equivalent whole_data first second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def representative_strict_order
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : Prop :=
  whole_data.nonstrict_order
    (whole_data.addition first.minuend second.subtrahend)
    (whole_data.addition second.minuend first.subtrahend) ∧
  ¬ equivalent whole_data first second

end LRA.NumberSystems.Integers.Tao
