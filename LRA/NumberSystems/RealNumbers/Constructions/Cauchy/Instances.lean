
import LRA.AlgebraicStructures
import LRA.NumberSystems.RationalNumbers.Interface.Definition
import LRA.NumberSystems.RealNumbers.Interface.Definition
import LRA.NumberSystems.RealNumbers.Constructions.Cauchy.Behavior

namespace LRA.NumberSystems.RealNumbers.Cauchy

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers
open LRA.AlgebraicStructures
open LRA.Order

/--
`quotient_addition` TODO

Predicate logic:

  noncomputable def quotient_addition
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data :=
  Classical.choose
    (addition_is_proper rationalSystem absolute_value_data).induced_operation_exists

Predicate logic (unfolded):

  noncomputable def quotient_addition
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data :=
  Classical.choose
    (addition_is_proper rationalSystem absolute_value_data).induced_operation_exists (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def quotient_addition
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data :=
  Classical.choose
    (addition_is_proper rationalSystem absolute_value_data).induced_operation_exists
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
noncomputable def quotient_addition
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data :=
  Classical.choose
    (addition_is_proper rationalSystem absolute_value_data).induced_operation_exists

/--
`quotient_addition_spec` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), ∀ first second, quotient_addition rationalSystem absolute_value_data (Quotient.mk _ first) (Quotient.mk _ second) = Quotient.mk _ (addition rationalSystem absolute_value_data first second)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (first second : LRA.NumberSystems.RealNumbers.Cauchy.Representative rationalSystem absolute_value_data), (Classical.indefiniteDescription (fun x => ∀ (first second : LRA.NumberSystems.RealNumbers.Cauchy.Representative rationalSystem absolute_value_data), x (Quotient.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data) first) (Quotient.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data) second) = Quotient.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data) (LRA.NumberSystems.RealNumbers.Cauchy.addition rationalSystem absolute_value_data first second)) ⋯).1 (Quot.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1 first) (Quot.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1 second) = Quot.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1 { sequence := fun index => rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (first.1 index) (second.1 index), sequence_is_cauchy := ⋯ }

Logical form (Lean):

```lean
theorem quotient_addition_spec
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    ∀ first second,
      quotient_addition rationalSystem absolute_value_data
          (Quotient.mk _ first) (Quotient.mk _ second) =
        Quotient.mk _ (addition rationalSystem absolute_value_data first second)
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
theorem quotient_addition_spec
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    ∀ first second,
      quotient_addition rationalSystem absolute_value_data
          (Quotient.mk _ first) (Quotient.mk _ second) =
        Quotient.mk _ (addition rationalSystem absolute_value_data first second) := by
  sorry

/--
`quotient_multiplication` TODO

Predicate logic:

  noncomputable def quotient_multiplication
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data :=
  Classical.choose
    (multiplication_is_proper rationalSystem absolute_value_data).induced_operation_exists

Predicate logic (unfolded):

  noncomputable def quotient_multiplication
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data :=
  Classical.choose
    (multiplication_is_proper rationalSystem absolute_value_data).induced_operation_exists (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def quotient_multiplication
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data :=
  Classical.choose
    (multiplication_is_proper rationalSystem absolute_value_data).induced_operation_exists
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
noncomputable def quotient_multiplication
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data :=
  Classical.choose
    (multiplication_is_proper rationalSystem absolute_value_data).induced_operation_exists

/--
`quotient_multiplication_spec` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), ∀ first second, quotient_multiplication rationalSystem absolute_value_data (Quotient.mk _ first) (Quotient.mk _ second) = Quotient.mk _ (multiplication rationalSystem absolute_value_data first second)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (first second : LRA.NumberSystems.RealNumbers.Cauchy.Representative rationalSystem absolute_value_data), (Classical.indefiniteDescription (fun x => ∀ (first second : LRA.NumberSystems.RealNumbers.Cauchy.Representative rationalSystem absolute_value_data), x (Quotient.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data) first) (Quotient.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data) second) = Quotient.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data) (LRA.NumberSystems.RealNumbers.Cauchy.multiplication rationalSystem absolute_value_data first second)) ⋯).1 (Quot.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1 first) (Quot.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1 second) = Quot.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1 { sequence := fun index => rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.3 (first.1 index) (second.1 index), sequence_is_cauchy := ⋯ }

Logical form (Lean):

```lean
theorem quotient_multiplication_spec
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    ∀ first second,
      quotient_multiplication rationalSystem absolute_value_data
          (Quotient.mk _ first) (Quotient.mk _ second) =
        Quotient.mk _ (multiplication rationalSystem absolute_value_data first second)
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
theorem quotient_multiplication_spec
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    ∀ first second,
      quotient_multiplication rationalSystem absolute_value_data
          (Quotient.mk _ first) (Quotient.mk _ second) =
        Quotient.mk _ (multiplication rationalSystem absolute_value_data first second) := by
  sorry

/--
`quotient_negation` TODO

Predicate logic:

  noncomputable def quotient_negation
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data :=
  (negation_is_proper rationalSystem absolute_value_data).inducedOperation

Predicate logic (unfolded):

  noncomputable def quotient_negation
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data :=
  (negation_is_proper rationalSystem absolute_value_data).inducedOperation (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def quotient_negation
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data :=
  (negation_is_proper rationalSystem absolute_value_data).inducedOperation
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
noncomputable def quotient_negation
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data :=
  (negation_is_proper rationalSystem absolute_value_data).inducedOperation

/--
`quotient_inverse` TODO

Predicate logic:

  noncomputable def quotient_inverse
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data :=
  (inverse_is_proper rationalSystem absolute_value_data).inducedOperation

Predicate logic (unfolded):

  noncomputable def quotient_inverse
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data :=
  (inverse_is_proper rationalSystem absolute_value_data).inducedOperation (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def quotient_inverse
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data :=
  (inverse_is_proper rationalSystem absolute_value_data).inducedOperation
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
noncomputable def quotient_inverse
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data :=
  (inverse_is_proper rationalSystem absolute_value_data).inducedOperation

/--
`quotient_strict_order` TODO

Predicate logic:

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (a a_1 : LRA.NumberSystems.RealNumbers.Cauchy.Carrier rationalSystem absolute_value_data), (Classical.indefiniteDescription (fun x => ∀ (first second : LRA.NumberSystems.RealNumbers.Cauchy.Representative rationalSystem absolute_value_data), x (Quotient.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data) first) (Quotient.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data) second) ↔ LRA.NumberSystems.RealNumbers.Cauchy.representative_strict_order rationalSystem absolute_value_data first second) ⋯).1 a a_1

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (a a_1 : Quot (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1), (Classical.indefiniteDescription (fun x => ∀ (first second : LRA.NumberSystems.RealNumbers.Cauchy.Representative rationalSystem absolute_value_data), x (Quotient.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data) first) (Quotient.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data) second) ↔ LRA.NumberSystems.RealNumbers.Cauchy.representative_strict_order rationalSystem absolute_value_data first second) ⋯).1 a a_1

Logical form (Lean):

```lean
noncomputable def quotient_strict_order
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data → Prop :=
  Classical.choose
    (strict_order_is_proper rationalSystem absolute_value_data).induced_relation_exists
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
noncomputable def quotient_strict_order
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Carrier rationalSystem absolute_value_data →
      Carrier rationalSystem absolute_value_data → Prop :=
  Classical.choose
    (strict_order_is_proper rationalSystem absolute_value_data).induced_relation_exists

/--
`quotient_strict_order_spec` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), ∀ first second, quotient_strict_order rationalSystem absolute_value_data (Quotient.mk _ first) (Quotient.mk _ second) ↔ representative_strict_order rationalSystem absolute_value_data first second

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (first second : LRA.NumberSystems.RealNumbers.Cauchy.Representative rationalSystem absolute_value_data), (Classical.indefiniteDescription (fun x => ∀ (first second : LRA.NumberSystems.RealNumbers.Cauchy.Representative rationalSystem absolute_value_data), x (Quotient.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data) first) (Quotient.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data) second) ↔ LRA.NumberSystems.RealNumbers.Cauchy.representative_strict_order rationalSystem absolute_value_data first second) ⋯).1 (Quot.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1 first) (Quot.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1 second) ↔ Exists fun epsilon => (rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon ∧ Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → rationalSystem.FieldModel.signature.toOrderedRingConceptSignature.2 (rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (first.1 index) epsilon) (second.1 index))

Logical form (Lean):

```lean
theorem quotient_strict_order_spec
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    ∀ first second,
      quotient_strict_order rationalSystem absolute_value_data
          (Quotient.mk _ first) (Quotient.mk _ second) ↔
        representative_strict_order rationalSystem absolute_value_data first second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem quotient_strict_order_spec
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    ∀ first second,
      quotient_strict_order rationalSystem absolute_value_data
          (Quotient.mk _ first) (Quotient.mk _ second) ↔
        representative_strict_order rationalSystem absolute_value_data first second := by
  sorry

/--
`quotient_nonstrict_order` TODO

Predicate logic:

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (first second : LRA.NumberSystems.RealNumbers.Cauchy.Carrier rationalSystem absolute_value_data), Or (LRA.NumberSystems.RealNumbers.Cauchy.quotient_strict_order rationalSystem absolute_value_data first second) (first = second)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (first second : Quot (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1), Or ((Classical.indefiniteDescription (fun x => ∀ (first second : LRA.NumberSystems.RealNumbers.Cauchy.Representative rationalSystem absolute_value_data), x (Quotient.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data) first) (Quotient.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data) second) ↔ LRA.NumberSystems.RealNumbers.Cauchy.representative_strict_order rationalSystem absolute_value_data first second) ⋯).1 first second) (first = second)

Logical form (Lean):

```lean
def quotient_nonstrict_order
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Carrier rationalSystem absolute_value_data) : Prop :=
  quotient_strict_order rationalSystem absolute_value_data first second ∨ first = second
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
def quotient_nonstrict_order
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Carrier rationalSystem absolute_value_data) : Prop :=
  quotient_strict_order rationalSystem absolute_value_data first second ∨ first = second

noncomputable instance quotientCarrierAdd
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Add (Carrier rationalSystem absolute_value_data) :=
  ⟨quotient_addition rationalSystem absolute_value_data⟩

noncomputable instance quotientCarrierMul
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Mul (Carrier rationalSystem absolute_value_data) :=
  ⟨quotient_multiplication rationalSystem absolute_value_data⟩

noncomputable instance quotientCarrierNeg
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Neg (Carrier rationalSystem absolute_value_data) :=
  ⟨quotient_negation rationalSystem absolute_value_data⟩

noncomputable instance quotientCarrierInv
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Inv (Carrier rationalSystem absolute_value_data) :=
  ⟨quotient_inverse rationalSystem absolute_value_data⟩

noncomputable instance quotientCarrierZero
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    OfNat (Carrier rationalSystem absolute_value_data) 0 :=
  ⟨Quotient.mk _ (zero rationalSystem absolute_value_data)⟩

noncomputable instance quotientCarrierOne
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    OfNat (Carrier rationalSystem absolute_value_data) 1 :=
  ⟨Quotient.mk _ (one rationalSystem absolute_value_data)⟩

noncomputable instance quotientCarrierLT
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LT (Carrier rationalSystem absolute_value_data) :=
  ⟨quotient_strict_order rationalSystem absolute_value_data⟩

noncomputable instance quotientCarrierLE
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LE (Carrier rationalSystem absolute_value_data) :=
  ⟨quotient_nonstrict_order rationalSystem absolute_value_data⟩

/--
`quotient_field_cert` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), OrderedFieldLaws (Carrier rationalSystem absolute_value_data)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem), LRA.AlgebraicStructures.OrderedFieldLaws (Quot (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1)

Logical form (Lean):

```lean
theorem quotient_field_cert
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    OrderedFieldLaws (Carrier rationalSystem absolute_value_data)
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
theorem quotient_field_cert
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    OrderedFieldLaws (Carrier rationalSystem absolute_value_data) := by
  sorry

/--
`quotient_strict_order_cert` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), StrictOrderCompatibilityLaw (Carrier rationalSystem absolute_value_data)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem), LRA.Order.StrictOrderCompatibilityLaw (Quot (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1)

Logical form (Lean):

```lean
theorem quotient_strict_order_cert
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    StrictOrderCompatibilityLaw (Carrier rationalSystem absolute_value_data)
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
theorem quotient_strict_order_cert
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    StrictOrderCompatibilityLaw (Carrier rationalSystem absolute_value_data) := by
  sorry

/--
`quotient_dense_order_cert` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), DenseOrderLaw (Carrier rationalSystem absolute_value_data)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem), LRA.Order.DenseOrderLaw (Quot (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1)

Logical form (Lean):

```lean
theorem quotient_dense_order_cert
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    DenseOrderLaw (Carrier rationalSystem absolute_value_data)
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
theorem quotient_dense_order_cert
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    DenseOrderLaw (Carrier rationalSystem absolute_value_data) := by
  sorry

/--
`quotient_completeness_cert` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), OrderCompletenessLaws (Carrier rationalSystem absolute_value_data) (Set (Carrier rationalSystem absolute_value_data))

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem), LRA.Order.OrderCompletenessLaws (Quot (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1) (Quot (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1 → Prop)

Logical form (Lean):

```lean
theorem quotient_completeness_cert
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    OrderCompletenessLaws (Carrier rationalSystem absolute_value_data)
      (Set (Carrier rationalSystem absolute_value_data))
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
theorem quotient_completeness_cert
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    OrderCompletenessLaws (Carrier rationalSystem absolute_value_data)
      (Set (Carrier rationalSystem absolute_value_data)) := by
  sorry

/--
`CauchyRealizesDenselyOrderedFieldModel` TODO

Predicate logic:

  noncomputable def CauchyRealizesDenselyOrderedFieldModel
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel where
  Carrier

Predicate logic (unfolded):

  noncomputable def CauchyRealizesDenselyOrderedFieldModel
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel where
  Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def CauchyRealizesDenselyOrderedFieldModel
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel where
  Carrier
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
noncomputable def CauchyRealizesDenselyOrderedFieldModel
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel where
  Carrier := Carrier rationalSystem absolute_value_data
  addInst := quotientCarrierAdd rationalSystem absolute_value_data
  mulInst := quotientCarrierMul rationalSystem absolute_value_data
  negInst := quotientCarrierNeg rationalSystem absolute_value_data
  invInst := quotientCarrierInv rationalSystem absolute_value_data
  zeroInst := quotientCarrierZero rationalSystem absolute_value_data
  oneInst := quotientCarrierOne rationalSystem absolute_value_data
  ltInst := quotientCarrierLT rationalSystem absolute_value_data
  leInst := quotientCarrierLE rationalSystem absolute_value_data
  fieldCert := quotient_field_cert rationalSystem absolute_value_data
  strictCert := quotient_strict_order_cert rationalSystem absolute_value_data
  denseCert := quotient_dense_order_cert rationalSystem absolute_value_data

/--
`CauchyRealizesRealModel` TODO

Predicate logic:

  noncomputable def CauchyRealizesRealModel
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.NumberSystems.Interface.ModelTheory.RealModel where
  Carrier

Predicate logic (unfolded):

  noncomputable def CauchyRealizesRealModel
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.NumberSystems.Interface.ModelTheory.RealModel where
  Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def CauchyRealizesRealModel
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.NumberSystems.Interface.ModelTheory.RealModel where
  Carrier
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
noncomputable def CauchyRealizesRealModel
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.NumberSystems.Interface.ModelTheory.RealModel where
  Carrier := Carrier rationalSystem absolute_value_data
  addInst := quotientCarrierAdd rationalSystem absolute_value_data
  mulInst := quotientCarrierMul rationalSystem absolute_value_data
  negInst := quotientCarrierNeg rationalSystem absolute_value_data
  invInst := quotientCarrierInv rationalSystem absolute_value_data
  zeroInst := quotientCarrierZero rationalSystem absolute_value_data
  oneInst := quotientCarrierOne rationalSystem absolute_value_data
  ltInst := quotientCarrierLT rationalSystem absolute_value_data
  leInst := quotientCarrierLE rationalSystem absolute_value_data
  fieldCert := quotient_field_cert rationalSystem absolute_value_data
  strictCert := quotient_strict_order_cert rationalSystem absolute_value_data
  denseCert := quotient_dense_order_cert rationalSystem absolute_value_data
  completeCert := quotient_completeness_cert rationalSystem absolute_value_data

/--
`quotient_rational_embedding` TODO

Predicate logic:

  noncomputable def quotient_rational_embedding
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (value : rationalSystem.FieldModel.signature.carrier) :
    Carrier rationalSystem absolute_value_data :=
  Quotient.mk _ (rational_embedding rationalSystem absolute_value_data value)

Predicate logic (unfolded):

  noncomputable def quotient_rational_embedding
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (value : rationalSystem.FieldModel.signature.carrier) :
    Carrier rationalSystem absolute_value_data :=
  Quotient.mk _ (rational_embedding rationalSystem absolute_value_data value) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def quotient_rational_embedding
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (value : rationalSystem.FieldModel.signature.carrier) :
    Carrier rationalSystem absolute_value_data :=
  Quotient.mk _ (rational_embedding rationalSystem absolute_value_data value)
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
noncomputable def quotient_rational_embedding
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (value : rationalSystem.FieldModel.signature.carrier) :
    Carrier rationalSystem absolute_value_data :=
  Quotient.mk _ (rational_embedding rationalSystem absolute_value_data value)

/--
`cauchy_rational_embedding_preserves_and_reflects_order` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), ∀ first second : rationalSystem.FieldModel.Carrier, quotient_rational_embedding rationalSystem absolute_value_data first ≤ quotient_rational_embedding rationalSystem absolute_value_data second ↔ rationalSystem.FieldModel.signature.le first second

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (first second : rationalSystem.FieldModel.1), (LRA.NumberSystems.RealNumbers.Cauchy.quotientCarrierLE rationalSystem absolute_value_data).1 (Quot.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1 { sequence := fun x => first, sequence_is_cauchy := ⋯ }) (Quot.mk (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1 { sequence := fun x => second, sequence_is_cauchy := ⋯ }) ↔ rationalSystem.FieldModel.signature.toOrderedRingConceptSignature.2 first second

Logical form (Lean):

```lean
theorem cauchy_rational_embedding_preserves_and_reflects_order
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    ∀ first second : rationalSystem.FieldModel.Carrier,
      quotient_rational_embedding rationalSystem absolute_value_data first ≤
          quotient_rational_embedding rationalSystem absolute_value_data second ↔
        rationalSystem.FieldModel.signature.le first second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem cauchy_rational_embedding_preserves_and_reflects_order
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    ∀ first second : rationalSystem.FieldModel.Carrier,
      quotient_rational_embedding rationalSystem absolute_value_data first ≤
          quotient_rational_embedding rationalSystem absolute_value_data second ↔
        rationalSystem.FieldModel.signature.le first second := by
  sorry

/--
`cauchy_rational_embedding_exists` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), ∃ embedding ∈ LRA.NumberSystems.Interface.ModelTheory.DenseOrderedFieldEmbeddingIntoReal rationalSystem.FieldModel (CauchyRealizesRealModel rationalSystem absolute_value_data), True

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem), Exists fun embedding => True

Logical form (Lean):

```lean
theorem cauchy_rational_embedding_exists
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    ∃ embedding :
        LRA.NumberSystems.Interface.ModelTheory.DenseOrderedFieldEmbeddingIntoReal
          rationalSystem.FieldModel
          (CauchyRealizesRealModel rationalSystem absolute_value_data),
      True
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
theorem cauchy_rational_embedding_exists
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    ∃ embedding :
        LRA.NumberSystems.Interface.ModelTheory.DenseOrderedFieldEmbeddingIntoReal
          rationalSystem.FieldModel
          (CauchyRealizesRealModel rationalSystem absolute_value_data),
      True := by
  sorry

/--
`cauchy_rational_embedding_data` TODO

Predicate logic:

  noncomputable def cauchy_rational_embedding_data
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.NumberSystems.Interface.ModelTheory.DenseOrderedFieldEmbeddingIntoReal
      rationalSystem.FieldModel
      (CauchyRealizesRealModel rationalSystem absolute_value_data) :=
  Classical.choose
    (cauchy_rational_embedding_exists rationalSystem absolute_value_data)

Predicate logic (unfolded):

  noncomputable def cauchy_rational_embedding_data
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.NumberSystems.Interface.ModelTheory.DenseOrderedFieldEmbeddingIntoReal
      rationalSystem.FieldModel
      (CauchyRealizesRealModel rationalSystem absolute_value_data) :=
  Classical.choose
    (cauchy_rational_embedding_exists rationalSystem absolute_value_data) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def cauchy_rational_embedding_data
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.NumberSystems.Interface.ModelTheory.DenseOrderedFieldEmbeddingIntoReal
      rationalSystem.FieldModel
      (CauchyRealizesRealModel rationalSystem absolute_value_data) :=
  Classical.choose
    (cauchy_rational_embedding_exists rationalSystem absolute_value_data)
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
noncomputable def cauchy_rational_embedding_data
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.NumberSystems.Interface.ModelTheory.DenseOrderedFieldEmbeddingIntoReal
      rationalSystem.FieldModel
      (CauchyRealizesRealModel rationalSystem absolute_value_data) :=
  Classical.choose
    (cauchy_rational_embedding_exists rationalSystem absolute_value_data)

/--
`CauchyRationalEmbedding` TODO

Predicate logic:

  noncomputable def CauchyRationalEmbedding
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.NumberSystems.Interface.ModelTheory.DenseOrderedFieldEmbeddingIntoReal
      rationalSystem.FieldModel
      (CauchyRealizesRealModel rationalSystem absolute_value_data) :=
  cauchy_rational_embedding_data rationalSystem absolute_value_data

Predicate logic (unfolded):

  noncomputable def CauchyRationalEmbedding
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.NumberSystems.Interface.ModelTheory.DenseOrderedFieldEmbeddingIntoReal
      rationalSystem.FieldModel
      (CauchyRealizesRealModel rationalSystem absolute_value_data) :=
  cauchy_rational_embedding_data rationalSystem absolute_value_data (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def CauchyRationalEmbedding
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.NumberSystems.Interface.ModelTheory.DenseOrderedFieldEmbeddingIntoReal
      rationalSystem.FieldModel
      (CauchyRealizesRealModel rationalSystem absolute_value_data) :=
  cauchy_rational_embedding_data rationalSystem absolute_value_data
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
noncomputable def CauchyRationalEmbedding
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.NumberSystems.Interface.ModelTheory.DenseOrderedFieldEmbeddingIntoReal
      rationalSystem.FieldModel
      (CauchyRealizesRealModel rationalSystem absolute_value_data) :=
  cauchy_rational_embedding_data rationalSystem absolute_value_data

/--
`cauchy_dense_ordered_field_embedding_is_cofinal` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), ∀ realValue : (CauchyRealizesRealModel rationalSystem absolute_value_data).Carrier, ∃ rationalValue ∈ rationalSystem.FieldModel.Carrier, realValue < (CauchyRationalEmbedding rationalSystem absolute_value_data).ToReal rationalValue

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (realValue : (LRA.NumberSystems.RealNumbers.Cauchy.CauchyRealizesRealModel rationalSystem absolute_value_data).toDenselyOrderedFieldModel.1), Exists fun rationalValue => (LRA.NumberSystems.RealNumbers.Cauchy.CauchyRealizesRealModel rationalSystem absolute_value_data).ltInst.1 realValue ((LRA.NumberSystems.RealNumbers.Cauchy.CauchyRationalEmbedding rationalSystem absolute_value_data).1 rationalValue)

Logical form (Lean):

```lean
theorem cauchy_dense_ordered_field_embedding_is_cofinal
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    ∀ realValue :
        (CauchyRealizesRealModel rationalSystem absolute_value_data).Carrier,
      ∃ rationalValue : rationalSystem.FieldModel.Carrier,
        realValue <
          (CauchyRationalEmbedding rationalSystem absolute_value_data).ToReal rationalValue
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
theorem cauchy_dense_ordered_field_embedding_is_cofinal
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    ∀ realValue :
        (CauchyRealizesRealModel rationalSystem absolute_value_data).Carrier,
      ∃ rationalValue : rationalSystem.FieldModel.Carrier,
        realValue <
          (CauchyRationalEmbedding rationalSystem absolute_value_data).ToReal rationalValue := by
  sorry

/--
`CauchyRealizesCofinalRealExtension` TODO

Predicate logic:

  noncomputable def CauchyRealizesCofinalRealExtension
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.NumberSystems.Interface.ModelTheory.CofinalRealExtension
      rationalSystem.FieldModel where
  RealModel := CauchyRealizesRealModel rationalSystem absolute_value_data
  DenseOrderedFieldEmbedding := CauchyRationalEmbedding rationalSystem absolute_value_data
  DenseOrderedFieldEmbeddingIsCofinal :=
    cauchy_dense_ordered_field_embedding_is_cofinal
      rationalSystem absolute_value_data

Predicate logic (unfolded):

  noncomputable def CauchyRealizesCofinalRealExtension
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.NumberSystems.Interface.ModelTheory.CofinalRealExtension
      rationalSystem.FieldModel where
  RealModel := CauchyRealizesRealModel rationalSystem absolute_value_data
  DenseOrderedFieldEmbedding := CauchyRationalEmbedding rationalSystem absolute_value_data
  DenseOrderedFieldEmbeddingIsCofinal :=
    cauchy_dense_ordered_field_embedding_is_cofinal
      rationalSystem absolute_value_data (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def CauchyRealizesCofinalRealExtension
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.NumberSystems.Interface.ModelTheory.CofinalRealExtension
      rationalSystem.FieldModel where
  RealModel := CauchyRealizesRealModel rationalSystem absolute_value_data
  DenseOrderedFieldEmbedding := CauchyRationalEmbedding rationalSystem absolute_value_data
  DenseOrderedFieldEmbeddingIsCofinal :=
    cauchy_dense_ordered_field_embedding_is_cofinal
      rationalSystem absolute_value_data
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
noncomputable def CauchyRealizesCofinalRealExtension
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.NumberSystems.Interface.ModelTheory.CofinalRealExtension
      rationalSystem.FieldModel where
  RealModel := CauchyRealizesRealModel rationalSystem absolute_value_data
  DenseOrderedFieldEmbedding := CauchyRationalEmbedding rationalSystem absolute_value_data
  DenseOrderedFieldEmbeddingIsCofinal :=
    cauchy_dense_ordered_field_embedding_is_cofinal
      rationalSystem absolute_value_data

/--
`CauchyRationalRealExtension` TODO

Predicate logic:

  noncomputable def CauchyRationalRealExtension
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem where
  RealModel := CauchyRealizesRealModel rationalSystem absolute_value_data
  DenseOrderedFieldEmbedding := CauchyRationalEmbedding rationalSystem absolute_value_data
  DenseOrderedFieldEmbeddingIsCofinal :=
    (CauchyRealizesCofinalRealExtension
      rationalSystem absolute_value_data).DenseOrderedFieldEmbeddingIsCofinal

Predicate logic (unfolded):

  noncomputable def CauchyRationalRealExtension
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem where
  RealModel := CauchyRealizesRealModel rationalSystem absolute_value_data
  DenseOrderedFieldEmbedding := CauchyRationalEmbedding rationalSystem absolute_value_data
  DenseOrderedFieldEmbeddingIsCofinal :=
    (CauchyRealizesCofinalRealExtension
      rationalSystem absolute_value_data).DenseOrderedFieldEmbeddingIsCofinal (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def CauchyRationalRealExtension
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem where
  RealModel := CauchyRealizesRealModel rationalSystem absolute_value_data
  DenseOrderedFieldEmbedding := CauchyRationalEmbedding rationalSystem absolute_value_data
  DenseOrderedFieldEmbeddingIsCofinal :=
    (CauchyRealizesCofinalRealExtension
      rationalSystem absolute_value_data).DenseOrderedFieldEmbeddingIsCofinal
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
noncomputable def CauchyRationalRealExtension
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem where
  RealModel := CauchyRealizesRealModel rationalSystem absolute_value_data
  DenseOrderedFieldEmbedding := CauchyRationalEmbedding rationalSystem absolute_value_data
  DenseOrderedFieldEmbeddingIsCofinal :=
    (CauchyRealizesCofinalRealExtension
      rationalSystem absolute_value_data).DenseOrderedFieldEmbeddingIsCofinal

/--
`CauchyRealizesRationalRealExtension` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), ∃ realExtension ∈ LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem, realExtension.RealModel.Carrier = Carrier rationalSystem absoluteValueData

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absoluteValueData : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem), Exists fun realExtension => realExtension.RealModel.toDenselyOrderedFieldModel.1 = Quot (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absoluteValueData).1

Logical form (Lean):

```lean
theorem CauchyRealizesRationalRealExtension
    (rationalSystem : RationalNumberSystem)
    (absoluteValueData : RationalMetricData rationalSystem) :
    ∃ realExtension :
        LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem,
      realExtension.RealModel.Carrier =
        Carrier rationalSystem absoluteValueData
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
theorem CauchyRealizesRationalRealExtension
    (rationalSystem : RationalNumberSystem)
    (absoluteValueData : RationalMetricData rationalSystem) :
    ∃ realExtension :
        LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem,
      realExtension.RealModel.Carrier =
        Carrier rationalSystem absoluteValueData := by
  sorry

end LRA.NumberSystems.RealNumbers.Cauchy
