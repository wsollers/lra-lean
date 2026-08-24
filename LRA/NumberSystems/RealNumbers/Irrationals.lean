
import LRA.NumberSystems.RationalNumbers.RationalNumberSystem
import LRA.NumberSystems.RealNumbers.Definition

namespace LRA.NumberSystems.RealNumbers.Irrationals

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers
open LRA.NumberSystems.RealNumbers

variable
    (rational_system : LRA.NumberSystems.RationalNumbers.RationalNumberSystem)
    (real_extension : RationalRealExtension rational_system)

/--
`RealCarrier` TODO

Predicate logic:

  abbrev RealCarrier
    (rational_system : RationalNumberSystem)
    (real_extension : RationalRealExtension rational_system) :=
  real_extension.RealModel.signature.carrier

Predicate logic (unfolded):

  abbrev RealCarrier
    (rational_system : RationalNumberSystem)
    (real_extension : RationalRealExtension rational_system) :=
  real_extension.RealModel.signature.carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev RealCarrier
    (rational_system : RationalNumberSystem)
    (real_extension : RationalRealExtension rational_system) :=
  real_extension.RealModel.signature.carrier
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
abbrev RealCarrier
    (rational_system : RationalNumberSystem)
    (real_extension : RationalRealExtension rational_system) :=
  real_extension.RealModel.signature.carrier

/--
`RationalCarrier` TODO

Predicate logic:

  abbrev RationalCarrier
    (rational_system : RationalNumberSystem) :=
  rational_system.FieldModel.signature.carrier

Predicate logic (unfolded):

  abbrev RationalCarrier
    (rational_system : RationalNumberSystem) :=
  rational_system.FieldModel.signature.carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev RationalCarrier
    (rational_system : RationalNumberSystem) :=
  rational_system.FieldModel.signature.carrier
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
abbrev RationalCarrier
    (rational_system : RationalNumberSystem) :=
  rational_system.FieldModel.signature.carrier

/--
`embedRational` TODO

Predicate logic:

  def embedRational (value : RationalCarrier rational_system) :
    RealCarrier rational_system real_extension :=
  real_extension.DenseOrderedFieldEmbedding.ToReal value

Predicate logic (unfolded):

  def embedRational (value : RationalCarrier rational_system) :
    RealCarrier rational_system real_extension :=
  real_extension.DenseOrderedFieldEmbedding.ToReal value (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def embedRational (value : RationalCarrier rational_system) :
    RealCarrier rational_system real_extension :=
  real_extension.DenseOrderedFieldEmbedding.ToReal value
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
def embedRational (value : RationalCarrier rational_system) :
    RealCarrier rational_system real_extension :=
  real_extension.DenseOrderedFieldEmbedding.ToReal value

/--
`IsRational` TODO

Predicate logic:

  ∀ (rational_system : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (real_extension : LRA.NumberSystems.RealNumbers.RationalRealExtension rational_system) (value : LRA.NumberSystems.RealNumbers.Irrationals.RealCarrier rational_system real_extension), Exists fun rational_value => LRA.NumberSystems.RealNumbers.Irrationals.embedRational rational_system real_extension rational_value = value

Predicate logic (unfolded):

  ∀ (rational_system : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (real_extension : LRA.NumberSystems.RealNumbers.RationalRealExtension rational_system) (value : real_extension.RealModel.signature.toCarrierBundle.1), Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = value

Logical form (Lean):

```lean
def IsRational (value : RealCarrier rational_system real_extension) : Prop :=
  ∃ rational_value : RationalCarrier rational_system,
    embedRational rational_system real_extension rational_value = value
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
def IsRational (value : RealCarrier rational_system real_extension) : Prop :=
  ∃ rational_value : RationalCarrier rational_system,
    embedRational rational_system real_extension rational_value = value

/--
`IsIrrational` TODO

Predicate logic:

  ∀ (rational_system : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (real_extension : LRA.NumberSystems.RealNumbers.RationalRealExtension rational_system) (value : LRA.NumberSystems.RealNumbers.Irrationals.RealCarrier rational_system real_extension), LRA.NumberSystems.RealNumbers.Irrationals.IsRational rational_system real_extension value → False

Predicate logic (unfolded):

  ∀ (rational_system : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (real_extension : LRA.NumberSystems.RealNumbers.RationalRealExtension rational_system) (value : real_extension.RealModel.signature.toCarrierBundle.1), (Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = value) → False

Logical form (Lean):

```lean
def IsIrrational (value : RealCarrier rational_system real_extension) : Prop :=
  ¬ IsRational rational_system real_extension value
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
def IsIrrational (value : RealCarrier rational_system real_extension) : Prop :=
  ¬ IsRational rational_system real_extension value

/--
`Carrier` TODO

Predicate logic:

  abbrev Carrier
    (rational_system : RationalNumberSystem)
    (real_extension : RationalRealExtension rational_system) :=
  { value : RealCarrier rational_system real_extension //
      IsIrrational rational_system real_extension value }

Predicate logic (unfolded):

  abbrev Carrier
    (rational_system : RationalNumberSystem)
    (real_extension : RationalRealExtension rational_system) :=
  { value : RealCarrier rational_system real_extension //
      IsIrrational rational_system real_extension value } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Carrier
    (rational_system : RationalNumberSystem)
    (real_extension : RationalRealExtension rational_system) :=
  { value : RealCarrier rational_system real_extension //
      IsIrrational rational_system real_extension value }
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
abbrev Carrier
    (rational_system : RationalNumberSystem)
    (real_extension : RationalRealExtension rational_system) :=
  { value : RealCarrier rational_system real_extension //
      IsIrrational rational_system real_extension value }

/--
`embedded_rational_is_rational` TODO

Predicate logic:

  IsRational rational_system real_extension (embedRational rational_system real_extension value)

Predicate logic (unfolded):

  ∀ (rational_system : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (real_extension : LRA.NumberSystems.RealNumbers.RationalRealExtension rational_system) (value : rational_system.FieldModel.signature.toCarrierBundle.1), Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = real_extension.DenseOrderedFieldEmbedding.1 value

Logical form (Lean):

```lean
theorem embedded_rational_is_rational
    (value : RationalCarrier rational_system) :
    IsRational rational_system real_extension
      (embedRational rational_system real_extension value)
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
theorem embedded_rational_is_rational
    (value : RationalCarrier rational_system) :
    IsRational rational_system real_extension
      (embedRational rational_system real_extension value) := by
  sorry

/--
`zero_is_rational` TODO

Predicate logic:

  IsRational rational_system real_extension real_extension.RealModel.signature.zero

Predicate logic (unfolded):

  ∀ (rational_system : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (real_extension : LRA.NumberSystems.RealNumbers.RationalRealExtension rational_system), Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = real_extension.RealModel.signature.toZeroOneBundle.2

Logical form (Lean):

```lean
theorem zero_is_rational :
    IsRational rational_system real_extension
      real_extension.RealModel.signature.zero
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
theorem zero_is_rational :
    IsRational rational_system real_extension
      real_extension.RealModel.signature.zero := by
  sorry

/--
`one_is_rational` TODO

Predicate logic:

  IsRational rational_system real_extension real_extension.RealModel.signature.one

Predicate logic (unfolded):

  ∀ (rational_system : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (real_extension : LRA.NumberSystems.RealNumbers.RationalRealExtension rational_system), Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = real_extension.RealModel.signature.toZeroOneBundle.3

Logical form (Lean):

```lean
theorem one_is_rational :
    IsRational rational_system real_extension
      real_extension.RealModel.signature.one
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
theorem one_is_rational :
    IsRational rational_system real_extension
      real_extension.RealModel.signature.one := by
  sorry

/--
`rational_two` TODO

Predicate logic:

  def rational_two : RationalCarrier rational_system :=
  rational_system.FieldModel.signature.add
    rational_system.FieldModel.signature.one
    rational_system.FieldModel.signature.one

Predicate logic (unfolded):

  def rational_two : RationalCarrier rational_system :=
  rational_system.FieldModel.signature.add
    rational_system.FieldModel.signature.one
    rational_system.FieldModel.signature.one (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def rational_two : RationalCarrier rational_system :=
  rational_system.FieldModel.signature.add
    rational_system.FieldModel.signature.one
    rational_system.FieldModel.signature.one
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
def rational_two : RationalCarrier rational_system :=
  rational_system.FieldModel.signature.add
    rational_system.FieldModel.signature.one
    rational_system.FieldModel.signature.one

/--
`real_two` TODO

Predicate logic:

  def real_two : RealCarrier rational_system real_extension :=
  embedRational rational_system real_extension (rational_two rational_system)

Predicate logic (unfolded):

  def real_two : RealCarrier rational_system real_extension :=
  embedRational rational_system real_extension (rational_two rational_system) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def real_two : RealCarrier rational_system real_extension :=
  embedRational rational_system real_extension (rational_two rational_system)
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
def real_two : RealCarrier rational_system real_extension :=
  embedRational rational_system real_extension (rational_two rational_system)

/--
`rational_addition_is_rational` TODO

Predicate logic:

  (IsRational rational_system real_extension first ∧ IsRational rational_system real_extension second) → IsRational rational_system real_extension (real_extension.RealModel.signature.add first second)

Predicate logic (unfolded):

  ∀ (rational_system : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (real_extension : LRA.NumberSystems.RealNumbers.RationalRealExtension rational_system) {first second : real_extension.RealModel.signature.toCarrierBundle.1}, (Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = first ∧ Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = second) → Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = real_extension.RealModel.signature.toBooleanRingOperationBundle.2 first second

Logical form (Lean):

```lean
theorem rational_addition_is_rational
    {first second : RealCarrier rational_system real_extension}
    (first_is_rational : IsRational rational_system real_extension first)
    (second_is_rational : IsRational rational_system real_extension second) :
    IsRational rational_system real_extension
      (real_extension.RealModel.signature.add first second)
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
theorem rational_addition_is_rational
    {first second : RealCarrier rational_system real_extension}
    (first_is_rational : IsRational rational_system real_extension first)
    (second_is_rational : IsRational rational_system real_extension second) :
    IsRational rational_system real_extension
      (real_extension.RealModel.signature.add first second) := by
  sorry

/--
`rational_negation_is_rational` TODO

Predicate logic:

  (IsRational rational_system real_extension value) → IsRational rational_system real_extension (real_extension.RealModel.signature.neg value)

Predicate logic (unfolded):

  ∀ (rational_system : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (real_extension : LRA.NumberSystems.RealNumbers.RationalRealExtension rational_system) {value : real_extension.RealModel.signature.toCarrierBundle.1}, (Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = value) → Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = real_extension.RealModel.signature.toRingConceptSignature.2 value

Logical form (Lean):

```lean
theorem rational_negation_is_rational
    {value : RealCarrier rational_system real_extension}
    (value_is_rational : IsRational rational_system real_extension value) :
    IsRational rational_system real_extension
      (real_extension.RealModel.signature.neg value)
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
theorem rational_negation_is_rational
    {value : RealCarrier rational_system real_extension}
    (value_is_rational : IsRational rational_system real_extension value) :
    IsRational rational_system real_extension
      (real_extension.RealModel.signature.neg value) := by
  sorry

/--
`rational_subtraction_is_rational` TODO

Predicate logic:

  (IsRational rational_system real_extension first ∧ IsRational rational_system real_extension second) → IsRational rational_system real_extension (real_extension.RealModel.signature.Subtraction first second)

Predicate logic (unfolded):

  ∀ (rational_system : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (real_extension : LRA.NumberSystems.RealNumbers.RationalRealExtension rational_system) {first second : real_extension.RealModel.signature.toCarrierBundle.1}, (Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = first ∧ Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = second) → Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = real_extension.RealModel.signature.toBooleanRingOperationBundle.2 first (real_extension.RealModel.signature.toRingConceptSignature.2 second)

Logical form (Lean):

```lean
theorem rational_subtraction_is_rational
    {first second : RealCarrier rational_system real_extension}
    (first_is_rational : IsRational rational_system real_extension first)
    (second_is_rational : IsRational rational_system real_extension second) :
    IsRational rational_system real_extension
      (real_extension.RealModel.signature.Subtraction first second)
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
theorem rational_subtraction_is_rational
    {first second : RealCarrier rational_system real_extension}
    (first_is_rational : IsRational rational_system real_extension first)
    (second_is_rational : IsRational rational_system real_extension second) :
    IsRational rational_system real_extension
      (real_extension.RealModel.signature.Subtraction first second) := by
  sorry

/--
`rational_multiplication_is_rational` TODO

Predicate logic:

  (IsRational rational_system real_extension first ∧ IsRational rational_system real_extension second) → IsRational rational_system real_extension (real_extension.RealModel.signature.multiply first second)

Predicate logic (unfolded):

  ∀ (rational_system : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (real_extension : LRA.NumberSystems.RealNumbers.RationalRealExtension rational_system) {first second : real_extension.RealModel.signature.toCarrierBundle.1}, (Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = first ∧ Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = second) → Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = real_extension.RealModel.signature.toBooleanRingOperationBundle.3 first second

Logical form (Lean):

```lean
theorem rational_multiplication_is_rational
    {first second : RealCarrier rational_system real_extension}
    (first_is_rational : IsRational rational_system real_extension first)
    (second_is_rational : IsRational rational_system real_extension second) :
    IsRational rational_system real_extension
      (real_extension.RealModel.signature.multiply first second)
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
theorem rational_multiplication_is_rational
    {first second : RealCarrier rational_system real_extension}
    (first_is_rational : IsRational rational_system real_extension first)
    (second_is_rational : IsRational rational_system real_extension second) :
    IsRational rational_system real_extension
      (real_extension.RealModel.signature.multiply first second) := by
  sorry

/--
`rational_inverse_is_rational` TODO

Predicate logic:

  (IsRational rational_system real_extension value) → IsRational rational_system real_extension (real_extension.RealModel.signature.inv value)

Predicate logic (unfolded):

  ∀ (rational_system : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (real_extension : LRA.NumberSystems.RealNumbers.RationalRealExtension rational_system) {value : real_extension.RealModel.signature.toCarrierBundle.1}, (Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = value ∧ value = real_extension.RealModel.signature.toZeroOneBundle.2 → False) → Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = real_extension.RealModel.signature.2 value

Logical form (Lean):

```lean
theorem rational_inverse_is_rational
    {value : RealCarrier rational_system real_extension}
    (value_is_rational : IsRational rational_system real_extension value)
    (value_is_nonzero : value ≠ real_extension.RealModel.signature.zero) :
    IsRational rational_system real_extension
      (real_extension.RealModel.signature.inv value)
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
theorem rational_inverse_is_rational
    {value : RealCarrier rational_system real_extension}
    (value_is_rational : IsRational rational_system real_extension value)
    (value_is_nonzero : value ≠ real_extension.RealModel.signature.zero) :
    IsRational rational_system real_extension
      (real_extension.RealModel.signature.inv value) := by
  sorry

/--
`rational_division_is_rational` TODO

Predicate logic:

  (IsRational rational_system real_extension numerator ∧ IsRational rational_system real_extension denominator) → IsRational rational_system real_extension (real_extension.RealModel.signature.multiply numerator (real_extension.RealModel.signature.inv denominator))

Predicate logic (unfolded):

  ∀ (rational_system : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (real_extension : LRA.NumberSystems.RealNumbers.RationalRealExtension rational_system) {numerator denominator : real_extension.RealModel.signature.toCarrierBundle.1}, (Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = numerator ∧ (Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = denominator ∧ denominator = real_extension.RealModel.signature.toZeroOneBundle.2 → False)) → Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = real_extension.RealModel.signature.toBooleanRingOperationBundle.3 numerator (real_extension.RealModel.signature.2 denominator)

Logical form (Lean):

```lean
theorem rational_division_is_rational
    {numerator denominator : RealCarrier rational_system real_extension}
    (numerator_is_rational : IsRational rational_system real_extension numerator)
    (denominator_is_rational : IsRational rational_system real_extension denominator)
    (denominator_is_nonzero : denominator ≠ real_extension.RealModel.signature.zero) :
    IsRational rational_system real_extension
      (real_extension.RealModel.signature.multiply
        numerator
        (real_extension.RealModel.signature.inv denominator))
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
theorem rational_division_is_rational
    {numerator denominator : RealCarrier rational_system real_extension}
    (numerator_is_rational : IsRational rational_system real_extension numerator)
    (denominator_is_rational : IsRational rational_system real_extension denominator)
    (denominator_is_nonzero : denominator ≠ real_extension.RealModel.signature.zero) :
    IsRational rational_system real_extension
      (real_extension.RealModel.signature.multiply
        numerator
        (real_extension.RealModel.signature.inv denominator)) := by
  sorry

/--
`negation_is_irrational` TODO

Predicate logic:

  (IsIrrational rational_system real_extension value) → IsIrrational rational_system real_extension (real_extension.RealModel.signature.neg value)

Predicate logic (unfolded):

  ∀ (rational_system : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (real_extension : LRA.NumberSystems.RealNumbers.RationalRealExtension rational_system) {value : real_extension.RealModel.signature.toCarrierBundle.1}, ((Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = value) → False ∧ Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = real_extension.RealModel.signature.toRingConceptSignature.2 value) → False

Logical form (Lean):

```lean
theorem negation_is_irrational
    {value : RealCarrier rational_system real_extension}
    (value_is_irrational : IsIrrational rational_system real_extension value) :
    IsIrrational rational_system real_extension
      (real_extension.RealModel.signature.neg value)
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
theorem negation_is_irrational
    {value : RealCarrier rational_system real_extension}
    (value_is_irrational : IsIrrational rational_system real_extension value) :
    IsIrrational rational_system real_extension
      (real_extension.RealModel.signature.neg value) := by
  sorry

/--
`rational_add_irrational_is_irrational` TODO

Predicate logic:

  (IsRational rational_system real_extension rational_value ∧ IsIrrational rational_system real_extension irrational_value) → IsIrrational rational_system real_extension (real_extension.RealModel.signature.add rational_value irrational_value)

Predicate logic (unfolded):

  ∀ (rational_system : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (real_extension : LRA.NumberSystems.RealNumbers.RationalRealExtension rational_system) {rational_value irrational_value : real_extension.RealModel.signature.toCarrierBundle.1}, (Exists fun rational_value_1 => real_extension.DenseOrderedFieldEmbedding.1 rational_value_1 = rational_value ∧ ((Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = irrational_value) → False ∧ Exists fun rational_value_1 => real_extension.DenseOrderedFieldEmbedding.1 rational_value_1 = real_extension.RealModel.signature.toBooleanRingOperationBundle.2 rational_value irrational_value)) → False

Logical form (Lean):

```lean
theorem rational_add_irrational_is_irrational
    {rational_value irrational_value : RealCarrier rational_system real_extension}
    (rational_is_rational : IsRational rational_system real_extension rational_value)
    (irrational_is_irrational : IsIrrational rational_system real_extension irrational_value) :
    IsIrrational rational_system real_extension
      (real_extension.RealModel.signature.add rational_value irrational_value)
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
theorem rational_add_irrational_is_irrational
    {rational_value irrational_value : RealCarrier rational_system real_extension}
    (rational_is_rational : IsRational rational_system real_extension rational_value)
    (irrational_is_irrational : IsIrrational rational_system real_extension irrational_value) :
    IsIrrational rational_system real_extension
      (real_extension.RealModel.signature.add rational_value irrational_value) := by
  sorry

/--
`irrational_add_rational_is_irrational` TODO

Predicate logic:

  (IsIrrational rational_system real_extension irrational_value ∧ IsRational rational_system real_extension rational_value) → IsIrrational rational_system real_extension (real_extension.RealModel.signature.add irrational_value rational_value)

Predicate logic (unfolded):

  ∀ (rational_system : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (real_extension : LRA.NumberSystems.RealNumbers.RationalRealExtension rational_system) {irrational_value rational_value : real_extension.RealModel.signature.toCarrierBundle.1}, ((Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = irrational_value) → False ∧ (Exists fun rational_value_1 => real_extension.DenseOrderedFieldEmbedding.1 rational_value_1 = rational_value ∧ Exists fun rational_value_1 => real_extension.DenseOrderedFieldEmbedding.1 rational_value_1 = real_extension.RealModel.signature.toBooleanRingOperationBundle.2 irrational_value rational_value)) → False

Logical form (Lean):

```lean
theorem irrational_add_rational_is_irrational
    {irrational_value rational_value : RealCarrier rational_system real_extension}
    (irrational_is_irrational : IsIrrational rational_system real_extension irrational_value)
    (rational_is_rational : IsRational rational_system real_extension rational_value) :
    IsIrrational rational_system real_extension
      (real_extension.RealModel.signature.add irrational_value rational_value)
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
theorem irrational_add_rational_is_irrational
    {irrational_value rational_value : RealCarrier rational_system real_extension}
    (irrational_is_irrational : IsIrrational rational_system real_extension irrational_value)
    (rational_is_rational : IsRational rational_system real_extension rational_value) :
    IsIrrational rational_system real_extension
      (real_extension.RealModel.signature.add irrational_value rational_value) := by
  sorry

/--
`rational_sub_irrational_is_irrational` TODO

Predicate logic:

  (IsRational rational_system real_extension rational_value ∧ IsIrrational rational_system real_extension irrational_value) → IsIrrational rational_system real_extension (real_extension.RealModel.signature.Subtraction rational_value irrational_value)

Predicate logic (unfolded):

  ∀ (rational_system : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (real_extension : LRA.NumberSystems.RealNumbers.RationalRealExtension rational_system) {rational_value irrational_value : real_extension.RealModel.signature.toCarrierBundle.1}, (Exists fun rational_value_1 => real_extension.DenseOrderedFieldEmbedding.1 rational_value_1 = rational_value ∧ ((Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = irrational_value) → False ∧ Exists fun rational_value_1 => real_extension.DenseOrderedFieldEmbedding.1 rational_value_1 = real_extension.RealModel.signature.toBooleanRingOperationBundle.2 rational_value (real_extension.RealModel.signature.toRingConceptSignature.2 irrational_value))) → False

Logical form (Lean):

```lean
theorem rational_sub_irrational_is_irrational
    {rational_value irrational_value : RealCarrier rational_system real_extension}
    (rational_is_rational : IsRational rational_system real_extension rational_value)
    (irrational_is_irrational : IsIrrational rational_system real_extension irrational_value) :
    IsIrrational rational_system real_extension
      (real_extension.RealModel.signature.Subtraction rational_value irrational_value)
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
theorem rational_sub_irrational_is_irrational
    {rational_value irrational_value : RealCarrier rational_system real_extension}
    (rational_is_rational : IsRational rational_system real_extension rational_value)
    (irrational_is_irrational : IsIrrational rational_system real_extension irrational_value) :
    IsIrrational rational_system real_extension
      (real_extension.RealModel.signature.Subtraction rational_value irrational_value) := by
  sorry

/--
`irrational_sub_rational_is_irrational` TODO

Predicate logic:

  (IsIrrational rational_system real_extension irrational_value ∧ IsRational rational_system real_extension rational_value) → IsIrrational rational_system real_extension (real_extension.RealModel.signature.Subtraction irrational_value rational_value)

Predicate logic (unfolded):

  ∀ (rational_system : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (real_extension : LRA.NumberSystems.RealNumbers.RationalRealExtension rational_system) {irrational_value rational_value : real_extension.RealModel.signature.toCarrierBundle.1}, ((Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = irrational_value) → False ∧ (Exists fun rational_value_1 => real_extension.DenseOrderedFieldEmbedding.1 rational_value_1 = rational_value ∧ Exists fun rational_value_1 => real_extension.DenseOrderedFieldEmbedding.1 rational_value_1 = real_extension.RealModel.signature.toBooleanRingOperationBundle.2 irrational_value (real_extension.RealModel.signature.toRingConceptSignature.2 rational_value))) → False

Logical form (Lean):

```lean
theorem irrational_sub_rational_is_irrational
    {irrational_value rational_value : RealCarrier rational_system real_extension}
    (irrational_is_irrational : IsIrrational rational_system real_extension irrational_value)
    (rational_is_rational : IsRational rational_system real_extension rational_value) :
    IsIrrational rational_system real_extension
      (real_extension.RealModel.signature.Subtraction irrational_value rational_value)
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
theorem irrational_sub_rational_is_irrational
    {irrational_value rational_value : RealCarrier rational_system real_extension}
    (irrational_is_irrational : IsIrrational rational_system real_extension irrational_value)
    (rational_is_rational : IsRational rational_system real_extension rational_value) :
    IsIrrational rational_system real_extension
      (real_extension.RealModel.signature.Subtraction irrational_value rational_value) := by
  sorry

/--
`nonzero_rational_mul_irrational_is_irrational` TODO

Predicate logic:

  (IsRational rational_system real_extension rational_value ∧ IsIrrational rational_system real_extension irrational_value) → IsIrrational rational_system real_extension (real_extension.RealModel.signature.multiply rational_value irrational_value)

Predicate logic (unfolded):

  ∀ (rational_system : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (real_extension : LRA.NumberSystems.RealNumbers.RationalRealExtension rational_system) {rational_value irrational_value : real_extension.RealModel.signature.toCarrierBundle.1}, (Exists fun rational_value_1 => real_extension.DenseOrderedFieldEmbedding.1 rational_value_1 = rational_value ∧ (rational_value = real_extension.RealModel.signature.toZeroOneBundle.2 → False ∧ ((Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = irrational_value) → False ∧ Exists fun rational_value_1 => real_extension.DenseOrderedFieldEmbedding.1 rational_value_1 = real_extension.RealModel.signature.toBooleanRingOperationBundle.3 rational_value irrational_value))) → False

Logical form (Lean):

```lean
theorem nonzero_rational_mul_irrational_is_irrational
    {rational_value irrational_value : RealCarrier rational_system real_extension}
    (rational_is_rational : IsRational rational_system real_extension rational_value)
    (rational_is_nonzero : rational_value ≠ real_extension.RealModel.signature.zero)
    (irrational_is_irrational : IsIrrational rational_system real_extension irrational_value) :
    IsIrrational rational_system real_extension
      (real_extension.RealModel.signature.multiply rational_value irrational_value)
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
theorem nonzero_rational_mul_irrational_is_irrational
    {rational_value irrational_value : RealCarrier rational_system real_extension}
    (rational_is_rational : IsRational rational_system real_extension rational_value)
    (rational_is_nonzero : rational_value ≠ real_extension.RealModel.signature.zero)
    (irrational_is_irrational : IsIrrational rational_system real_extension irrational_value) :
    IsIrrational rational_system real_extension
      (real_extension.RealModel.signature.multiply rational_value irrational_value) := by
  sorry

/--
`irrational_mul_nonzero_rational_is_irrational` TODO

Predicate logic:

  (IsIrrational rational_system real_extension irrational_value ∧ IsRational rational_system real_extension rational_value) → IsIrrational rational_system real_extension (real_extension.RealModel.signature.multiply irrational_value rational_value)

Predicate logic (unfolded):

  ∀ (rational_system : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (real_extension : LRA.NumberSystems.RealNumbers.RationalRealExtension rational_system) {irrational_value rational_value : real_extension.RealModel.signature.toCarrierBundle.1}, ((Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = irrational_value) → False ∧ (Exists fun rational_value_1 => real_extension.DenseOrderedFieldEmbedding.1 rational_value_1 = rational_value ∧ (rational_value = real_extension.RealModel.signature.toZeroOneBundle.2 → False ∧ Exists fun rational_value_1 => real_extension.DenseOrderedFieldEmbedding.1 rational_value_1 = real_extension.RealModel.signature.toBooleanRingOperationBundle.3 irrational_value rational_value))) → False

Logical form (Lean):

```lean
theorem irrational_mul_nonzero_rational_is_irrational
    {irrational_value rational_value : RealCarrier rational_system real_extension}
    (irrational_is_irrational : IsIrrational rational_system real_extension irrational_value)
    (rational_is_rational : IsRational rational_system real_extension rational_value)
    (rational_is_nonzero : rational_value ≠ real_extension.RealModel.signature.zero) :
    IsIrrational rational_system real_extension
      (real_extension.RealModel.signature.multiply irrational_value rational_value)
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
theorem irrational_mul_nonzero_rational_is_irrational
    {irrational_value rational_value : RealCarrier rational_system real_extension}
    (irrational_is_irrational : IsIrrational rational_system real_extension irrational_value)
    (rational_is_rational : IsRational rational_system real_extension rational_value)
    (rational_is_nonzero : rational_value ≠ real_extension.RealModel.signature.zero) :
    IsIrrational rational_system real_extension
      (real_extension.RealModel.signature.multiply irrational_value rational_value) := by
  sorry

/--
`irrational_div_nonzero_rational_is_irrational` TODO

Predicate logic:

  (IsIrrational rational_system real_extension irrational_value ∧ IsRational rational_system real_extension rational_value) → IsIrrational rational_system real_extension (real_extension.RealModel.signature.multiply irrational_value (real_extension.RealModel.signature.inv rational_value))

Predicate logic (unfolded):

  ∀ (rational_system : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (real_extension : LRA.NumberSystems.RealNumbers.RationalRealExtension rational_system) {irrational_value rational_value : real_extension.RealModel.signature.toCarrierBundle.1}, ((Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = irrational_value) → False ∧ (Exists fun rational_value_1 => real_extension.DenseOrderedFieldEmbedding.1 rational_value_1 = rational_value ∧ (rational_value = real_extension.RealModel.signature.toZeroOneBundle.2 → False ∧ Exists fun rational_value_1 => real_extension.DenseOrderedFieldEmbedding.1 rational_value_1 = real_extension.RealModel.signature.toBooleanRingOperationBundle.3 irrational_value (real_extension.RealModel.signature.2 rational_value)))) → False

Logical form (Lean):

```lean
theorem irrational_div_nonzero_rational_is_irrational
    {irrational_value rational_value : RealCarrier rational_system real_extension}
    (irrational_is_irrational : IsIrrational rational_system real_extension irrational_value)
    (rational_is_rational : IsRational rational_system real_extension rational_value)
    (rational_is_nonzero : rational_value ≠ real_extension.RealModel.signature.zero) :
    IsIrrational rational_system real_extension
      (real_extension.RealModel.signature.multiply
        irrational_value
        (real_extension.RealModel.signature.inv rational_value))
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
theorem irrational_div_nonzero_rational_is_irrational
    {irrational_value rational_value : RealCarrier rational_system real_extension}
    (irrational_is_irrational : IsIrrational rational_system real_extension irrational_value)
    (rational_is_rational : IsRational rational_system real_extension rational_value)
    (rational_is_nonzero : rational_value ≠ real_extension.RealModel.signature.zero) :
    IsIrrational rational_system real_extension
      (real_extension.RealModel.signature.multiply
        irrational_value
        (real_extension.RealModel.signature.inv rational_value)) := by
  sorry

/--
`nonzero_rational_div_irrational_is_irrational` TODO

Predicate logic:

  (IsRational rational_system real_extension rational_value ∧ IsIrrational rational_system real_extension irrational_value) → IsIrrational rational_system real_extension (real_extension.RealModel.signature.multiply rational_value (real_extension.RealModel.signature.inv irrational_value))

Predicate logic (unfolded):

  ∀ (rational_system : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (real_extension : LRA.NumberSystems.RealNumbers.RationalRealExtension rational_system) {rational_value irrational_value : real_extension.RealModel.signature.toCarrierBundle.1}, (Exists fun rational_value_1 => real_extension.DenseOrderedFieldEmbedding.1 rational_value_1 = rational_value ∧ (rational_value = real_extension.RealModel.signature.toZeroOneBundle.2 → False ∧ ((Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = irrational_value) → False ∧ Exists fun rational_value_1 => real_extension.DenseOrderedFieldEmbedding.1 rational_value_1 = real_extension.RealModel.signature.toBooleanRingOperationBundle.3 rational_value (real_extension.RealModel.signature.2 irrational_value)))) → False

Logical form (Lean):

```lean
theorem nonzero_rational_div_irrational_is_irrational
    {rational_value irrational_value : RealCarrier rational_system real_extension}
    (rational_is_rational : IsRational rational_system real_extension rational_value)
    (rational_is_nonzero : rational_value ≠ real_extension.RealModel.signature.zero)
    (irrational_is_irrational : IsIrrational rational_system real_extension irrational_value) :
    IsIrrational rational_system real_extension
      (real_extension.RealModel.signature.multiply
        rational_value
        (real_extension.RealModel.signature.inv irrational_value))
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
theorem nonzero_rational_div_irrational_is_irrational
    {rational_value irrational_value : RealCarrier rational_system real_extension}
    (rational_is_rational : IsRational rational_system real_extension rational_value)
    (rational_is_nonzero : rational_value ≠ real_extension.RealModel.signature.zero)
    (irrational_is_irrational : IsIrrational rational_system real_extension irrational_value) :
    IsIrrational rational_system real_extension
      (real_extension.RealModel.signature.multiply
        rational_value
        (real_extension.RealModel.signature.inv irrational_value)) := by
  sorry

/--
`irrational_is_nonzero` TODO

Predicate logic:

  (IsIrrational rational_system real_extension value) → value ≠ real_extension.RealModel.signature.zero

Predicate logic (unfolded):

  ∀ (rational_system : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (real_extension : LRA.NumberSystems.RealNumbers.RationalRealExtension rational_system) {value : real_extension.RealModel.signature.toCarrierBundle.1}, ((Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = value) → False ∧ value = real_extension.RealModel.signature.toZeroOneBundle.2) → False

Logical form (Lean):

```lean
theorem irrational_is_nonzero
    {value : RealCarrier rational_system real_extension}
    (value_is_irrational : IsIrrational rational_system real_extension value) :
    value ≠ real_extension.RealModel.signature.zero
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
theorem irrational_is_nonzero
    {value : RealCarrier rational_system real_extension}
    (value_is_irrational : IsIrrational rational_system real_extension value) :
    value ≠ real_extension.RealModel.signature.zero := by
  sorry

/--
`SquareRootTwoWitness` TODO

Predicate logic:

  structure SquareRootTwoWitness
    (rational_system : RationalNumberSystem)
    (real_extension : RationalRealExtension rational_system) where
  value : RealCarrier rational_system real_extension
  square_is_two :
    real_extension.RealModel.signature.multiply value value =
      real_two rational_system real_extension
  is_irrational : IsIrrational rational_system real_extension value

Predicate logic (unfolded):

  structure SquareRootTwoWitness
    (rational_system : RationalNumberSystem)
    (real_extension : RationalRealExtension rational_system) where
  value : RealCarrier rational_system real_extension
  square_is_two :
    real_extension.RealModel.signature.multiply value value =
      real_two rational_system real_extension
  is_irrational : IsIrrational rational_system real_extension value (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure SquareRootTwoWitness
    (rational_system : RationalNumberSystem)
    (real_extension : RationalRealExtension rational_system) where
  value : RealCarrier rational_system real_extension
  square_is_two :
    real_extension.RealModel.signature.multiply value value =
      real_two rational_system real_extension
  is_irrational : IsIrrational rational_system real_extension value
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
structure SquareRootTwoWitness
    (rational_system : RationalNumberSystem)
    (real_extension : RationalRealExtension rational_system) where
  value : RealCarrier rational_system real_extension
  square_is_two :
    real_extension.RealModel.signature.multiply value value =
      real_two rational_system real_extension
  is_irrational : IsIrrational rational_system real_extension value

/--
`irrationals_not_closed_under_addition` TODO

Predicate logic:

  ∃ first second ∈ RealCarrier rational_system real_extension, IsIrrational rational_system real_extension first ∧ IsIrrational rational_system real_extension second ∧ IsRational rational_system real_extension (real_extension.RealModel.signature.add first second)

Predicate logic (unfolded):

  ∀ (rational_system : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (real_extension : LRA.NumberSystems.RealNumbers.RationalRealExtension rational_system) (a : LRA.NumberSystems.RealNumbers.Irrationals.SquareRootTwoWitness rational_system real_extension), Exists fun first => Exists fun second => ((Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = first) → False ∧ ((Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = second) → False ∧ Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = real_extension.RealModel.signature.toBooleanRingOperationBundle.2 first second))

Logical form (Lean):

```lean
theorem irrationals_not_closed_under_addition
    (witness : SquareRootTwoWitness rational_system real_extension) :
    ∃ first second : RealCarrier rational_system real_extension,
      IsIrrational rational_system real_extension first ∧
      IsIrrational rational_system real_extension second ∧
      IsRational rational_system real_extension
        (real_extension.RealModel.signature.add first second)
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
theorem irrationals_not_closed_under_addition
    (witness : SquareRootTwoWitness rational_system real_extension) :
    ∃ first second : RealCarrier rational_system real_extension,
      IsIrrational rational_system real_extension first ∧
      IsIrrational rational_system real_extension second ∧
      IsRational rational_system real_extension
        (real_extension.RealModel.signature.add first second) := by
  sorry

/--
`irrationals_not_closed_under_subtraction` TODO

Predicate logic:

  ∃ first second ∈ RealCarrier rational_system real_extension, IsIrrational rational_system real_extension first ∧ IsIrrational rational_system real_extension second ∧ IsRational rational_system real_extension (real_extension.RealModel.signature.Subtraction first second)

Predicate logic (unfolded):

  ∀ (rational_system : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (real_extension : LRA.NumberSystems.RealNumbers.RationalRealExtension rational_system) (a : LRA.NumberSystems.RealNumbers.Irrationals.SquareRootTwoWitness rational_system real_extension), Exists fun first => Exists fun second => ((Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = first) → False ∧ ((Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = second) → False ∧ Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = real_extension.RealModel.signature.toBooleanRingOperationBundle.2 first (real_extension.RealModel.signature.toRingConceptSignature.2 second)))

Logical form (Lean):

```lean
theorem irrationals_not_closed_under_subtraction
    (witness : SquareRootTwoWitness rational_system real_extension) :
    ∃ first second : RealCarrier rational_system real_extension,
      IsIrrational rational_system real_extension first ∧
      IsIrrational rational_system real_extension second ∧
      IsRational rational_system real_extension
        (real_extension.RealModel.signature.Subtraction first second)
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
theorem irrationals_not_closed_under_subtraction
    (witness : SquareRootTwoWitness rational_system real_extension) :
    ∃ first second : RealCarrier rational_system real_extension,
      IsIrrational rational_system real_extension first ∧
      IsIrrational rational_system real_extension second ∧
      IsRational rational_system real_extension
        (real_extension.RealModel.signature.Subtraction first second) := by
  sorry

/--
`irrationals_not_closed_under_multiplication` TODO

Predicate logic:

  ∃ first second ∈ RealCarrier rational_system real_extension, IsIrrational rational_system real_extension first ∧ IsIrrational rational_system real_extension second ∧ IsRational rational_system real_extension (real_extension.RealModel.signature.multiply first second)

Predicate logic (unfolded):

  ∀ (rational_system : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (real_extension : LRA.NumberSystems.RealNumbers.RationalRealExtension rational_system) (a : LRA.NumberSystems.RealNumbers.Irrationals.SquareRootTwoWitness rational_system real_extension), Exists fun first => Exists fun second => ((Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = first) → False ∧ ((Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = second) → False ∧ Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = real_extension.RealModel.signature.toBooleanRingOperationBundle.3 first second))

Logical form (Lean):

```lean
theorem irrationals_not_closed_under_multiplication
    (witness : SquareRootTwoWitness rational_system real_extension) :
    ∃ first second : RealCarrier rational_system real_extension,
      IsIrrational rational_system real_extension first ∧
      IsIrrational rational_system real_extension second ∧
      IsRational rational_system real_extension
        (real_extension.RealModel.signature.multiply first second)
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
theorem irrationals_not_closed_under_multiplication
    (witness : SquareRootTwoWitness rational_system real_extension) :
    ∃ first second : RealCarrier rational_system real_extension,
      IsIrrational rational_system real_extension first ∧
      IsIrrational rational_system real_extension second ∧
      IsRational rational_system real_extension
        (real_extension.RealModel.signature.multiply first second) := by
  sorry

/--
`irrationals_not_closed_under_division` TODO

Predicate logic:

  ∃ first second ∈ RealCarrier rational_system real_extension, IsIrrational rational_system real_extension first ∧ IsIrrational rational_system real_extension second ∧ IsRational rational_system real_extension (real_extension.RealModel.signature.multiply first (real_extension.RealModel.signature.inv second))

Predicate logic (unfolded):

  ∀ (rational_system : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (real_extension : LRA.NumberSystems.RealNumbers.RationalRealExtension rational_system) (a : LRA.NumberSystems.RealNumbers.Irrationals.SquareRootTwoWitness rational_system real_extension), Exists fun first => Exists fun second => ((Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = first) → False ∧ ((Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = second) → False ∧ Exists fun rational_value => real_extension.DenseOrderedFieldEmbedding.1 rational_value = real_extension.RealModel.signature.toBooleanRingOperationBundle.3 first (real_extension.RealModel.signature.2 second)))

Logical form (Lean):

```lean
theorem irrationals_not_closed_under_division
    (witness : SquareRootTwoWitness rational_system real_extension) :
    ∃ first second : RealCarrier rational_system real_extension,
      IsIrrational rational_system real_extension first ∧
      IsIrrational rational_system real_extension second ∧
      IsRational rational_system real_extension
        (real_extension.RealModel.signature.multiply
          first
          (real_extension.RealModel.signature.inv second))
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
theorem irrationals_not_closed_under_division
    (witness : SquareRootTwoWitness rational_system real_extension) :
    ∃ first second : RealCarrier rational_system real_extension,
      IsIrrational rational_system real_extension first ∧
      IsIrrational rational_system real_extension second ∧
      IsRational rational_system real_extension
        (real_extension.RealModel.signature.multiply
          first
          (real_extension.RealModel.signature.inv second)) := by
  sorry

end LRA.NumberSystems.RealNumbers.Irrationals
