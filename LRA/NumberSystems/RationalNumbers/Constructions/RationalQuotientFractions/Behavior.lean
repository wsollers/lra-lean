
import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions.Laws

namespace LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

/--
`integer_representative` TODO

Predicate logic:

  def integer_representative (rational_data : IntegerAndPositiveNaturalData)
    (value : rational_data.integer_system.Model.signature.carrier) : Representative rational_data where
  numerator := value
  denominator := rational_data.one

Predicate logic (unfolded):

  def integer_representative (rational_data : IntegerAndPositiveNaturalData)
    (value : rational_data.integer_system.Model.signature.carrier) : Representative rational_data where
  numerator := value
  denominator := rational_data.one (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def integer_representative (rational_data : IntegerAndPositiveNaturalData)
    (value : rational_data.integer_system.Model.signature.carrier) : Representative rational_data where
  numerator := value
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
def integer_representative (rational_data : IntegerAndPositiveNaturalData)
    (value : rational_data.integer_system.Model.signature.carrier) : Representative rational_data where
  numerator := value
  denominator := rational_data.one

/--
`integer_embedding` TODO

Predicate logic:

  def integer_embedding (rational_data : IntegerAndPositiveNaturalData)
    (value : rational_data.integer_system.Model.signature.carrier) : Carrier rational_data :=
  Quotient.mk _ (integer_representative rational_data value)

Predicate logic (unfolded):

  def integer_embedding (rational_data : IntegerAndPositiveNaturalData)
    (value : rational_data.integer_system.Model.signature.carrier) : Carrier rational_data :=
  Quotient.mk _ (integer_representative rational_data value) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def integer_embedding (rational_data : IntegerAndPositiveNaturalData)
    (value : rational_data.integer_system.Model.signature.carrier) : Carrier rational_data :=
  Quotient.mk _ (integer_representative rational_data value)
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
def integer_embedding (rational_data : IntegerAndPositiveNaturalData)
    (value : rational_data.integer_system.Model.signature.carrier) : Carrier rational_data :=
  Quotient.mk _ (integer_representative rational_data value)

/--
`two` TODO

Predicate logic:

  def two (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data :=
  integer_embedding rational_data
    (rational_data.integer_system.Model.signature.add
      rational_data.integer_system.Model.signature.one
      rational_data.integer_system.Model.signature.one)

Predicate logic (unfolded):

  def two (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data :=
  integer_embedding rational_data
    (rational_data.integer_system.Model.signature.add
      rational_data.integer_system.Model.signature.one
      rational_data.integer_system.Model.signature.one) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def two (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data :=
  integer_embedding rational_data
    (rational_data.integer_system.Model.signature.add
      rational_data.integer_system.Model.signature.one
      rational_data.integer_system.Model.signature.one)
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
def two (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data :=
  integer_embedding rational_data
    (rational_data.integer_system.Model.signature.add
      rational_data.integer_system.Model.signature.one
      rational_data.integer_system.Model.signature.one)

/--
`integer_embedding_properties` TODO

Predicate logic:

  (∀ rational_data ∈ IntegerAndPositiveNaturalData), (∀ first second, integer_embedding rational_data first = integer_embedding rational_data second → first = second) ∧ integer_embedding rational_data rational_data.integer_system.Model.signature.zero = zero rational_data ∧ integer_embedding rational_data rational_data.integer_system.Model.signature.one = one rational_data ∧ (∀ first second, integer_embedding rational_data (rational_data.integer_system.Model.signature.add first second) = addition rational_data (integer_embedding rational_data first) (integer_embedding rational_data second)) ∧ (∀ first second, integer_embedding rational_data (rational_data.integer_system.Model.signature.multiply first second) = multiplication rational_data (integer_embedding rational_data first) (integer_embedding rational_data second)) ∧ (∀ first second, strict_order rational_data (integer_embedding rational_data first) (integer_embedding rational_data second) ↔ rational_data.integer_system.Model.signature.StrictOrder first second)

Predicate logic (unfolded):

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData), (∀ (first second : rational_data.integer_system.Model.signature.toCarrierBundle.1), Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 { numerator := first, denominator := rational_data.3 } = Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 { numerator := second, denominator := rational_data.3 } → first = second ∧ (Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 { numerator := rational_data.integer_system.Model.signature.toZeroOneBundle.2, denominator := rational_data.3 } = Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 { numerator := rational_data.integer_system.Model.signature.toZeroOneBundle.2, denominator := rational_data.3 } ∧ (Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 { numerator := rational_data.integer_system.Model.signature.toZeroOneBundle.3, denominator := rational_data.3 } = Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 { numerator := rational_data.integer_system.Model.signature.toZeroOneBundle.3, denominator := rational_data.3 } ∧ (∀ (first second : rational_data.integer_system.Model.signature.toCarrierBundle.1), Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 { numerator := rational_data.integer_system.Model.signature.toBooleanRingOperationBundle.2 first second, denominator := rational_data.3 } = (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_addition rational_data first_representative second_representative)) ⋯).1 (Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 { numerator := first, denominator := rational_data.one }) (Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 { numerator := second, denominator := rational_data.one }) ∧ (∀ (first second : rational_data.integer_system.Model.signature.toCarrierBundle.1), Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 { numerator := rational_data.integer_system.Model.signature.toBooleanRingOperationBundle.3 first second, denominator := rational_data.3 } = (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_multiplication rational_data first_representative second_representative)) ⋯).1 (Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 { numerator := first, denominator := rational_data.one }) (Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 { numerator := second, denominator := rational_data.one }) ∧ ∀ (first second : rational_data.integer_system.Model.signature.toCarrierBundle.1), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 (Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 { numerator := first, denominator := rational_data.one }) (Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 { numerator := second, denominator := rational_data.one }) ↔ rational_data.integer_system.Model.signature.2 first second)))))

Logical form (Lean):

```lean
theorem integer_embedding_properties (rational_data : IntegerAndPositiveNaturalData) :
    (∀ first second,
      integer_embedding rational_data first = integer_embedding rational_data second → first = second) ∧
    integer_embedding rational_data rational_data.integer_system.Model.signature.zero = zero rational_data ∧
    integer_embedding rational_data rational_data.integer_system.Model.signature.one = one rational_data ∧
    (∀ first second,
      integer_embedding rational_data
          (rational_data.integer_system.Model.signature.add first second) =
        addition rational_data (integer_embedding rational_data first) (integer_embedding rational_data second)) ∧
    (∀ first second,
      integer_embedding rational_data
          (rational_data.integer_system.Model.signature.multiply first second) =
        multiplication rational_data (integer_embedding rational_data first) (integer_embedding rational_data second)) ∧
    (∀ first second,
      strict_order rational_data (integer_embedding rational_data first) (integer_embedding rational_data second) ↔
        rational_data.integer_system.Model.signature.StrictOrder first second)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
theorem integer_embedding_properties (rational_data : IntegerAndPositiveNaturalData) :
    (∀ first second,
      integer_embedding rational_data first = integer_embedding rational_data second → first = second) ∧
    integer_embedding rational_data rational_data.integer_system.Model.signature.zero = zero rational_data ∧
    integer_embedding rational_data rational_data.integer_system.Model.signature.one = one rational_data ∧
    (∀ first second,
      integer_embedding rational_data
          (rational_data.integer_system.Model.signature.add first second) =
        addition rational_data (integer_embedding rational_data first) (integer_embedding rational_data second)) ∧
    (∀ first second,
      integer_embedding rational_data
          (rational_data.integer_system.Model.signature.multiply first second) =
        multiplication rational_data (integer_embedding rational_data first) (integer_embedding rational_data second)) ∧
    (∀ first second,
      strict_order rational_data (integer_embedding rational_data first) (integer_embedding rational_data second) ↔
        rational_data.integer_system.Model.signature.StrictOrder first second) := by
  sorry

/--
`IsReduced` TODO

Predicate logic:

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalReductionData) (representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data.toIntegerAndPositiveNaturalData), rational_data.gcd (rational_data.absolute_numerator representative.numerator) representative.denominator = rational_data.one

Predicate logic (unfolded):

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalReductionData) (representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data.1), rational_data.3 (rational_data.2 representative.1) representative.2 = rational_data.toIntegerAndPositiveNaturalData.3

Logical form (Lean):

```lean
def IsReduced
    (rational_data : IntegerAndPositiveNaturalReductionData)
    (representative : Representative rational_data.toIntegerAndPositiveNaturalData) : Prop :=
  rational_data.gcd
      (rational_data.absolute_numerator representative.numerator)
      representative.denominator = rational_data.one
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
def IsReduced
    (rational_data : IntegerAndPositiveNaturalReductionData)
    (representative : Representative rational_data.toIntegerAndPositiveNaturalData) : Prop :=
  rational_data.gcd
      (rational_data.absolute_numerator representative.numerator)
      representative.denominator = rational_data.one

/--
`reduced_representative_exists` TODO

Predicate logic:

  (∀ rational_data ∈ IntegerAndPositiveNaturalReductionData), ∃ representative ∈ Representative rational_data.toIntegerAndPositiveNaturalData, IsReduced rational_data representative ∧ Quotient.mk _ representative = value

Predicate logic (unfolded):

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalReductionData) (value : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data.toIntegerAndPositiveNaturalData).1), Exists fun representative => (rational_data.3 (rational_data.2 representative.1) representative.2 = rational_data.toIntegerAndPositiveNaturalData.3 ∧ Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data.toIntegerAndPositiveNaturalData).1 representative = value)

Logical form (Lean):

```lean
theorem reduced_representative_exists
    (rational_data : IntegerAndPositiveNaturalReductionData)
    (value : Carrier rational_data.toIntegerAndPositiveNaturalData) :
    ∃ representative : Representative rational_data.toIntegerAndPositiveNaturalData,
      IsReduced rational_data representative ∧ Quotient.mk _ representative = value
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem reduced_representative_exists
    (rational_data : IntegerAndPositiveNaturalReductionData)
    (value : Carrier rational_data.toIntegerAndPositiveNaturalData) :
    ∃ representative : Representative rational_data.toIntegerAndPositiveNaturalData,
      IsReduced rational_data representative ∧ Quotient.mk _ representative = value := by
  sorry

/--
`reduced_representative_unique` TODO

Predicate logic:

  (∀ rational_data ∈ IntegerAndPositiveNaturalReductionData), (IsReduced rational_data first ∧ IsReduced rational_data second ∧ Quotient.mk (representative_setoid rational_data.toIntegerAndPositiveNaturalData) first = Quotient.mk (representative_setoid rational_data.toIntegerAndPositiveNaturalData) second) → first.numerator = second.numerator ∧ first.denominator = second.denominator

Predicate logic (unfolded):

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalReductionData) (first second : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data.1), (rational_data.3 (rational_data.2 first.1) first.2 = rational_data.toIntegerAndPositiveNaturalData.3 ∧ (rational_data.3 (rational_data.2 second.1) second.2 = rational_data.toIntegerAndPositiveNaturalData.3 ∧ Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data.toIntegerAndPositiveNaturalData).1 first = Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data.toIntegerAndPositiveNaturalData).1 second)) → (first.1 = second.1 ∧ first.2 = second.2)

Logical form (Lean):

```lean
theorem reduced_representative_unique
    (rational_data : IntegerAndPositiveNaturalReductionData)
    (first second : Representative rational_data.toIntegerAndPositiveNaturalData)
    (first_reduced : IsReduced rational_data first)
    (second_reduced : IsReduced rational_data second)
    (same_value :
      Quotient.mk
          (representative_setoid rational_data.toIntegerAndPositiveNaturalData) first =
        Quotient.mk
          (representative_setoid rational_data.toIntegerAndPositiveNaturalData) second) :
    first.numerator = second.numerator ∧
    first.denominator = second.denominator
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem reduced_representative_unique
    (rational_data : IntegerAndPositiveNaturalReductionData)
    (first second : Representative rational_data.toIntegerAndPositiveNaturalData)
    (first_reduced : IsReduced rational_data first)
    (second_reduced : IsReduced rational_data second)
    (same_value :
      Quotient.mk
          (representative_setoid rational_data.toIntegerAndPositiveNaturalData) first =
        Quotient.mk
          (representative_setoid rational_data.toIntegerAndPositiveNaturalData) second) :
    first.numerator = second.numerator ∧
    first.denominator = second.denominator := by
  sorry

/--
`unique_lowest_term_form` TODO

Predicate logic:

  (∀ rational_data ∈ IntegerAndPositiveNaturalReductionData), ∃ representative ∈ Representative rational_data.toIntegerAndPositiveNaturalData, IsReduced rational_data representative ∧ Quotient.mk _ representative = value ∧ ∀ other : Representative rational_data.toIntegerAndPositiveNaturalData, IsReduced rational_data other → Quotient.mk _ other = value → other.numerator = representative.numerator ∧ other.denominator = representative.denominator

Predicate logic (unfolded):

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalReductionData) (value : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data.toIntegerAndPositiveNaturalData).1), Exists fun representative => (rational_data.3 (rational_data.2 representative.1) representative.2 = rational_data.toIntegerAndPositiveNaturalData.3 ∧ (Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data.toIntegerAndPositiveNaturalData).1 representative = value ∧ ∀ (other : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data.1), rational_data.3 (rational_data.2 other.1) other.2 = rational_data.toIntegerAndPositiveNaturalData.3 → Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data.toIntegerAndPositiveNaturalData).1 other = value → (other.1 = representative.1 ∧ other.2 = representative.2)))

Logical form (Lean):

```lean
theorem unique_lowest_term_form
    (rational_data : IntegerAndPositiveNaturalReductionData)
    (value : Carrier rational_data.toIntegerAndPositiveNaturalData) :
    ∃ representative : Representative rational_data.toIntegerAndPositiveNaturalData,
      IsReduced rational_data representative ∧
      Quotient.mk _ representative = value ∧
      ∀ other : Representative rational_data.toIntegerAndPositiveNaturalData,
        IsReduced rational_data other →
        Quotient.mk _ other = value →
        other.numerator = representative.numerator ∧
        other.denominator = representative.denominator
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem unique_lowest_term_form
    (rational_data : IntegerAndPositiveNaturalReductionData)
    (value : Carrier rational_data.toIntegerAndPositiveNaturalData) :
    ∃ representative : Representative rational_data.toIntegerAndPositiveNaturalData,
      IsReduced rational_data representative ∧
      Quotient.mk _ representative = value ∧
      ∀ other : Representative rational_data.toIntegerAndPositiveNaturalData,
        IsReduced rational_data other →
        Quotient.mk _ other = value →
        other.numerator = representative.numerator ∧
        other.denominator = representative.denominator := by
  sorry

/--
`density` TODO

Predicate logic:

  (∀ rational_data ∈ IntegerAndPositiveNaturalData), ∃ middle, strict_order rational_data first middle ∧ strict_order rational_data middle second

Predicate logic (unfolded):

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData) (first second : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 first second → Exists fun middle => ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 first middle ∧ (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 middle second)

Logical form (Lean):

```lean
theorem density (rational_data : IntegerAndPositiveNaturalData)
    (first second : Carrier rational_data)
    (first_lt_second : strict_order rational_data first second) :
    ∃ middle,
      strict_order rational_data first middle ∧ strict_order rational_data middle second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem density (rational_data : IntegerAndPositiveNaturalData)
    (first second : Carrier rational_data)
    (first_lt_second : strict_order rational_data first second) :
    ∃ middle,
      strict_order rational_data first middle ∧ strict_order rational_data middle second := by
  sorry

/--
`archimedean_property` TODO

Predicate logic:

  (∀ rational_data ∈ IntegerAndPositiveNaturalData), ∃ natural ∈ rational_data.natural_carrier, strict_order rational_data value (integer_embedding rational_data (rational_data.to_integer natural))

Predicate logic (unfolded):

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData) (value : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), Exists fun natural => (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 value (Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 { numerator := rational_data.to_integer natural, denominator := rational_data.one })

Logical form (Lean):

```lean
theorem archimedean_property (rational_data : IntegerAndPositiveNaturalData) (value : Carrier rational_data) :
    ∃ natural : rational_data.natural_carrier,
      strict_order rational_data value
        (integer_embedding rational_data (rational_data.to_integer natural))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem archimedean_property (rational_data : IntegerAndPositiveNaturalData) (value : Carrier rational_data) :
    ∃ natural : rational_data.natural_carrier,
      strict_order rational_data value
        (integer_embedding rational_data (rational_data.to_integer natural)) := by
  sorry

/--
`integer_part_bounds` TODO

Predicate logic:

  (∀ rational_data ∈ IntegerAndPositiveNaturalData), ∃ integer ∈ rational_data.integer_system.Model.signature.carrier, nonstrict_order rational_data (integer_embedding rational_data integer) value ∧ strict_order rational_data value (integer_embedding rational_data (rational_data.integer_system.Model.signature.add integer rational_data.integer_system.Model.signature.one))

Predicate logic (unfolded):

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData) (value : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), Exists fun integer => (Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 (Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).r (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.integer_representative rational_data integer)) value) (Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 { numerator := integer, denominator := rational_data.3 } = value) ∧ (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 value (Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 { numerator := rational_data.integer_system.Model.signature.add integer rational_data.integer_system.Model.signature.one, denominator := rational_data.one }))

Logical form (Lean):

```lean
theorem integer_part_bounds (rational_data : IntegerAndPositiveNaturalData) (value : Carrier rational_data) :
    ∃ integer : rational_data.integer_system.Model.signature.carrier,
      nonstrict_order rational_data (integer_embedding rational_data integer) value ∧
      strict_order rational_data value
        (integer_embedding rational_data
          (rational_data.integer_system.Model.signature.add
            integer rational_data.integer_system.Model.signature.one))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem integer_part_bounds (rational_data : IntegerAndPositiveNaturalData) (value : Carrier rational_data) :
    ∃ integer : rational_data.integer_system.Model.signature.carrier,
      nonstrict_order rational_data (integer_embedding rational_data integer) value ∧
      strict_order rational_data value
        (integer_embedding rational_data
          (rational_data.integer_system.Model.signature.add
            integer rational_data.integer_system.Model.signature.one)) := by
  sorry

/--
`square_root_two_cut` TODO

Predicate logic:

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData) (a : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Carrier rational_data), Or (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.strict_order rational_data a (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.zero rational_data)) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.strict_order rational_data (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.multiplication rational_data a a) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.two rational_data))

Predicate logic (unfolded):

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData) (a : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 a (Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 { numerator := rational_data.integer_system.Model.signature.zero, denominator := rational_data.one })) ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_multiplication rational_data first_representative second_representative)) ⋯).1 a a) (Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).r (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.integer_representative rational_data (rational_data.integer_system.Model.signature.add rational_data.integer_system.Model.signature.one rational_data.integer_system.Model.signature.one))))

Logical form (Lean):

```lean
def square_root_two_cut (rational_data : IntegerAndPositiveNaturalData) :
    Carrier rational_data → Prop :=
  fun value =>
    strict_order rational_data value (zero rational_data) ∨
    strict_order rational_data
      (multiplication rational_data value value)
      (two rational_data)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases, unfold

-/
def square_root_two_cut (rational_data : IntegerAndPositiveNaturalData) :
    Carrier rational_data → Prop :=
  fun value =>
    strict_order rational_data value (zero rational_data) ∨
    strict_order rational_data
      (multiplication rational_data value value)
      (two rational_data)

/--
`square_root_two_cut_nonempty_bounded` TODO

Predicate logic:

  (∀ rational_data ∈ IntegerAndPositiveNaturalData), (∃ value, square_root_two_cut rational_data value) ∧ (∃ upper, ∀ value, square_root_two_cut rational_data value → nonstrict_order rational_data value upper)

Predicate logic (unfolded):

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData), (Exists fun value => Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 value (Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).r (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.zero_representative rational_data))) ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_multiplication rational_data first_representative second_representative)) ⋯).val value value) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.integer_representative rational_data (rational_data.integer_system.Model.signature.add rational_data.integer_system.Model.signature.one rational_data.integer_system.Model.signature.one)))) ∧ Exists fun upper => ∀ (value : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 value (Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).r (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.zero_representative rational_data))) ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_multiplication rational_data first_representative second_representative)) ⋯).val value value) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.integer_representative rational_data (rational_data.integer_system.Model.signature.add rational_data.integer_system.Model.signature.one rational_data.integer_system.Model.signature.one)))) → Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 value upper) (value = upper))

Logical form (Lean):

```lean
theorem square_root_two_cut_nonempty_bounded (rational_data : IntegerAndPositiveNaturalData) :
    (∃ value, square_root_two_cut rational_data value) ∧
    (∃ upper,
      ∀ value,
        square_root_two_cut rational_data value →
        nonstrict_order rational_data value upper)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem square_root_two_cut_nonempty_bounded (rational_data : IntegerAndPositiveNaturalData) :
    (∃ value, square_root_two_cut rational_data value) ∧
    (∃ upper,
      ∀ value,
        square_root_two_cut rational_data value →
        nonstrict_order rational_data value upper) := by
  sorry

/--
`no_rational_square_root_two` TODO

Predicate logic:

  (∀ rational_data ∈ IntegerAndPositiveNaturalData), ¬ ∃ value, multiplication rational_data value value = two rational_data

Predicate logic (unfolded):

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData), (Exists fun value => (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_multiplication rational_data first_representative second_representative)) ⋯).1 value value = Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 { numerator := rational_data.integer_system.Model.signature.toBooleanRingOperationBundle.2 rational_data.integer_system.Model.signature.one rational_data.integer_system.Model.signature.one, denominator := rational_data.3 }) → False

Logical form (Lean):

```lean
theorem no_rational_square_root_two (rational_data : IntegerAndPositiveNaturalData) :
    ¬ ∃ value, multiplication rational_data value value = two rational_data
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem no_rational_square_root_two (rational_data : IntegerAndPositiveNaturalData) :
    ¬ ∃ value, multiplication rational_data value value = two rational_data := by
  sorry

/--
`square_root_two_cut_has_no_supremum` TODO

Predicate logic:

  (∀ rational_data ∈ IntegerAndPositiveNaturalData), ¬ ∃ supremum, (∀ value, square_root_two_cut rational_data value → nonstrict_order rational_data value supremum) ∧ (∀ upper, (∀ value, square_root_two_cut rational_data value → nonstrict_order rational_data value upper) → nonstrict_order rational_data supremum upper)

Predicate logic (unfolded):

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData), (Exists fun supremum => (∀ (value : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 value (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.zero_representative rational_data))) ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 (Classical.choose ⋯ value value) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.integer_embedding rational_data (rational_data.integer_system.Model.signature.add rational_data.integer_system.Model.signature.one rational_data.integer_system.Model.signature.one))) → Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 value supremum) (value = supremum) ∧ ∀ (upper : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), (∀ (value : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 value (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.zero_representative rational_data))) ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 (Classical.choose ⋯ value value) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.integer_embedding rational_data (rational_data.integer_system.Model.signature.add rational_data.integer_system.Model.signature.one rational_data.integer_system.Model.signature.one))) → Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 value upper) (value = upper)) → Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 supremum upper) (supremum = upper))) → False

Logical form (Lean):

```lean
theorem square_root_two_cut_has_no_supremum (rational_data : IntegerAndPositiveNaturalData)
    : ¬ ∃ supremum,
      (∀ value,
        square_root_two_cut rational_data value →
        nonstrict_order rational_data value supremum) ∧
      (∀ upper,
        (∀ value,
          square_root_two_cut rational_data value →
          nonstrict_order rational_data value upper) →
        nonstrict_order rational_data supremum upper)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem square_root_two_cut_has_no_supremum (rational_data : IntegerAndPositiveNaturalData)
    : ¬ ∃ supremum,
      (∀ value,
        square_root_two_cut rational_data value →
        nonstrict_order rational_data value supremum) ∧
      (∀ upper,
        (∀ value,
          square_root_two_cut rational_data value →
          nonstrict_order rational_data value upper) →
        nonstrict_order rational_data supremum upper) := by
  sorry

/--
`NotOrderComplete` TODO

Predicate logic:

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData), Exists fun subset => (Exists fun value => subset value ∧ (Exists fun upper => ∀ (value : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Carrier rational_data), subset value → LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.nonstrict_order rational_data value upper ∧ ¬ Exists fun supremum => (∀ (value : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Carrier rational_data), subset value → LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.nonstrict_order rational_data value supremum ∧ ∀ (upper : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Carrier rational_data), (∀ (value : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Carrier rational_data), subset value → LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.nonstrict_order rational_data value upper) → LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.nonstrict_order rational_data supremum upper)))

Predicate logic (unfolded):

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData), Exists fun subset => (Exists fun value => subset value ∧ (Exists fun upper => ∀ (value : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), subset value → Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 value upper) (value = upper) ∧ (Exists fun supremum => (∀ (value : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), subset value → Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 value supremum) (value = supremum) ∧ ∀ (upper : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), (∀ (value : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), subset value → Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 value upper) (value = upper)) → Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 supremum upper) (supremum = upper))) → False))

Logical form (Lean):

```lean
def NotOrderComplete (rational_data : IntegerAndPositiveNaturalData) : Prop :=
  ∃ subset : Carrier rational_data → Prop,
    (∃ value, subset value) ∧
    (∃ upper,
      ∀ value, subset value → nonstrict_order rational_data value upper) ∧
    ¬ ∃ supremum,
      (∀ value, subset value → nonstrict_order rational_data value supremum) ∧
      (∀ upper,
        (∀ value, subset value → nonstrict_order rational_data value upper) →
        nonstrict_order rational_data supremum upper)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def NotOrderComplete (rational_data : IntegerAndPositiveNaturalData) : Prop :=
  ∃ subset : Carrier rational_data → Prop,
    (∃ value, subset value) ∧
    (∃ upper,
      ∀ value, subset value → nonstrict_order rational_data value upper) ∧
    ¬ ∃ supremum,
      (∀ value, subset value → nonstrict_order rational_data value supremum) ∧
      (∀ upper,
        (∀ value, subset value → nonstrict_order rational_data value upper) →
        nonstrict_order rational_data supremum upper)

/--
`not_order_complete` TODO

Predicate logic:

  (∀ rational_data ∈ IntegerAndPositiveNaturalData), NotOrderComplete rational_data

Predicate logic (unfolded):

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData), Exists fun subset => (Exists fun value => subset value ∧ (Exists fun upper => ∀ (value : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), subset value → Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 value upper) (value = upper) ∧ (Exists fun supremum => (∀ (value : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), subset value → Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 value supremum) (value = supremum) ∧ ∀ (upper : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), (∀ (value : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), subset value → Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 value upper) (value = upper)) → Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 supremum upper) (supremum = upper))) → False))

Logical form (Lean):

```lean
theorem not_order_complete (rational_data : IntegerAndPositiveNaturalData) : NotOrderComplete rational_data
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
theorem not_order_complete (rational_data : IntegerAndPositiveNaturalData) : NotOrderComplete rational_data := by
  sorry

/--
`StructureOfTheRationals` TODO

Predicate logic:

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData), (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.OrderedFieldStructure rational_data ∧ (∀ (first second : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Carrier rational_data), LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.strict_order rational_data first second → Exists fun middle => (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.strict_order rational_data first middle ∧ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.strict_order rational_data middle second) ∧ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.NotOrderComplete rational_data))

Predicate logic (unfolded):

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData), ((((∀ (first second third : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_addition rational_data first_representative second_representative)) ⋯).1 (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.addition rational_data first second) third = (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_addition rational_data first_representative second_representative)) ⋯).1 first (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.addition rational_data second third) ∧ (∀ (first second : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_addition rational_data first_representative second_representative)) ⋯).1 first second = (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_addition rational_data first_representative second_representative)) ⋯).1 second first ∧ (∀ (value : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_addition rational_data first_representative second_representative)) ⋯).1 (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.zero rational_data) value = value ∧ (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_addition rational_data first_representative second_representative)) ⋯).1 value (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.zero rational_data) = value) ∧ ∀ (value : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_addition rational_data first_representative second_representative)) ⋯).1 value (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.negation rational_data value) = Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 { numerator := rational_data.integer_system.Model.signature.zero, denominator := rational_data.one } ∧ (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_addition rational_data first_representative second_representative)) ⋯).1 (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.negation rational_data value) value = Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 { numerator := rational_data.integer_system.Model.signature.zero, denominator := rational_data.one })))) ∧ ((∀ (first second third : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_multiplication rational_data first_representative second_representative)) ⋯).1 (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.multiplication rational_data first second) third = (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_multiplication rational_data first_representative second_representative)) ⋯).1 first (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.multiplication rational_data second third) ∧ (∀ (first second : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_multiplication rational_data first_representative second_representative)) ⋯).1 first second = (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_multiplication rational_data first_representative second_representative)) ⋯).1 second first ∧ (∀ (value : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_multiplication rational_data first_representative second_representative)) ⋯).1 (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.one rational_data) value = value ∧ (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_multiplication rational_data first_representative second_representative)) ⋯).1 value (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.one rational_data) = value) ∧ ∀ (first second third : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_multiplication rational_data first_representative second_representative)) ⋯).1 first (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.addition rational_data second third) = (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_addition rational_data first_representative second_representative)) ⋯).1 (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.multiplication rational_data first second) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.multiplication rational_data first third)))) ∧ (Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).r (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.zero_representative rational_data) = Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).r (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.one_representative rational_data) → False ∧ ∀ (value : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), (value = Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).r (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.zero_representative rational_data) → False) → Exists fun reciprocal => ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_multiplication rational_data first_representative second_representative)) ⋯).1 value reciprocal = Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 { numerator := rational_data.integer_system.Model.signature.one, denominator := rational_data.one } ∧ (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_multiplication rational_data first_representative second_representative)) ⋯).1 reciprocal value = Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 { numerator := rational_data.integer_system.Model.signature.one, denominator := rational_data.one })))) ∧ ((∀ (value : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 value value → False ∧ (∀ (first second third : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 first second → (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 second third → (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 first third ∧ ∀ (first second : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), (first = second → False) → Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 first second) ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 second first))) ∧ (∀ (first second translation : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 first second → (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 (Classical.choose ⋯ first translation) (Classical.choose ⋯ second translation) ∧ ∀ (first second : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.zero_representative rational_data)) first → (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.zero_representative rational_data)) second → (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.zero_representative rational_data)) (Classical.choose ⋯ first second)))) ∧ (∀ (first second : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 first second → Exists fun middle => ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 first middle ∧ (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 middle second) ∧ Exists fun subset => (Exists fun value => subset value ∧ (Exists fun upper => ∀ (value : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), subset value → Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 value upper) (value = upper) ∧ (Exists fun supremum => (∀ (value : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), subset value → Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 value supremum) (value = supremum) ∧ ∀ (upper : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), (∀ (value : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), subset value → Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 value upper) (value = upper)) → Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 supremum upper) (supremum = upper))) → False))))

Logical form (Lean):

```lean
def StructureOfTheRationals (rational_data : IntegerAndPositiveNaturalData) : Prop :=
  OrderedFieldStructure rational_data ∧
  (∀ first second : Carrier rational_data,
    strict_order rational_data first second →
    ∃ middle,
      strict_order rational_data first middle ∧ strict_order rational_data middle second) ∧
  NotOrderComplete rational_data
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def StructureOfTheRationals (rational_data : IntegerAndPositiveNaturalData) : Prop :=
  OrderedFieldStructure rational_data ∧
  (∀ first second : Carrier rational_data,
    strict_order rational_data first second →
    ∃ middle,
      strict_order rational_data first middle ∧ strict_order rational_data middle second) ∧
  NotOrderComplete rational_data

/--
`structure_of_the_rationals` TODO

Predicate logic:

  (∀ rational_data ∈ IntegerAndPositiveNaturalData), StructureOfTheRationals rational_data

Predicate logic (unfolded):

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData), ((((∀ (first second third : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).r), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_addition rational_data first_representative second_representative)) ⋯).val (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.addition rational_data first second) third = (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_addition rational_data first_representative second_representative)) ⋯).val first (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.addition rational_data second third) ∧ (∀ (first second : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).r), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_addition rational_data first_representative second_representative)) ⋯).val first second = (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_addition rational_data first_representative second_representative)) ⋯).val second first ∧ (∀ (value : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).r), ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_addition rational_data first_representative second_representative)) ⋯).val (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.zero rational_data) value = value ∧ (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_addition rational_data first_representative second_representative)) ⋯).val value (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.zero rational_data) = value) ∧ ∀ (value : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).r), ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_addition rational_data first_representative second_representative)) ⋯).val value (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.negation rational_data value) = Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).r (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.zero_representative rational_data) ∧ (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_addition rational_data first_representative second_representative)) ⋯).val (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.negation rational_data value) value = Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).r (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.zero_representative rational_data))))) ∧ ((∀ (first second third : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).r), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_multiplication rational_data first_representative second_representative)) ⋯).val (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.multiplication rational_data first second) third = (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_multiplication rational_data first_representative second_representative)) ⋯).val first (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.multiplication rational_data second third) ∧ (∀ (first second : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).r), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_multiplication rational_data first_representative second_representative)) ⋯).val first second = (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_multiplication rational_data first_representative second_representative)) ⋯).val second first ∧ (∀ (value : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).r), ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_multiplication rational_data first_representative second_representative)) ⋯).val (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.one rational_data) value = value ∧ (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_multiplication rational_data first_representative second_representative)) ⋯).val value (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.one rational_data) = value) ∧ ∀ (first second third : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).r), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_multiplication rational_data first_representative second_representative)) ⋯).val first (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.addition rational_data second third) = (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_addition rational_data first_representative second_representative)) ⋯).val (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.multiplication rational_data first second) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.multiplication rational_data first third)))) ∧ (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.zero_representative rational_data) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.one_representative rational_data) → False ∧ ∀ (value : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), (value = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.zero_representative rational_data) → False) → Exists fun reciprocal => ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_multiplication rational_data first_representative second_representative)) ⋯).val value reciprocal = Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).r (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.one_representative rational_data) ∧ (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) = Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_multiplication rational_data first_representative second_representative)) ⋯).val reciprocal value = Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).r (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.one_representative rational_data))))) ∧ ((∀ (value : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).val value value → False ∧ (∀ (first second third : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 first second → (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 second third → (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 first third ∧ ∀ (first second : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), (first = second → False) → Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 first second) ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 second first))) ∧ (∀ (first second translation : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 first second → (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.addition rational_data first translation) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.addition rational_data second translation) ∧ ∀ (first second : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.zero rational_data) first → (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.zero rational_data) second → (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.zero rational_data) (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.multiplication rational_data first second)))) ∧ (∀ (first second : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 first second → Exists fun middle => ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 first middle ∧ (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 middle second) ∧ Exists fun subset => (Exists fun value => subset value ∧ (Exists fun upper => ∀ (value : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), subset value → Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 value upper) (value = upper) ∧ (Exists fun supremum => (∀ (value : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), subset value → Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).val value supremum) (value = supremum) ∧ ∀ (upper : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), (∀ (value : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), subset value → Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).val value upper) (value = upper)) → Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).val supremum upper) (supremum = upper))) → False))))

Logical form (Lean):

```lean
theorem structure_of_the_rationals (rational_data : IntegerAndPositiveNaturalData) :
    StructureOfTheRationals rational_data
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
theorem structure_of_the_rationals (rational_data : IntegerAndPositiveNaturalData) :
    StructureOfTheRationals rational_data := by
  sorry

end LRA.NumberSystems.RationalNumbers.RationalQuotientFractions
