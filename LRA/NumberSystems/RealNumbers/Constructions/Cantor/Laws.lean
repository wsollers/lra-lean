import LRA.NumberSystems.RealNumbers.Constructions.Cantor.WellDefinedness
import LRA.Operation.Laws.QuotientCompatible.Definition

namespace LRA.NumberSystems.RealNumbers.Cantor
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory
open LRA.Operation.Laws.QuotientCompatible

/--
`addition` TODO

Predicate logic:

  noncomputable def addition
    (fieldModel : RationalModel)
    (first second : NestedIntervalSequence fieldModel) :
    NestedIntervalSequence fieldModel where
  interval := representative_addition fieldModel first second
  nested := (representative_addition_is_nested_and_shrinking fieldModel first second).1
  widths_converge_to_zero :=
    (representative_addition_is_nested_and_shrinking fieldModel first second).2

Predicate logic (unfolded):

  noncomputable def addition
    (fieldModel : RationalModel)
    (first second : NestedIntervalSequence fieldModel) :
    NestedIntervalSequence fieldModel where
  interval := representative_addition fieldModel first second
  nested := (representative_addition_is_nested_and_shrinking fieldModel first second).1
  widths_converge_to_zero :=
    (representative_addition_is_nested_and_shrinking fieldModel first second).2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def addition
    (fieldModel : RationalModel)
    (first second : NestedIntervalSequence fieldModel) :
    NestedIntervalSequence fieldModel where
  interval := representative_addition fieldModel first second
  nested := (representative_addition_is_nested_and_shrinking fieldModel first second).1
  widths_converge_to_zero :=
    (representative_addition_is_nested_and_shrinking fieldModel first second).2
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
noncomputable def addition
    (fieldModel : RationalModel)
    (first second : NestedIntervalSequence fieldModel) :
    NestedIntervalSequence fieldModel where
  interval := representative_addition fieldModel first second
  nested := (representative_addition_is_nested_and_shrinking fieldModel first second).1
  widths_converge_to_zero :=
    (representative_addition_is_nested_and_shrinking fieldModel first second).2

/--
`representative_addition_respects_equivalence` TODO

Predicate logic:

  (∀ fieldModel ∈ RationalModel), LRA.UniversalAlgebra.Quotient.binary_operation_respects (EndpointSetoid fieldModel) (addition fieldModel)

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first_representative first_replacement second_representative second_replacement : LRA.NumberSystems.RealNumbers.Cantor.NestedIntervalSequence fieldModel), ((LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid fieldModel).1 first_representative first_replacement ∧ (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid fieldModel).1 second_representative second_replacement) → (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid fieldModel).1 { interval := fun index => (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Cantor.IsEndpointSum fieldModel (first_representative.interval index) (second_representative.interval index) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Cantor.EndpointInterval fieldModel), LRA.NumberSystems.RealNumbers.Cantor.IsEndpointSum fieldModel (first_representative.interval index) (second_representative.interval index) other → other = x)) ⋯).val, nested := ⋯, widths_converge_to_zero := ⋯ } { interval := fun index => (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Cantor.IsEndpointSum fieldModel (first_replacement.interval index) (second_replacement.interval index) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Cantor.EndpointInterval fieldModel), LRA.NumberSystems.RealNumbers.Cantor.IsEndpointSum fieldModel (first_replacement.interval index) (second_replacement.interval index) other → other = x)) ⋯).val, nested := ⋯, widths_converge_to_zero := ⋯ }

Logical form (Lean):

```lean
theorem representative_addition_respects_equivalence
    (fieldModel : RationalModel) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      (EndpointSetoid fieldModel) (addition fieldModel)
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
theorem representative_addition_respects_equivalence
    (fieldModel : RationalModel) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      (EndpointSetoid fieldModel) (addition fieldModel) := by
  sorry

/--
`addition_is_proper` TODO

Predicate logic:

  (∀ fieldModel ∈ RationalModel), BinaryOperationIsProper (IsNestedAndShrinking fieldModel) (fun representative => representative.interval) (representative_addition fieldModel) (EndpointSetoid fieldModel) (addition fieldModel)

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), LRA.Operation.Laws.QuotientCompatible.BinaryOperationIsProper (fun sequence => (∀ (index : Nat), (fieldModel.signature.toOrderedRingConceptSignature.2 (sequence index).1 (sequence (instHAdd.hAdd index 1)).1 ∧ fieldModel.signature.toOrderedRingConceptSignature.2 (sequence (instHAdd.hAdd index 1)).2 (sequence index).2) ∧ ∀ (positive_tolerance : fieldModel.signature.toCarrierBundle.1), fieldModel.signature.toOrderedRingSignature.2 fieldModel.signature.toZeroOneBundle.2 positive_tolerance → Exists fun index => fieldModel.signature.toOrderedRingSignature.2 (fieldModel.signature.toBooleanRingOperationBundle.2 (sequence index).2 (fieldModel.signature.toRingConceptSignature.2 (sequence index).1)) positive_tolerance)) (fun representative => representative.1) (fun first second index => (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Cantor.IsEndpointSum fieldModel (first.interval index) (second.interval index) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Cantor.EndpointInterval fieldModel), LRA.NumberSystems.RealNumbers.Cantor.IsEndpointSum fieldModel (first.interval index) (second.interval index) other → other = x)) ⋯).1) { r := fun first second => ∀ (tolerance : fieldModel.1), fieldModel.ltInst.1 fieldModel.zeroInst.1 tolerance → Exists fun index => (fieldModel.signature.toOrderedRingSignature.2 (fieldModel.signature.toBooleanRingOperationBundle.2 (first.interval index).1 (fieldModel.signature.toRingConceptSignature.2 (second.interval index).2)) tolerance ∧ fieldModel.signature.toOrderedRingSignature.2 (fieldModel.signature.toBooleanRingOperationBundle.2 (second.interval index).1 (fieldModel.signature.toRingConceptSignature.2 (first.interval index).2)) tolerance), iseqv := ⋯ } fun first second => { interval := fun index => (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Cantor.IsEndpointSum fieldModel (first.interval index) (second.interval index) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Cantor.EndpointInterval fieldModel), LRA.NumberSystems.RealNumbers.Cantor.IsEndpointSum fieldModel (first.interval index) (second.interval index) other → other = x)) ⋯).1, nested := ⋯, widths_converge_to_zero := ⋯ }

Logical form (Lean):

```lean
theorem addition_is_proper
    (fieldModel : RationalModel) :
    BinaryOperationIsProper
      (IsNestedAndShrinking fieldModel)
      (fun representative => representative.interval)
      (representative_addition fieldModel)
      (EndpointSetoid fieldModel)
      (addition fieldModel)
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
theorem addition_is_proper
    (fieldModel : RationalModel) :
    BinaryOperationIsProper
      (IsNestedAndShrinking fieldModel)
      (fun representative => representative.interval)
      (representative_addition fieldModel)
      (EndpointSetoid fieldModel)
      (addition fieldModel) := by
  sorry

/--
`negation` TODO

Predicate logic:

  noncomputable def negation
    (fieldModel : RationalModel)
    (sequence : NestedIntervalSequence fieldModel) :
    NestedIntervalSequence fieldModel where
  interval := representative_negation fieldModel sequence
  nested := (representative_negation_is_nested_and_shrinking fieldModel sequence).1
  widths_converge_to_zero :=
    (representative_negation_is_nested_and_shrinking fieldModel sequence).2

Predicate logic (unfolded):

  noncomputable def negation
    (fieldModel : RationalModel)
    (sequence : NestedIntervalSequence fieldModel) :
    NestedIntervalSequence fieldModel where
  interval := representative_negation fieldModel sequence
  nested := (representative_negation_is_nested_and_shrinking fieldModel sequence).1
  widths_converge_to_zero :=
    (representative_negation_is_nested_and_shrinking fieldModel sequence).2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def negation
    (fieldModel : RationalModel)
    (sequence : NestedIntervalSequence fieldModel) :
    NestedIntervalSequence fieldModel where
  interval := representative_negation fieldModel sequence
  nested := (representative_negation_is_nested_and_shrinking fieldModel sequence).1
  widths_converge_to_zero :=
    (representative_negation_is_nested_and_shrinking fieldModel sequence).2
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
noncomputable def negation
    (fieldModel : RationalModel)
    (sequence : NestedIntervalSequence fieldModel) :
    NestedIntervalSequence fieldModel where
  interval := representative_negation fieldModel sequence
  nested := (representative_negation_is_nested_and_shrinking fieldModel sequence).1
  widths_converge_to_zero :=
    (representative_negation_is_nested_and_shrinking fieldModel sequence).2

/--
`representative_negation_respects_equivalence` TODO

Predicate logic:

  (∀ fieldModel ∈ RationalModel), LRA.UniversalAlgebra.Quotient.unary_operation_respects (EndpointSetoid fieldModel) (negation fieldModel)

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first_representative second_representative : LRA.NumberSystems.RealNumbers.Cantor.NestedIntervalSequence fieldModel), (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid fieldModel).1 first_representative second_representative → (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid fieldModel).1 { interval := fun index => (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Cantor.IsEndpointNegation fieldModel (first_representative.interval index) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Cantor.EndpointInterval fieldModel), LRA.NumberSystems.RealNumbers.Cantor.IsEndpointNegation fieldModel (first_representative.interval index) other → other = x)) ⋯).val, nested := ⋯, widths_converge_to_zero := ⋯ } { interval := fun index => (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Cantor.IsEndpointNegation fieldModel (second_representative.interval index) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Cantor.EndpointInterval fieldModel), LRA.NumberSystems.RealNumbers.Cantor.IsEndpointNegation fieldModel (second_representative.interval index) other → other = x)) ⋯).val, nested := ⋯, widths_converge_to_zero := ⋯ }

Logical form (Lean):

```lean
theorem representative_negation_respects_equivalence
    (fieldModel : RationalModel) :
    LRA.UniversalAlgebra.Quotient.unary_operation_respects
      (EndpointSetoid fieldModel) (negation fieldModel)
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
theorem representative_negation_respects_equivalence
    (fieldModel : RationalModel) :
    LRA.UniversalAlgebra.Quotient.unary_operation_respects
      (EndpointSetoid fieldModel) (negation fieldModel) := by
  sorry

/--
`negation_is_proper` TODO

Predicate logic:

  (∀ fieldModel ∈ RationalModel), UnaryOperationIsProper (IsNestedAndShrinking fieldModel) (fun representative => representative.interval) (representative_negation fieldModel) (EndpointSetoid fieldModel) (negation fieldModel)

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), LRA.Operation.Laws.QuotientCompatible.UnaryOperationIsProper (fun sequence => (∀ (index : Nat), (fieldModel.signature.toOrderedRingConceptSignature.2 (sequence index).1 (sequence (instHAdd.hAdd index 1)).1 ∧ fieldModel.signature.toOrderedRingConceptSignature.2 (sequence (instHAdd.hAdd index 1)).2 (sequence index).2) ∧ ∀ (positive_tolerance : fieldModel.signature.toCarrierBundle.1), fieldModel.signature.toOrderedRingSignature.2 fieldModel.signature.toZeroOneBundle.2 positive_tolerance → Exists fun index => fieldModel.signature.toOrderedRingSignature.2 (fieldModel.signature.toBooleanRingOperationBundle.2 (sequence index).2 (fieldModel.signature.toRingConceptSignature.2 (sequence index).1)) positive_tolerance)) (fun representative => representative.1) (fun sequence index => (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Cantor.IsEndpointNegation fieldModel (sequence.interval index) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Cantor.EndpointInterval fieldModel), LRA.NumberSystems.RealNumbers.Cantor.IsEndpointNegation fieldModel (sequence.interval index) other → other = x)) ⋯).1) { r := fun first second => ∀ (tolerance : fieldModel.1), fieldModel.ltInst.1 fieldModel.zeroInst.1 tolerance → Exists fun index => (fieldModel.signature.toOrderedRingSignature.2 (fieldModel.signature.toBooleanRingOperationBundle.2 (first.interval index).1 (fieldModel.signature.toRingConceptSignature.2 (second.interval index).2)) tolerance ∧ fieldModel.signature.toOrderedRingSignature.2 (fieldModel.signature.toBooleanRingOperationBundle.2 (second.interval index).1 (fieldModel.signature.toRingConceptSignature.2 (first.interval index).2)) tolerance), iseqv := ⋯ } fun sequence => { interval := fun index => (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Cantor.IsEndpointNegation fieldModel (sequence.interval index) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Cantor.EndpointInterval fieldModel), LRA.NumberSystems.RealNumbers.Cantor.IsEndpointNegation fieldModel (sequence.interval index) other → other = x)) ⋯).1, nested := ⋯, widths_converge_to_zero := ⋯ }

Logical form (Lean):

```lean
theorem negation_is_proper
    (fieldModel : RationalModel) :
    UnaryOperationIsProper
      (IsNestedAndShrinking fieldModel)
      (fun representative => representative.interval)
      (representative_negation fieldModel)
      (EndpointSetoid fieldModel)
      (negation fieldModel)
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
theorem negation_is_proper
    (fieldModel : RationalModel) :
    UnaryOperationIsProper
      (IsNestedAndShrinking fieldModel)
      (fun representative => representative.interval)
      (representative_negation fieldModel)
      (EndpointSetoid fieldModel)
      (negation fieldModel) := by
  sorry

/--
`multiplication` TODO

Predicate logic:

  noncomputable def multiplication
    (fieldModel : RationalModel)
    (first second : NestedIntervalSequence fieldModel) :
    NestedIntervalSequence fieldModel where
  interval := representative_multiplication fieldModel first second
  nested :=
    (representative_multiplication_is_nested_and_shrinking fieldModel first second).1
  widths_converge_to_zero :=
    (representative_multiplication_is_nested_and_shrinking fieldModel first second).2

Predicate logic (unfolded):

  noncomputable def multiplication
    (fieldModel : RationalModel)
    (first second : NestedIntervalSequence fieldModel) :
    NestedIntervalSequence fieldModel where
  interval := representative_multiplication fieldModel first second
  nested :=
    (representative_multiplication_is_nested_and_shrinking fieldModel first second).1
  widths_converge_to_zero :=
    (representative_multiplication_is_nested_and_shrinking fieldModel first second).2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def multiplication
    (fieldModel : RationalModel)
    (first second : NestedIntervalSequence fieldModel) :
    NestedIntervalSequence fieldModel where
  interval := representative_multiplication fieldModel first second
  nested :=
    (representative_multiplication_is_nested_and_shrinking fieldModel first second).1
  widths_converge_to_zero :=
    (representative_multiplication_is_nested_and_shrinking fieldModel first second).2
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
    (fieldModel : RationalModel)
    (first second : NestedIntervalSequence fieldModel) :
    NestedIntervalSequence fieldModel where
  interval := representative_multiplication fieldModel first second
  nested :=
    (representative_multiplication_is_nested_and_shrinking fieldModel first second).1
  widths_converge_to_zero :=
    (representative_multiplication_is_nested_and_shrinking fieldModel first second).2

/--
`representative_multiplication_respects_equivalence` TODO

Predicate logic:

  (∀ fieldModel ∈ RationalModel), LRA.UniversalAlgebra.Quotient.binary_operation_respects (EndpointSetoid fieldModel) (multiplication fieldModel)

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first_representative first_replacement second_representative second_replacement : LRA.NumberSystems.RealNumbers.Cantor.NestedIntervalSequence fieldModel), ((LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid fieldModel).1 first_representative first_replacement ∧ (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid fieldModel).1 second_representative second_replacement) → (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid fieldModel).1 { interval := fun index => (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Cantor.IsEndpointProduct fieldModel (first_representative.interval index) (second_representative.interval index) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Cantor.EndpointInterval fieldModel), LRA.NumberSystems.RealNumbers.Cantor.IsEndpointProduct fieldModel (first_representative.interval index) (second_representative.interval index) other → other = x)) ⋯).val, nested := ⋯, widths_converge_to_zero := ⋯ } { interval := fun index => (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Cantor.IsEndpointProduct fieldModel (first_replacement.interval index) (second_replacement.interval index) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Cantor.EndpointInterval fieldModel), LRA.NumberSystems.RealNumbers.Cantor.IsEndpointProduct fieldModel (first_replacement.interval index) (second_replacement.interval index) other → other = x)) ⋯).val, nested := ⋯, widths_converge_to_zero := ⋯ }

Logical form (Lean):

```lean
theorem representative_multiplication_respects_equivalence
    (fieldModel : RationalModel) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      (EndpointSetoid fieldModel) (multiplication fieldModel)
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
theorem representative_multiplication_respects_equivalence
    (fieldModel : RationalModel) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      (EndpointSetoid fieldModel) (multiplication fieldModel) := by
  sorry

/--
`multiplication_is_proper` TODO

Predicate logic:

  (∀ fieldModel ∈ RationalModel), BinaryOperationIsProper (IsNestedAndShrinking fieldModel) (fun representative => representative.interval) (representative_multiplication fieldModel) (EndpointSetoid fieldModel) (multiplication fieldModel)

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), LRA.Operation.Laws.QuotientCompatible.BinaryOperationIsProper (fun sequence => (∀ (index : Nat), (fieldModel.signature.toOrderedRingConceptSignature.2 (sequence index).1 (sequence (instHAdd.hAdd index 1)).1 ∧ fieldModel.signature.toOrderedRingConceptSignature.2 (sequence (instHAdd.hAdd index 1)).2 (sequence index).2) ∧ ∀ (positive_tolerance : fieldModel.signature.toCarrierBundle.1), fieldModel.signature.toOrderedRingSignature.2 fieldModel.signature.toZeroOneBundle.2 positive_tolerance → Exists fun index => fieldModel.signature.toOrderedRingSignature.2 (fieldModel.signature.toBooleanRingOperationBundle.2 (sequence index).2 (fieldModel.signature.toRingConceptSignature.2 (sequence index).1)) positive_tolerance)) (fun representative => representative.1) (fun first second index => (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Cantor.IsEndpointProduct fieldModel (first.interval index) (second.interval index) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Cantor.EndpointInterval fieldModel), LRA.NumberSystems.RealNumbers.Cantor.IsEndpointProduct fieldModel (first.interval index) (second.interval index) other → other = x)) ⋯).1) { r := fun first second => ∀ (tolerance : fieldModel.1), fieldModel.ltInst.1 fieldModel.zeroInst.1 tolerance → Exists fun index => (fieldModel.signature.toOrderedRingSignature.2 (fieldModel.signature.toBooleanRingOperationBundle.2 (first.interval index).1 (fieldModel.signature.toRingConceptSignature.2 (second.interval index).2)) tolerance ∧ fieldModel.signature.toOrderedRingSignature.2 (fieldModel.signature.toBooleanRingOperationBundle.2 (second.interval index).1 (fieldModel.signature.toRingConceptSignature.2 (first.interval index).2)) tolerance), iseqv := ⋯ } fun first second => { interval := fun index => (Classical.indefiniteDescription (fun x => (LRA.NumberSystems.RealNumbers.Cantor.IsEndpointProduct fieldModel (first.interval index) (second.interval index) x ∧ ∀ (other : LRA.NumberSystems.RealNumbers.Cantor.EndpointInterval fieldModel), LRA.NumberSystems.RealNumbers.Cantor.IsEndpointProduct fieldModel (first.interval index) (second.interval index) other → other = x)) ⋯).1, nested := ⋯, widths_converge_to_zero := ⋯ }

Logical form (Lean):

```lean
theorem multiplication_is_proper
    (fieldModel : RationalModel) :
    BinaryOperationIsProper
      (IsNestedAndShrinking fieldModel)
      (fun representative => representative.interval)
      (representative_multiplication fieldModel)
      (EndpointSetoid fieldModel)
      (multiplication fieldModel)
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
theorem multiplication_is_proper
    (fieldModel : RationalModel) :
    BinaryOperationIsProper
      (IsNestedAndShrinking fieldModel)
      (fun representative => representative.interval)
      (representative_multiplication fieldModel)
      (EndpointSetoid fieldModel)
      (multiplication fieldModel) := by
  sorry

/--
`constant_interval_lower_le_upper` TODO

Predicate logic:

  (∀ fieldModel ∈ RationalModel ∀ value ∈ fieldModel.signature.carrier), fieldModel.signature.le value value

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (value : fieldModel.signature.toCarrierBundle.1), fieldModel.signature.toOrderedRingConceptSignature.2 value value

Logical form (Lean):

```lean
theorem constant_interval_lower_le_upper
    (fieldModel : RationalModel)
    (value : fieldModel.signature.carrier) :
    fieldModel.signature.le value value
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
theorem constant_interval_lower_le_upper
    (fieldModel : RationalModel)
    (value : fieldModel.signature.carrier) :
    fieldModel.signature.le value value := by
  sorry

/--
`constant_interval` TODO

Predicate logic:

  def constant_interval
    (fieldModel : RationalModel)
    (value : fieldModel.signature.carrier) : EndpointInterval fieldModel where
  lower := value
  upper := value
  lower_le_upper := constant_interval_lower_le_upper fieldModel value

Predicate logic (unfolded):

  def constant_interval
    (fieldModel : RationalModel)
    (value : fieldModel.signature.carrier) : EndpointInterval fieldModel where
  lower := value
  upper := value
  lower_le_upper := constant_interval_lower_le_upper fieldModel value (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def constant_interval
    (fieldModel : RationalModel)
    (value : fieldModel.signature.carrier) : EndpointInterval fieldModel where
  lower := value
  upper := value
  lower_le_upper := constant_interval_lower_le_upper fieldModel value
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
def constant_interval
    (fieldModel : RationalModel)
    (value : fieldModel.signature.carrier) : EndpointInterval fieldModel where
  lower := value
  upper := value
  lower_le_upper := constant_interval_lower_le_upper fieldModel value

/--
`constant_sequence_is_nested_and_shrinking` TODO

Predicate logic:

  (∀ fieldModel ∈ RationalModel ∀ value ∈ fieldModel.signature.carrier), IsNestedAndShrinking fieldModel (fun _ => constant_interval fieldModel value)

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (value : fieldModel.signature.toCarrierBundle.1), (∀ (index : Nat), (fieldModel.signature.toOrderedRingConceptSignature.2 ((fun x => LRA.NumberSystems.RealNumbers.Cantor.constant_interval fieldModel value) index).1 ((fun x => LRA.NumberSystems.RealNumbers.Cantor.constant_interval fieldModel value) (instHAdd.hAdd index 1)).1 ∧ fieldModel.signature.toOrderedRingConceptSignature.2 ((fun x => LRA.NumberSystems.RealNumbers.Cantor.constant_interval fieldModel value) (instHAdd.hAdd index 1)).2 ((fun x => LRA.NumberSystems.RealNumbers.Cantor.constant_interval fieldModel value) index).2) ∧ ∀ (positive_tolerance : fieldModel.signature.toCarrierBundle.1), fieldModel.signature.toOrderedRingSignature.2 fieldModel.signature.toZeroOneBundle.2 positive_tolerance → Exists fun index => fieldModel.signature.toOrderedRingSignature.2 (fieldModel.signature.toBooleanRingOperationBundle.2 ((fun x => LRA.NumberSystems.RealNumbers.Cantor.constant_interval fieldModel value) index).2 (fieldModel.signature.toRingConceptSignature.2 ((fun x => LRA.NumberSystems.RealNumbers.Cantor.constant_interval fieldModel value) index).1)) positive_tolerance)

Logical form (Lean):

```lean
theorem constant_sequence_is_nested_and_shrinking
    (fieldModel : RationalModel)
    (value : fieldModel.signature.carrier) :
    IsNestedAndShrinking fieldModel (fun _ => constant_interval fieldModel value)
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
theorem constant_sequence_is_nested_and_shrinking
    (fieldModel : RationalModel)
    (value : fieldModel.signature.carrier) :
    IsNestedAndShrinking fieldModel (fun _ => constant_interval fieldModel value) := by
  sorry

/--
`rational_embedding` TODO

Predicate logic:

  noncomputable def rational_embedding
    (fieldModel : RationalModel)
    (value : fieldModel.signature.carrier) : NestedIntervalSequence fieldModel where
  interval := fun _ => constant_interval fieldModel value
  nested := (constant_sequence_is_nested_and_shrinking fieldModel value).1
  widths_converge_to_zero :=
    (constant_sequence_is_nested_and_shrinking fieldModel value).2

Predicate logic (unfolded):

  noncomputable def rational_embedding
    (fieldModel : RationalModel)
    (value : fieldModel.signature.carrier) : NestedIntervalSequence fieldModel where
  interval := fun _ => constant_interval fieldModel value
  nested := (constant_sequence_is_nested_and_shrinking fieldModel value).1
  widths_converge_to_zero :=
    (constant_sequence_is_nested_and_shrinking fieldModel value).2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def rational_embedding
    (fieldModel : RationalModel)
    (value : fieldModel.signature.carrier) : NestedIntervalSequence fieldModel where
  interval := fun _ => constant_interval fieldModel value
  nested := (constant_sequence_is_nested_and_shrinking fieldModel value).1
  widths_converge_to_zero :=
    (constant_sequence_is_nested_and_shrinking fieldModel value).2
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
noncomputable def rational_embedding
    (fieldModel : RationalModel)
    (value : fieldModel.signature.carrier) : NestedIntervalSequence fieldModel where
  interval := fun _ => constant_interval fieldModel value
  nested := (constant_sequence_is_nested_and_shrinking fieldModel value).1
  widths_converge_to_zero :=
    (constant_sequence_is_nested_and_shrinking fieldModel value).2

/--
`zero` TODO

Predicate logic:

  noncomputable def zero
    (fieldModel : RationalModel) : NestedIntervalSequence fieldModel :=
  rational_embedding fieldModel fieldModel.signature.zero

Predicate logic (unfolded):

  noncomputable def zero
    (fieldModel : RationalModel) : NestedIntervalSequence fieldModel :=
  rational_embedding fieldModel fieldModel.signature.zero (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def zero
    (fieldModel : RationalModel) : NestedIntervalSequence fieldModel :=
  rational_embedding fieldModel fieldModel.signature.zero
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
noncomputable def zero
    (fieldModel : RationalModel) : NestedIntervalSequence fieldModel :=
  rational_embedding fieldModel fieldModel.signature.zero

/--
`one` TODO

Predicate logic:

  noncomputable def one
    (fieldModel : RationalModel) : NestedIntervalSequence fieldModel :=
  rational_embedding fieldModel fieldModel.signature.one

Predicate logic (unfolded):

  noncomputable def one
    (fieldModel : RationalModel) : NestedIntervalSequence fieldModel :=
  rational_embedding fieldModel fieldModel.signature.one (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def one
    (fieldModel : RationalModel) : NestedIntervalSequence fieldModel :=
  rational_embedding fieldModel fieldModel.signature.one
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
noncomputable def one
    (fieldModel : RationalModel) : NestedIntervalSequence fieldModel :=
  rational_embedding fieldModel fieldModel.signature.one

/--
`representative_strict_order` TODO

Predicate logic:

  ∀ (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first second : LRA.NumberSystems.RealNumbers.Cantor.NestedIntervalSequence fieldModel), Exists fun index => fieldModel.signature.StrictOrder (first.interval index).upper (second.interval index).lower

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first second : LRA.NumberSystems.RealNumbers.Cantor.NestedIntervalSequence fieldModel), Exists fun index => fieldModel.signature.toOrderedRingSignature.2 (first.interval index).2 (second.interval index).1

Logical form (Lean):

```lean
def representative_strict_order
    (fieldModel : RationalModel)
    (first second : NestedIntervalSequence fieldModel) : Prop :=
  ∃ index : Nat,
    fieldModel.signature.StrictOrder
      (first.interval index).upper (second.interval index).lower
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
    (fieldModel : RationalModel)
    (first second : NestedIntervalSequence fieldModel) : Prop :=
  ∃ index : Nat,
    fieldModel.signature.StrictOrder
      (first.interval index).upper (second.interval index).lower

/--
`representative_strict_order_respects_equivalence` TODO

Predicate logic:

  (∀ fieldModel ∈ RationalModel), LRA.UniversalAlgebra.Quotient.relation_respects (EndpointSetoid fieldModel) (representative_strict_order fieldModel)

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first_representative first_replacement second_representative second_replacement : LRA.NumberSystems.RealNumbers.Cantor.NestedIntervalSequence fieldModel), ((LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid fieldModel).1 first_representative first_replacement ∧ (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid fieldModel).1 second_representative second_replacement) → Exists fun index => fieldModel.signature.toOrderedRingSignature.2 (first_representative.interval index).2 (second_representative.interval index).1 ↔ Exists fun index => fieldModel.signature.toOrderedRingSignature.2 (first_replacement.interval index).2 (second_replacement.interval index).1

Logical form (Lean):

```lean
theorem representative_strict_order_respects_equivalence
    (fieldModel : RationalModel) :
    LRA.UniversalAlgebra.Quotient.relation_respects
      (EndpointSetoid fieldModel) (representative_strict_order fieldModel)
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
theorem representative_strict_order_respects_equivalence
    (fieldModel : RationalModel) :
    LRA.UniversalAlgebra.Quotient.relation_respects
      (EndpointSetoid fieldModel) (representative_strict_order fieldModel) := by
  sorry

/--
`strict_order_is_proper` TODO

Predicate logic:

  (∀ fieldModel ∈ RationalModel), RelationIsProper (EndpointSetoid fieldModel) (representative_strict_order fieldModel)

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), LRA.Operation.Laws.QuotientCompatible.RelationIsProper { r := fun first second => ∀ (tolerance : fieldModel.1), fieldModel.ltInst.1 fieldModel.zeroInst.1 tolerance → Exists fun index => (fieldModel.signature.toOrderedRingSignature.2 (fieldModel.signature.toBooleanRingOperationBundle.2 (first.interval index).1 (fieldModel.signature.toRingConceptSignature.2 (second.interval index).2)) tolerance ∧ fieldModel.signature.toOrderedRingSignature.2 (fieldModel.signature.toBooleanRingOperationBundle.2 (second.interval index).1 (fieldModel.signature.toRingConceptSignature.2 (first.interval index).2)) tolerance), iseqv := ⋯ } fun first second => Exists fun index => fieldModel.signature.toOrderedRingSignature.2 (first.interval index).2 (second.interval index).1

Logical form (Lean):

```lean
theorem strict_order_is_proper
    (fieldModel : RationalModel) :
    RelationIsProper
      (EndpointSetoid fieldModel) (representative_strict_order fieldModel)
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
theorem strict_order_is_proper
    (fieldModel : RationalModel) :
    RelationIsProper
      (EndpointSetoid fieldModel) (representative_strict_order fieldModel) := by
  sorry
