
import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions.Carrier

namespace LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

/--
`equivalent` TODO

Predicate logic:

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData) (first second : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), rational_data.integer_system.Model.signature.multiply first.numerator (rational_data.to_integer second.denominator) = rational_data.integer_system.Model.signature.multiply second.numerator (rational_data.to_integer first.denominator)

Predicate logic (unfolded):

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData) (first second : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), rational_data.integer_system.Model.signature.toBooleanRingOperationBundle.3 first.1 (rational_data.5 second.2) = rational_data.integer_system.Model.signature.toBooleanRingOperationBundle.3 second.1 (rational_data.5 first.2)

Logical form (Lean):

```lean
def equivalent (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data) : Prop :=
  rational_data.integer_system.Model.signature.multiply
      first.numerator (rational_data.to_integer second.denominator) =
    rational_data.integer_system.Model.signature.multiply
      second.numerator (rational_data.to_integer first.denominator)
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
def equivalent (rational_data : IntegerAndPositiveNaturalData)
    (first second : Representative rational_data) : Prop :=
  rational_data.integer_system.Model.signature.multiply
      first.numerator (rational_data.to_integer second.denominator) =
    rational_data.integer_system.Model.signature.multiply
      second.numerator (rational_data.to_integer first.denominator)

/--
`equivalent_is_equivalence_relation` TODO

Predicate logic:

  (∀ rational_data ∈ IntegerAndPositiveNaturalData), Equivalence (equivalent rational_data)

Predicate logic (unfolded):

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData), Equivalence fun first second => rational_data.integer_system.Model.signature.toBooleanRingOperationBundle.3 first.1 (rational_data.5 second.2) = rational_data.integer_system.Model.signature.toBooleanRingOperationBundle.3 second.1 (rational_data.5 first.2)

Logical form (Lean):

```lean
theorem equivalent_is_equivalence_relation (rational_data : IntegerAndPositiveNaturalData) :
    Equivalence (equivalent rational_data)
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
theorem equivalent_is_equivalence_relation (rational_data : IntegerAndPositiveNaturalData) :
    Equivalence (equivalent rational_data) := by
  sorry
/--
`representative_setoid` TODO

Predicate logic:

  def representative_setoid (rational_data : IntegerAndPositiveNaturalData) : Setoid (Representative rational_data) where
  r := equivalent rational_data
  iseqv := equivalent_is_equivalence_relation rational_data

Predicate logic (unfolded):

  def representative_setoid (rational_data : IntegerAndPositiveNaturalData) : Setoid (Representative rational_data) where
  r := equivalent rational_data
  iseqv := equivalent_is_equivalence_relation rational_data (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def representative_setoid (rational_data : IntegerAndPositiveNaturalData) : Setoid (Representative rational_data) where
  r := equivalent rational_data
  iseqv := equivalent_is_equivalence_relation rational_data
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
def representative_setoid (rational_data : IntegerAndPositiveNaturalData) : Setoid (Representative rational_data) where
  r := equivalent rational_data
  iseqv := equivalent_is_equivalence_relation rational_data

/--
`Carrier` TODO

Predicate logic:

  abbrev Carrier (rational_data : IntegerAndPositiveNaturalData) := Quotient (representative_setoid rational_data)

Predicate logic (unfolded):

  abbrev Carrier (rational_data : IntegerAndPositiveNaturalData) := Quotient (representative_setoid rational_data) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Carrier (rational_data : IntegerAndPositiveNaturalData) := Quotient (representative_setoid rational_data)
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
abbrev Carrier (rational_data : IntegerAndPositiveNaturalData) := Quotient (representative_setoid rational_data)

end LRA.NumberSystems.RationalNumbers.RationalQuotientFractions
