import LRA.AlgebraicStructures
import LRA.NumberSystems.RealNumbers.Definition
import LRA.NumberSystems.RealNumbers.Constructions.EffectiveCauchy.Behavior

namespace LRA.NumberSystems.RealNumbers.EffectiveCauchy

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers
open LRA.AlgebraicStructures
open LRA.Order

/--
`quotient_addition` TODO

Predicate logic:

  noncomputable def quotient_addition
    (rationalSystem : RationalNumberSystem) :
    EffectiveCauchyReal rationalSystem →
      EffectiveCauchyReal rationalSystem → EffectiveCauchyReal rationalSystem :=
  Classical.choose (addition_is_proper rationalSystem).induced_operation_exists

Predicate logic (unfolded):

  noncomputable def quotient_addition
    (rationalSystem : RationalNumberSystem) :
    EffectiveCauchyReal rationalSystem →
      EffectiveCauchyReal rationalSystem → EffectiveCauchyReal rationalSystem :=
  Classical.choose (addition_is_proper rationalSystem).induced_operation_exists (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def quotient_addition
    (rationalSystem : RationalNumberSystem) :
    EffectiveCauchyReal rationalSystem →
      EffectiveCauchyReal rationalSystem → EffectiveCauchyReal rationalSystem :=
  Classical.choose (addition_is_proper rationalSystem).induced_operation_exists
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
    (rationalSystem : RationalNumberSystem) :
    EffectiveCauchyReal rationalSystem →
      EffectiveCauchyReal rationalSystem → EffectiveCauchyReal rationalSystem :=
  Classical.choose (addition_is_proper rationalSystem).induced_operation_exists

/--
`quotient_multiplication` TODO

Predicate logic:

  noncomputable def quotient_multiplication
    (rationalSystem : RationalNumberSystem) :
    EffectiveCauchyReal rationalSystem →
      EffectiveCauchyReal rationalSystem → EffectiveCauchyReal rationalSystem :=
  Classical.choose (multiplication_is_proper rationalSystem).induced_operation_exists

Predicate logic (unfolded):

  noncomputable def quotient_multiplication
    (rationalSystem : RationalNumberSystem) :
    EffectiveCauchyReal rationalSystem →
      EffectiveCauchyReal rationalSystem → EffectiveCauchyReal rationalSystem :=
  Classical.choose (multiplication_is_proper rationalSystem).induced_operation_exists (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def quotient_multiplication
    (rationalSystem : RationalNumberSystem) :
    EffectiveCauchyReal rationalSystem →
      EffectiveCauchyReal rationalSystem → EffectiveCauchyReal rationalSystem :=
  Classical.choose (multiplication_is_proper rationalSystem).induced_operation_exists
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
    (rationalSystem : RationalNumberSystem) :
    EffectiveCauchyReal rationalSystem →
      EffectiveCauchyReal rationalSystem → EffectiveCauchyReal rationalSystem :=
  Classical.choose (multiplication_is_proper rationalSystem).induced_operation_exists

/--
`quotient_negation` TODO

Predicate logic:

  noncomputable def quotient_negation
    (rationalSystem : RationalNumberSystem) :
    EffectiveCauchyReal rationalSystem → EffectiveCauchyReal rationalSystem :=
  (negation_is_proper rationalSystem).inducedOperation

Predicate logic (unfolded):

  noncomputable def quotient_negation
    (rationalSystem : RationalNumberSystem) :
    EffectiveCauchyReal rationalSystem → EffectiveCauchyReal rationalSystem :=
  (negation_is_proper rationalSystem).inducedOperation (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def quotient_negation
    (rationalSystem : RationalNumberSystem) :
    EffectiveCauchyReal rationalSystem → EffectiveCauchyReal rationalSystem :=
  (negation_is_proper rationalSystem).inducedOperation
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
    (rationalSystem : RationalNumberSystem) :
    EffectiveCauchyReal rationalSystem → EffectiveCauchyReal rationalSystem :=
  (negation_is_proper rationalSystem).inducedOperation

/--
`quotient_strict_order` TODO

Predicate logic:

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (a a_1 : LRA.NumberSystems.RealNumbers.EffectiveCauchy.EffectiveCauchyReal rationalSystem), (Classical.indefiniteDescription (fun x => ∀ (first second : LRA.NumberSystems.RealNumbers.EffectiveCauchy.EffectiveCauchyApproximation rationalSystem), x (Quotient.mk (LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem) first) (Quotient.mk (LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem) second) ↔ LRA.NumberSystems.RealNumbers.EffectiveCauchy.representative_strict_order first second) ⋯).1 a a_1

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (a a_1 : Quot (LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem).1), (Classical.indefiniteDescription (fun x => ∀ (first second : LRA.NumberSystems.RealNumbers.EffectiveCauchy.EffectiveCauchyApproximation rationalSystem), x (Quotient.mk (LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem) first) (Quotient.mk (LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem) second) ↔ LRA.NumberSystems.RealNumbers.EffectiveCauchy.representative_strict_order first second) ⋯).1 a a_1

Logical form (Lean):

```lean
noncomputable def quotient_strict_order
    (rationalSystem : RationalNumberSystem) :
    EffectiveCauchyReal rationalSystem → EffectiveCauchyReal rationalSystem → Prop :=
  Classical.choose (strict_order_is_proper rationalSystem).induced_relation_exists
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
    (rationalSystem : RationalNumberSystem) :
    EffectiveCauchyReal rationalSystem → EffectiveCauchyReal rationalSystem → Prop :=
  Classical.choose (strict_order_is_proper rationalSystem).induced_relation_exists

/--
`quotient_nonstrict_order` TODO

Predicate logic:

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (first second : LRA.NumberSystems.RealNumbers.EffectiveCauchy.EffectiveCauchyReal rationalSystem), Or (LRA.NumberSystems.RealNumbers.EffectiveCauchy.quotient_strict_order rationalSystem first second) (first = second)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (first second : Quot (LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem).1), Or ((Classical.indefiniteDescription (fun x => ∀ (first second : LRA.NumberSystems.RealNumbers.EffectiveCauchy.EffectiveCauchyApproximation rationalSystem), x (Quotient.mk (LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem) first) (Quotient.mk (LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem) second) ↔ LRA.NumberSystems.RealNumbers.EffectiveCauchy.representative_strict_order first second) ⋯).1 first second) (first = second)

Logical form (Lean):

```lean
def quotient_nonstrict_order
    (rationalSystem : RationalNumberSystem)
    (first second : EffectiveCauchyReal rationalSystem) : Prop :=
  quotient_strict_order rationalSystem first second ∨ first = second
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
    (first second : EffectiveCauchyReal rationalSystem) : Prop :=
  quotient_strict_order rationalSystem first second ∨ first = second

/--
`quotient_zero` TODO

Predicate logic:

  noncomputable def quotient_zero (rationalSystem : RationalNumberSystem) : EffectiveCauchyReal rationalSystem :=
  Quotient.mk _ (zero rationalSystem)

Predicate logic (unfolded):

  noncomputable def quotient_zero (rationalSystem : RationalNumberSystem) : EffectiveCauchyReal rationalSystem :=
  Quotient.mk _ (zero rationalSystem) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def quotient_zero (rationalSystem : RationalNumberSystem) : EffectiveCauchyReal rationalSystem :=
  Quotient.mk _ (zero rationalSystem)
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
noncomputable def quotient_zero (rationalSystem : RationalNumberSystem) : EffectiveCauchyReal rationalSystem :=
  Quotient.mk _ (zero rationalSystem)

/--
`quotient_one` TODO

Predicate logic:

  noncomputable def quotient_one (rationalSystem : RationalNumberSystem) : EffectiveCauchyReal rationalSystem :=
  Quotient.mk _ (one rationalSystem)

Predicate logic (unfolded):

  noncomputable def quotient_one (rationalSystem : RationalNumberSystem) : EffectiveCauchyReal rationalSystem :=
  Quotient.mk _ (one rationalSystem) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def quotient_one (rationalSystem : RationalNumberSystem) : EffectiveCauchyReal rationalSystem :=
  Quotient.mk _ (one rationalSystem)
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
noncomputable def quotient_one (rationalSystem : RationalNumberSystem) : EffectiveCauchyReal rationalSystem :=
  Quotient.mk _ (one rationalSystem)

noncomputable instance CarrierAdd (rationalSystem : RationalNumberSystem) :
    Add (EffectiveCauchyReal rationalSystem) := ⟨quotient_addition rationalSystem⟩

noncomputable instance CarrierMul (rationalSystem : RationalNumberSystem) :
    Mul (EffectiveCauchyReal rationalSystem) := ⟨quotient_multiplication rationalSystem⟩

noncomputable instance CarrierNeg (rationalSystem : RationalNumberSystem) :
    Neg (EffectiveCauchyReal rationalSystem) := ⟨quotient_negation rationalSystem⟩

noncomputable instance CarrierZero (rationalSystem : RationalNumberSystem) :
    OfNat (EffectiveCauchyReal rationalSystem) 0 := ⟨quotient_zero rationalSystem⟩

noncomputable instance CarrierOne (rationalSystem : RationalNumberSystem) :
    OfNat (EffectiveCauchyReal rationalSystem) 1 := ⟨quotient_one rationalSystem⟩

noncomputable instance CarrierLT (rationalSystem : RationalNumberSystem) :
    LT (EffectiveCauchyReal rationalSystem) := ⟨quotient_strict_order rationalSystem⟩

noncomputable instance CarrierLE (rationalSystem : RationalNumberSystem) :
    LE (EffectiveCauchyReal rationalSystem) := ⟨quotient_nonstrict_order rationalSystem⟩

/--
`reciprocal_exists_uniquely` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), ∃ reciprocal ∈ EffectiveCauchyReal rationalSystem, value * reciprocal = 1 ∈ EffectiveCauchyReal rationalSystem ∧ ∀ other, value * other = 1 ∈ EffectiveCauchyReal rationalSystem → other = reciprocal

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (value : Quot (LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem).1), (value = LRA.NumberSystems.RealNumbers.EffectiveCauchy.CarrierZero rationalSystem.1 → False) → Exists fun reciprocal => (instHMul.1 value reciprocal = LRA.NumberSystems.RealNumbers.EffectiveCauchy.CarrierOne rationalSystem.1 ∧ ∀ (other : Quot (LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem).1), instHMul.1 value other = LRA.NumberSystems.RealNumbers.EffectiveCauchy.CarrierOne rationalSystem.1 → other = reciprocal)

Logical form (Lean):

```lean
theorem reciprocal_exists_uniquely
    (rationalSystem : RationalNumberSystem)
    (value : EffectiveCauchyReal rationalSystem)
    (value_nonzero : value ≠ (0 : EffectiveCauchyReal rationalSystem)) :
    ∃ reciprocal : EffectiveCauchyReal rationalSystem,
      value * reciprocal = (1 : EffectiveCauchyReal rationalSystem) ∧
      ∀ other, value * other = (1 : EffectiveCauchyReal rationalSystem) → other = reciprocal
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
    (rationalSystem : RationalNumberSystem)
    (value : EffectiveCauchyReal rationalSystem)
    (value_nonzero : value ≠ (0 : EffectiveCauchyReal rationalSystem)) :
    ∃ reciprocal : EffectiveCauchyReal rationalSystem,
      value * reciprocal = (1 : EffectiveCauchyReal rationalSystem) ∧
      ∀ other, value * other = (1 : EffectiveCauchyReal rationalSystem) → other = reciprocal := by
  sorry

/--
`inverse` TODO

Predicate logic:

  noncomputable def inverse
    (rationalSystem : RationalNumberSystem)
    (value : EffectiveCauchyReal rationalSystem)
    (value_nonzero : value ≠ (0 : EffectiveCauchyReal rationalSystem)) :
    EffectiveCauchyReal rationalSystem :=
  Classical.choose (reciprocal_exists_uniquely rationalSystem value value_nonzero)

Predicate logic (unfolded):

  noncomputable def inverse
    (rationalSystem : RationalNumberSystem)
    (value : EffectiveCauchyReal rationalSystem)
    (value_nonzero : value ≠ (0 : EffectiveCauchyReal rationalSystem)) :
    EffectiveCauchyReal rationalSystem :=
  Classical.choose (reciprocal_exists_uniquely rationalSystem value value_nonzero) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def inverse
    (rationalSystem : RationalNumberSystem)
    (value : EffectiveCauchyReal rationalSystem)
    (value_nonzero : value ≠ (0 : EffectiveCauchyReal rationalSystem)) :
    EffectiveCauchyReal rationalSystem :=
  Classical.choose (reciprocal_exists_uniquely rationalSystem value value_nonzero)
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
    (rationalSystem : RationalNumberSystem)
    (value : EffectiveCauchyReal rationalSystem)
    (value_nonzero : value ≠ (0 : EffectiveCauchyReal rationalSystem)) :
    EffectiveCauchyReal rationalSystem :=
  Classical.choose (reciprocal_exists_uniquely rationalSystem value value_nonzero)

open Classical in

/--
`totalInverse` TODO

Predicate logic:

  noncomputable def totalInverse
    (rationalSystem : RationalNumberSystem)
    (value : EffectiveCauchyReal rationalSystem) : EffectiveCauchyReal rationalSystem :=
  if value_nonzero : value ≠ (0 : EffectiveCauchyReal rationalSystem)
  then inverse rationalSystem value value_nonzero
  else (0 : EffectiveCauchyReal rationalSystem)

Predicate logic (unfolded):

  noncomputable def totalInverse
    (rationalSystem : RationalNumberSystem)
    (value : EffectiveCauchyReal rationalSystem) : EffectiveCauchyReal rationalSystem :=
  if value_nonzero : value ≠ (0 : EffectiveCauchyReal rationalSystem)
  then inverse rationalSystem value value_nonzero
  else (0 : EffectiveCauchyReal rationalSystem) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def totalInverse
    (rationalSystem : RationalNumberSystem)
    (value : EffectiveCauchyReal rationalSystem) : EffectiveCauchyReal rationalSystem :=
  if value_nonzero : value ≠ (0 : EffectiveCauchyReal rationalSystem)
  then inverse rationalSystem value value_nonzero
  else (0 : EffectiveCauchyReal rationalSystem)
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
    (rationalSystem : RationalNumberSystem)
    (value : EffectiveCauchyReal rationalSystem) : EffectiveCauchyReal rationalSystem :=
  if value_nonzero : value ≠ (0 : EffectiveCauchyReal rationalSystem)
  then inverse rationalSystem value value_nonzero
  else (0 : EffectiveCauchyReal rationalSystem)

noncomputable instance CarrierInv (rationalSystem : RationalNumberSystem) :
    Inv (EffectiveCauchyReal rationalSystem) := ⟨totalInverse rationalSystem⟩

/--
`carrier_field_cert` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), OrderedFieldLaws (EffectiveCauchyReal rationalSystem)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem), LRA.AlgebraicStructures.OrderedFieldLaws (Quot (LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem).1)

Logical form (Lean):

```lean
theorem carrier_field_cert
    (rationalSystem : RationalNumberSystem) :
    OrderedFieldLaws (EffectiveCauchyReal rationalSystem)
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
    (rationalSystem : RationalNumberSystem) :
    OrderedFieldLaws (EffectiveCauchyReal rationalSystem) := by
  sorry

/--
`carrier_strict_order_cert` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), StrictOrderCompatibilityLaw (EffectiveCauchyReal rationalSystem)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem), LRA.Order.StrictOrderCompatibilityLaw (Quot (LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem).1)

Logical form (Lean):

```lean
theorem carrier_strict_order_cert
    (rationalSystem : RationalNumberSystem) :
    StrictOrderCompatibilityLaw (EffectiveCauchyReal rationalSystem)
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
    (rationalSystem : RationalNumberSystem) :
    StrictOrderCompatibilityLaw (EffectiveCauchyReal rationalSystem) := by
  sorry

/--
`carrier_dense_order_cert` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), DenseOrderLaw (EffectiveCauchyReal rationalSystem)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem), LRA.Order.DenseOrderLaw (Quot (LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem).1)

Logical form (Lean):

```lean
theorem carrier_dense_order_cert
    (rationalSystem : RationalNumberSystem) :
    DenseOrderLaw (EffectiveCauchyReal rationalSystem)
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
    (rationalSystem : RationalNumberSystem) :
    DenseOrderLaw (EffectiveCauchyReal rationalSystem) := by
  sorry

/--
`carrier_completeness_cert` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), OrderCompletenessLaws (EffectiveCauchyReal rationalSystem) (Set (EffectiveCauchyReal rationalSystem))

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem), LRA.Order.OrderCompletenessLaws (Quot (LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem).1) (Quot (LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem).1 → Prop)

Logical form (Lean):

```lean
theorem carrier_completeness_cert
    (rationalSystem : RationalNumberSystem) :
    OrderCompletenessLaws (EffectiveCauchyReal rationalSystem)
      (Set (EffectiveCauchyReal rationalSystem))
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
    (rationalSystem : RationalNumberSystem) :
    OrderCompletenessLaws (EffectiveCauchyReal rationalSystem)
      (Set (EffectiveCauchyReal rationalSystem)) := by
  sorry

/--
`EffectiveCauchyRealizesDenselyOrderedFieldModel` TODO

Predicate logic:

  noncomputable def EffectiveCauchyRealizesDenselyOrderedFieldModel
    (rationalSystem : RationalNumberSystem) :
    LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel where
  Carrier

Predicate logic (unfolded):

  noncomputable def EffectiveCauchyRealizesDenselyOrderedFieldModel
    (rationalSystem : RationalNumberSystem) :
    LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel where
  Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def EffectiveCauchyRealizesDenselyOrderedFieldModel
    (rationalSystem : RationalNumberSystem) :
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
noncomputable def EffectiveCauchyRealizesDenselyOrderedFieldModel
    (rationalSystem : RationalNumberSystem) :
    LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel where
  Carrier := EffectiveCauchyReal rationalSystem
  addInst := CarrierAdd rationalSystem
  mulInst := CarrierMul rationalSystem
  negInst := CarrierNeg rationalSystem
  invInst := CarrierInv rationalSystem
  zeroInst := CarrierZero rationalSystem
  oneInst := CarrierOne rationalSystem
  ltInst := CarrierLT rationalSystem
  leInst := CarrierLE rationalSystem
  fieldCert := carrier_field_cert rationalSystem
  strictCert := carrier_strict_order_cert rationalSystem
  denseCert := carrier_dense_order_cert rationalSystem

/--
`EffectiveCauchyRealizesRealModel` TODO

Predicate logic:

  noncomputable def EffectiveCauchyRealizesRealModel
    (rationalSystem : RationalNumberSystem) :
    LRA.NumberSystems.Interface.ModelTheory.RealModel where
  Carrier

Predicate logic (unfolded):

  noncomputable def EffectiveCauchyRealizesRealModel
    (rationalSystem : RationalNumberSystem) :
    LRA.NumberSystems.Interface.ModelTheory.RealModel where
  Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def EffectiveCauchyRealizesRealModel
    (rationalSystem : RationalNumberSystem) :
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
noncomputable def EffectiveCauchyRealizesRealModel
    (rationalSystem : RationalNumberSystem) :
    LRA.NumberSystems.Interface.ModelTheory.RealModel where
  Carrier := EffectiveCauchyReal rationalSystem
  addInst := CarrierAdd rationalSystem
  mulInst := CarrierMul rationalSystem
  negInst := CarrierNeg rationalSystem
  invInst := CarrierInv rationalSystem
  zeroInst := CarrierZero rationalSystem
  oneInst := CarrierOne rationalSystem
  ltInst := CarrierLT rationalSystem
  leInst := CarrierLE rationalSystem
  fieldCert := carrier_field_cert rationalSystem
  strictCert := carrier_strict_order_cert rationalSystem
  denseCert := carrier_dense_order_cert rationalSystem
  completeCert := carrier_completeness_cert rationalSystem

end LRA.NumberSystems.RealNumbers.EffectiveCauchy
