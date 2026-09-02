
import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs.WellFoundedness

namespace LRA.NumberSystems.Integers.QuotientOrderedPairs

/--
`representative_addition` TODO

Predicate logic:

  def representative_addition
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (first second : Representative whole_data) : Representative whole_data where
  positive_coordinate :=
    whole_data.addition first.positive_coordinate second.positive_coordinate
  negative_coordinate :=
    whole_data.addition first.negative_coordinate second.negative_coordinate

Predicate logic (unfolded):

  def representative_addition
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (first second : Representative whole_data) : Representative whole_data where
  positive_coordinate :=
    whole_data.addition first.positive_coordinate second.positive_coordinate
  negative_coordinate :=
    whole_data.addition first.negative_coordinate second.negative_coordinate (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def representative_addition
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (first second : Representative whole_data) : Representative whole_data where
  positive_coordinate :=
    whole_data.addition first.positive_coordinate second.positive_coordinate
  negative_coordinate :=
    whole_data.addition first.negative_coordinate second.negative_coordinate
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
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (first second : Representative whole_data) : Representative whole_data where
  positive_coordinate :=
    whole_data.addition first.positive_coordinate second.positive_coordinate
  negative_coordinate :=
    whole_data.addition first.negative_coordinate second.negative_coordinate

/--
`representative_negation` TODO

Predicate logic:

  def representative_negation
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (value : Representative whole_data) : Representative whole_data where
  positive_coordinate := value.negative_coordinate
  negative_coordinate := value.positive_coordinate

Predicate logic (unfolded):

  def representative_negation
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (value : Representative whole_data) : Representative whole_data where
  positive_coordinate := value.negative_coordinate
  negative_coordinate := value.positive_coordinate (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def representative_negation
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (value : Representative whole_data) : Representative whole_data where
  positive_coordinate := value.negative_coordinate
  negative_coordinate := value.positive_coordinate
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
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (value : Representative whole_data) : Representative whole_data where
  positive_coordinate := value.negative_coordinate
  negative_coordinate := value.positive_coordinate

/--
`representative_multiplication` TODO

Predicate logic:

  def representative_multiplication
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (first second : Representative whole_data) : Representative whole_data where
  positive_coordinate :=
    whole_data.addition
      (whole_data.multiplication first.positive_coordinate second.positive_coordinate)
      (whole_data.multiplication first.negative_coordinate second.negative_coordinate)
  negative_coordinate :=
    whole_data.addition
      (whole_data.multiplication first.positive_coordinate second.negative_coordinate)
      (whole_data.multiplication first.negative_coordinate second.positive_coordinate)

Predicate logic (unfolded):

  def representative_multiplication
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (first second : Representative whole_data) : Representative whole_data where
  positive_coordinate :=
    whole_data.addition
      (whole_data.multiplication first.positive_coordinate second.positive_coordinate)
      (whole_data.multiplication first.negative_coordinate second.negative_coordinate)
  negative_coordinate :=
    whole_data.addition
      (whole_data.multiplication first.positive_coordinate second.negative_coordinate)
      (whole_data.multiplication first.negative_coordinate second.positive_coordinate) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def representative_multiplication
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (first second : Representative whole_data) : Representative whole_data where
  positive_coordinate :=
    whole_data.addition
      (whole_data.multiplication first.positive_coordinate second.positive_coordinate)
      (whole_data.multiplication first.negative_coordinate second.negative_coordinate)
  negative_coordinate :=
    whole_data.addition
      (whole_data.multiplication first.positive_coordinate second.negative_coordinate)
      (whole_data.multiplication first.negative_coordinate second.positive_coordinate)
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
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (first second : Representative whole_data) : Representative whole_data where
  positive_coordinate :=
    whole_data.addition
      (whole_data.multiplication first.positive_coordinate second.positive_coordinate)
      (whole_data.multiplication first.negative_coordinate second.negative_coordinate)
  negative_coordinate :=
    whole_data.addition
      (whole_data.multiplication first.positive_coordinate second.negative_coordinate)
      (whole_data.multiplication first.negative_coordinate second.positive_coordinate)

/--
`representative_nonstrict_order` TODO

Predicate logic:

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs) (first second : LRA.NumberSystems.Integers.QuotientOrderedPairs.Representative whole_data), whole_data.6 (whole_data.addition first.positive_coordinate second.negative_coordinate) (whole_data.addition second.positive_coordinate first.negative_coordinate)

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs) (first second : LRA.NumberSystems.Integers.QuotientOrderedPairs.Representative whole_data), whole_data.6 (whole_data.4 first.1 second.2) (whole_data.4 second.1 first.2)

Logical form (Lean):

```lean
def representative_nonstrict_order
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (first second : Representative whole_data) : Prop :=
  whole_data.nonstrict_order
    (whole_data.addition first.positive_coordinate second.negative_coordinate)
    (whole_data.addition second.positive_coordinate first.negative_coordinate)
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
def representative_nonstrict_order
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (first second : Representative whole_data) : Prop :=
  whole_data.nonstrict_order
    (whole_data.addition first.positive_coordinate second.negative_coordinate)
    (whole_data.addition second.positive_coordinate first.negative_coordinate)

/--
`zero_representative` TODO

Predicate logic:

  def zero_representative (whole_data : WholeNumberArithmeticForQuotientPairs) : Representative whole_data where
  positive_coordinate := whole_data.zero
  negative_coordinate := whole_data.zero

Predicate logic (unfolded):

  def zero_representative (whole_data : WholeNumberArithmeticForQuotientPairs) : Representative whole_data where
  positive_coordinate := whole_data.zero
  negative_coordinate := whole_data.zero (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def zero_representative (whole_data : WholeNumberArithmeticForQuotientPairs) : Representative whole_data where
  positive_coordinate := whole_data.zero
  negative_coordinate := whole_data.zero
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
def zero_representative (whole_data : WholeNumberArithmeticForQuotientPairs) : Representative whole_data where
  positive_coordinate := whole_data.zero
  negative_coordinate := whole_data.zero

/--
`one_representative` TODO

Predicate logic:

  def one_representative (whole_data : WholeNumberArithmeticForQuotientPairs) : Representative whole_data where
  positive_coordinate := whole_data.one
  negative_coordinate := whole_data.zero

Predicate logic (unfolded):

  def one_representative (whole_data : WholeNumberArithmeticForQuotientPairs) : Representative whole_data where
  positive_coordinate := whole_data.one
  negative_coordinate := whole_data.zero (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def one_representative (whole_data : WholeNumberArithmeticForQuotientPairs) : Representative whole_data where
  positive_coordinate := whole_data.one
  negative_coordinate := whole_data.zero
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
def one_representative (whole_data : WholeNumberArithmeticForQuotientPairs) : Representative whole_data where
  positive_coordinate := whole_data.one
  negative_coordinate := whole_data.zero

/--
`embed` TODO

Predicate logic:

  def embed
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (value : whole_data.carrier) : Carrier whole_data :=
  Quotient.mk _
    { positive_coordinate := value
      negative_coordinate := whole_data.zero }

Predicate logic (unfolded):

  def embed
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (value : whole_data.carrier) : Carrier whole_data :=
  Quotient.mk _
    { positive_coordinate := value
      negative_coordinate := whole_data.zero } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def embed
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (value : whole_data.carrier) : Carrier whole_data :=
  Quotient.mk _
    { positive_coordinate := value
      negative_coordinate := whole_data.zero }
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
def embed
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (value : whole_data.carrier) : Carrier whole_data :=
  Quotient.mk _
    { positive_coordinate := value
      negative_coordinate := whole_data.zero }

/--
`embedding_is_injective` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForQuotientPairs), ∀ first second, embed whole_data first = embed whole_data second → first = second

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs) (first second : whole_data.1), Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 { positive_coordinate := first, negative_coordinate := whole_data.2 } = Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 { positive_coordinate := second, negative_coordinate := whole_data.2 } → first = second

Logical form (Lean):

```lean
theorem embedding_is_injective
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∀ first second,
      embed whole_data first = embed whole_data second → first = second
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
theorem embedding_is_injective
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∀ first second,
      embed whole_data first = embed whole_data second → first = second := by
  sorry
end LRA.NumberSystems.Integers.QuotientOrderedPairs
