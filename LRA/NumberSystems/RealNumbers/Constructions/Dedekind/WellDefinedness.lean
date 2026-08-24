
import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.Operations

namespace LRA.NumberSystems.RealNumbers.Dedekind
open LRA.NumberSystems.Interface.ModelTheory

variable (rational_model : DenselyOrderedFieldModel)

/--
`rational_lower_ray_is_cut` TODO

Predicate logic:

  IsCut rational_model (rational_lower_ray rational_model value)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (value : rational_model.signature.toCarrierBundle.1), (Exists fun value_1 => rational_model.signature.toOrderedRingSignature.2 value_1 value ∧ (Exists fun value_1 => rational_model.signature.toOrderedRingSignature.2 value_1 value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), rational_model.signature.toOrderedRingSignature.2 upper value → rational_model.signature.toOrderedRingSignature.2 lower upper → rational_model.signature.toOrderedRingSignature.2 lower value ∧ ∀ (value_1 : rational_model.signature.toCarrierBundle.1), rational_model.signature.toOrderedRingSignature.2 value_1 value → Exists fun greater => (rational_model.signature.toOrderedRingSignature.2 greater value ∧ rational_model.signature.toOrderedRingSignature.2 value_1 greater))))

Logical form (Lean):

```lean
theorem rational_lower_ray_is_cut (value : Rational rational_model) :
    IsCut rational_model (rational_lower_ray rational_model value)
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
theorem rational_lower_ray_is_cut (value : Rational rational_model) :
    IsCut rational_model (rational_lower_ray rational_model value) := by
  sorry

/--
`rational_embedding` TODO

Predicate logic:

  def rational_embedding (value : Rational rational_model) : Cut rational_model :=
  ⟨rational_lower_ray rational_model value,
    rational_lower_ray_is_cut rational_model value⟩

Predicate logic (unfolded):

  def rational_embedding (value : Rational rational_model) : Cut rational_model :=
  ⟨rational_lower_ray rational_model value,
    rational_lower_ray_is_cut rational_model value⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def rational_embedding (value : Rational rational_model) : Cut rational_model :=
  ⟨rational_lower_ray rational_model value,
    rational_lower_ray_is_cut rational_model value⟩
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
def rational_embedding (value : Rational rational_model) : Cut rational_model :=
  ⟨rational_lower_ray rational_model value,
    rational_lower_ray_is_cut rational_model value⟩

/--
`rational_embedding_is_order_embedding` TODO

Predicate logic:

  (∀ first second, rational_embedding rational_model first = rational_embedding rational_model second → first = second) ∧ (∀ first second, rational_model.signature.StrictOrder first second ↔ strict_order rational_model (rational_embedding rational_model first) (rational_embedding rational_model second))

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel), (∀ (first second : rational_model.signature.toCarrierBundle.1), ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate first, ⋯⟩ = ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate second, ⋯⟩ → first = second ∧ ∀ (first second : rational_model.signature.toCarrierBundle.1), rational_model.signature.toOrderedRingSignature.2 first second ↔ (∀ (value : rational_model.signature.toCarrierBundle.1), (LRA.NumberSystems.RealNumbers.Dedekind.rational_embedding rational_model first).1 value → (LRA.NumberSystems.RealNumbers.Dedekind.rational_embedding rational_model second).1 value ∧ ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate first, ⋯⟩ = ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate second, ⋯⟩ → False))

Logical form (Lean):

```lean
theorem rational_embedding_is_order_embedding :
    (∀ first second,
      rational_embedding rational_model first =
        rational_embedding rational_model second → first = second) ∧
    (∀ first second,
      rational_model.signature.StrictOrder first second ↔
        strict_order rational_model
          (rational_embedding rational_model first)
          (rational_embedding rational_model second))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
theorem rational_embedding_is_order_embedding :
    (∀ first second,
      rational_embedding rational_model first =
        rational_embedding rational_model second → first = second) ∧
    (∀ first second,
      rational_model.signature.StrictOrder first second ↔
        strict_order rational_model
          (rational_embedding rational_model first)
          (rational_embedding rational_model second)) := by
  sorry

/--
`addition_lower_set_is_cut` TODO

Predicate logic:

  IsCut rational_model (addition_lower_set rational_model first second)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (Exists fun value => Exists fun left => Exists fun right => (first.1 left ∧ (second.1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right)) ∧ (Exists fun value => (Exists fun left => Exists fun right => (first.1 left ∧ (second.1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right))) → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), (Exists fun left => Exists fun right => (first.1 left ∧ (second.1 right ∧ upper = rational_model.signature.toBooleanRingOperationBundle.2 left right))) → rational_model.signature.toOrderedRingSignature.2 lower upper → Exists fun left => Exists fun right => (first.1 left ∧ (second.1 right ∧ lower = rational_model.signature.toBooleanRingOperationBundle.2 left right)) ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), (Exists fun left => Exists fun right => (first.1 left ∧ (second.1 right ∧ value = rational_model.signature.toBooleanRingOperationBundle.2 left right))) → Exists fun greater => (Exists fun left => Exists fun right => (first.1 left ∧ (second.1 right ∧ greater = rational_model.signature.toBooleanRingOperationBundle.2 left right)) ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))

Logical form (Lean):

```lean
theorem addition_lower_set_is_cut (first second : Cut rational_model) :
    IsCut rational_model (addition_lower_set rational_model first second)
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
theorem addition_lower_set_is_cut (first second : Cut rational_model) :
    IsCut rational_model (addition_lower_set rational_model first second) := by
  sorry

/--
`addition` TODO

Predicate logic:

  def addition (first second : Cut rational_model) : Cut rational_model :=
  ⟨addition_lower_set rational_model first second,
    addition_lower_set_is_cut rational_model first second⟩

Predicate logic (unfolded):

  def addition (first second : Cut rational_model) : Cut rational_model :=
  ⟨addition_lower_set rational_model first second,
    addition_lower_set_is_cut rational_model first second⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def addition (first second : Cut rational_model) : Cut rational_model :=
  ⟨addition_lower_set rational_model first second,
    addition_lower_set_is_cut rational_model first second⟩
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
def addition (first second : Cut rational_model) : Cut rational_model :=
  ⟨addition_lower_set rational_model first second,
    addition_lower_set_is_cut rational_model first second⟩

/--
`zero` TODO

Predicate logic:

  def zero : Cut rational_model :=
  rational_embedding rational_model rational_model.signature.zero

Predicate logic (unfolded):

  def zero : Cut rational_model :=
  rational_embedding rational_model rational_model.signature.zero (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def zero : Cut rational_model :=
  rational_embedding rational_model rational_model.signature.zero
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
def zero : Cut rational_model :=
  rational_embedding rational_model rational_model.signature.zero

/--
`negation_lower_set_is_cut` TODO

Predicate logic:

  IsCut rational_model (negation_lower_set rational_model cut)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (Exists fun value => Exists fun excluded => (cut.1 excluded → False ∧ rational_model.signature.toOrderedRingSignature.2 value (rational_model.signature.toRingConceptSignature.2 excluded)) ∧ (Exists fun value => (Exists fun excluded => (cut.1 excluded → False ∧ rational_model.signature.toOrderedRingSignature.2 value (rational_model.signature.toRingConceptSignature.2 excluded))) → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), (Exists fun excluded => (cut.1 excluded → False ∧ rational_model.signature.toOrderedRingSignature.2 upper (rational_model.signature.toRingConceptSignature.2 excluded))) → rational_model.signature.toOrderedRingSignature.2 lower upper → Exists fun excluded => (cut.1 excluded → False ∧ rational_model.signature.toOrderedRingSignature.2 lower (rational_model.signature.toRingConceptSignature.2 excluded)) ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), (Exists fun excluded => (cut.1 excluded → False ∧ rational_model.signature.toOrderedRingSignature.2 value (rational_model.signature.toRingConceptSignature.2 excluded))) → Exists fun greater => (Exists fun excluded => (cut.1 excluded → False ∧ rational_model.signature.toOrderedRingSignature.2 greater (rational_model.signature.toRingConceptSignature.2 excluded)) ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))

Logical form (Lean):

```lean
theorem negation_lower_set_is_cut (cut : Cut rational_model) :
    IsCut rational_model (negation_lower_set rational_model cut)
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
theorem negation_lower_set_is_cut (cut : Cut rational_model) :
    IsCut rational_model (negation_lower_set rational_model cut) := by
  sorry

/--
`negation` TODO

Predicate logic:

  def negation (cut : Cut rational_model) : Cut rational_model :=
  ⟨negation_lower_set rational_model cut,
    negation_lower_set_is_cut rational_model cut⟩

Predicate logic (unfolded):

  def negation (cut : Cut rational_model) : Cut rational_model :=
  ⟨negation_lower_set rational_model cut,
    negation_lower_set_is_cut rational_model cut⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def negation (cut : Cut rational_model) : Cut rational_model :=
  ⟨negation_lower_set rational_model cut,
    negation_lower_set_is_cut rational_model cut⟩
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
def negation (cut : Cut rational_model) : Cut rational_model :=
  ⟨negation_lower_set rational_model cut,
    negation_lower_set_is_cut rational_model cut⟩

/--
`IsPositive` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (cut : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), (LRA.NumberSystems.RealNumbers.Dedekind.nonstrict_order rational_model (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model) cut ∧ Ne (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model) cut)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (∀ (value : rational_model.signature.toCarrierBundle.1), (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 value → cut.1 value ∧ ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate rational_model.signature.zero, ⋯⟩ = cut → False)

Logical form (Lean):

```lean
def IsPositive (cut : Cut rational_model) : Prop :=
  strict_order rational_model (zero rational_model) cut
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
def IsPositive (cut : Cut rational_model) : Prop :=
  strict_order rational_model (zero rational_model) cut

/--
`IsNonnegative` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (cut : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model) (value : LRA.NumberSystems.RealNumbers.Dedekind.Rational rational_model), LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model) value → LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model cut value

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))) (value : rational_model.signature.toCarrierBundle.1), (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 value → cut.1 value

Logical form (Lean):

```lean
def IsNonnegative (cut : Cut rational_model) : Prop :=
  nonstrict_order rational_model (zero rational_model) cut
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
def IsNonnegative (cut : Cut rational_model) : Prop :=
  nonstrict_order rational_model (zero rational_model) cut

/--
`nonnegative_product_is_cut` TODO

Predicate logic:

  (IsNonnegative rational_model first ∧ IsNonnegative rational_model second) → IsCut rational_model (nonnegative_product_lower_set rational_model first second)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (∀ (value : rational_model.signature.toCarrierBundle.1), (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 value → first.1 value ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 value → second.1 value) → (Exists fun value => Or (rational_model.signature.toOrderedRingSignature.2 value rational_model.signature.toZeroOneBundle.2) (Exists fun left => Exists fun right => (first.1 left ∧ (second.1 right ∧ (rational_model.signature.toOrderedRingSignature.2 rational_model.signature.toZeroOneBundle.2 left ∧ (rational_model.signature.toOrderedRingSignature.2 rational_model.signature.toZeroOneBundle.2 right ∧ rational_model.signature.toOrderedRingSignature.2 value (rational_model.signature.toBooleanRingOperationBundle.3 left right)))))) ∧ (Exists fun value => Or (rational_model.signature.toOrderedRingSignature.2 value rational_model.signature.toZeroOneBundle.2) (Exists fun left => Exists fun right => (first.1 left ∧ (second.1 right ∧ (rational_model.signature.toOrderedRingSignature.2 rational_model.signature.toZeroOneBundle.2 left ∧ (rational_model.signature.toOrderedRingSignature.2 rational_model.signature.toZeroOneBundle.2 right ∧ rational_model.signature.toOrderedRingSignature.2 value (rational_model.signature.toBooleanRingOperationBundle.3 left right)))))) → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), Or (rational_model.signature.toOrderedRingSignature.2 upper rational_model.signature.toZeroOneBundle.2) (Exists fun left => Exists fun right => (first.1 left ∧ (second.1 right ∧ (rational_model.signature.toOrderedRingSignature.2 rational_model.signature.toZeroOneBundle.2 left ∧ (rational_model.signature.toOrderedRingSignature.2 rational_model.signature.toZeroOneBundle.2 right ∧ rational_model.signature.toOrderedRingSignature.2 upper (rational_model.signature.toBooleanRingOperationBundle.3 left right)))))) → rational_model.signature.toOrderedRingSignature.2 lower upper → Or (rational_model.signature.toOrderedRingSignature.2 lower rational_model.signature.toZeroOneBundle.2) (Exists fun left => Exists fun right => (first.1 left ∧ (second.1 right ∧ (rational_model.signature.toOrderedRingSignature.2 rational_model.signature.toZeroOneBundle.2 left ∧ (rational_model.signature.toOrderedRingSignature.2 rational_model.signature.toZeroOneBundle.2 right ∧ rational_model.signature.toOrderedRingSignature.2 lower (rational_model.signature.toBooleanRingOperationBundle.3 left right)))))) ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), Or (rational_model.signature.toOrderedRingSignature.2 value rational_model.signature.toZeroOneBundle.2) (Exists fun left => Exists fun right => (first.1 left ∧ (second.1 right ∧ (rational_model.signature.toOrderedRingSignature.2 rational_model.signature.toZeroOneBundle.2 left ∧ (rational_model.signature.toOrderedRingSignature.2 rational_model.signature.toZeroOneBundle.2 right ∧ rational_model.signature.toOrderedRingSignature.2 value (rational_model.signature.toBooleanRingOperationBundle.3 left right)))))) → Exists fun greater => (Or (rational_model.signature.toOrderedRingSignature.2 greater rational_model.signature.toZeroOneBundle.2) (Exists fun left => Exists fun right => (first.1 left ∧ (second.1 right ∧ (rational_model.signature.toOrderedRingSignature.2 rational_model.signature.toZeroOneBundle.2 left ∧ (rational_model.signature.toOrderedRingSignature.2 rational_model.signature.toZeroOneBundle.2 right ∧ rational_model.signature.toOrderedRingSignature.2 greater (rational_model.signature.toBooleanRingOperationBundle.3 left right)))))) ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))

Logical form (Lean):

```lean
theorem nonnegative_product_is_cut
    (first second : Cut rational_model)
    (first_nonnegative : IsNonnegative rational_model first)
    (second_nonnegative : IsNonnegative rational_model second) :
    IsCut rational_model
      (nonnegative_product_lower_set rational_model first second)
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
theorem nonnegative_product_is_cut
    (first second : Cut rational_model)
    (first_nonnegative : IsNonnegative rational_model first)
    (second_nonnegative : IsNonnegative rational_model second) :
    IsCut rational_model
      (nonnegative_product_lower_set rational_model first second) := by
  sorry

/--
`nonnegative_multiplication` TODO

Predicate logic:

  def nonnegative_multiplication
    (first second : Cut rational_model)
    (first_nonnegative : IsNonnegative rational_model first)
    (second_nonnegative : IsNonnegative rational_model second) :
    Cut rational_model :=
  ⟨nonnegative_product_lower_set rational_model first second,
    nonnegative_product_is_cut rational_model first second
      first_nonnegative second_nonnegative⟩

Predicate logic (unfolded):

  def nonnegative_multiplication
    (first second : Cut rational_model)
    (first_nonnegative : IsNonnegative rational_model first)
    (second_nonnegative : IsNonnegative rational_model second) :
    Cut rational_model :=
  ⟨nonnegative_product_lower_set rational_model first second,
    nonnegative_product_is_cut rational_model first second
      first_nonnegative second_nonnegative⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def nonnegative_multiplication
    (first second : Cut rational_model)
    (first_nonnegative : IsNonnegative rational_model first)
    (second_nonnegative : IsNonnegative rational_model second) :
    Cut rational_model :=
  ⟨nonnegative_product_lower_set rational_model first second,
    nonnegative_product_is_cut rational_model first second
      first_nonnegative second_nonnegative⟩
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
def nonnegative_multiplication
    (first second : Cut rational_model)
    (first_nonnegative : IsNonnegative rational_model first)
    (second_nonnegative : IsNonnegative rational_model second) :
    Cut rational_model :=
  ⟨nonnegative_product_lower_set rational_model first second,
    nonnegative_product_is_cut rational_model first second
      first_nonnegative second_nonnegative⟩

/--
`IsProduct` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (first second product : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), Or (Exists fun first_nonnegative => Exists fun second_nonnegative => product = LRA.NumberSystems.RealNumbers.Dedekind.nonnegative_multiplication rational_model first second first_nonnegative second_nonnegative) (Or ((LRA.NumberSystems.RealNumbers.Dedekind.strict_order rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model) ∧ Exists fun second_nonnegative => Exists fun first_neg_nonnegative => product = LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model (LRA.NumberSystems.RealNumbers.Dedekind.nonnegative_multiplication rational_model (LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model first) second first_neg_nonnegative second_nonnegative))) (Or ((LRA.NumberSystems.RealNumbers.Dedekind.strict_order rational_model second (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model) ∧ Exists fun first_nonnegative => Exists fun second_neg_nonnegative => product = LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model (LRA.NumberSystems.RealNumbers.Dedekind.nonnegative_multiplication rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model second) first_nonnegative second_neg_nonnegative))) ((LRA.NumberSystems.RealNumbers.Dedekind.strict_order rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model) ∧ (LRA.NumberSystems.RealNumbers.Dedekind.strict_order rational_model second (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model) ∧ Exists fun first_neg_nonnegative => Exists fun second_neg_nonnegative => product = LRA.NumberSystems.RealNumbers.Dedekind.nonnegative_multiplication rational_model (LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model first) (LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model second) first_neg_nonnegative second_neg_nonnegative)))))

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (first second product : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), Or (Exists fun first_nonnegative => Exists fun second_nonnegative => product = ⟨fun value => Or (rational_model.signature.toOrderedRingSignature.2 value rational_model.signature.toZeroOneBundle.2) (Exists fun left => Exists fun right => (first.1 left ∧ (second.1 right ∧ (rational_model.signature.toOrderedRingSignature.2 rational_model.signature.toZeroOneBundle.2 left ∧ (rational_model.signature.toOrderedRingSignature.2 rational_model.signature.toZeroOneBundle.2 right ∧ rational_model.signature.toOrderedRingSignature.2 value (rational_model.signature.toBooleanRingOperationBundle.3 left right)))))), ⋯⟩) (Or (((∀ (value : rational_model.signature.toCarrierBundle.1), first.1 value → (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 value ∧ first = ⟨fun candidate => rational_model.signature.StrictOrder candidate rational_model.signature.zero, ⋯⟩ → False) ∧ Exists fun second_nonnegative => Exists fun first_neg_nonnegative => product = ⟨fun value => Exists fun excluded => ((LRA.NumberSystems.RealNumbers.Dedekind.nonnegative_multiplication rational_model (LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model first) second first_neg_nonnegative second_nonnegative).1 excluded → False ∧ rational_model.signature.toOrderedRingSignature.2 value (rational_model.signature.toRingConceptSignature.2 excluded)), ⋯⟩)) (Or (((∀ (value : rational_model.signature.toCarrierBundle.1), second.1 value → (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 value ∧ second = ⟨fun candidate => rational_model.signature.StrictOrder candidate rational_model.signature.zero, ⋯⟩ → False) ∧ Exists fun first_nonnegative => Exists fun second_neg_nonnegative => product = ⟨fun value => Exists fun excluded => ((LRA.NumberSystems.RealNumbers.Dedekind.nonnegative_multiplication rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model second) first_nonnegative second_neg_nonnegative).1 excluded → False ∧ rational_model.signature.toOrderedRingSignature.2 value (rational_model.signature.toRingConceptSignature.2 excluded)), ⋯⟩)) (((∀ (value : rational_model.signature.toCarrierBundle.1), first.1 value → (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 value ∧ first = ⟨fun candidate => rational_model.signature.StrictOrder candidate rational_model.signature.zero, ⋯⟩ → False) ∧ ((∀ (value : rational_model.signature.toCarrierBundle.1), second.1 value → (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 value ∧ second = ⟨fun candidate => rational_model.signature.StrictOrder candidate rational_model.signature.zero, ⋯⟩ → False) ∧ Exists fun first_neg_nonnegative => Exists fun second_neg_nonnegative => product = ⟨fun value => Or (rational_model.signature.toOrderedRingSignature.2 value rational_model.signature.toZeroOneBundle.2) (Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model first).1 left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model second).1 right ∧ (rational_model.signature.toOrderedRingSignature.2 rational_model.signature.toZeroOneBundle.2 left ∧ (rational_model.signature.toOrderedRingSignature.2 rational_model.signature.toZeroOneBundle.2 right ∧ rational_model.signature.toOrderedRingSignature.2 value (rational_model.signature.toBooleanRingOperationBundle.3 left right)))))), ⋯⟩)))))

Logical form (Lean):

```lean
def IsProduct (first second product : Cut rational_model) : Prop :=
  (∃ first_nonnegative : IsNonnegative rational_model first,
    ∃ second_nonnegative : IsNonnegative rational_model second,
      product = nonnegative_multiplication rational_model first second
        first_nonnegative second_nonnegative) ∨
  (strict_order rational_model first (zero rational_model) ∧
    ∃ second_nonnegative : IsNonnegative rational_model second,
      ∃ first_neg_nonnegative : IsNonnegative rational_model
          (negation rational_model first),
        product = negation rational_model
          (nonnegative_multiplication rational_model
            (negation rational_model first) second
            first_neg_nonnegative second_nonnegative)) ∨
  (strict_order rational_model second (zero rational_model) ∧
    ∃ first_nonnegative : IsNonnegative rational_model first,
      ∃ second_neg_nonnegative : IsNonnegative rational_model
          (negation rational_model second),
        product = negation rational_model
          (nonnegative_multiplication rational_model
            first (negation rational_model second)
            first_nonnegative second_neg_nonnegative)) ∨
  (strict_order rational_model first (zero rational_model) ∧
    strict_order rational_model second (zero rational_model) ∧
    ∃ first_neg_nonnegative : IsNonnegative rational_model
        (negation rational_model first),
      ∃ second_neg_nonnegative : IsNonnegative rational_model
          (negation rational_model second),
        product = nonnegative_multiplication rational_model
          (negation rational_model first)
          (negation rational_model second)
          first_neg_nonnegative second_neg_nonnegative)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, Or.inl, Or.inr, use, unfold

-/
def IsProduct (first second product : Cut rational_model) : Prop :=
  (∃ first_nonnegative : IsNonnegative rational_model first,
    ∃ second_nonnegative : IsNonnegative rational_model second,
      product = nonnegative_multiplication rational_model first second
        first_nonnegative second_nonnegative) ∨
  (strict_order rational_model first (zero rational_model) ∧
    ∃ second_nonnegative : IsNonnegative rational_model second,
      ∃ first_neg_nonnegative : IsNonnegative rational_model
          (negation rational_model first),
        product = negation rational_model
          (nonnegative_multiplication rational_model
            (negation rational_model first) second
            first_neg_nonnegative second_nonnegative)) ∨
  (strict_order rational_model second (zero rational_model) ∧
    ∃ first_nonnegative : IsNonnegative rational_model first,
      ∃ second_neg_nonnegative : IsNonnegative rational_model
          (negation rational_model second),
        product = negation rational_model
          (nonnegative_multiplication rational_model
            first (negation rational_model second)
            first_nonnegative second_neg_nonnegative)) ∨
  (strict_order rational_model first (zero rational_model) ∧
    strict_order rational_model second (zero rational_model) ∧
    ∃ first_neg_nonnegative : IsNonnegative rational_model
        (negation rational_model first),
      ∃ second_neg_nonnegative : IsNonnegative rational_model
          (negation rational_model second),
        product = nonnegative_multiplication rational_model
          (negation rational_model first)
          (negation rational_model second)
          first_neg_nonnegative second_neg_nonnegative)

/--
`product_exists_uniquely` TODO

Predicate logic:

  ∃ product ∈ Cut rational_model, IsProduct rational_model first second product ∧ ∀ other, IsProduct rational_model first second other → other = product

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), Exists fun product => (Or (Exists fun first_nonnegative => Exists fun second_nonnegative => product = ⟨fun value => Or (rational_model.signature.toOrderedRingSignature.2 value rational_model.signature.toZeroOneBundle.2) (Exists fun left => Exists fun right => (first.1 left ∧ (second.1 right ∧ (rational_model.signature.toOrderedRingSignature.2 rational_model.signature.toZeroOneBundle.2 left ∧ (rational_model.signature.toOrderedRingSignature.2 rational_model.signature.toZeroOneBundle.2 right ∧ rational_model.signature.toOrderedRingSignature.2 value (rational_model.signature.toBooleanRingOperationBundle.3 left right)))))), ⋯⟩) (Or (((∀ (value : rational_model.signature.toCarrierBundle.1), first.1 value → (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 value ∧ first = ⟨LRA.NumberSystems.RealNumbers.Dedekind.rational_lower_ray rational_model rational_model.signature.zero, ⋯⟩ → False) ∧ Exists fun second_nonnegative => Exists fun first_neg_nonnegative => product = ⟨fun value => Exists fun excluded => ((LRA.NumberSystems.RealNumbers.Dedekind.nonnegative_multiplication rational_model (LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model first) second first_neg_nonnegative second_nonnegative).1 excluded → False ∧ rational_model.signature.toOrderedRingSignature.2 value (rational_model.signature.toRingConceptSignature.2 excluded)), ⋯⟩)) (Or (((∀ (value : rational_model.signature.toCarrierBundle.1), second.1 value → (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 value ∧ second = ⟨LRA.NumberSystems.RealNumbers.Dedekind.rational_lower_ray rational_model rational_model.signature.zero, ⋯⟩ → False) ∧ Exists fun first_nonnegative => Exists fun second_neg_nonnegative => product = ⟨fun value => Exists fun excluded => ((LRA.NumberSystems.RealNumbers.Dedekind.nonnegative_multiplication rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model second) first_nonnegative second_neg_nonnegative).1 excluded → False ∧ rational_model.signature.toOrderedRingSignature.2 value (rational_model.signature.toRingConceptSignature.2 excluded)), ⋯⟩)) (((∀ (value : rational_model.signature.toCarrierBundle.1), first.1 value → (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 value ∧ first = ⟨LRA.NumberSystems.RealNumbers.Dedekind.rational_lower_ray rational_model rational_model.signature.zero, ⋯⟩ → False) ∧ ((∀ (value : rational_model.signature.toCarrierBundle.1), second.1 value → (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 value ∧ second = ⟨LRA.NumberSystems.RealNumbers.Dedekind.rational_lower_ray rational_model rational_model.signature.zero, ⋯⟩ → False) ∧ Exists fun first_neg_nonnegative => Exists fun second_neg_nonnegative => product = ⟨fun value => Or (rational_model.signature.toOrderedRingSignature.2 value rational_model.signature.toZeroOneBundle.2) (Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model first).1 left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model second).1 right ∧ (rational_model.signature.toOrderedRingSignature.2 rational_model.signature.toZeroOneBundle.2 left ∧ (rational_model.signature.toOrderedRingSignature.2 rational_model.signature.toZeroOneBundle.2 right ∧ rational_model.signature.toOrderedRingSignature.2 value (rational_model.signature.toBooleanRingOperationBundle.3 left right)))))), ⋯⟩))))) ∧ ∀ (other : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), Or (Exists fun first_nonnegative => Exists fun second_nonnegative => other = ⟨fun value => Or (rational_model.signature.toOrderedRingSignature.2 value rational_model.signature.toZeroOneBundle.2) (Exists fun left => Exists fun right => (first.1 left ∧ (second.1 right ∧ (rational_model.signature.toOrderedRingSignature.2 rational_model.signature.toZeroOneBundle.2 left ∧ (rational_model.signature.toOrderedRingSignature.2 rational_model.signature.toZeroOneBundle.2 right ∧ rational_model.signature.toOrderedRingSignature.2 value (rational_model.signature.toBooleanRingOperationBundle.3 left right)))))), ⋯⟩) (Or (((∀ (value : rational_model.signature.toCarrierBundle.1), first.1 value → (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 value ∧ first = ⟨LRA.NumberSystems.RealNumbers.Dedekind.rational_lower_ray rational_model rational_model.signature.zero, ⋯⟩ → False) ∧ Exists fun second_nonnegative => Exists fun first_neg_nonnegative => other = ⟨fun value => Exists fun excluded => ((LRA.NumberSystems.RealNumbers.Dedekind.nonnegative_multiplication rational_model (LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model first) second first_neg_nonnegative second_nonnegative).1 excluded → False ∧ rational_model.signature.toOrderedRingSignature.2 value (rational_model.signature.toRingConceptSignature.2 excluded)), ⋯⟩)) (Or (((∀ (value : rational_model.signature.toCarrierBundle.1), second.1 value → (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 value ∧ second = ⟨LRA.NumberSystems.RealNumbers.Dedekind.rational_lower_ray rational_model rational_model.signature.zero, ⋯⟩ → False) ∧ Exists fun first_nonnegative => Exists fun second_neg_nonnegative => other = ⟨fun value => Exists fun excluded => ((LRA.NumberSystems.RealNumbers.Dedekind.nonnegative_multiplication rational_model first (LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model second) first_nonnegative second_neg_nonnegative).1 excluded → False ∧ rational_model.signature.toOrderedRingSignature.2 value (rational_model.signature.toRingConceptSignature.2 excluded)), ⋯⟩)) (((∀ (value : rational_model.signature.toCarrierBundle.1), first.1 value → (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 value ∧ first = ⟨LRA.NumberSystems.RealNumbers.Dedekind.rational_lower_ray rational_model rational_model.signature.zero, ⋯⟩ → False) ∧ ((∀ (value : rational_model.signature.toCarrierBundle.1), second.1 value → (LRA.NumberSystems.RealNumbers.Dedekind.zero rational_model).1 value ∧ second = ⟨LRA.NumberSystems.RealNumbers.Dedekind.rational_lower_ray rational_model rational_model.signature.zero, ⋯⟩ → False) ∧ Exists fun first_neg_nonnegative => Exists fun second_neg_nonnegative => other = ⟨fun value => Or (rational_model.signature.toOrderedRingSignature.2 value rational_model.signature.toZeroOneBundle.2) (Exists fun left => Exists fun right => ((LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model first).1 left ∧ ((LRA.NumberSystems.RealNumbers.Dedekind.negation rational_model second).1 right ∧ (rational_model.signature.toOrderedRingSignature.2 rational_model.signature.toZeroOneBundle.2 left ∧ (rational_model.signature.toOrderedRingSignature.2 rational_model.signature.toZeroOneBundle.2 right ∧ rational_model.signature.toOrderedRingSignature.2 value (rational_model.signature.toBooleanRingOperationBundle.3 left right)))))), ⋯⟩))))) → other = product)

Logical form (Lean):

```lean
theorem product_exists_uniquely (first second : Cut rational_model) :
    ∃ product : Cut rational_model,
      IsProduct rational_model first second product ∧
      ∀ other, IsProduct rational_model first second other → other = product
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
theorem product_exists_uniquely (first second : Cut rational_model) :
    ∃ product : Cut rational_model,
      IsProduct rational_model first second product ∧
      ∀ other, IsProduct rational_model first second other → other = product := by
  sorry

/--
`multiplication` TODO

Predicate logic:

  noncomputable def multiplication
    (first second : Cut rational_model) : Cut rational_model :=
  Classical.choose (product_exists_uniquely rational_model first second)

Predicate logic (unfolded):

  noncomputable def multiplication
    (first second : Cut rational_model) : Cut rational_model :=
  Classical.choose (product_exists_uniquely rational_model first second) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def multiplication
    (first second : Cut rational_model) : Cut rational_model :=
  Classical.choose (product_exists_uniquely rational_model first second)
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
noncomputable def multiplication
    (first second : Cut rational_model) : Cut rational_model :=
  Classical.choose (product_exists_uniquely rational_model first second)

/--
`one` TODO

Predicate logic:

  def one : Cut rational_model :=
  rational_embedding rational_model rational_model.signature.one

Predicate logic (unfolded):

  def one : Cut rational_model :=
  rational_embedding rational_model rational_model.signature.one (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def one : Cut rational_model :=
  rational_embedding rational_model rational_model.signature.one
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
def one : Cut rational_model :=
  rational_embedding rational_model rational_model.signature.one

/--
`IsReciprocal` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (cut reciprocal : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), (LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model cut reciprocal = LRA.NumberSystems.RealNumbers.Dedekind.one rational_model ∧ LRA.NumberSystems.RealNumbers.Dedekind.multiplication rational_model reciprocal cut = LRA.NumberSystems.RealNumbers.Dedekind.one rational_model)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (cut reciprocal : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut reciprocal x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut reciprocal other → other = x)) ⋯ = .1 ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate rational_model.signature.toZeroOneBundle.3, ⋯⟩ ∧ Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model reciprocal cut x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model reciprocal cut other → other = x)) ⋯ = .1 ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate rational_model.signature.toZeroOneBundle.3, ⋯⟩)

Logical form (Lean):

```lean
def IsReciprocal (cut reciprocal : Cut rational_model) : Prop :=
  multiplication rational_model cut reciprocal = one rational_model ∧
  multiplication rational_model reciprocal cut = one rational_model
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
def IsReciprocal (cut reciprocal : Cut rational_model) : Prop :=
  multiplication rational_model cut reciprocal = one rational_model ∧
  multiplication rational_model reciprocal cut = one rational_model

/--
`reciprocal_exists_uniquely` TODO

Predicate logic:

  ∃ reciprocal ∈ Cut rational_model, IsReciprocal rational_model cut reciprocal ∧ ∀ other, IsReciprocal rational_model cut other → other = reciprocal

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (cut = ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate rational_model.signature.zero, ⋯⟩ → False) → Exists fun reciprocal => ((Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut reciprocal x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut reciprocal other → other = x)) ⋯ = .1 ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate rational_model.signature.toZeroOneBundle.3, ⋯⟩ ∧ Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model reciprocal cut x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model reciprocal cut other → other = x)) ⋯ = .1 ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate rational_model.signature.toZeroOneBundle.3, ⋯⟩) ∧ ∀ (other : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut other x ∧ ∀ (other_1 : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut other other_1 → other_1 = x)) ⋯ = .1 ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate rational_model.signature.toZeroOneBundle.3, ⋯⟩ ∧ Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model other cut x ∧ ∀ (other_1 : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model other cut other_1 → other_1 = x)) ⋯ = .1 ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate rational_model.signature.toZeroOneBundle.3, ⋯⟩) → other = reciprocal)

Logical form (Lean):

```lean
theorem reciprocal_exists_uniquely
    (cut : Cut rational_model)
    (cut_nonzero : cut ≠ zero rational_model) :
    ∃ reciprocal : Cut rational_model,
      IsReciprocal rational_model cut reciprocal ∧
      ∀ other, IsReciprocal rational_model cut other → other = reciprocal
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
    (cut : Cut rational_model)
    (cut_nonzero : cut ≠ zero rational_model) :
    ∃ reciprocal : Cut rational_model,
      IsReciprocal rational_model cut reciprocal ∧
      ∀ other, IsReciprocal rational_model cut other → other = reciprocal := by
  sorry

/--
`inverse` TODO

Predicate logic:

  noncomputable def inverse
    (cut : Cut rational_model)
    (cut_nonzero : cut ≠ zero rational_model) : Cut rational_model :=
  Classical.choose
    (reciprocal_exists_uniquely rational_model cut cut_nonzero)

Predicate logic (unfolded):

  noncomputable def inverse
    (cut : Cut rational_model)
    (cut_nonzero : cut ≠ zero rational_model) : Cut rational_model :=
  Classical.choose
    (reciprocal_exists_uniquely rational_model cut cut_nonzero) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def inverse
    (cut : Cut rational_model)
    (cut_nonzero : cut ≠ zero rational_model) : Cut rational_model :=
  Classical.choose
    (reciprocal_exists_uniquely rational_model cut cut_nonzero)
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
    (cut : Cut rational_model)
    (cut_nonzero : cut ≠ zero rational_model) : Cut rational_model :=
  Classical.choose
    (reciprocal_exists_uniquely rational_model cut cut_nonzero)

/--
`inverse_correct` TODO

Predicate logic:

  IsReciprocal rational_model cut (inverse rational_model cut cut_nonzero)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))) (cut_nonzero : cut = ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate rational_model.signature.zero, ⋯⟩ → False), (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut (LRA.NumberSystems.RealNumbers.Dedekind.inverse rational_model cut cut_nonzero) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model cut (LRA.NumberSystems.RealNumbers.Dedekind.inverse rational_model cut cut_nonzero) other → other = x)) ⋯ = .1 ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate rational_model.signature.toZeroOneBundle.3, ⋯⟩ ∧ Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.inverse rational_model cut cut_nonzero) cut x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model), LRA.NumberSystems.RealNumbers.Dedekind.IsProduct rational_model (LRA.NumberSystems.RealNumbers.Dedekind.inverse rational_model cut cut_nonzero) cut other → other = x)) ⋯ = .1 ⟨fun candidate => rational_model.signature.toOrderedRingSignature.2 candidate rational_model.signature.toZeroOneBundle.3, ⋯⟩)

Logical form (Lean):

```lean
theorem inverse_correct
    (cut : Cut rational_model)
    (cut_nonzero : cut ≠ zero rational_model) :
    IsReciprocal rational_model cut
      (inverse rational_model cut cut_nonzero)
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
theorem inverse_correct
    (cut : Cut rational_model)
    (cut_nonzero : cut ≠ zero rational_model) :
    IsReciprocal rational_model cut
      (inverse rational_model cut cut_nonzero) := by
  sorry

/--
`family_union_is_cut` TODO

Predicate logic:

  (Cut rational_model → Prop ∧ ∃ cut, family cut ∧ ∃ upper, ∀ cut, family cut → nonstrict_order rational_model cut upper) → IsCut rational_model (family_union rational_model family)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (family : (Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))) → Prop), (Exists fun cut => family cut ∧ Exists fun upper => ∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), family cut → ∀ (value : rational_model.signature.toCarrierBundle.1), cut.1 value → upper.1 value) → (Exists fun value => Exists fun cut => (family cut ∧ cut.1 value) ∧ (Exists fun value => (Exists fun cut => (family cut ∧ cut.1 value)) → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), (Exists fun cut => (family cut ∧ cut.1 upper)) → rational_model.signature.toOrderedRingSignature.2 lower upper → Exists fun cut => (family cut ∧ cut.1 lower) ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), (Exists fun cut => (family cut ∧ cut.1 value)) → Exists fun greater => (Exists fun cut => (family cut ∧ cut.1 greater) ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))

Logical form (Lean):

```lean
theorem family_union_is_cut
    (family : Cut rational_model → Prop)
    (family_nonempty : ∃ cut, family cut)
    (family_bounded :
      ∃ upper,
        ∀ cut,
          family cut → nonstrict_order rational_model cut upper) :
    IsCut rational_model (family_union rational_model family)
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
theorem family_union_is_cut
    (family : Cut rational_model → Prop)
    (family_nonempty : ∃ cut, family cut)
    (family_bounded :
      ∃ upper,
        ∀ cut,
          family cut → nonstrict_order rational_model cut upper) :
    IsCut rational_model (family_union rational_model family) := by
  sorry

/--
`family_supremum` TODO

Predicate logic:

  def family_supremum
    (family : Cut rational_model → Prop)
    (family_nonempty : ∃ cut, family cut)
    (family_bounded :
      ∃ upper,
        ∀ cut,
          family cut → nonstrict_order rational_model cut upper) :
    Cut rational_model :=
  ⟨family_union rational_model family,
    family_union_is_cut rational_model family
      family_nonempty family_bounded⟩

Predicate logic (unfolded):

  def family_supremum
    (family : Cut rational_model → Prop)
    (family_nonempty : ∃ cut, family cut)
    (family_bounded :
      ∃ upper,
        ∀ cut,
          family cut → nonstrict_order rational_model cut upper) :
    Cut rational_model :=
  ⟨family_union rational_model family,
    family_union_is_cut rational_model family
      family_nonempty family_bounded⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def family_supremum
    (family : Cut rational_model → Prop)
    (family_nonempty : ∃ cut, family cut)
    (family_bounded :
      ∃ upper,
        ∀ cut,
          family cut → nonstrict_order rational_model cut upper) :
    Cut rational_model :=
  ⟨family_union rational_model family,
    family_union_is_cut rational_model family
      family_nonempty family_bounded⟩
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def family_supremum
    (family : Cut rational_model → Prop)
    (family_nonempty : ∃ cut, family cut)
    (family_bounded :
      ∃ upper,
        ∀ cut,
          family cut → nonstrict_order rational_model cut upper) :
    Cut rational_model :=
  ⟨family_union rational_model family,
    family_union_is_cut rational_model family
      family_nonempty family_bounded⟩

/--
`family_union_is_supremum` TODO

Predicate logic:

  (Cut rational_model → Prop ∧ ∃ cut, family cut ∧ ∃ upper, ∀ cut, family cut → nonstrict_order rational_model cut upper) → (∀ cut, family cut → nonstrict_order rational_model cut (family_supremum rational_model family family_nonempty family_bounded)) ∧ (∀ upper, (∀ cut, family cut → nonstrict_order rational_model cut upper) → nonstrict_order rational_model (family_supremum rational_model family family_nonempty family_bounded) upper)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (family : (Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))) → Prop) (family_nonempty : Exists fun cut => family cut) (family_bounded : Exists fun upper => ∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), family cut → ∀ (value : rational_model.signature.toCarrierBundle.1), cut.1 value → upper.1 value), (∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), family cut → ∀ (value : rational_model.signature.toCarrierBundle.1), cut.1 value → (LRA.NumberSystems.RealNumbers.Dedekind.family_supremum rational_model family family_nonempty family_bounded).1 value ∧ ∀ (upper : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), (∀ (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), family cut → ∀ (value : rational_model.signature.toCarrierBundle.1), cut.1 value → upper.1 value) → ∀ (value : rational_model.signature.toCarrierBundle.1), (LRA.NumberSystems.RealNumbers.Dedekind.family_supremum rational_model family family_nonempty family_bounded).1 value → upper.1 value)

Logical form (Lean):

```lean
theorem family_union_is_supremum
    (family : Cut rational_model → Prop)
    (family_nonempty : ∃ cut, family cut)
    (family_bounded :
      ∃ upper,
        ∀ cut,
          family cut → nonstrict_order rational_model cut upper) :
    (∀ cut,
      family cut →
      nonstrict_order rational_model cut
        (family_supremum rational_model family
          family_nonempty family_bounded)) ∧
    (∀ upper,
      (∀ cut,
        family cut → nonstrict_order rational_model cut upper) →
      nonstrict_order rational_model
        (family_supremum rational_model family
          family_nonempty family_bounded)
        upper)
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
theorem family_union_is_supremum
    (family : Cut rational_model → Prop)
    (family_nonempty : ∃ cut, family cut)
    (family_bounded :
      ∃ upper,
        ∀ cut,
          family cut → nonstrict_order rational_model cut upper) :
    (∀ cut,
      family cut →
      nonstrict_order rational_model cut
        (family_supremum rational_model family
          family_nonempty family_bounded)) ∧
    (∀ upper,
      (∀ cut,
        family cut → nonstrict_order rational_model cut upper) →
      nonstrict_order rational_model
        (family_supremum rational_model family
          family_nonempty family_bounded)
        upper) := by
  sorry

end LRA.NumberSystems.RealNumbers.Dedekind
