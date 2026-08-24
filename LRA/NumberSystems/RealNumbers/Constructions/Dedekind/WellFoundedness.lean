
import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.Equivalence

namespace LRA.NumberSystems.RealNumbers.Dedekind
open LRA.NumberSystems.Interface.ModelTheory

variable (rational_model : DenselyOrderedFieldModel)

/--
`InductionOnCuts` TODO

Predicate logic:

  (Cut rational_model → Prop ∧ ∀ lower_set ∈ RationalSet rational_model isCut ∈ IsCut rational_model lower_set, motive ⟨lower_set, isCut⟩) → ∀ cut : Cut rational_model, motive cut

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (motive : (Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))) → Prop), (∀ (lower_set : rational_model.signature.toCarrierBundle.1 → Prop) (isCut : (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), motive ⟨lower_set, isCut⟩) → ∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), motive cut

Logical form (Lean):

```lean
theorem InductionOnCuts
    (motive : Cut rational_model → Prop)
    (onLowerSet :
      ∀ (lower_set : RationalSet rational_model) (isCut : IsCut rational_model lower_set),
        motive ⟨lower_set, isCut⟩) :
    ∀ cut : Cut rational_model, motive cut
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
theorem InductionOnCuts
    (motive : Cut rational_model → Prop)
    (onLowerSet :
      ∀ (lower_set : RationalSet rational_model) (isCut : IsCut rational_model lower_set),
        motive ⟨lower_set, isCut⟩) :
    ∀ cut : Cut rational_model, motive cut := by
  sorry

end LRA.NumberSystems.RealNumbers.Dedekind
