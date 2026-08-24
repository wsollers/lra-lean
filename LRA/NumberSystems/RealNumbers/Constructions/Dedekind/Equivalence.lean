
import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.Carrier

namespace LRA.NumberSystems.RealNumbers.Dedekind
open LRA.NumberSystems.Interface.ModelTheory

variable (rational_model : DenselyOrderedFieldModel)

/--
`nonstrict_order` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (first second : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model) (value : LRA.NumberSystems.RealNumbers.Dedekind.Rational rational_model), LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model first value → LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model second value

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))) (value : rational_model.signature.toCarrierBundle.1), first.1 value → second.1 value

Logical form (Lean):

```lean
def nonstrict_order (first second : Cut rational_model) : Prop :=
  ∀ value,
    contains rational_model first value →
    contains rational_model second value
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
def nonstrict_order (first second : Cut rational_model) : Prop :=
  ∀ value,
    contains rational_model first value →
    contains rational_model second value

/--
`strict_order` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (first second : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), (LRA.NumberSystems.RealNumbers.Dedekind.nonstrict_order rational_model first second ∧ Ne first second)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (∀ (value : rational_model.signature.toCarrierBundle.1), first.1 value → second.1 value ∧ first = second → False)

Logical form (Lean):

```lean
def strict_order (first second : Cut rational_model) : Prop :=
  nonstrict_order rational_model first second ∧ first ≠ second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def strict_order (first second : Cut rational_model) : Prop :=
  nonstrict_order rational_model first second ∧ first ≠ second

/--
`StrictTotalOrder` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel), (∀ (cut : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), ¬ LRA.NumberSystems.RealNumbers.Dedekind.strict_order rational_model cut cut ∧ (∀ (first second third : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.strict_order rational_model first second → LRA.NumberSystems.RealNumbers.Dedekind.strict_order rational_model second third → LRA.NumberSystems.RealNumbers.Dedekind.strict_order rational_model first third ∧ ∀ (first second : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), Ne first second → Or (LRA.NumberSystems.RealNumbers.Dedekind.strict_order rational_model first second) (LRA.NumberSystems.RealNumbers.Dedekind.strict_order rational_model second first)))

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel), (∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (∀ (value : rational_model.signature.toCarrierBundle.1), cut.1 value → cut.1 value ∧ cut = cut → False) → False ∧ (∀ (first second third : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (∀ (value : rational_model.signature.toCarrierBundle.1), first.1 value → second.1 value ∧ first = second → False) → (∀ (value : rational_model.signature.toCarrierBundle.1), second.1 value → third.1 value ∧ second = third → False) → (∀ (value : rational_model.signature.toCarrierBundle.1), first.1 value → third.1 value ∧ first = third → False) ∧ ∀ (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (first = second → False) → Or ((∀ (value : rational_model.signature.toCarrierBundle.1), first.1 value → second.1 value ∧ first = second → False)) ((∀ (value : rational_model.signature.toCarrierBundle.1), second.1 value → first.1 value ∧ second = first → False))))

Logical form (Lean):

```lean
def StrictTotalOrder : Prop :=
  (∀ cut : Cut rational_model, ¬ strict_order rational_model cut cut) ∧
  (∀ first second third : Cut rational_model,
    strict_order rational_model first second →
    strict_order rational_model second third →
    strict_order rational_model first third) ∧
  (∀ first second : Cut rational_model,
    first ≠ second →
    strict_order rational_model first second ∨
    strict_order rational_model second first)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, Or.inl, Or.inr, unfold

-/
def StrictTotalOrder : Prop :=
  (∀ cut : Cut rational_model, ¬ strict_order rational_model cut cut) ∧
  (∀ first second third : Cut rational_model,
    strict_order rational_model first second →
    strict_order rational_model second third →
    strict_order rational_model first third) ∧
  (∀ first second : Cut rational_model,
    first ≠ second →
    strict_order rational_model first second ∨
    strict_order rational_model second first)

/--
`strict_total_order` TODO

Predicate logic:

  StrictTotalOrder rational_model

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel), (∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (∀ (value : rational_model.signature.toCarrierBundle.1), cut.1 value → cut.1 value ∧ cut = cut → False) → False ∧ (∀ (first second third : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (∀ (value : rational_model.signature.toCarrierBundle.1), first.1 value → second.1 value ∧ first = second → False) → (∀ (value : rational_model.signature.toCarrierBundle.1), second.1 value → third.1 value ∧ second = third → False) → (∀ (value : rational_model.signature.toCarrierBundle.1), first.1 value → third.1 value ∧ first = third → False) ∧ ∀ (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (first = second → False) → Or ((∀ (value : rational_model.signature.toCarrierBundle.1), first.1 value → second.1 value ∧ first = second → False)) ((∀ (value : rational_model.signature.toCarrierBundle.1), second.1 value → first.1 value ∧ second = first → False))))

Logical form (Lean):

```lean
theorem strict_total_order : StrictTotalOrder rational_model
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
theorem strict_total_order : StrictTotalOrder rational_model := by
  sorry

end LRA.NumberSystems.RealNumbers.Dedekind
