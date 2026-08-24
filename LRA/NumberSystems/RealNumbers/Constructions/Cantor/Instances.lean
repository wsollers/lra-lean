
import LRA.AlgebraicStructures
import LRA.NumberSystems.RationalNumbers.Definition
import LRA.NumberSystems.RealNumbers.Definition
import LRA.NumberSystems.RealNumbers.Constructions.Cantor.Behavior

namespace LRA.NumberSystems.RealNumbers.Cantor

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers
open LRA.AlgebraicStructures
open LRA.Order

/--
`quotient_addition` TODO

Predicate logic:

  noncomputable def quotient_addition
    (fieldModel : DenselyOrderedFieldModel) :
    Carrier fieldModel → Carrier fieldModel → Carrier fieldModel :=
  Classical.choose (addition_is_proper fieldModel).induced_operation_exists

Predicate logic (unfolded):

  noncomputable def quotient_addition
    (fieldModel : DenselyOrderedFieldModel) :
    Carrier fieldModel → Carrier fieldModel → Carrier fieldModel :=
  Classical.choose (addition_is_proper fieldModel).induced_operation_exists (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def quotient_addition
    (fieldModel : DenselyOrderedFieldModel) :
    Carrier fieldModel → Carrier fieldModel → Carrier fieldModel :=
  Classical.choose (addition_is_proper fieldModel).induced_operation_exists
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
    (fieldModel : DenselyOrderedFieldModel) :
    Carrier fieldModel → Carrier fieldModel → Carrier fieldModel :=
  Classical.choose (addition_is_proper fieldModel).induced_operation_exists

/--
`quotient_multiplication` TODO

Predicate logic:

  noncomputable def quotient_multiplication
    (fieldModel : DenselyOrderedFieldModel) :
    Carrier fieldModel → Carrier fieldModel → Carrier fieldModel :=
  Classical.choose (multiplication_is_proper fieldModel).induced_operation_exists

Predicate logic (unfolded):

  noncomputable def quotient_multiplication
    (fieldModel : DenselyOrderedFieldModel) :
    Carrier fieldModel → Carrier fieldModel → Carrier fieldModel :=
  Classical.choose (multiplication_is_proper fieldModel).induced_operation_exists (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def quotient_multiplication
    (fieldModel : DenselyOrderedFieldModel) :
    Carrier fieldModel → Carrier fieldModel → Carrier fieldModel :=
  Classical.choose (multiplication_is_proper fieldModel).induced_operation_exists
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
    (fieldModel : DenselyOrderedFieldModel) :
    Carrier fieldModel → Carrier fieldModel → Carrier fieldModel :=
  Classical.choose (multiplication_is_proper fieldModel).induced_operation_exists

/--
`quotient_negation` TODO

Predicate logic:

  noncomputable def quotient_negation
    (fieldModel : DenselyOrderedFieldModel) :
    Carrier fieldModel → Carrier fieldModel :=
  (negation_is_proper fieldModel).inducedOperation

Predicate logic (unfolded):

  noncomputable def quotient_negation
    (fieldModel : DenselyOrderedFieldModel) :
    Carrier fieldModel → Carrier fieldModel :=
  (negation_is_proper fieldModel).inducedOperation (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def quotient_negation
    (fieldModel : DenselyOrderedFieldModel) :
    Carrier fieldModel → Carrier fieldModel :=
  (negation_is_proper fieldModel).inducedOperation
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
    (fieldModel : DenselyOrderedFieldModel) :
    Carrier fieldModel → Carrier fieldModel :=
  (negation_is_proper fieldModel).inducedOperation

/--
`quotient_strict_order` TODO

Predicate logic:

  ∀ (fieldModel : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (a a_1 : LRA.NumberSystems.RealNumbers.Cantor.Carrier fieldModel), (Classical.indefiniteDescription (fun x => ∀ (first second : LRA.NumberSystems.RealNumbers.Cantor.NestedIntervalSequence fieldModel), x (Quotient.mk (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid fieldModel) first) (Quotient.mk (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid fieldModel) second) ↔ LRA.NumberSystems.RealNumbers.Cantor.representative_strict_order fieldModel first second) ⋯).1 a a_1

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (a a_1 : Quot (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid fieldModel).1), (Classical.indefiniteDescription (fun x => ∀ (first second : LRA.NumberSystems.RealNumbers.Cantor.NestedIntervalSequence fieldModel), x (Quotient.mk (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid fieldModel) first) (Quotient.mk (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid fieldModel) second) ↔ LRA.NumberSystems.RealNumbers.Cantor.representative_strict_order fieldModel first second) ⋯).1 a a_1

Logical form (Lean):

```lean
noncomputable def quotient_strict_order
    (fieldModel : DenselyOrderedFieldModel) :
    Carrier fieldModel → Carrier fieldModel → Prop :=
  Classical.choose (strict_order_is_proper fieldModel).induced_relation_exists
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
    (fieldModel : DenselyOrderedFieldModel) :
    Carrier fieldModel → Carrier fieldModel → Prop :=
  Classical.choose (strict_order_is_proper fieldModel).induced_relation_exists

/--
`quotient_nonstrict_order` TODO

Predicate logic:

  ∀ (fieldModel : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (first second : LRA.NumberSystems.RealNumbers.Cantor.Carrier fieldModel), Or (LRA.NumberSystems.RealNumbers.Cantor.quotient_strict_order fieldModel first second) (first = second)

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (first second : Quot (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid fieldModel).1), Or ((Classical.indefiniteDescription (fun x => ∀ (first second : LRA.NumberSystems.RealNumbers.Cantor.NestedIntervalSequence fieldModel), x (Quotient.mk (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid fieldModel) first) (Quotient.mk (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid fieldModel) second) ↔ LRA.NumberSystems.RealNumbers.Cantor.representative_strict_order fieldModel first second) ⋯).1 first second) (first = second)

Logical form (Lean):

```lean
def quotient_nonstrict_order
    (fieldModel : DenselyOrderedFieldModel)
    (first second : Carrier fieldModel) : Prop :=
  quotient_strict_order fieldModel first second ∨ first = second
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
    (fieldModel : DenselyOrderedFieldModel)
    (first second : Carrier fieldModel) : Prop :=
  quotient_strict_order fieldModel first second ∨ first = second

/--
`quotient_zero` TODO

Predicate logic:

  noncomputable def quotient_zero (fieldModel : DenselyOrderedFieldModel) : Carrier fieldModel :=
  Quotient.mk _ (zero fieldModel)

Predicate logic (unfolded):

  noncomputable def quotient_zero (fieldModel : DenselyOrderedFieldModel) : Carrier fieldModel :=
  Quotient.mk _ (zero fieldModel) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def quotient_zero (fieldModel : DenselyOrderedFieldModel) : Carrier fieldModel :=
  Quotient.mk _ (zero fieldModel)
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
noncomputable def quotient_zero (fieldModel : DenselyOrderedFieldModel) : Carrier fieldModel :=
  Quotient.mk _ (zero fieldModel)

/--
`quotient_one` TODO

Predicate logic:

  noncomputable def quotient_one (fieldModel : DenselyOrderedFieldModel) : Carrier fieldModel :=
  Quotient.mk _ (one fieldModel)

Predicate logic (unfolded):

  noncomputable def quotient_one (fieldModel : DenselyOrderedFieldModel) : Carrier fieldModel :=
  Quotient.mk _ (one fieldModel) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def quotient_one (fieldModel : DenselyOrderedFieldModel) : Carrier fieldModel :=
  Quotient.mk _ (one fieldModel)
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
noncomputable def quotient_one (fieldModel : DenselyOrderedFieldModel) : Carrier fieldModel :=
  Quotient.mk _ (one fieldModel)

noncomputable instance CarrierAdd (fieldModel : DenselyOrderedFieldModel) :
    Add (Carrier fieldModel) := ⟨quotient_addition fieldModel⟩

noncomputable instance CarrierMul (fieldModel : DenselyOrderedFieldModel) :
    Mul (Carrier fieldModel) := ⟨quotient_multiplication fieldModel⟩

noncomputable instance CarrierNeg (fieldModel : DenselyOrderedFieldModel) :
    Neg (Carrier fieldModel) := ⟨quotient_negation fieldModel⟩

noncomputable instance CarrierZero (fieldModel : DenselyOrderedFieldModel) :
    OfNat (Carrier fieldModel) 0 := ⟨quotient_zero fieldModel⟩

noncomputable instance CarrierOne (fieldModel : DenselyOrderedFieldModel) :
    OfNat (Carrier fieldModel) 1 := ⟨quotient_one fieldModel⟩

noncomputable instance CarrierLT (fieldModel : DenselyOrderedFieldModel) :
    LT (Carrier fieldModel) := ⟨quotient_strict_order fieldModel⟩

noncomputable instance CarrierLE (fieldModel : DenselyOrderedFieldModel) :
    LE (Carrier fieldModel) := ⟨quotient_nonstrict_order fieldModel⟩

/--
`reciprocal_exists_uniquely` TODO

Predicate logic:

  (∀ fieldModel ∈ DenselyOrderedFieldModel), ∃ reciprocal ∈ Carrier fieldModel, value * reciprocal = 1 ∈ Carrier fieldModel ∧ ∀ other, value * other = 1 ∈ Carrier fieldModel → other = reciprocal

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (value : Quot (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid fieldModel).1), (value = LRA.NumberSystems.RealNumbers.Cantor.CarrierZero fieldModel.1 → False) → Exists fun reciprocal => (instHMul.1 value reciprocal = LRA.NumberSystems.RealNumbers.Cantor.CarrierOne fieldModel.1 ∧ ∀ (other : Quot (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid fieldModel).1), instHMul.1 value other = LRA.NumberSystems.RealNumbers.Cantor.CarrierOne fieldModel.1 → other = reciprocal)

Logical form (Lean):

```lean
theorem reciprocal_exists_uniquely
    (fieldModel : DenselyOrderedFieldModel)
    (value : Carrier fieldModel)
    (value_nonzero : value ≠ (0 : Carrier fieldModel)) :
    ∃ reciprocal : Carrier fieldModel,
      value * reciprocal = (1 : Carrier fieldModel) ∧
      ∀ other, value * other = (1 : Carrier fieldModel) → other = reciprocal
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
theorem reciprocal_exists_uniquely
    (fieldModel : DenselyOrderedFieldModel)
    (value : Carrier fieldModel)
    (value_nonzero : value ≠ (0 : Carrier fieldModel)) :
    ∃ reciprocal : Carrier fieldModel,
      value * reciprocal = (1 : Carrier fieldModel) ∧
      ∀ other, value * other = (1 : Carrier fieldModel) → other = reciprocal := by
  sorry

/--
`inverse` TODO

Predicate logic:

  noncomputable def inverse
    (fieldModel : DenselyOrderedFieldModel)
    (value : Carrier fieldModel)
    (value_nonzero : value ≠ (0 : Carrier fieldModel)) : Carrier fieldModel :=
  Classical.choose (reciprocal_exists_uniquely fieldModel value value_nonzero)

Predicate logic (unfolded):

  noncomputable def inverse
    (fieldModel : DenselyOrderedFieldModel)
    (value : Carrier fieldModel)
    (value_nonzero : value ≠ (0 : Carrier fieldModel)) : Carrier fieldModel :=
  Classical.choose (reciprocal_exists_uniquely fieldModel value value_nonzero) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def inverse
    (fieldModel : DenselyOrderedFieldModel)
    (value : Carrier fieldModel)
    (value_nonzero : value ≠ (0 : Carrier fieldModel)) : Carrier fieldModel :=
  Classical.choose (reciprocal_exists_uniquely fieldModel value value_nonzero)
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
noncomputable def inverse
    (fieldModel : DenselyOrderedFieldModel)
    (value : Carrier fieldModel)
    (value_nonzero : value ≠ (0 : Carrier fieldModel)) : Carrier fieldModel :=
  Classical.choose (reciprocal_exists_uniquely fieldModel value value_nonzero)

open Classical in

/--
`totalInverse` TODO

Predicate logic:

  noncomputable def totalInverse
    (fieldModel : DenselyOrderedFieldModel)
    (value : Carrier fieldModel) : Carrier fieldModel :=
  if value_nonzero : value ≠ (0 : Carrier fieldModel)
  then inverse fieldModel value value_nonzero
  else (0 : Carrier fieldModel)

Predicate logic (unfolded):

  noncomputable def totalInverse
    (fieldModel : DenselyOrderedFieldModel)
    (value : Carrier fieldModel) : Carrier fieldModel :=
  if value_nonzero : value ≠ (0 : Carrier fieldModel)
  then inverse fieldModel value value_nonzero
  else (0 : Carrier fieldModel) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def totalInverse
    (fieldModel : DenselyOrderedFieldModel)
    (value : Carrier fieldModel) : Carrier fieldModel :=
  if value_nonzero : value ≠ (0 : Carrier fieldModel)
  then inverse fieldModel value value_nonzero
  else (0 : Carrier fieldModel)
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
noncomputable def totalInverse
    (fieldModel : DenselyOrderedFieldModel)
    (value : Carrier fieldModel) : Carrier fieldModel :=
  if value_nonzero : value ≠ (0 : Carrier fieldModel)
  then inverse fieldModel value value_nonzero
  else (0 : Carrier fieldModel)

noncomputable instance CarrierInv (fieldModel : DenselyOrderedFieldModel) :
    Inv (Carrier fieldModel) := ⟨totalInverse fieldModel⟩

/--
`carrier_field_cert` TODO

Predicate logic:

  (∀ fieldModel ∈ DenselyOrderedFieldModel), OrderedFieldLaws (Carrier fieldModel)

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel), LRA.AlgebraicStructures.OrderedFieldLaws (Quot (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid fieldModel).1)

Logical form (Lean):

```lean
theorem carrier_field_cert
    (fieldModel : DenselyOrderedFieldModel) :
    OrderedFieldLaws (Carrier fieldModel)
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
theorem carrier_field_cert
    (fieldModel : DenselyOrderedFieldModel) :
    OrderedFieldLaws (Carrier fieldModel) := by
  sorry

/--
`carrier_strict_order_cert` TODO

Predicate logic:

  (∀ fieldModel ∈ DenselyOrderedFieldModel), StrictOrderCompatibilityLaw (Carrier fieldModel)

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel), LRA.Order.StrictOrderCompatibilityLaw (Quot (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid fieldModel).1)

Logical form (Lean):

```lean
theorem carrier_strict_order_cert
    (fieldModel : DenselyOrderedFieldModel) :
    StrictOrderCompatibilityLaw (Carrier fieldModel)
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
theorem carrier_strict_order_cert
    (fieldModel : DenselyOrderedFieldModel) :
    StrictOrderCompatibilityLaw (Carrier fieldModel) := by
  sorry

/--
`carrier_dense_order_cert` TODO

Predicate logic:

  (∀ fieldModel ∈ DenselyOrderedFieldModel), DenseOrderLaw (Carrier fieldModel)

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel), LRA.Order.DenseOrderLaw (Quot (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid fieldModel).1)

Logical form (Lean):

```lean
theorem carrier_dense_order_cert
    (fieldModel : DenselyOrderedFieldModel) :
    DenseOrderLaw (Carrier fieldModel)
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
theorem carrier_dense_order_cert
    (fieldModel : DenselyOrderedFieldModel) :
    DenseOrderLaw (Carrier fieldModel) := by
  sorry

/--
`carrier_completeness_cert` TODO

Predicate logic:

  (∀ fieldModel ∈ DenselyOrderedFieldModel), OrderCompletenessLaws (Carrier fieldModel) (Set (Carrier fieldModel))

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel), LRA.Order.OrderCompletenessLaws (Quot (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid fieldModel).1) (Quot (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid fieldModel).1 → Prop)

Logical form (Lean):

```lean
theorem carrier_completeness_cert
    (fieldModel : DenselyOrderedFieldModel) :
    OrderCompletenessLaws (Carrier fieldModel) (Set (Carrier fieldModel))
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
theorem carrier_completeness_cert
    (fieldModel : DenselyOrderedFieldModel) :
    OrderCompletenessLaws (Carrier fieldModel) (Set (Carrier fieldModel)) := by
  sorry

/--
`CantorRealizesDenselyOrderedFieldModel` TODO

Predicate logic:

  noncomputable def CantorRealizesDenselyOrderedFieldModel
    (fieldModel : DenselyOrderedFieldModel) :
    LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel where
  Carrier

Predicate logic (unfolded):

  noncomputable def CantorRealizesDenselyOrderedFieldModel
    (fieldModel : DenselyOrderedFieldModel) :
    LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel where
  Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def CantorRealizesDenselyOrderedFieldModel
    (fieldModel : DenselyOrderedFieldModel) :
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
noncomputable def CantorRealizesDenselyOrderedFieldModel
    (fieldModel : DenselyOrderedFieldModel) :
    LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel where
  Carrier := Carrier fieldModel
  addInst := CarrierAdd fieldModel
  mulInst := CarrierMul fieldModel
  negInst := CarrierNeg fieldModel
  invInst := CarrierInv fieldModel
  zeroInst := CarrierZero fieldModel
  oneInst := CarrierOne fieldModel
  ltInst := CarrierLT fieldModel
  leInst := CarrierLE fieldModel
  fieldCert := carrier_field_cert fieldModel
  strictCert := carrier_strict_order_cert fieldModel
  denseCert := carrier_dense_order_cert fieldModel

/--
`CantorRealizesRealModel` TODO

Predicate logic:

  noncomputable def CantorRealizesRealModel
    (fieldModel : DenselyOrderedFieldModel) :
    LRA.NumberSystems.Interface.ModelTheory.RealModel where
  Carrier

Predicate logic (unfolded):

  noncomputable def CantorRealizesRealModel
    (fieldModel : DenselyOrderedFieldModel) :
    LRA.NumberSystems.Interface.ModelTheory.RealModel where
  Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def CantorRealizesRealModel
    (fieldModel : DenselyOrderedFieldModel) :
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
noncomputable def CantorRealizesRealModel
    (fieldModel : DenselyOrderedFieldModel) :
    LRA.NumberSystems.Interface.ModelTheory.RealModel where
  Carrier := Carrier fieldModel
  addInst := CarrierAdd fieldModel
  mulInst := CarrierMul fieldModel
  negInst := CarrierNeg fieldModel
  invInst := CarrierInv fieldModel
  zeroInst := CarrierZero fieldModel
  oneInst := CarrierOne fieldModel
  ltInst := CarrierLT fieldModel
  leInst := CarrierLE fieldModel
  fieldCert := carrier_field_cert fieldModel
  strictCert := carrier_strict_order_cert fieldModel
  denseCert := carrier_dense_order_cert fieldModel
  completeCert := carrier_completeness_cert fieldModel

/--
`CantorRealizesRationalRealExtension` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), ∃ realExtension ∈ LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem, realExtension.RealModel.Carrier = Carrier rationalSystem.FieldModel

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem), Exists fun realExtension => realExtension.RealModel.toDenselyOrderedFieldModel.1 = Quot (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid rationalSystem.FieldModel).1

Logical form (Lean):

```lean
theorem CantorRealizesRationalRealExtension
    (rationalSystem : RationalNumberSystem) :
    ∃ realExtension :
        LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem,
      realExtension.RealModel.Carrier = Carrier rationalSystem.FieldModel
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
theorem CantorRealizesRationalRealExtension
    (rationalSystem : RationalNumberSystem) :
    ∃ realExtension :
        LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem,
      realExtension.RealModel.Carrier = Carrier rationalSystem.FieldModel := by
  sorry

end LRA.NumberSystems.RealNumbers.Cantor
