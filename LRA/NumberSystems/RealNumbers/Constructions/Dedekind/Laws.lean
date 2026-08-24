
import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.WellDefinedness

namespace LRA.NumberSystems.RealNumbers.Dedekind
open LRA.NumberSystems.Interface.ModelTheory

variable (rational_model : DenselyOrderedFieldModel)

/--
`AdditiveGroupStructure` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel), (∀ (first second third : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model first second) third = LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second third) ∧ (∀ (first second : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model first second = LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second first ∧ (∀ (cut : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model) cut = cut ∧ LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model cut (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model) = cut) ∧ ∀ (cut : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model cut (LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model cut) = LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model ∧ LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model (LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model cut) cut = LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model))))

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel), (∀ (first second third : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), ⟨fun value => Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model first second).1 left ∧ (third.1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = ⟨fun value => Exists fun left => Exists fun right => (first.1 left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second third).1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ ∧ (∀ (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), ⟨fun value => Exists fun left => Exists fun right => (first.1 left ∧ (second.1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = ⟨fun value => Exists fun left => Exists fun right => (second.1 left ∧ (first.1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ ∧ (∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (⟨fun value => Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 left ∧ (cut.1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = cut ∧ ⟨fun value => Exists fun left => Exists fun right => (cut.1 left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = cut) ∧ ∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (⟨fun value => Exists fun left => Exists fun right => (cut.1 left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model cut).1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate rational_model.signature.toZeroOneBundle.2, ⋯⟩ ∧ ⟨fun value => Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model cut).1 left ∧ (cut.1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate rational_model.signature.toZeroOneBundle.2, ⋯⟩))))

Logical form (Lean):

```lean
def AdditiveGroupStructure : Prop :=
  (∀ first second third : Cut rational_model,
    addition rational_model (addition rational_model first second) third =
      addition rational_model first (addition rational_model second third)) ∧
  (∀ first second : Cut rational_model,
    addition rational_model first second = addition rational_model second first) ∧
  (∀ cut : Cut rational_model,
    addition rational_model (zero rational_model) cut = cut ∧
    addition rational_model cut (zero rational_model) = cut) ∧
  (∀ cut : Cut rational_model,
    addition rational_model cut (negation rational_model cut) = zero rational_model ∧
    addition rational_model (negation rational_model cut) cut = zero rational_model)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def AdditiveGroupStructure : Prop :=
  (∀ first second third : Cut rational_model,
    addition rational_model (addition rational_model first second) third =
      addition rational_model first (addition rational_model second third)) ∧
  (∀ first second : Cut rational_model,
    addition rational_model first second = addition rational_model second first) ∧
  (∀ cut : Cut rational_model,
    addition rational_model (zero rational_model) cut = cut ∧
    addition rational_model cut (zero rational_model) = cut) ∧
  (∀ cut : Cut rational_model,
    addition rational_model cut (negation rational_model cut) = zero rational_model ∧
    addition rational_model (negation rational_model cut) cut = zero rational_model)

/--
`additive_group_structure` TODO

Predicate logic:

  AdditiveGroupStructure rational_model

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel), (∀ (first second third : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), ⟨fun value => Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model first second).1 left ∧ (third.1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = ⟨fun value => Exists fun left => Exists fun right => (first.1 left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second third).1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ ∧ (∀ (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), ⟨fun value => Exists fun left => Exists fun right => (first.1 left ∧ (second.1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = ⟨fun value => Exists fun left => Exists fun right => (second.1 left ∧ (first.1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ ∧ (∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (⟨fun value => Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 left ∧ (cut.1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = cut ∧ ⟨fun value => Exists fun left => Exists fun right => (cut.1 left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = cut) ∧ ∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (⟨fun value => Exists fun left => Exists fun right => (cut.1 left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model cut).1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate rational_model.signature.toZeroOneBundle.2, ⋯⟩ ∧ ⟨fun value => Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model cut).1 left ∧ (cut.1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate rational_model.signature.toZeroOneBundle.2, ⋯⟩))))

Logical form (Lean):

```lean
theorem additive_group_structure : AdditiveGroupStructure rational_model
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
theorem additive_group_structure : AdditiveGroupStructure rational_model := by
  sorry

/--
`MultiplicativeAndDistributiveLaws` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel), (∀ (first second third : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second) third = LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model second third) ∧ (∀ (first second : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second = LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model second first ∧ (∀ (cut : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) cut = cut ∧ LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model cut (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) = cut) ∧ ∀ (first second third : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second third) = LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second) (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first third))))

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel), (∀ (first second third : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second) third x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second) third other → other = x)) ⋯ = .1 (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model second third) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model second third) other → other = x)) ⋯).1 ∧ (∀ (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first second x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first second other → other = x)) ⋯ = .1 (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model second first x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model second first other → other = x)) ⋯).1 ∧ (∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) cut x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) cut other → other = x)) ⋯ = .1 cut ∧ Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) other → other = x)) ⋯ = .1 cut) ∧ ∀ (first second third : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second third) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second third) other → other = x)) ⋯ = .1 ⟨fun value => Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second).1 left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first third).1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩)))

Logical form (Lean):

```lean
def MultiplicativeAndDistributiveLaws : Prop :=
  (∀ first second third : Cut rational_model,
    multiplication rational_model (multiplication rational_model first second) third =
      multiplication rational_model first (multiplication rational_model second third)) ∧
  (∀ first second : Cut rational_model,
    multiplication rational_model first second = multiplication rational_model second first) ∧
  (∀ cut : Cut rational_model,
    multiplication rational_model (one rational_model) cut = cut ∧
    multiplication rational_model cut (one rational_model) = cut) ∧
  (∀ first second third : Cut rational_model,
    multiplication rational_model first (addition rational_model second third) =
      addition rational_model
        (multiplication rational_model first second)
        (multiplication rational_model first third))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def MultiplicativeAndDistributiveLaws : Prop :=
  (∀ first second third : Cut rational_model,
    multiplication rational_model (multiplication rational_model first second) third =
      multiplication rational_model first (multiplication rational_model second third)) ∧
  (∀ first second : Cut rational_model,
    multiplication rational_model first second = multiplication rational_model second first) ∧
  (∀ cut : Cut rational_model,
    multiplication rational_model (one rational_model) cut = cut ∧
    multiplication rational_model cut (one rational_model) = cut) ∧
  (∀ first second third : Cut rational_model,
    multiplication rational_model first (addition rational_model second third) =
      addition rational_model
        (multiplication rational_model first second)
        (multiplication rational_model first third))

/--
`multiplicative_and_distributive_laws` TODO

Predicate logic:

  MultiplicativeAndDistributiveLaws rational_model

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel), (∀ (first second third : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second) third x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second) third other → other = x)) ⋯ = .1 (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model second third) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model second third) other → other = x)) ⋯).1 ∧ (∀ (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first second x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first second other → other = x)) ⋯ = .1 (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model second first x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model second first other → other = x)) ⋯).1 ∧ (∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) cut x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) cut other → other = x)) ⋯ = .1 cut ∧ Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) other → other = x)) ⋯ = .1 cut) ∧ ∀ (first second third : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second third) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second third) other → other = x)) ⋯ = .1 ⟨fun value => Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second).1 left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first third).1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩)))

Logical form (Lean):

```lean
theorem multiplicative_and_distributive_laws :
    MultiplicativeAndDistributiveLaws rational_model
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
theorem multiplicative_and_distributive_laws :
    MultiplicativeAndDistributiveLaws rational_model := by
  sorry

/--
`FieldStructure` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel), (LRA.NumberSystems.RealNumbers.Dedekind.AdditiveGroupStructure rational_model ∧ (LRA.NumberSystems.RealNumbers.Dedekind.MultiplicativeAndDistributiveLaws rational_model ∧ ∀ (cut : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), Ne cut (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model) → Exists fun reciprocal => LRA.NumberSystems.RealNumbers.Dedekind.IsReciprocal rational_model cut reciprocal))

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel), ((∀ (first second third : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), ⟨fun value => Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model first second).1 left ∧ (third.1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = ⟨fun value => Exists fun left => Exists fun right => (first.1 left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second third).1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ ∧ (∀ (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), ⟨fun value => Exists fun left => Exists fun right => (first.1 left ∧ (second.1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = ⟨fun value => Exists fun left => Exists fun right => (second.1 left ∧ (first.1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ ∧ (∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (⟨fun value => Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 left ∧ (cut.1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = cut ∧ ⟨fun value => Exists fun left => Exists fun right => (cut.1 left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = cut) ∧ ∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (⟨fun value => Exists fun left => Exists fun right => (cut.1 left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model cut).1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate rational_model.signature.toZeroOneBundle.2, ⋯⟩ ∧ ⟨fun value => Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model cut).1 left ∧ (cut.1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate rational_model.signature.toZeroOneBundle.2, ⋯⟩)))) ∧ ((∀ (first second third : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second) third x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second) third other → other = x)) ⋯ = .1 (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model second third) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model second third) other → other = x)) ⋯).1 ∧ (∀ (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first second x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first second other → other = x)) ⋯ = .1 (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model second first x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model second first other → other = x)) ⋯).1 ∧ (∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) cut x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) cut other → other = x)) ⋯ = .1 cut ∧ Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) other → other = x)) ⋯ = .1 cut) ∧ ∀ (first second third : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second third) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second third) other → other = x)) ⋯ = .1 ⟨fun value => Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second).1 left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first third).1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩))) ∧ ∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (cut = ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate rational_model.signature.zero, ⋯⟩ → False) → Exists fun reciprocal => (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut reciprocal x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut reciprocal other → other = x)) ⋯ = .1 ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate rational_model.signature.toZeroOneBundle.3, ⋯⟩ ∧ Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model reciprocal cut x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model reciprocal cut other → other = x)) ⋯ = .1 ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate rational_model.signature.toZeroOneBundle.3, ⋯⟩)))

Logical form (Lean):

```lean
def FieldStructure : Prop :=
  AdditiveGroupStructure rational_model ∧
  MultiplicativeAndDistributiveLaws rational_model ∧
  (∀ cut : Cut rational_model,
    cut ≠ zero rational_model →
    ∃ reciprocal, IsReciprocal rational_model cut reciprocal)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def FieldStructure : Prop :=
  AdditiveGroupStructure rational_model ∧
  MultiplicativeAndDistributiveLaws rational_model ∧
  (∀ cut : Cut rational_model,
    cut ≠ zero rational_model →
    ∃ reciprocal, IsReciprocal rational_model cut reciprocal)

/--
`field_structure` TODO

Predicate logic:

  FieldStructure rational_model

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel), ((∀ (first second third : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), ⟨fun value => Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model first second).1 left ∧ (third.1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = ⟨fun value => Exists fun left => Exists fun right => (first.1 left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second third).1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ ∧ (∀ (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), ⟨fun value => Exists fun left => Exists fun right => (first.1 left ∧ (second.1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = ⟨fun value => Exists fun left => Exists fun right => (second.1 left ∧ (first.1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ ∧ (∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (⟨fun value => Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 left ∧ (cut.1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = cut ∧ ⟨fun value => Exists fun left => Exists fun right => (cut.1 left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = cut) ∧ ∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (⟨fun value => Exists fun left => Exists fun right => (cut.1 left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model cut).1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate rational_model.signature.zero, ⋯⟩ ∧ ⟨fun value => Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model cut).1 left ∧ (cut.1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate rational_model.signature.zero, ⋯⟩)))) ∧ ((∀ (first second third : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second) third x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second) third other → other = x)) ⋯ = .1 (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model second third) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model second third) other → other = x)) ⋯).1 ∧ (∀ (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first second x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first second other → other = x)) ⋯ = .1 (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model second first x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model second first other → other = x)) ⋯).1 ∧ (∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) cut x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) cut other → other = x)) ⋯ = .1 cut ∧ Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) other → other = x)) ⋯ = .1 cut) ∧ ∀ (first second third : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second third) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second third) other → other = x)) ⋯ = .1 ⟨fun value => Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second).1 left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first third).1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩))) ∧ ∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (cut = ⟨fun candidate => rational_model.signature.StrictOrder candidate rational_model.signature.zero, ⋯⟩ → False) → Exists fun reciprocal => (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut reciprocal x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut reciprocal other → other = x)) ⋯ = .1 ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate rational_model.signature.one, ⋯⟩ ∧ Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model reciprocal cut x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model reciprocal cut other → other = x)) ⋯ = .1 ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate rational_model.signature.one, ⋯⟩)))

Logical form (Lean):

```lean
theorem field_structure : FieldStructure rational_model
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
theorem field_structure : FieldStructure rational_model := by
  sorry

/--
`translation_invariance` TODO

Predicate logic:

  strict_order rational_model (addition rational_model first translation) (addition rational_model second translation)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (first second translation : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (∀ (value : rational_model.signature.toCarrierBundle.1), first.1 value → second.1 value ∧ first = second → False) → (∀ (value : rational_model.signature.toCarrierBundle.1), (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model first translation).1 value → (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second translation).1 value ∧ ⟨fun value => Exists fun left => Exists fun right => (first.val left ∧ (translation.val right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = ⟨fun value => Exists fun left => Exists fun right => (second.val left ∧ (translation.val right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ → False)

Logical form (Lean):

```lean
theorem translation_invariance
    (first second translation : Cut rational_model)
    (first_lt_second : strict_order rational_model first second) :
    strict_order rational_model
      (addition rational_model first translation)
      (addition rational_model second translation)
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
theorem translation_invariance
    (first second translation : Cut rational_model)
    (first_lt_second : strict_order rational_model first second) :
    strict_order rational_model
      (addition rational_model first translation)
      (addition rational_model second translation) := by
  sorry

/--
`positive_products_are_positive` TODO

Predicate logic:

  (IsPositive rational_model first ∧ IsPositive rational_model second) → IsPositive rational_model (multiplication rational_model first second)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), ((∀ (value : rational_model.signature.toCarrierBundle.1), (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 value → first.1 value ∧ ⟨LRA.NumberSystems.RealNumbers.Dedekind.rational_lower_ray rational_model rational_model.signature.zero, ⋯⟩ = first → False) ∧ (∀ (value : rational_model.signature.toCarrierBundle.1), (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 value → second.1 value ∧ ⟨LRA.NumberSystems.RealNumbers.Dedekind.rational_lower_ray rational_model rational_model.signature.zero, ⋯⟩ = second → False)) → (∀ (value : rational_model.signature.toCarrierBundle.1), (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 value → (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second).1 value ∧ ⟨LRA.NumberSystems.RealNumbers.Dedekind.rational_lower_ray rational_model rational_model.signature.zero, ⋯⟩ = Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first second x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first second other → other = x)) ⋯.val → False)

Logical form (Lean):

```lean
theorem positive_products_are_positive
    (first second : Cut rational_model)
    (first_positive : IsPositive rational_model first)
    (second_positive : IsPositive rational_model second) :
    IsPositive rational_model
      (multiplication rational_model first second)
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
theorem positive_products_are_positive
    (first second : Cut rational_model)
    (first_positive : IsPositive rational_model first)
    (second_positive : IsPositive rational_model second) :
    IsPositive rational_model
      (multiplication rational_model first second) := by
  sorry

/--
`OrderedFieldStructure` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel), (LRA.NumberSystems.RealNumbers.Dedekind.FieldStructure rational_model ∧ (LRA.NumberSystems.RealNumbers.Dedekind.StrictTotalOrder rational_model ∧ (∀ (first second translation : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.strict_order rational_model first second → LRA.NumberSystems.RealNumbers.Dedekind.strict_order rational_model (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model first translation) (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second translation) ∧ ∀ (first second : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsPositive rational_model first → LRA.NumberSystems.RealNumbers.Dedekind.IsPositive rational_model second → LRA.NumberSystems.RealNumbers.Dedekind.IsPositive rational_model (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second))))

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel), (((∀ (first second third : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), ⟨fun value => Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model first second).1 left ∧ (third.1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = ⟨fun value => Exists fun left => Exists fun right => (first.1 left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second third).1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ ∧ (∀ (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), ⟨fun value => Exists fun left => Exists fun right => (first.1 left ∧ (second.1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = ⟨fun value => Exists fun left => Exists fun right => (second.1 left ∧ (first.1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ ∧ (∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (⟨fun value => Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 left ∧ (cut.1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = cut ∧ ⟨fun value => Exists fun left => Exists fun right => (cut.1 left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = cut) ∧ ∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (⟨fun value => Exists fun left => Exists fun right => (cut.1 left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model cut).1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate rational_model.signature.zero, ⋯⟩ ∧ ⟨fun value => Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model cut).1 left ∧ (cut.1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate rational_model.signature.zero, ⋯⟩)))) ∧ ((∀ (first second third : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second) third x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second) third other → other = x)) ⋯ = .1 (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model second third) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model second third) other → other = x)) ⋯).1 ∧ (∀ (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first second x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first second other → other = x)) ⋯ = .1 (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model second first x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model second first other → other = x)) ⋯).1 ∧ (∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) cut x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) cut other → other = x)) ⋯ = .1 cut ∧ Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) other → other = x)) ⋯ = .1 cut) ∧ ∀ (first second third : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second third) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second third) other → other = x)) ⋯ = .1 ⟨fun value => Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second).1 left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first third).1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩))) ∧ ∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (cut = ⟨fun candidate => rational_model.signature.StrictOrder candidate rational_model.signature.zero, ⋯⟩ → False) → Exists fun reciprocal => (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut reciprocal x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut reciprocal other → other = x)) ⋯ = .1 ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate rational_model.signature.one, ⋯⟩ ∧ Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model reciprocal cut x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model reciprocal cut other → other = x)) ⋯ = .1 ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate rational_model.signature.one, ⋯⟩))) ∧ ((∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (∀ (value : rational_model.signature.toCarrierBundle.1), cut.1 value → cut.1 value ∧ cut = cut → False) → False ∧ (∀ (first second third : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (∀ (value : rational_model.signature.toCarrierBundle.1), first.1 value → second.1 value ∧ first = second → False) → (∀ (value : rational_model.signature.toCarrierBundle.1), second.1 value → third.1 value ∧ second = third → False) → (∀ (value : rational_model.signature.toCarrierBundle.1), first.1 value → third.1 value ∧ first = third → False) ∧ ∀ (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (first = second → False) → Or ((∀ (value : rational_model.signature.toCarrierBundle.1), first.1 value → second.1 value ∧ first = second → False)) ((∀ (value : rational_model.signature.toCarrierBundle.1), second.1 value → first.1 value ∧ second = first → False)))) ∧ (∀ (first second translation : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (∀ (value : rational_model.signature.toCarrierBundle.1), first.1 value → second.1 value ∧ first = second → False) → (∀ (value : rational_model.signature.toCarrierBundle.1), (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model first translation).1 value → (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second translation).1 value ∧ ⟨fun value => Exists fun left => Exists fun right => (first.val left ∧ (translation.val right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = ⟨fun value => Exists fun left => Exists fun right => (second.val left ∧ (translation.val right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ → False) ∧ ∀ (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (∀ (value : rational_model.signature.toCarrierBundle.1), (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 value → first.1 value ∧ ⟨LRA.NumberSystems.RealNumbers.Dedekind.rational_lower_ray rational_model rational_model.signature.zero, ⋯⟩ = first → False) → (∀ (value : rational_model.signature.toCarrierBundle.1), (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 value → second.1 value ∧ ⟨LRA.NumberSystems.RealNumbers.Dedekind.rational_lower_ray rational_model rational_model.signature.zero, ⋯⟩ = second → False) → (∀ (value : rational_model.signature.toCarrierBundle.1), (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 value → (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second).1 value ∧ ⟨LRA.NumberSystems.RealNumbers.Dedekind.rational_lower_ray rational_model rational_model.signature.zero, ⋯⟩ = Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first second x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first second other → other = x)) ⋯.val → False))))

Logical form (Lean):

```lean
def OrderedFieldStructure : Prop :=
  FieldStructure rational_model ∧
  StrictTotalOrder rational_model ∧
  (∀ first second translation : Cut rational_model,
    strict_order rational_model first second →
    strict_order rational_model
      (addition rational_model first translation)
      (addition rational_model second translation)) ∧
  (∀ first second : Cut rational_model,
    IsPositive rational_model first →
    IsPositive rational_model second →
    IsPositive rational_model
      (multiplication rational_model first second))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def OrderedFieldStructure : Prop :=
  FieldStructure rational_model ∧
  StrictTotalOrder rational_model ∧
  (∀ first second translation : Cut rational_model,
    strict_order rational_model first second →
    strict_order rational_model
      (addition rational_model first translation)
      (addition rational_model second translation)) ∧
  (∀ first second : Cut rational_model,
    IsPositive rational_model first →
    IsPositive rational_model second →
    IsPositive rational_model
      (multiplication rational_model first second))

/--
`ordered_field_structure` TODO

Predicate logic:

  OrderedFieldStructure rational_model

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel), (((∀ (first second third : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper : rational_model.signature.carrier) (lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.carrier), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), ⟨fun value => Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model first second).val left ∧ (third.val right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = ⟨fun value => Exists fun left => Exists fun right => (first.val left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second third).val right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ ∧ (∀ (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper : rational_model.signature.carrier) (lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.carrier), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), ⟨fun value => Exists fun left => Exists fun right => (first.val left ∧ (second.val right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = ⟨fun value => Exists fun left => Exists fun right => (second.val left ∧ (first.val right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ ∧ (∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper : rational_model.signature.carrier) (lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.carrier), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (⟨fun value => Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).val left ∧ (cut.val right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = cut ∧ ⟨fun value => Exists fun left => Exists fun right => (cut.val left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).val right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = cut) ∧ ∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper : rational_model.signature.carrier) (lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.carrier), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (⟨fun value => Exists fun left => Exists fun right => (cut.val left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model cut).val right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = ⟨fun candidate => rational_model.signature.StrictOrder candidate rational_model.signature.zero, ⋯⟩ ∧ ⟨fun value => Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model cut).val left ∧ (cut.val right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = ⟨fun candidate => rational_model.signature.StrictOrder candidate rational_model.signature.zero, ⋯⟩)))) ∧ ((∀ (first second third : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper : rational_model.signature.carrier) (lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.carrier), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second) third x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second) third other → other = x)) ⋯ = .1 (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model second third) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model second third) other → other = x)) ⋯).1 ∧ (∀ (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper : rational_model.signature.carrier) (lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.carrier), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first second x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first second other → other = x)) ⋯ = .1 (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model second first x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model second first other → other = x)) ⋯).1 ∧ (∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper : rational_model.signature.carrier) (lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.carrier), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) cut x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) cut other → other = x)) ⋯ = .1 cut ∧ Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) other → other = x)) ⋯ = .1 cut) ∧ ∀ (first second third : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper : rational_model.signature.carrier) (lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.carrier), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second third) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second third) other → other = x)) ⋯ = .1 ⟨fun value => Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second).val left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first third).val right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩))) ∧ ∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (cut = ⟨LRA.NumberSystems.RealNumbers.Dedekind.rational_lower_ray rational_model rational_model.signature.zero, ⋯⟩ → False) → Exists fun reciprocal => (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut reciprocal x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut reciprocal other → other = x)) ⋯ = .1 ⟨fun candidate => rational_model.signature.StrictOrder candidate rational_model.signature.one, ⋯⟩ ∧ Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model reciprocal cut x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model reciprocal cut other → other = x)) ⋯ = .1 ⟨fun candidate => rational_model.signature.StrictOrder candidate rational_model.signature.one, ⋯⟩))) ∧ ((∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (∀ (value : rational_model.signature.carrier), cut.val value → cut.val value ∧ cut = cut → False) → False ∧ (∀ (first second third : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (∀ (value : rational_model.signature.toCarrierBundle.1), first.1 value → second.1 value ∧ first = second → False) → (∀ (value : rational_model.signature.toCarrierBundle.1), second.1 value → third.1 value ∧ second = third → False) → (∀ (value : rational_model.signature.toCarrierBundle.1), first.1 value → third.1 value ∧ first = third → False) ∧ ∀ (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (first = second → False) → Or ((∀ (value : rational_model.signature.toCarrierBundle.1), first.1 value → second.1 value ∧ first = second → False)) ((∀ (value : rational_model.signature.toCarrierBundle.1), second.1 value → first.1 value ∧ second = first → False)))) ∧ (∀ (first second translation : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (∀ (value : rational_model.signature.toCarrierBundle.1), first.1 value → second.1 value ∧ first = second → False) → (∀ (value : rational_model.signature.toCarrierBundle.1), (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model first translation).1 value → (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second translation).1 value ∧ ⟨fun value => Exists fun left => Exists fun right => (LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model first left ∧ (LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model translation right ∧ value = rational_model.signature.add left right)), ⋯⟩ = ⟨fun value => Exists fun left => Exists fun right => (LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model second left ∧ (LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model translation right ∧ value = rational_model.signature.add left right)), ⋯⟩ → False) ∧ ∀ (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (∀ (value : rational_model.signature.toCarrierBundle.1), (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 value → first.1 value ∧ LRA.NumberSystems.RealNumbers.Dedekind.rational_embedding rational_model rational_model.signature.zero = first → False) → (∀ (value : rational_model.signature.toCarrierBundle.1), (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 value → second.1 value ∧ LRA.NumberSystems.RealNumbers.Dedekind.rational_embedding rational_model rational_model.signature.zero = second → False) → (∀ (value : rational_model.signature.toCarrierBundle.1), (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 value → (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second).1 value ∧ LRA.NumberSystems.RealNumbers.Dedekind.rational_embedding rational_model rational_model.signature.zero = Classical.choose ⋯ → False))))

Logical form (Lean):

```lean
theorem ordered_field_structure : OrderedFieldStructure rational_model
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
theorem ordered_field_structure : OrderedFieldStructure rational_model := by
  sorry

/--
`LeastUpperBoundProperty` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (family : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model → Prop), (Exists fun cut => family cut ∧ Exists fun upper => ∀ (cut : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), family cut → LRA.NumberSystems.RealNumbers.Dedekind.nonstrict_order rational_model cut upper) → Exists fun supremum => (∀ (cut : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), family cut → LRA.NumberSystems.RealNumbers.Dedekind.nonstrict_order rational_model cut supremum ∧ ∀ (upper : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), (∀ (cut : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), family cut → LRA.NumberSystems.RealNumbers.Dedekind.nonstrict_order rational_model cut upper) → LRA.NumberSystems.RealNumbers.Dedekind.nonstrict_order rational_model supremum upper)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (family : (Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))) → Prop), (Exists fun cut => family cut ∧ Exists fun upper => ∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), family cut → ∀ (value : rational_model.signature.toCarrierBundle.1), cut.1 value → upper.1 value) → Exists fun supremum => (∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), family cut → ∀ (value : rational_model.signature.toCarrierBundle.1), cut.1 value → supremum.1 value ∧ ∀ (upper : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), family cut → ∀ (value : rational_model.signature.toCarrierBundle.1), cut.1 value → upper.1 value) → ∀ (value : rational_model.signature.toCarrierBundle.1), supremum.1 value → upper.1 value)

Logical form (Lean):

```lean
def LeastUpperBoundProperty : Prop :=
  ∀ family : Cut rational_model → Prop,
    (∃ cut, family cut) →
    (∃ upper,
      ∀ cut,
        family cut → nonstrict_order rational_model cut upper) →
    ∃ supremum,
      (∀ cut,
        family cut → nonstrict_order rational_model cut supremum) ∧
      (∀ upper,
        (∀ cut,
          family cut → nonstrict_order rational_model cut upper) →
        nonstrict_order rational_model supremum upper)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def LeastUpperBoundProperty : Prop :=
  ∀ family : Cut rational_model → Prop,
    (∃ cut, family cut) →
    (∃ upper,
      ∀ cut,
        family cut → nonstrict_order rational_model cut upper) →
    ∃ supremum,
      (∀ cut,
        family cut → nonstrict_order rational_model cut supremum) ∧
      (∀ upper,
        (∀ cut,
          family cut → nonstrict_order rational_model cut upper) →
        nonstrict_order rational_model supremum upper)

/--
`least_upper_bound_property` TODO

Predicate logic:

  LeastUpperBoundProperty rational_model

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (family : (Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))) → Prop), (Exists fun cut => family cut ∧ Exists fun upper => ∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), family cut → ∀ (value : rational_model.signature.toCarrierBundle.1), cut.1 value → upper.1 value) → Exists fun supremum => (∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), family cut → ∀ (value : rational_model.signature.toCarrierBundle.1), cut.1 value → supremum.1 value ∧ ∀ (upper : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), family cut → ∀ (value : rational_model.signature.toCarrierBundle.1), cut.1 value → upper.1 value) → ∀ (value : rational_model.signature.toCarrierBundle.1), supremum.1 value → upper.1 value)

Logical form (Lean):

```lean
theorem least_upper_bound_property : LeastUpperBoundProperty rational_model
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
theorem least_upper_bound_property : LeastUpperBoundProperty rational_model := by
  sorry

/--
`CompleteOrderedFieldStructure` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel), (LRA.NumberSystems.RealNumbers.Dedekind.OrderedFieldStructure rational_model ∧ LRA.NumberSystems.RealNumbers.Dedekind.LeastUpperBoundProperty rational_model)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel), ((((∀ (first second third : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper : rational_model.signature.carrier) (lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.carrier), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), ⟨fun value => Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model first second).val left ∧ (third.val right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = ⟨fun value => Exists fun left => Exists fun right => (first.val left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second third).val right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ ∧ (∀ (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper : rational_model.signature.carrier) (lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.carrier), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), ⟨fun value => Exists fun left => Exists fun right => (first.val left ∧ (second.val right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = ⟨fun value => Exists fun left => Exists fun right => (second.val left ∧ (first.val right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ ∧ (∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper : rational_model.signature.carrier) (lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.carrier), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (⟨fun value => Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).val left ∧ (cut.val right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = cut ∧ ⟨fun value => Exists fun left => Exists fun right => (cut.val left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).val right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = cut) ∧ ∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper : rational_model.signature.carrier) (lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.carrier), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (⟨fun value => Exists fun left => Exists fun right => (cut.val left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model cut).val right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = ⟨fun candidate => rational_model.signature.StrictOrder candidate rational_model.signature.zero, ⋯⟩ ∧ ⟨fun value => Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model cut).val left ∧ (cut.val right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩ = ⟨fun candidate => rational_model.signature.StrictOrder candidate rational_model.signature.zero, ⋯⟩)))) ∧ ((∀ (first second third : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper : rational_model.signature.carrier) (lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.carrier), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second) third x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second) third other → other = x)) ⋯ = .1 (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model second third) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model second third) other → other = x)) ⋯).1 ∧ (∀ (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper : rational_model.signature.carrier) (lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.carrier), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first second x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first second other → other = x)) ⋯ = .1 (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model second first x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model second first other → other = x)) ⋯).1 ∧ (∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper : rational_model.signature.carrier) (lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.carrier), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) cut x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) cut other → other = x)) ⋯ = .1 cut ∧ Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) other → other = x)) ⋯ = .1 cut) ∧ ∀ (first second third : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper : rational_model.signature.carrier) (lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.carrier), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second third) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second third) other → other = x)) ⋯ = .1 ⟨fun value => Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second).val left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first third).val right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)), ⋯⟩))) ∧ ∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (cut = ⟨LRA.NumberSystems.RealNumbers.Dedekind.rational_lower_ray rational_model rational_model.signature.zero, ⋯⟩ → False) → Exists fun reciprocal => (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut reciprocal x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut reciprocal other → other = x)) ⋯ = .1 ⟨fun candidate => rational_model.signature.StrictOrder candidate rational_model.signature.one, ⋯⟩ ∧ Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model reciprocal cut x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model reciprocal cut other → other = x)) ⋯ = .1 ⟨fun candidate => rational_model.signature.StrictOrder candidate rational_model.signature.one, ⋯⟩))) ∧ ((∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (∀ (value : rational_model.signature.carrier), cut.val value → cut.val value ∧ cut = cut → False) → False ∧ (∀ (first second third : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (∀ (value : rational_model.signature.toCarrierBundle.1), first.1 value → second.1 value ∧ first = second → False) → (∀ (value : rational_model.signature.toCarrierBundle.1), second.1 value → third.1 value ∧ second = third → False) → (∀ (value : rational_model.signature.toCarrierBundle.1), first.1 value → third.1 value ∧ first = third → False) ∧ ∀ (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (first = second → False) → Or ((∀ (value : rational_model.signature.toCarrierBundle.1), first.1 value → second.1 value ∧ first = second → False)) ((∀ (value : rational_model.signature.toCarrierBundle.1), second.1 value → first.1 value ∧ second = first → False)))) ∧ (∀ (first second translation : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (∀ (value : rational_model.signature.toCarrierBundle.1), first.1 value → second.1 value ∧ first = second → False) → (∀ (value : rational_model.signature.toCarrierBundle.1), (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model first translation).1 value → (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second translation).1 value ∧ ⟨fun value => Exists fun left => Exists fun right => (LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model first left ∧ (LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model translation right ∧ value = rational_model.signature.add left right)), ⋯⟩ = ⟨fun value => Exists fun left => Exists fun right => (LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model second left ∧ (LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model translation right ∧ value = rational_model.signature.add left right)), ⋯⟩ → False) ∧ ∀ (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (∀ (value : rational_model.signature.toCarrierBundle.1), (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 value → first.1 value ∧ LRA.NumberSystems.RealNumbers.Dedekind.rational_embedding rational_model rational_model.signature.zero = first → False) → (∀ (value : rational_model.signature.toCarrierBundle.1), (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 value → second.1 value ∧ LRA.NumberSystems.RealNumbers.Dedekind.rational_embedding rational_model rational_model.signature.zero = second → False) → (∀ (value : rational_model.signature.toCarrierBundle.1), (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 value → (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second).1 value ∧ LRA.NumberSystems.RealNumbers.Dedekind.rational_embedding rational_model rational_model.signature.zero = Classical.choose ⋯ → False)))) ∧ ∀ (family : (Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))) → Prop), (Exists fun cut => family cut) → (Exists fun upper => ∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), family cut → ∀ (value : rational_model.signature.toCarrierBundle.1), cut.1 value → upper.1 value) → Exists fun supremum => (∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), family cut → ∀ (value : rational_model.signature.toCarrierBundle.1), cut.1 value → supremum.1 value ∧ ∀ (upper : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), family cut → ∀ (value : rational_model.signature.toCarrierBundle.1), cut.1 value → upper.1 value) → ∀ (value : rational_model.signature.toCarrierBundle.1), supremum.1 value → upper.1 value))

Logical form (Lean):

```lean
def CompleteOrderedFieldStructure : Prop :=
  OrderedFieldStructure rational_model ∧ LeastUpperBoundProperty rational_model
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
def CompleteOrderedFieldStructure : Prop :=
  OrderedFieldStructure rational_model ∧ LeastUpperBoundProperty rational_model

/--
`complete_ordered_field_structure` TODO

Predicate logic:

  CompleteOrderedFieldStructure rational_model

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel), ((((∀ (first second third : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => ¬ lower_set value ∧ (∀ (upper : LRA.NumberSystems.RealNumbers.Dedekind.Rational rational_model) (lower : rational_model.signature.carrier), lower_set upper → rational_model.signature.StrictOrder lower upper → lower_set lower ∧ ∀ (value : LRA.NumberSystems.RealNumbers.Dedekind.Rational rational_model), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.StrictOrder value greater))))), ⟨fun value => Exists fun left => Exists fun right => (LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model first second) left ∧ (LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model third right ∧ value = rational_model.signature.add left right)), ⋯⟩ = ⟨fun value => Exists fun left => Exists fun right => (LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model first left ∧ (LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second third) right ∧ value = rational_model.signature.add left right)), ⋯⟩ ∧ (∀ (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => ¬ lower_set value ∧ (∀ (upper : LRA.NumberSystems.RealNumbers.Dedekind.Rational rational_model) (lower : rational_model.signature.carrier), lower_set upper → rational_model.signature.StrictOrder lower upper → lower_set lower ∧ ∀ (value : LRA.NumberSystems.RealNumbers.Dedekind.Rational rational_model), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.StrictOrder value greater))))), ⟨fun value => Exists fun left => Exists fun right => (LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model first left ∧ (LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model second right ∧ value = rational_model.signature.add left right)), ⋯⟩ = ⟨fun value => Exists fun left => Exists fun right => (LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model second left ∧ (LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model first right ∧ value = rational_model.signature.add left right)), ⋯⟩ ∧ (∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => ¬ lower_set value ∧ (∀ (upper : LRA.NumberSystems.RealNumbers.Dedekind.Rational rational_model) (lower : rational_model.signature.carrier), lower_set upper → rational_model.signature.StrictOrder lower upper → lower_set lower ∧ ∀ (value : LRA.NumberSystems.RealNumbers.Dedekind.Rational rational_model), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.StrictOrder value greater))))), (⟨fun value => Exists fun left => Exists fun right => (LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model) left ∧ (LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model cut right ∧ value = rational_model.signature.add left right)), ⋯⟩ = cut ∧ ⟨fun value => Exists fun left => Exists fun right => (LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model cut left ∧ (LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model) right ∧ value = rational_model.signature.add left right)), ⋯⟩ = cut) ∧ ∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => ¬ lower_set value ∧ (∀ (upper : LRA.NumberSystems.RealNumbers.Dedekind.Rational rational_model) (lower : rational_model.signature.carrier), lower_set upper → rational_model.signature.StrictOrder lower upper → lower_set lower ∧ ∀ (value : LRA.NumberSystems.RealNumbers.Dedekind.Rational rational_model), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.StrictOrder value greater))))), (⟨fun value => Exists fun left => Exists fun right => (LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model cut left ∧ (LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model (LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model cut) right ∧ value = rational_model.signature.add left right)), ⋯⟩ = ⟨LRA.NumberSystems.RealNumbers.Dedekind.rational_lower_ray rational_model rational_model.signature.zero, ⋯⟩ ∧ ⟨fun value => Exists fun left => Exists fun right => (LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model (LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model cut) left ∧ (LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model cut right ∧ value = rational_model.signature.add left right)), ⋯⟩ = ⟨LRA.NumberSystems.RealNumbers.Dedekind.rational_lower_ray rational_model rational_model.signature.zero, ⋯⟩)))) ∧ ((∀ (first second third : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => ¬ lower_set value ∧ (∀ (upper : LRA.NumberSystems.RealNumbers.Dedekind.Rational rational_model) (lower : rational_model.signature.carrier), lower_set upper → rational_model.signature.StrictOrder lower upper → lower_set lower ∧ ∀ (value : LRA.NumberSystems.RealNumbers.Dedekind.Rational rational_model), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.StrictOrder value greater))))), Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second) third x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second) third other → other = x)) ⋯ = .val (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model second third) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model second third) other → other = x)) ⋯).val ∧ (∀ (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => ¬ lower_set value ∧ (∀ (upper : LRA.NumberSystems.RealNumbers.Dedekind.Rational rational_model) (lower : rational_model.signature.carrier), lower_set upper → rational_model.signature.StrictOrder lower upper → lower_set lower ∧ ∀ (value : LRA.NumberSystems.RealNumbers.Dedekind.Rational rational_model), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.StrictOrder value greater))))), Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first second x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first second other → other = x)) ⋯ = .val (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model second first x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model second first other → other = x)) ⋯).val ∧ (∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => ¬ lower_set value ∧ (∀ (upper : LRA.NumberSystems.RealNumbers.Dedekind.Rational rational_model) (lower : rational_model.signature.carrier), lower_set upper → rational_model.signature.StrictOrder lower upper → lower_set lower ∧ ∀ (value : LRA.NumberSystems.RealNumbers.Dedekind.Rational rational_model), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.StrictOrder value greater))))), (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) cut x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) cut other → other = x)) ⋯ = .val cut ∧ Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut (LRA.NumberSystems.RealNumbers.Dedekind.one rational_model) other → other = x)) ⋯ = .val cut) ∧ ∀ (first second third : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => ¬ lower_set value ∧ (∀ (upper : LRA.NumberSystems.RealNumbers.Dedekind.Rational rational_model) (lower : rational_model.signature.carrier), lower_set upper → rational_model.signature.StrictOrder lower upper → lower_set lower ∧ ∀ (value : LRA.NumberSystems.RealNumbers.Dedekind.Rational rational_model), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.StrictOrder value greater))))), Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second third) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second third) other → other = x)) ⋯ = .val ⟨fun value => Exists fun left => Exists fun right => (LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second) left ∧ (LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first third) right ∧ value = rational_model.signature.add left right)), ⋯⟩))) ∧ ∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper : rational_model.signature.carrier) (lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.carrier), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (cut = LRA.NumberSystems.RealNumbers.Dedekind.rational_embedding rational_model rational_model.signature.zero → False) → Exists fun reciprocal => (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut reciprocal x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut reciprocal other → other = x)) ⋯ = .val ⟨LRA.NumberSystems.RealNumbers.Dedekind.rational_lower_ray rational_model rational_model.signature.one, ⋯⟩ ∧ Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model reciprocal cut x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model reciprocal cut other → other = x)) ⋯ = .val ⟨LRA.NumberSystems.RealNumbers.Dedekind.rational_lower_ray rational_model rational_model.signature.one, ⋯⟩))) ∧ ((∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper : rational_model.signature.carrier) (lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.carrier), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (∀ (value : LRA.NumberSystems.RealNumbers.Dedekind.Rational rational_model), LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model cut value → LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model cut value ∧ ¬ cut = cut) → False ∧ (∀ (first second third : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper : rational_model.signature.carrier) (lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.carrier), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (∀ (value : rational_model.signature.carrier), first.val value → second.val value ∧ first = second → False) → (∀ (value : rational_model.signature.carrier), second.val value → third.val value ∧ second = third → False) → (∀ (value : rational_model.signature.carrier), first.val value → third.val value ∧ first = third → False) ∧ ∀ (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper : rational_model.signature.carrier) (lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.carrier), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (first = second → False) → Or ((∀ (value : rational_model.signature.carrier), first.val value → second.val value ∧ first = second → False)) ((∀ (value : rational_model.signature.carrier), second.val value → first.val value ∧ second = first → False)))) ∧ (∀ (first second translation : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (∀ (value : rational_model.signature.toCarrierBundle.1), first.1 value → second.1 value ∧ first = second → False) → (∀ (value : rational_model.signature.toCarrierBundle.1), (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model first translation).1 value → (LRA.NumberSystems.RealNumbers.Dedekind.addition rational_model second translation).1 value ∧ ⟨LRA.NumberSystems.RealNumbers.Dedekind.addition_lower_set rational_model first translation, ⋯⟩ = ⟨LRA.NumberSystems.RealNumbers.Dedekind.addition_lower_set rational_model second translation, ⋯⟩ → False) ∧ ∀ (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (∀ (value : rational_model.signature.carrier), (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).val value → first.val value ∧ LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model = first → False) → (∀ (value : rational_model.signature.carrier), (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).val value → second.val value ∧ LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model = second → False) → (∀ (value : rational_model.signature.carrier), (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).val value → (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second).val value ∧ LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model = LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model first second → False)))) ∧ ∀ (family : (Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))) → Prop), (Exists fun cut => family cut) → (Exists fun upper => ∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), family cut → ∀ (value : rational_model.signature.toCarrierBundle.1), cut.1 value → upper.1 value) → Exists fun supremum => (∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), family cut → ∀ (value : rational_model.signature.toCarrierBundle.1), cut.1 value → supremum.1 value ∧ ∀ (upper : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), family cut → ∀ (value : rational_model.signature.toCarrierBundle.1), cut.1 value → upper.1 value) → ∀ (value : rational_model.signature.toCarrierBundle.1), supremum.1 value → upper.1 value))

Logical form (Lean):

```lean
theorem complete_ordered_field_structure :
    CompleteOrderedFieldStructure rational_model
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
theorem complete_ordered_field_structure :
    CompleteOrderedFieldStructure rational_model := by
  sorry

end LRA.NumberSystems.RealNumbers.Dedekind
