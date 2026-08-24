
import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals.WellFoundedness

namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervals
open LRA.NumberSystems.Interface.ModelTheory

variable (rational_model : DenselyOrderedFieldModel)

/--
`IsIntervalSum` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (first second result : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.RationalInterval rational_model), (result.left_endpoint = rational_model.signature.add first.left_endpoint second.left_endpoint ∧ result.right_endpoint = rational_model.signature.add first.right_endpoint second.right_endpoint)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (first second result : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.RationalInterval rational_model), (result.1 = rational_model.signature.toBooleanRingOperationBundle.2 first.1 second.1 ∧ result.2 = rational_model.signature.toBooleanRingOperationBundle.2 first.2 second.2)

Logical form (Lean):

```lean
def IsIntervalSum
    (first second result : RationalInterval rational_model) : Prop :=
  result.left_endpoint =
      rational_model.signature.add
        first.left_endpoint second.left_endpoint ∧
  result.right_endpoint =
      rational_model.signature.add
        first.right_endpoint second.right_endpoint
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
def IsIntervalSum
    (first second result : RationalInterval rational_model) : Prop :=
  result.left_endpoint =
      rational_model.signature.add
        first.left_endpoint second.left_endpoint ∧
  result.right_endpoint =
      rational_model.signature.add
        first.right_endpoint second.right_endpoint

/--
`IsIntervalNegation` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (interval result : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.RationalInterval rational_model), (result.left_endpoint = rational_model.signature.neg interval.right_endpoint ∧ result.right_endpoint = rational_model.signature.neg interval.left_endpoint)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (interval result : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.RationalInterval rational_model), (result.1 = rational_model.signature.toRingConceptSignature.2 interval.2 ∧ result.2 = rational_model.signature.toRingConceptSignature.2 interval.1)

Logical form (Lean):

```lean
def IsIntervalNegation
    (interval result : RationalInterval rational_model) : Prop :=
  result.left_endpoint =
      rational_model.signature.neg interval.right_endpoint ∧
  result.right_endpoint =
      rational_model.signature.neg interval.left_endpoint
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
def IsIntervalNegation
    (interval result : RationalInterval rational_model) : Prop :=
  result.left_endpoint =
      rational_model.signature.neg interval.right_endpoint ∧
  result.right_endpoint =
      rational_model.signature.neg interval.left_endpoint

/--
`IsCornerProduct` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (first second : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.RationalInterval rational_model) (value : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Rational rational_model), Or (value = rational_model.signature.multiply first.left_endpoint second.left_endpoint) (Or (value = rational_model.signature.multiply first.left_endpoint second.right_endpoint) (Or (value = rational_model.signature.multiply first.right_endpoint second.left_endpoint) (value = rational_model.signature.multiply first.right_endpoint second.right_endpoint)))

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (first second : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.RationalInterval rational_model) (value : rational_model.signature.toCarrierBundle.1), Or (value = rational_model.signature.toBooleanRingOperationBundle.3 first.1 second.1) (Or (value = rational_model.signature.toBooleanRingOperationBundle.3 first.1 second.2) (Or (value = rational_model.signature.toBooleanRingOperationBundle.3 first.2 second.1) (value = rational_model.signature.toBooleanRingOperationBundle.3 first.2 second.2)))

Logical form (Lean):

```lean
def IsCornerProduct
    (first second : RationalInterval rational_model)
    (value : Rational rational_model) : Prop :=
  value = rational_model.signature.multiply
      first.left_endpoint second.left_endpoint ∨
  value = rational_model.signature.multiply
      first.left_endpoint second.right_endpoint ∨
  value = rational_model.signature.multiply
      first.right_endpoint second.left_endpoint ∨
  value = rational_model.signature.multiply
      first.right_endpoint second.right_endpoint
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
def IsCornerProduct
    (first second : RationalInterval rational_model)
    (value : Rational rational_model) : Prop :=
  value = rational_model.signature.multiply
      first.left_endpoint second.left_endpoint ∨
  value = rational_model.signature.multiply
      first.left_endpoint second.right_endpoint ∨
  value = rational_model.signature.multiply
      first.right_endpoint second.left_endpoint ∨
  value = rational_model.signature.multiply
      first.right_endpoint second.right_endpoint

/--
`IsIntervalProduct` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (first second result : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.RationalInterval rational_model), (∀ (corner : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Rational rational_model), LRA.NumberSystems.RealNumbers.PrimitiveIntervals.IsCornerProduct rational_model first second corner → rational_model.signature.le result.left_endpoint corner ∧ (∀ (corner : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Rational rational_model), LRA.NumberSystems.RealNumbers.PrimitiveIntervals.IsCornerProduct rational_model first second corner → rational_model.signature.le corner result.right_endpoint ∧ (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.IsCornerProduct rational_model first second result.left_endpoint ∧ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.IsCornerProduct rational_model first second result.right_endpoint)))

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (first second result : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.RationalInterval rational_model), (∀ (corner : rational_model.signature.toCarrierBundle.1), Or (corner = rational_model.signature.toBooleanRingOperationBundle.3 first.1 second.1) (Or (corner = rational_model.signature.toBooleanRingOperationBundle.3 first.1 second.2) (Or (corner = rational_model.signature.toBooleanRingOperationBundle.3 first.2 second.1) (corner = rational_model.signature.toBooleanRingOperationBundle.3 first.2 second.2))) → rational_model.signature.toOrderedRingConceptSignature.2 result.1 corner ∧ (∀ (corner : rational_model.signature.toCarrierBundle.1), Or (corner = rational_model.signature.toBooleanRingOperationBundle.3 first.1 second.1) (Or (corner = rational_model.signature.toBooleanRingOperationBundle.3 first.1 second.2) (Or (corner = rational_model.signature.toBooleanRingOperationBundle.3 first.2 second.1) (corner = rational_model.signature.toBooleanRingOperationBundle.3 first.2 second.2))) → rational_model.signature.toOrderedRingConceptSignature.2 corner result.2 ∧ (Or (result.1 = rational_model.signature.toBooleanRingOperationBundle.3 first.1 second.1) (Or (result.1 = rational_model.signature.toBooleanRingOperationBundle.3 first.1 second.2) (Or (result.1 = rational_model.signature.toBooleanRingOperationBundle.3 first.2 second.1) (result.1 = rational_model.signature.toBooleanRingOperationBundle.3 first.2 second.2))) ∧ Or (result.2 = rational_model.signature.toBooleanRingOperationBundle.3 first.1 second.1) (Or (result.2 = rational_model.signature.toBooleanRingOperationBundle.3 first.1 second.2) (Or (result.2 = rational_model.signature.toBooleanRingOperationBundle.3 first.2 second.1) (result.2 = rational_model.signature.toBooleanRingOperationBundle.3 first.2 second.2))))))

Logical form (Lean):

```lean
def IsIntervalProduct
    (first second result : RationalInterval rational_model) : Prop :=
  (∀ corner,
    IsCornerProduct rational_model first second corner →
    rational_model.signature.le result.left_endpoint corner) ∧
  (∀ corner,
    IsCornerProduct rational_model first second corner →
    rational_model.signature.le corner result.right_endpoint) ∧
  IsCornerProduct rational_model first second result.left_endpoint ∧
  IsCornerProduct rational_model first second result.right_endpoint
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
def IsIntervalProduct
    (first second result : RationalInterval rational_model) : Prop :=
  (∀ corner,
    IsCornerProduct rational_model first second corner →
    rational_model.signature.le result.left_endpoint corner) ∧
  (∀ corner,
    IsCornerProduct rational_model first second corner →
    rational_model.signature.le corner result.right_endpoint) ∧
  IsCornerProduct rational_model first second result.left_endpoint ∧
  IsCornerProduct rational_model first second result.right_endpoint

/--
`zero` TODO

Predicate logic:

  noncomputable def zero : Carrier rational_model :=
  rational_embedding rational_model rational_model.signature.zero

Predicate logic (unfolded):

  noncomputable def zero : Carrier rational_model :=
  rational_embedding rational_model rational_model.signature.zero (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def zero : Carrier rational_model :=
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
noncomputable def zero : Carrier rational_model :=
  rational_embedding rational_model rational_model.signature.zero

/--
`one` TODO

Predicate logic:

  noncomputable def one : Carrier rational_model :=
  rational_embedding rational_model rational_model.signature.one

Predicate logic (unfolded):

  noncomputable def one : Carrier rational_model :=
  rational_embedding rational_model rational_model.signature.one (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def one : Carrier rational_model :=
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
noncomputable def one : Carrier rational_model :=
  rational_embedding rational_model rational_model.signature.one

/--
`representative_strict_order` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (first second : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), Exists fun first_index => Exists fun second_index => rational_model.signature.StrictOrder (first.interval first_index).right_endpoint (second.interval second_index).left_endpoint

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (first second : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), Exists fun first_index => Exists fun second_index => rational_model.signature.toOrderedRingSignature.2 (first.interval first_index).2 (second.interval second_index).1

Logical form (Lean):

```lean
def representative_strict_order
    (first second : Representative rational_model) : Prop :=
  ∃ first_index second_index,
    rational_model.signature.StrictOrder
      (first.interval first_index).right_endpoint
      (second.interval second_index).left_endpoint
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
def representative_strict_order
    (first second : Representative rational_model) : Prop :=
  ∃ first_index second_index,
    rational_model.signature.StrictOrder
      (first.interval first_index).right_endpoint
      (second.interval second_index).left_endpoint

end LRA.NumberSystems.RealNumbers.PrimitiveIntervals
