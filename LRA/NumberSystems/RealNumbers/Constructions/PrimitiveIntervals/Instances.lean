
import LRA.AlgebraicStructures
import LRA.NumberSystems.RationalNumbers.Interface.Definition
import LRA.NumberSystems.RealNumbers.Interface.Definition
import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals.Behavior

namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervals

open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers
open LRA.AlgebraicStructures
open LRA.Order

/-!
Unlike `Dedekind` (a subtype) and like `Cauchy` (a quotient),
`PrimitiveIntervals` is already fully lifted to its quotient `Carrier` —
`addition`/`negation`/`multiplication`/`strict_order`/`zero`/`one`
(`WellDefinedness.lean`/`Operations.lean`) are already `Carrier →
Carrier → Carrier`/`Carrier → Carrier → Prop`, and `inverse`
(`Laws.lean`) is already the standard partial `value ≠ zero →
Carrier`. So — same as `Dedekind` — none of
`Operation.Laws.QuotientCompatible`'s machinery is needed here either;
these become typeclass instances directly, with `inverse` total-ized the
same `0⁻¹ := 0` way as `Dedekind`'s.
-/

open Classical in

/--
`totalInverse` TODO

Predicate logic:

  noncomputable def totalInverse
    (rational_model : RationalModel)
    (value : Carrier rational_model) : Carrier rational_model :=
  if value_nonzero : value ≠ zero rational_model
  then inverse rational_model value value_nonzero
  else zero rational_model

Predicate logic (unfolded):

  noncomputable def totalInverse
    (rational_model : RationalModel)
    (value : Carrier rational_model) : Carrier rational_model :=
  if value_nonzero : value ≠ zero rational_model
  then inverse rational_model value value_nonzero
  else zero rational_model (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def totalInverse
    (rational_model : RationalModel)
    (value : Carrier rational_model) : Carrier rational_model :=
  if value_nonzero : value ≠ zero rational_model
  then inverse rational_model value value_nonzero
  else zero rational_model
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
    (rational_model : RationalModel)
    (value : Carrier rational_model) : Carrier rational_model :=
  if value_nonzero : value ≠ zero rational_model
  then inverse rational_model value value_nonzero
  else zero rational_model

noncomputable instance CarrierAdd (rational_model : RationalModel) :
    Add (Carrier rational_model) := ⟨addition rational_model⟩

noncomputable instance CarrierMul (rational_model : RationalModel) :
    Mul (Carrier rational_model) := ⟨multiplication rational_model⟩

noncomputable instance CarrierNeg (rational_model : RationalModel) :
    Neg (Carrier rational_model) := ⟨negation rational_model⟩

noncomputable instance CarrierInv (rational_model : RationalModel) :
    Inv (Carrier rational_model) := ⟨totalInverse rational_model⟩

noncomputable instance CarrierZero (rational_model : RationalModel) :
    OfNat (Carrier rational_model) 0 := ⟨zero rational_model⟩

noncomputable instance CarrierOne (rational_model : RationalModel) :
    OfNat (Carrier rational_model) 1 := ⟨one rational_model⟩

noncomputable instance CarrierLT (rational_model : RationalModel) :
    LT (Carrier rational_model) := ⟨strict_order rational_model⟩

/--
`nonstrict_order` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first second : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Carrier rational_model), Or (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.strict_order rational_model first second) (first = second)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first second : Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1), Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 first second) (first = second)

Logical form (Lean):

```lean
def nonstrict_order
    (rational_model : RationalModel)
    (first second : Carrier rational_model) : Prop :=
  strict_order rational_model first second ∨ first = second
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
def nonstrict_order
    (rational_model : RationalModel)
    (first second : Carrier rational_model) : Prop :=
  strict_order rational_model first second ∨ first = second

noncomputable instance CarrierLE (rational_model : RationalModel) :
    LE (Carrier rational_model) := ⟨nonstrict_order rational_model⟩

/--
`carrier_field_cert` TODO

Predicate logic:

  (∀ rational_model ∈ RationalModel), OrderedFieldLaws (Carrier rational_model)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), LRA.AlgebraicStructures.OrderedFieldLaws (Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1)

Logical form (Lean):

```lean
theorem carrier_field_cert
    (rational_model : RationalModel) :
    OrderedFieldLaws (Carrier rational_model)
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
    (rational_model : RationalModel) :
    OrderedFieldLaws (Carrier rational_model) := by
  sorry
/--
`carrier_strict_order_cert` TODO

Predicate logic:

  (∀ rational_model ∈ RationalModel), StrictOrderCompatibilityLaw (Carrier rational_model)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), LRA.Order.StrictOrderCompatibilityLaw (Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1)

Logical form (Lean):

```lean
theorem carrier_strict_order_cert
    (rational_model : RationalModel) :
    StrictOrderCompatibilityLaw (Carrier rational_model)
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
    (rational_model : RationalModel) :
    StrictOrderCompatibilityLaw (Carrier rational_model) := by
  sorry
/--
`carrier_dense_order_cert` TODO

Predicate logic:

  (∀ rational_model ∈ RationalModel), DenseOrderLaw (Carrier rational_model)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), LRA.Order.DenseOrderLaw (Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1)

Logical form (Lean):

```lean
theorem carrier_dense_order_cert
    (rational_model : RationalModel) :
    DenseOrderLaw (Carrier rational_model)
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
    (rational_model : RationalModel) :
    DenseOrderLaw (Carrier rational_model) := by
  sorry
/--
`carrier_completeness_cert` TODO

Predicate logic:

  (∀ rational_model ∈ RationalModel), OrderCompletenessLaws (Carrier rational_model) (Set (Carrier rational_model))

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), LRA.Order.OrderCompletenessLaws (Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1) (Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1 → Prop)

Logical form (Lean):

```lean
theorem carrier_completeness_cert
    (rational_model : RationalModel) :
    OrderCompletenessLaws (Carrier rational_model) (Set (Carrier rational_model))
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
    (rational_model : RationalModel) :
    OrderCompletenessLaws (Carrier rational_model) (Set (Carrier rational_model)) := by
  sorry
/--
`PrimitiveIntervalsRealizesRationalModel` TODO

Predicate logic:

  noncomputable def PrimitiveIntervalsRealizesRationalModel
    (rational_model : RationalModel) :
    LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel where
  Carrier

Predicate logic (unfolded):

  noncomputable def PrimitiveIntervalsRealizesRationalModel
    (rational_model : RationalModel) :
    LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel where
  Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def PrimitiveIntervalsRealizesRationalModel
    (rational_model : RationalModel) :
    LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel where
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
noncomputable def PrimitiveIntervalsRealizesRationalModel
    (rational_model : RationalModel) :
    LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel where
  Carrier := Carrier rational_model
  addInst := CarrierAdd rational_model
  mulInst := CarrierMul rational_model
  negInst := CarrierNeg rational_model
  invInst := CarrierInv rational_model
  zeroInst := CarrierZero rational_model
  oneInst := CarrierOne rational_model
  ltInst := CarrierLT rational_model
  leInst := CarrierLE rational_model
  fieldCert := carrier_field_cert rational_model
  strictCert := carrier_strict_order_cert rational_model
  denseCert := carrier_dense_order_cert rational_model

/--
`PrimitiveIntervalsRealizesRealModel` TODO

Predicate logic:

  noncomputable def PrimitiveIntervalsRealizesRealModel
    (rational_model : RationalModel) :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel where
  Carrier

Predicate logic (unfolded):

  noncomputable def PrimitiveIntervalsRealizesRealModel
    (rational_model : RationalModel) :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel where
  Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def PrimitiveIntervalsRealizesRealModel
    (rational_model : RationalModel) :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel where
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
noncomputable def PrimitiveIntervalsRealizesRealModel
    (rational_model : RationalModel) :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel where
  Carrier := Carrier rational_model
  addInst := CarrierAdd rational_model
  mulInst := CarrierMul rational_model
  negInst := CarrierNeg rational_model
  invInst := CarrierInv rational_model
  zeroInst := CarrierZero rational_model
  oneInst := CarrierOne rational_model
  ltInst := CarrierLT rational_model
  leInst := CarrierLE rational_model
  fieldCert := carrier_field_cert rational_model
  strictCert := carrier_strict_order_cert rational_model
  denseCert := carrier_dense_order_cert rational_model
  completeCert := carrier_completeness_cert rational_model

/--
`PrimitiveIntervalsRealizesRationalRealExtension` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), ∃ realExtension ∈ LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem, realExtension.RealModel.Carrier = Carrier rationalSystem.FieldModel

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem), Exists fun realExtension => realExtension.RealModel.toDenselyOrderedFieldModel.1 = Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rationalSystem.FieldModel).1

Logical form (Lean):

```lean
theorem PrimitiveIntervalsRealizesRationalRealExtension
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
theorem PrimitiveIntervalsRealizesRationalRealExtension
    (rationalSystem : RationalNumberSystem) :
    ∃ realExtension :
        LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem,
      realExtension.RealModel.Carrier = Carrier rationalSystem.FieldModel := by
  sorry
end LRA.NumberSystems.RealNumbers.PrimitiveIntervals
