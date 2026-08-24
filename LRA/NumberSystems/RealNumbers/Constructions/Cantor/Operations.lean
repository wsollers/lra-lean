import LRA.NumberSystems.RealNumbers.Constructions.Cantor.WellFoundedness

namespace LRA.NumberSystems.RealNumbers.Cantor
open LRA.NumberSystems.Interface.ModelTheory

/--
`IsEndpointSum` TODO

Predicate logic:

  ∀ (fieldModel : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (first second result : LRA.NumberSystems.RealNumbers.Cantor.EndpointInterval fieldModel), (result.lower = fieldModel.signature.add first.lower second.lower ∧ result.upper = fieldModel.signature.add first.upper second.upper)

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (first second result : LRA.NumberSystems.RealNumbers.Cantor.EndpointInterval fieldModel), (result.1 = fieldModel.signature.toBooleanRingOperationBundle.2 first.1 second.1 ∧ result.2 = fieldModel.signature.toBooleanRingOperationBundle.2 first.2 second.2)

Logical form (Lean):

```lean
def IsEndpointSum
    (fieldModel : DenselyOrderedFieldModel)
    (first second result : EndpointInterval fieldModel) : Prop :=
  result.lower = fieldModel.signature.add first.lower second.lower ∧
  result.upper = fieldModel.signature.add first.upper second.upper
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
def IsEndpointSum
    (fieldModel : DenselyOrderedFieldModel)
    (first second result : EndpointInterval fieldModel) : Prop :=
  result.lower = fieldModel.signature.add first.lower second.lower ∧
  result.upper = fieldModel.signature.add first.upper second.upper

/--
`IsEndpointNegation` TODO

Predicate logic:

  ∀ (fieldModel : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (interval result : LRA.NumberSystems.RealNumbers.Cantor.EndpointInterval fieldModel), (result.lower = fieldModel.signature.neg interval.upper ∧ result.upper = fieldModel.signature.neg interval.lower)

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (interval result : LRA.NumberSystems.RealNumbers.Cantor.EndpointInterval fieldModel), (result.1 = fieldModel.signature.toRingConceptSignature.2 interval.2 ∧ result.2 = fieldModel.signature.toRingConceptSignature.2 interval.1)

Logical form (Lean):

```lean
def IsEndpointNegation
    (fieldModel : DenselyOrderedFieldModel)
    (interval result : EndpointInterval fieldModel) : Prop :=
  result.lower = fieldModel.signature.neg interval.upper ∧
  result.upper = fieldModel.signature.neg interval.lower
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
def IsEndpointNegation
    (fieldModel : DenselyOrderedFieldModel)
    (interval result : EndpointInterval fieldModel) : Prop :=
  result.lower = fieldModel.signature.neg interval.upper ∧
  result.upper = fieldModel.signature.neg interval.lower

/--
`IsCornerProduct` TODO

Predicate logic:

  ∀ (fieldModel : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (first second : LRA.NumberSystems.RealNumbers.Cantor.EndpointInterval fieldModel) (value : fieldModel.signature.carrier), Or (value = fieldModel.signature.multiply first.lower second.lower) (Or (value = fieldModel.signature.multiply first.lower second.upper) (Or (value = fieldModel.signature.multiply first.upper second.lower) (value = fieldModel.signature.multiply first.upper second.upper)))

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (first second : LRA.NumberSystems.RealNumbers.Cantor.EndpointInterval fieldModel) (value : fieldModel.signature.toCarrierBundle.1), Or (value = fieldModel.signature.toBooleanRingOperationBundle.3 first.1 second.1) (Or (value = fieldModel.signature.toBooleanRingOperationBundle.3 first.1 second.2) (Or (value = fieldModel.signature.toBooleanRingOperationBundle.3 first.2 second.1) (value = fieldModel.signature.toBooleanRingOperationBundle.3 first.2 second.2)))

Logical form (Lean):

```lean
def IsCornerProduct
    (fieldModel : DenselyOrderedFieldModel)
    (first second : EndpointInterval fieldModel)
    (value : fieldModel.signature.carrier) : Prop :=
  value = fieldModel.signature.multiply first.lower second.lower ∨
  value = fieldModel.signature.multiply first.lower second.upper ∨
  value = fieldModel.signature.multiply first.upper second.lower ∨
  value = fieldModel.signature.multiply first.upper second.upper
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
    (fieldModel : DenselyOrderedFieldModel)
    (first second : EndpointInterval fieldModel)
    (value : fieldModel.signature.carrier) : Prop :=
  value = fieldModel.signature.multiply first.lower second.lower ∨
  value = fieldModel.signature.multiply first.lower second.upper ∨
  value = fieldModel.signature.multiply first.upper second.lower ∨
  value = fieldModel.signature.multiply first.upper second.upper

/--
`IsEndpointProduct` TODO

Predicate logic:

  ∀ (fieldModel : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (first second result : LRA.NumberSystems.RealNumbers.Cantor.EndpointInterval fieldModel), (∀ (corner : fieldModel.signature.carrier), LRA.NumberSystems.RealNumbers.Cantor.IsCornerProduct fieldModel first second corner → fieldModel.signature.le result.lower corner ∧ (∀ (corner : fieldModel.signature.carrier), LRA.NumberSystems.RealNumbers.Cantor.IsCornerProduct fieldModel first second corner → fieldModel.signature.le corner result.upper ∧ (LRA.NumberSystems.RealNumbers.Cantor.IsCornerProduct fieldModel first second result.lower ∧ LRA.NumberSystems.RealNumbers.Cantor.IsCornerProduct fieldModel first second result.upper)))

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (first second result : LRA.NumberSystems.RealNumbers.Cantor.EndpointInterval fieldModel), (∀ (corner : fieldModel.signature.toCarrierBundle.1), Or (corner = fieldModel.signature.toBooleanRingOperationBundle.3 first.1 second.1) (Or (corner = fieldModel.signature.toBooleanRingOperationBundle.3 first.1 second.2) (Or (corner = fieldModel.signature.toBooleanRingOperationBundle.3 first.2 second.1) (corner = fieldModel.signature.toBooleanRingOperationBundle.3 first.2 second.2))) → fieldModel.signature.toOrderedRingConceptSignature.2 result.1 corner ∧ (∀ (corner : fieldModel.signature.toCarrierBundle.1), Or (corner = fieldModel.signature.toBooleanRingOperationBundle.3 first.1 second.1) (Or (corner = fieldModel.signature.toBooleanRingOperationBundle.3 first.1 second.2) (Or (corner = fieldModel.signature.toBooleanRingOperationBundle.3 first.2 second.1) (corner = fieldModel.signature.toBooleanRingOperationBundle.3 first.2 second.2))) → fieldModel.signature.toOrderedRingConceptSignature.2 corner result.2 ∧ (Or (result.1 = fieldModel.signature.toBooleanRingOperationBundle.3 first.1 second.1) (Or (result.1 = fieldModel.signature.toBooleanRingOperationBundle.3 first.1 second.2) (Or (result.1 = fieldModel.signature.toBooleanRingOperationBundle.3 first.2 second.1) (result.1 = fieldModel.signature.toBooleanRingOperationBundle.3 first.2 second.2))) ∧ Or (result.2 = fieldModel.signature.toBooleanRingOperationBundle.3 first.1 second.1) (Or (result.2 = fieldModel.signature.toBooleanRingOperationBundle.3 first.1 second.2) (Or (result.2 = fieldModel.signature.toBooleanRingOperationBundle.3 first.2 second.1) (result.2 = fieldModel.signature.toBooleanRingOperationBundle.3 first.2 second.2))))))

Logical form (Lean):

```lean
def IsEndpointProduct
    (fieldModel : DenselyOrderedFieldModel)
    (first second result : EndpointInterval fieldModel) : Prop :=
  (∀ corner, IsCornerProduct fieldModel first second corner →
    fieldModel.signature.le result.lower corner) ∧
  (∀ corner, IsCornerProduct fieldModel first second corner →
    fieldModel.signature.le corner result.upper) ∧
  IsCornerProduct fieldModel first second result.lower ∧
  IsCornerProduct fieldModel first second result.upper
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
def IsEndpointProduct
    (fieldModel : DenselyOrderedFieldModel)
    (first second result : EndpointInterval fieldModel) : Prop :=
  (∀ corner, IsCornerProduct fieldModel first second corner →
    fieldModel.signature.le result.lower corner) ∧
  (∀ corner, IsCornerProduct fieldModel first second corner →
    fieldModel.signature.le corner result.upper) ∧
  IsCornerProduct fieldModel first second result.lower ∧
  IsCornerProduct fieldModel first second result.upper

/--
`IsNestedAndShrinking` TODO

Predicate logic:

  ∀ (fieldModel : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (sequence : Nat → LRA.NumberSystems.RealNumbers.Cantor.EndpointInterval fieldModel), (∀ (index : Nat), (fieldModel.signature.le (sequence index).lower (sequence (instHAdd.hAdd index 1)).lower ∧ fieldModel.signature.le (sequence (instHAdd.hAdd index 1)).upper (sequence index).upper) ∧ ∀ (positive_tolerance : fieldModel.signature.carrier), fieldModel.signature.StrictOrder fieldModel.signature.zero positive_tolerance → Exists fun index => fieldModel.signature.StrictOrder (fieldModel.signature.add (sequence index).upper (fieldModel.signature.neg (sequence index).lower)) positive_tolerance)

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel) (sequence : Nat → LRA.NumberSystems.RealNumbers.Cantor.EndpointInterval fieldModel), (∀ (index : Nat), (fieldModel.signature.toOrderedRingConceptSignature.2 (sequence index).1 (sequence (instHAdd.hAdd index 1)).1 ∧ fieldModel.signature.toOrderedRingConceptSignature.2 (sequence (instHAdd.hAdd index 1)).2 (sequence index).2) ∧ ∀ (positive_tolerance : fieldModel.signature.toCarrierBundle.1), fieldModel.signature.toOrderedRingSignature.2 fieldModel.signature.toZeroOneBundle.2 positive_tolerance → Exists fun index => fieldModel.signature.toOrderedRingSignature.2 (fieldModel.signature.toBooleanRingOperationBundle.2 (sequence index).2 (fieldModel.signature.toRingConceptSignature.2 (sequence index).1)) positive_tolerance)

Logical form (Lean):

```lean
def IsNestedAndShrinking
    (fieldModel : DenselyOrderedFieldModel)
    (sequence : Nat → EndpointInterval fieldModel) : Prop :=
  (∀ index : Nat,
    fieldModel.signature.le (sequence index).lower (sequence (index + 1)).lower ∧
    fieldModel.signature.le (sequence (index + 1)).upper (sequence index).upper) ∧
  (∀ positive_tolerance : fieldModel.signature.carrier,
    fieldModel.signature.StrictOrder fieldModel.signature.zero positive_tolerance →
    ∃ index : Nat,
      fieldModel.signature.StrictOrder
        (fieldModel.signature.add
          (sequence index).upper
          (fieldModel.signature.neg (sequence index).lower))
        positive_tolerance)
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
def IsNestedAndShrinking
    (fieldModel : DenselyOrderedFieldModel)
    (sequence : Nat → EndpointInterval fieldModel) : Prop :=
  (∀ index : Nat,
    fieldModel.signature.le (sequence index).lower (sequence (index + 1)).lower ∧
    fieldModel.signature.le (sequence (index + 1)).upper (sequence index).upper) ∧
  (∀ positive_tolerance : fieldModel.signature.carrier,
    fieldModel.signature.StrictOrder fieldModel.signature.zero positive_tolerance →
    ∃ index : Nat,
      fieldModel.signature.StrictOrder
        (fieldModel.signature.add
          (sequence index).upper
          (fieldModel.signature.neg (sequence index).lower))
        positive_tolerance)

end LRA.NumberSystems.RealNumbers.Cantor
