
import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions.WellFoundedness

namespace LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

/--
`representative_addition` TODO

Predicate logic:

  def representative_addition (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data) : Representative rational_data where
  numerator :=
    rational_data.integer_system.Model.signature.add
      (rational_data.integer_system.Model.signature.multiply
        first.numerator (rational_data.to_integer second.denominator))
      (rational_data.integer_system.Model.signature.multiply
        second.numerator (rational_data.to_integer first.denominator))
  denominator := rational_data.multiplication first.denominator second.denominator

Predicate logic (unfolded):

  def representative_addition (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data) : Representative rational_data where
  numerator :=
    rational_data.integer_system.Model.signature.add
      (rational_data.integer_system.Model.signature.multiply
        first.numerator (rational_data.to_integer second.denominator))
      (rational_data.integer_system.Model.signature.multiply
        second.numerator (rational_data.to_integer first.denominator))
  denominator := rational_data.multiplication first.denominator second.denominator (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def representative_addition (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data) : Representative rational_data where
  numerator :=
    rational_data.integer_system.Model.signature.add
      (rational_data.integer_system.Model.signature.multiply
        first.numerator (rational_data.to_integer second.denominator))
      (rational_data.integer_system.Model.signature.multiply
        second.numerator (rational_data.to_integer first.denominator))
  denominator := rational_data.multiplication first.denominator second.denominator
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
def representative_addition (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data) : Representative rational_data where
  numerator :=
    rational_data.integer_system.Model.signature.add
      (rational_data.integer_system.Model.signature.multiply
        first.numerator (rational_data.to_integer second.denominator))
      (rational_data.integer_system.Model.signature.multiply
        second.numerator (rational_data.to_integer first.denominator))
  denominator := rational_data.multiplication first.denominator second.denominator

/--
`representative_multiplication` TODO

Predicate logic:

  def representative_multiplication (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data) : Representative rational_data where
  numerator := rational_data.integer_system.Model.signature.multiply
    first.numerator second.numerator
  denominator := rational_data.multiplication first.denominator second.denominator

Predicate logic (unfolded):

  def representative_multiplication (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data) : Representative rational_data where
  numerator := rational_data.integer_system.Model.signature.multiply
    first.numerator second.numerator
  denominator := rational_data.multiplication first.denominator second.denominator (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def representative_multiplication (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data) : Representative rational_data where
  numerator := rational_data.integer_system.Model.signature.multiply
    first.numerator second.numerator
  denominator := rational_data.multiplication first.denominator second.denominator
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
def representative_multiplication (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data) : Representative rational_data where
  numerator := rational_data.integer_system.Model.signature.multiply
    first.numerator second.numerator
  denominator := rational_data.multiplication first.denominator second.denominator

/--
`representative_negation` TODO

Predicate logic:

  def representative_negation (rational_data : IntegerAndPositiveNaturalData)
    (representative : Representative rational_data) : Representative rational_data where
  numerator := rational_data.integer_system.Model.signature.neg representative.numerator
  denominator := representative.denominator

Predicate logic (unfolded):

  def representative_negation (rational_data : IntegerAndPositiveNaturalData)
    (representative : Representative rational_data) : Representative rational_data where
  numerator := rational_data.integer_system.Model.signature.neg representative.numerator
  denominator := representative.denominator (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def representative_negation (rational_data : IntegerAndPositiveNaturalData)
    (representative : Representative rational_data) : Representative rational_data where
  numerator := rational_data.integer_system.Model.signature.neg representative.numerator
  denominator := representative.denominator
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
def representative_negation (rational_data : IntegerAndPositiveNaturalData)
    (representative : Representative rational_data) : Representative rational_data where
  numerator := rational_data.integer_system.Model.signature.neg representative.numerator
  denominator := representative.denominator

/--
`zero_representative` TODO

Predicate logic:

  def zero_representative (rational_data : IntegerAndPositiveNaturalData) : Representative rational_data where
  numerator := rational_data.integer_system.Model.signature.zero
  denominator := rational_data.one

Predicate logic (unfolded):

  def zero_representative (rational_data : IntegerAndPositiveNaturalData) : Representative rational_data where
  numerator := rational_data.integer_system.Model.signature.zero
  denominator := rational_data.one (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def zero_representative (rational_data : IntegerAndPositiveNaturalData) : Representative rational_data where
  numerator := rational_data.integer_system.Model.signature.zero
  denominator := rational_data.one
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
def zero_representative (rational_data : IntegerAndPositiveNaturalData) : Representative rational_data where
  numerator := rational_data.integer_system.Model.signature.zero
  denominator := rational_data.one

/--
`one_representative` TODO

Predicate logic:

  def one_representative (rational_data : IntegerAndPositiveNaturalData) : Representative rational_data where
  numerator := rational_data.integer_system.Model.signature.one
  denominator := rational_data.one

Predicate logic (unfolded):

  def one_representative (rational_data : IntegerAndPositiveNaturalData) : Representative rational_data where
  numerator := rational_data.integer_system.Model.signature.one
  denominator := rational_data.one (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def one_representative (rational_data : IntegerAndPositiveNaturalData) : Representative rational_data where
  numerator := rational_data.integer_system.Model.signature.one
  denominator := rational_data.one
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
def one_representative (rational_data : IntegerAndPositiveNaturalData) : Representative rational_data where
  numerator := rational_data.integer_system.Model.signature.one
  denominator := rational_data.one

/--
`zero` TODO

Predicate logic:

  def zero (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data :=
  Quotient.mk _ (zero_representative rational_data)

Predicate logic (unfolded):

  def zero (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data :=
  Quotient.mk _ (zero_representative rational_data) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def zero (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data :=
  Quotient.mk _ (zero_representative rational_data)
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
def zero (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data :=
  Quotient.mk _ (zero_representative rational_data)

/--
`one` TODO

Predicate logic:

  def one (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data :=
  Quotient.mk _ (one_representative rational_data)

Predicate logic (unfolded):

  def one (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data :=
  Quotient.mk _ (one_representative rational_data) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def one (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data :=
  Quotient.mk _ (one_representative rational_data)
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
def one (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data :=
  Quotient.mk _ (one_representative rational_data)

/--
`representative_strict_order` TODO

Predicate logic:

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData) (first second : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), rational_data.integer_system.Model.ltInst.1 (rational_data.integer_system.Model.signature.multiply first.numerator (rational_data.to_integer second.denominator)) (rational_data.integer_system.Model.signature.multiply second.numerator (rational_data.to_integer first.denominator))

Predicate logic (unfolded):

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData) (first second : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), rational_data.integer_system.Model.ltInst.1 (rational_data.integer_system.Model.signature.toBooleanRingOperationBundle.3 first.1 (rational_data.5 second.2)) (rational_data.integer_system.Model.signature.toBooleanRingOperationBundle.3 second.1 (rational_data.5 first.2))

Logical form (Lean):

```lean
def representative_strict_order (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data) : Prop :=
  rational_data.integer_system.Model.signature.StrictOrder
    (rational_data.integer_system.Model.signature.multiply
      first.numerator (rational_data.to_integer second.denominator))
    (rational_data.integer_system.Model.signature.multiply
      second.numerator (rational_data.to_integer first.denominator))
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
def representative_strict_order (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data) : Prop :=
  rational_data.integer_system.Model.signature.StrictOrder
    (rational_data.integer_system.Model.signature.multiply
      first.numerator (rational_data.to_integer second.denominator))
    (rational_data.integer_system.Model.signature.multiply
      second.numerator (rational_data.to_integer first.denominator))

end LRA.NumberSystems.RationalNumbers.RationalQuotientFractions
