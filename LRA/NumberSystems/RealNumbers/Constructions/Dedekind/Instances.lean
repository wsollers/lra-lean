
import LRA.AlgebraicStructures
import LRA.NumberSystems.RationalNumbers.Interface.Definition
import LRA.NumberSystems.RealNumbers.Interface.Definition
import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.Behavior

namespace LRA.NumberSystems.RealNumbers.Dedekind

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers
open LRA.AlgebraicStructures
open LRA.Order

/-!
Unlike `Cauchy`, `Cut` is a subtype refinement (`{lower_set // IsCut
lower_set}`), not a quotient — `addition`/`negation`/`multiplication`/
`zero`/`one`/`strict_order`/`nonstrict_order` (`WellDefinedness.lean`,
`Equivalence.lean`) are already total functions directly on `Cut`, with
no separate raw/promoted split and no equivalence-respecting step to
prove. So none of `Operation.Laws.QuotientCompatible`'s machinery is
needed here — these become typeclass instances directly. `inverse`,
unlike the others, is partial (`cut ≠ zero rational_model` required); it
is total-ized below the standard way, `0⁻¹ := 0`.
-/

open Classical in

/--
`totalInverse` TODO

Predicate logic:

  noncomputable def totalInverse
    (rational_model : DenselyOrderedFieldModel)
    (cut : Cut rational_model) : Cut rational_model :=
  if cut_nonzero : cut ≠ zero rational_model
  then inverse rational_model cut cut_nonzero
  else zero rational_model

Predicate logic (unfolded):

  noncomputable def totalInverse
    (rational_model : DenselyOrderedFieldModel)
    (cut : Cut rational_model) : Cut rational_model :=
  if cut_nonzero : cut ≠ zero rational_model
  then inverse rational_model cut cut_nonzero
  else zero rational_model (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def totalInverse
    (rational_model : DenselyOrderedFieldModel)
    (cut : Cut rational_model) : Cut rational_model :=
  if cut_nonzero : cut ≠ zero rational_model
  then inverse rational_model cut cut_nonzero
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
    (rational_model : DenselyOrderedFieldModel)
    (cut : Cut rational_model) : Cut rational_model :=
  if cut_nonzero : cut ≠ zero rational_model
  then inverse rational_model cut cut_nonzero
  else zero rational_model

noncomputable instance CutAdd (rational_model : DenselyOrderedFieldModel) :
    Add (Cut rational_model) := ⟨addition rational_model⟩

noncomputable instance CutMul (rational_model : DenselyOrderedFieldModel) :
    Mul (Cut rational_model) := ⟨multiplication rational_model⟩

noncomputable instance CutNeg (rational_model : DenselyOrderedFieldModel) :
    Neg (Cut rational_model) := ⟨negation rational_model⟩

noncomputable instance CutInv (rational_model : DenselyOrderedFieldModel) :
    Inv (Cut rational_model) := ⟨totalInverse rational_model⟩

noncomputable instance CutZero (rational_model : DenselyOrderedFieldModel) :
    OfNat (Cut rational_model) 0 := ⟨zero rational_model⟩

noncomputable instance CutOne (rational_model : DenselyOrderedFieldModel) :
    OfNat (Cut rational_model) 1 := ⟨one rational_model⟩

noncomputable instance CutLT (rational_model : DenselyOrderedFieldModel) :
    LT (Cut rational_model) := ⟨strict_order rational_model⟩

noncomputable instance CutLE (rational_model : DenselyOrderedFieldModel) :
    LE (Cut rational_model) := ⟨nonstrict_order rational_model⟩

/--
`cut_field_cert` TODO

Predicate logic:

  (∀ rational_model ∈ DenselyOrderedFieldModel), OrderedFieldLaws (Cut rational_model)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel), LRA.AlgebraicStructures.OrderedFieldLaws (Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater)))))

Logical form (Lean):

```lean
theorem cut_field_cert
    (rational_model : DenselyOrderedFieldModel) :
    OrderedFieldLaws (Cut rational_model)
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
theorem cut_field_cert
    (rational_model : DenselyOrderedFieldModel) :
    OrderedFieldLaws (Cut rational_model) := by
  sorry

/--
`cut_strict_order_cert` TODO

Predicate logic:

  (∀ rational_model ∈ DenselyOrderedFieldModel), StrictOrderCompatibilityLaw (Cut rational_model)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel), LRA.Order.StrictOrderCompatibilityLaw (Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater)))))

Logical form (Lean):

```lean
theorem cut_strict_order_cert
    (rational_model : DenselyOrderedFieldModel) :
    StrictOrderCompatibilityLaw (Cut rational_model)
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
theorem cut_strict_order_cert
    (rational_model : DenselyOrderedFieldModel) :
    StrictOrderCompatibilityLaw (Cut rational_model) := by
  sorry

/--
`cut_dense_order_cert` TODO

Predicate logic:

  (∀ rational_model ∈ DenselyOrderedFieldModel), DenseOrderLaw (Cut rational_model)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel), LRA.Order.DenseOrderLaw (Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater)))))

Logical form (Lean):

```lean
theorem cut_dense_order_cert
    (rational_model : DenselyOrderedFieldModel) :
    DenseOrderLaw (Cut rational_model)
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
theorem cut_dense_order_cert
    (rational_model : DenselyOrderedFieldModel) :
    DenseOrderLaw (Cut rational_model) := by
  sorry

/--
`cut_completeness_cert` TODO

Predicate logic:

  (∀ rational_model ∈ DenselyOrderedFieldModel), OrderCompletenessLaws (Cut rational_model) (Set (Cut rational_model))

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel), LRA.Order.OrderCompletenessLaws (Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))) ((Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))) → Prop)

Logical form (Lean):

```lean
theorem cut_completeness_cert
    (rational_model : DenselyOrderedFieldModel) :
    OrderCompletenessLaws (Cut rational_model) (Set (Cut rational_model))
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
theorem cut_completeness_cert
    (rational_model : DenselyOrderedFieldModel) :
    OrderCompletenessLaws (Cut rational_model) (Set (Cut rational_model)) := by
  sorry

/--
`DedekindRealizesDenselyOrderedFieldModel` TODO

Predicate logic:

  noncomputable def DedekindRealizesDenselyOrderedFieldModel
    (rational_model : DenselyOrderedFieldModel) :
    LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel where
  Carrier

Predicate logic (unfolded):

  noncomputable def DedekindRealizesDenselyOrderedFieldModel
    (rational_model : DenselyOrderedFieldModel) :
    LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel where
  Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def DedekindRealizesDenselyOrderedFieldModel
    (rational_model : DenselyOrderedFieldModel) :
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
noncomputable def DedekindRealizesDenselyOrderedFieldModel
    (rational_model : DenselyOrderedFieldModel) :
    LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel where
  Carrier := Cut rational_model
  addInst := CutAdd rational_model
  mulInst := CutMul rational_model
  negInst := CutNeg rational_model
  invInst := CutInv rational_model
  zeroInst := CutZero rational_model
  oneInst := CutOne rational_model
  ltInst := CutLT rational_model
  leInst := CutLE rational_model
  fieldCert := cut_field_cert rational_model
  strictCert := cut_strict_order_cert rational_model
  denseCert := cut_dense_order_cert rational_model

/--
`DedekindRealizesRealModel` TODO

Predicate logic:

  noncomputable def DedekindRealizesRealModel
    (rational_model : DenselyOrderedFieldModel) :
    LRA.NumberSystems.Interface.ModelTheory.RealModel where
  Carrier

Predicate logic (unfolded):

  noncomputable def DedekindRealizesRealModel
    (rational_model : DenselyOrderedFieldModel) :
    LRA.NumberSystems.Interface.ModelTheory.RealModel where
  Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def DedekindRealizesRealModel
    (rational_model : DenselyOrderedFieldModel) :
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
noncomputable def DedekindRealizesRealModel
    (rational_model : DenselyOrderedFieldModel) :
    LRA.NumberSystems.Interface.ModelTheory.RealModel where
  Carrier := Cut rational_model
  addInst := CutAdd rational_model
  mulInst := CutMul rational_model
  negInst := CutNeg rational_model
  invInst := CutInv rational_model
  zeroInst := CutZero rational_model
  oneInst := CutOne rational_model
  ltInst := CutLT rational_model
  leInst := CutLE rational_model
  fieldCert := cut_field_cert rational_model
  strictCert := cut_strict_order_cert rational_model
  denseCert := cut_dense_order_cert rational_model
  completeCert := cut_completeness_cert rational_model

/--
`DedekindRealizesRationalRealExtension` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), ∃ realExtension ∈ LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem, realExtension.RealModel.Carrier = Cut rationalSystem.FieldModel

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem), Exists fun realExtension => realExtension.RealModel.toDenselyOrderedFieldModel.1 = Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rationalSystem.FieldModel.signature.toCarrierBundle.1), lower_set upper → rationalSystem.FieldModel.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rationalSystem.FieldModel.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rationalSystem.FieldModel.signature.toOrderedRingSignature.2 value greater))))

Logical form (Lean):

```lean
theorem DedekindRealizesRationalRealExtension
    (rationalSystem : RationalNumberSystem) :
    ∃ realExtension :
        LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem,
      realExtension.RealModel.Carrier = Cut rationalSystem.FieldModel
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
theorem DedekindRealizesRationalRealExtension
    (rationalSystem : RationalNumberSystem) :
    ∃ realExtension :
        LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem,
      realExtension.RealModel.Carrier = Cut rationalSystem.FieldModel := by
  sorry

end LRA.NumberSystems.RealNumbers.Dedekind
