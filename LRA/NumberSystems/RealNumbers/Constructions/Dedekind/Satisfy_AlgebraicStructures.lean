import LRA.AlgebraicStructures
import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.Instances

namespace LRA.NumberSystems.RealNumbers.Dedekind

open LRA.AlgebraicStructures

/--
`satisfiesField` The Dedekind-cut construction canonically realizes field structure.

Predicate logic:

  ∀ (rationalModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), LRA.AlgebraicStructures.FieldLaws (LRA.NumberSystems.RealNumbers.Dedekind.Cut rationalModel)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    rationalModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel
  Prove
    LRA.AlgebraicStructures.FieldLaws (Subtype fun lower_set => (Exists fun value => lower_set value ∧ ((Exists fun value => lower_set value → False) ∧ ((∀ (upper lower : rationalModel.signature.toCarrierBundle.1), lower_set upper → rationalModel.signature.toOrderedRingSignature.2 lower upper → lower_set lower) ∧ (∀ (value : rationalModel.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rationalModel.signature.toOrderedRingSignature.2 value greater))))))

Logical form (Lean):

```lean
theorem satisfiesField
    (rationalModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) :
    FieldLaws (Cut rationalModel)
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
theorem satisfiesField
    (rationalModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) :
    FieldLaws (Cut rationalModel) := by
  sorry
/--
`satisfiesOrderedField` The Dedekind-cut construction canonically realizes ordered field structure.

Predicate logic:

  ∀ (rationalModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), LRA.AlgebraicStructures.OrderedFieldLaws (LRA.NumberSystems.RealNumbers.Dedekind.Cut rationalModel)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    rationalModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel
  Prove
    LRA.AlgebraicStructures.OrderedFieldLaws (Subtype fun lower_set => (Exists fun value => lower_set value ∧ ((Exists fun value => lower_set value → False) ∧ ((∀ (upper lower : rationalModel.signature.toCarrierBundle.1), lower_set upper → rationalModel.signature.toOrderedRingSignature.2 lower upper → lower_set lower) ∧ (∀ (value : rationalModel.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rationalModel.signature.toOrderedRingSignature.2 value greater))))))

Logical form (Lean):

```lean
theorem satisfiesOrderedField
    (rationalModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) :
    OrderedFieldLaws (Cut rationalModel)
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
theorem satisfiesOrderedField
    (rationalModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) :
    OrderedFieldLaws (Cut rationalModel) := by
  sorry
/--
`satisfiesCompleteOrderedField` The Dedekind-cut construction canonically realizes complete ordered field structure.

Predicate logic:

  ∀ (rationalModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), LRA.AlgebraicStructures.CompleteOrderedFieldLaws (LRA.NumberSystems.RealNumbers.Dedekind.Cut rationalModel) (Set (LRA.NumberSystems.RealNumbers.Dedekind.Cut rationalModel))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    rationalModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel
  Prove
    ((LRA.AlgebraicStructures.OrderedFieldLaws (Subtype fun lower_set => (Exists fun value => lower_set value ∧ ((Exists fun value => lower_set value → False) ∧ ((∀ (upper lower : rationalModel.signature.toCarrierBundle.1), lower_set upper → rationalModel.signature.toOrderedRingSignature.2 lower upper → lower_set lower) ∧ (∀ (value : rationalModel.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rationalModel.signature.toOrderedRingSignature.2 value greater))))))) ∧ (LRA.Order.OrderCompletenessLaws (Subtype fun lower_set => (Exists fun value => lower_set value ∧ ((Exists fun value => lower_set value → False) ∧ ((∀ (upper lower : rationalModel.signature.toCarrierBundle.1), lower_set upper → rationalModel.signature.toOrderedRingSignature.2 lower upper → lower_set lower) ∧ (∀ (value : rationalModel.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rationalModel.signature.toOrderedRingSignature.2 value greater)))))) ((Subtype fun lower_set => (Exists fun value => lower_set value ∧ ((Exists fun value => lower_set value → False) ∧ ((∀ (upper lower : rationalModel.signature.toCarrierBundle.1), lower_set upper → rationalModel.signature.toOrderedRingSignature.2 lower upper → lower_set lower) ∧ (∀ (value : rationalModel.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rationalModel.signature.toOrderedRingSignature.2 value greater)))))) → Prop)))

Logical form (Lean):

```lean
theorem satisfiesCompleteOrderedField
    (rationalModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) :
    CompleteOrderedFieldLaws (Cut rationalModel) (Set (Cut rationalModel))
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
theorem satisfiesCompleteOrderedField
    (rationalModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) :
    CompleteOrderedFieldLaws (Cut rationalModel) (Set (Cut rationalModel)) := by
  sorry
end LRA.NumberSystems.RealNumbers.Dedekind
