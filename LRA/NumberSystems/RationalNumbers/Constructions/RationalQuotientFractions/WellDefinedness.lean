
import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions.Operations

namespace LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

/--
`representative_operations_respect_equivalence` TODO

Predicate logic:

  (∀ rational_data ∈ IntegerAndPositiveNaturalData), LRA.UniversalAlgebra.Quotient.binary_operation_respects (representative_setoid rational_data) (representative_addition rational_data) ∧ LRA.UniversalAlgebra.Quotient.binary_operation_respects (representative_setoid rational_data) (representative_multiplication rational_data) ∧ LRA.UniversalAlgebra.Quotient.unary_operation_respects (representative_setoid rational_data) (representative_negation rational_data)

Predicate logic (unfolded):

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData), (∀ (first_representative first_replacement second_representative second_replacement : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 first_representative first_replacement → (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 second_representative second_replacement → (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 { numerator := rational_data.integer_system.Model.signature.toBooleanRingOperationBundle.2 (rational_data.integer_system.Model.signature.toBooleanRingOperationBundle.3 first_representative.1 (rational_data.5 second_representative.denominator)) (rational_data.integer_system.Model.signature.toBooleanRingOperationBundle.3 second_representative.1 (rational_data.5 first_representative.denominator)), denominator := rational_data.4 first_representative.2 second_representative.2 } { numerator := rational_data.integer_system.Model.signature.toBooleanRingOperationBundle.2 (rational_data.integer_system.Model.signature.toBooleanRingOperationBundle.3 first_replacement.1 (rational_data.5 second_replacement.denominator)) (rational_data.integer_system.Model.signature.toBooleanRingOperationBundle.3 second_replacement.1 (rational_data.5 first_replacement.denominator)), denominator := rational_data.4 first_replacement.2 second_replacement.2 } ∧ (∀ (first_representative first_replacement second_representative second_replacement : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 first_representative first_replacement → (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 second_representative second_replacement → (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 { numerator := rational_data.integer_system.Model.signature.toBooleanRingOperationBundle.3 first_representative.1 second_representative.1, denominator := rational_data.4 first_representative.2 second_representative.2 } { numerator := rational_data.integer_system.Model.signature.toBooleanRingOperationBundle.3 first_replacement.1 second_replacement.1, denominator := rational_data.4 first_replacement.2 second_replacement.2 } ∧ ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 first_representative second_representative → (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 { numerator := rational_data.integer_system.Model.signature.toRingConceptSignature.2 first_representative.1, denominator := first_representative.2 } { numerator := rational_data.integer_system.Model.signature.toRingConceptSignature.2 second_representative.1, denominator := second_representative.2 }))

Logical form (Lean):

```lean
theorem representative_operations_respect_equivalence (rational_data : IntegerAndPositiveNaturalData) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
        (representative_setoid rational_data) (representative_addition rational_data) ∧
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
        (representative_setoid rational_data) (representative_multiplication rational_data) ∧
    LRA.UniversalAlgebra.Quotient.unary_operation_respects
        (representative_setoid rational_data) (representative_negation rational_data)
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
theorem representative_operations_respect_equivalence (rational_data : IntegerAndPositiveNaturalData) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
        (representative_setoid rational_data) (representative_addition rational_data) ∧
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
        (representative_setoid rational_data) (representative_multiplication rational_data) ∧
    LRA.UniversalAlgebra.Quotient.unary_operation_respects
        (representative_setoid rational_data) (representative_negation rational_data) := by
  sorry

/--
`addition` TODO

Predicate logic:

  noncomputable def addition (rational_data : IntegerAndPositiveNaturalData) :
    Carrier rational_data → Carrier rational_data → Carrier rational_data :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_binary_operation_exists
      (representative_setoid rational_data)
      (representative_addition rational_data)
      (representative_operations_respect_equivalence rational_data).1)

Predicate logic (unfolded):

  noncomputable def addition (rational_data : IntegerAndPositiveNaturalData) :
    Carrier rational_data → Carrier rational_data → Carrier rational_data :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_binary_operation_exists
      (representative_setoid rational_data)
      (representative_addition rational_data)
      (representative_operations_respect_equivalence rational_data).1) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def addition (rational_data : IntegerAndPositiveNaturalData) :
    Carrier rational_data → Carrier rational_data → Carrier rational_data :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_binary_operation_exists
      (representative_setoid rational_data)
      (representative_addition rational_data)
      (representative_operations_respect_equivalence rational_data).1)
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
noncomputable def addition (rational_data : IntegerAndPositiveNaturalData) :
    Carrier rational_data → Carrier rational_data → Carrier rational_data :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_binary_operation_exists
      (representative_setoid rational_data)
      (representative_addition rational_data)
      (representative_operations_respect_equivalence rational_data).1)

/--
`multiplication` TODO

Predicate logic:

  noncomputable def multiplication (rational_data : IntegerAndPositiveNaturalData) :
    Carrier rational_data → Carrier rational_data → Carrier rational_data :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_binary_operation_exists
      (representative_setoid rational_data)
      (representative_multiplication rational_data)
      (representative_operations_respect_equivalence rational_data).2.1)

Predicate logic (unfolded):

  noncomputable def multiplication (rational_data : IntegerAndPositiveNaturalData) :
    Carrier rational_data → Carrier rational_data → Carrier rational_data :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_binary_operation_exists
      (representative_setoid rational_data)
      (representative_multiplication rational_data)
      (representative_operations_respect_equivalence rational_data).2.1) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def multiplication (rational_data : IntegerAndPositiveNaturalData) :
    Carrier rational_data → Carrier rational_data → Carrier rational_data :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_binary_operation_exists
      (representative_setoid rational_data)
      (representative_multiplication rational_data)
      (representative_operations_respect_equivalence rational_data).2.1)
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
noncomputable def multiplication (rational_data : IntegerAndPositiveNaturalData) :
    Carrier rational_data → Carrier rational_data → Carrier rational_data :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_binary_operation_exists
      (representative_setoid rational_data)
      (representative_multiplication rational_data)
      (representative_operations_respect_equivalence rational_data).2.1)

/--
`negation_exists` TODO

Predicate logic:

  (∀ rational_data ∈ IntegerAndPositiveNaturalData), ∃ negation ∈ Carrier rational_data → Carrier rational_data, ∀ representative : Representative rational_data, negation (Quotient.mk _ representative) = Quotient.mk _ (representative_negation rational_data representative)

Predicate logic (unfolded):

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData), Exists fun negation => ∀ (representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), negation (Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 representative) = Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 { numerator := rational_data.integer_system.Model.signature.toRingConceptSignature.2 representative.1, denominator := representative.2 }

Logical form (Lean):

```lean
theorem negation_exists (rational_data : IntegerAndPositiveNaturalData) :
    ∃ negation : Carrier rational_data → Carrier rational_data,
      ∀ representative : Representative rational_data,
        negation (Quotient.mk _ representative) =
          Quotient.mk _ (representative_negation rational_data representative)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem negation_exists (rational_data : IntegerAndPositiveNaturalData) :
    ∃ negation : Carrier rational_data → Carrier rational_data,
      ∀ representative : Representative rational_data,
        negation (Quotient.mk _ representative) =
          Quotient.mk _ (representative_negation rational_data representative) := by
  sorry

/--
`negation` TODO

Predicate logic:

  noncomputable def negation (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data → Carrier rational_data :=
  Classical.choose (negation_exists rational_data)

Predicate logic (unfolded):

  noncomputable def negation (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data → Carrier rational_data :=
  Classical.choose (negation_exists rational_data) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def negation (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data → Carrier rational_data :=
  Classical.choose (negation_exists rational_data)
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
noncomputable def negation (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data → Carrier rational_data :=
  Classical.choose (negation_exists rational_data)

/--
`representative_strict_order_respects_equivalence` TODO

Predicate logic:

  (∀ rational_data ∈ IntegerAndPositiveNaturalData), LRA.UniversalAlgebra.Quotient.relation_respects (representative_setoid rational_data) (representative_strict_order rational_data)

Predicate logic (unfolded):

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData) (first_representative first_replacement second_representative second_replacement : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), ((LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 first_representative first_replacement ∧ (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 second_representative second_replacement) → rational_data.integer_system.Model.signature.2 (rational_data.integer_system.Model.signature.toBooleanRingOperationBundle.3 first_representative.1 (rational_data.5 second_representative.2)) (rational_data.integer_system.Model.signature.toBooleanRingOperationBundle.3 second_representative.1 (rational_data.5 first_representative.2)) ↔ rational_data.integer_system.Model.signature.2 (rational_data.integer_system.Model.signature.toBooleanRingOperationBundle.3 first_replacement.1 (rational_data.5 second_replacement.2)) (rational_data.integer_system.Model.signature.toBooleanRingOperationBundle.3 second_replacement.1 (rational_data.5 first_replacement.2))

Logical form (Lean):

```lean
theorem representative_strict_order_respects_equivalence (rational_data : IntegerAndPositiveNaturalData) :
    LRA.UniversalAlgebra.Quotient.relation_respects
      (representative_setoid rational_data)
      (representative_strict_order rational_data)
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
theorem representative_strict_order_respects_equivalence (rational_data : IntegerAndPositiveNaturalData) :
    LRA.UniversalAlgebra.Quotient.relation_respects
      (representative_setoid rational_data)
      (representative_strict_order rational_data) := by
  sorry

/--
`strict_order` TODO

Predicate logic:

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData) (a a_1 : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Carrier rational_data), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 a a_1

Predicate logic (unfolded):

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData) (a a_1 : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 a a_1

Logical form (Lean):

```lean
noncomputable def strict_order (rational_data : IntegerAndPositiveNaturalData) :
    Carrier rational_data → Carrier rational_data → Prop :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_relation_exists
      (representative_setoid rational_data)
      (representative_strict_order rational_data)
      (representative_strict_order_respects_equivalence rational_data))
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
noncomputable def strict_order (rational_data : IntegerAndPositiveNaturalData) :
    Carrier rational_data → Carrier rational_data → Prop :=
  Classical.choose
    (LRA.UniversalAlgebra.Quotient.induced_relation_exists
      (representative_setoid rational_data)
      (representative_strict_order rational_data)
      (representative_strict_order_respects_equivalence rational_data))

/--
`nonstrict_order` TODO

Predicate logic:

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData) (first second : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Carrier rational_data), Or (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.strict_order rational_data first second) (first = second)

Predicate logic (unfolded):

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData) (first second : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), x (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) first_representative) (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) second_representative) ↔ LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_strict_order rational_data first_representative second_representative) ⋯).1 first second) (first = second)

Logical form (Lean):

```lean
def nonstrict_order (rational_data : IntegerAndPositiveNaturalData) (first second : Carrier rational_data) : Prop :=
  strict_order rational_data first second ∨ first = second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases, unfold

-/
def nonstrict_order (rational_data : IntegerAndPositiveNaturalData) (first second : Carrier rational_data) : Prop :=
  strict_order rational_data first second ∨ first = second

end LRA.NumberSystems.RationalNumbers.RationalQuotientFractions
