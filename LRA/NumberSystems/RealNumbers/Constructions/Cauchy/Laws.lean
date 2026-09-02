import LRA.NumberSystems.RealNumbers.Constructions.Cauchy.WellDefinedness
import LRA.Operation.Laws.QuotientCompatible.Definition

namespace LRA.NumberSystems.RealNumbers.Cauchy
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers
open LRA.Operation.Laws.QuotientCompatible

/--
`addition` TODO

Predicate logic:

  def addition
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) :
    Representative rationalSystem absolute_value_data :=
  ⟨representative_addition rationalSystem absolute_value_data first second,
    representative_addition_is_cauchy rationalSystem absolute_value_data first second⟩

Predicate logic (unfolded):

  def addition
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) :
    Representative rationalSystem absolute_value_data :=
  ⟨representative_addition rationalSystem absolute_value_data first second,
    representative_addition_is_cauchy rationalSystem absolute_value_data first second⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def addition
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) :
    Representative rationalSystem absolute_value_data :=
  ⟨representative_addition rationalSystem absolute_value_data first second,
    representative_addition_is_cauchy rationalSystem absolute_value_data first second⟩
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
def addition
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) :
    Representative rationalSystem absolute_value_data :=
  ⟨representative_addition rationalSystem absolute_value_data first second,
    representative_addition_is_cauchy rationalSystem absolute_value_data first second⟩

/--
`addition_is_proper` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), BinaryOperationIsProper (is_cauchy rationalSystem absolute_value_data) (fun representative => representative.sequence) (representative_addition rationalSystem absolute_value_data) (representative_setoid rationalSystem absolute_value_data) (addition rationalSystem absolute_value_data)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem), LRA.Operation.Laws.QuotientCompatible.BinaryOperationIsProper (fun sequence => ∀ (epsilon : rationalSystem.FieldModel.signature.toCarrierBundle.1), rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon → Exists fun threshold => ∀ (first_index second_index : Nat), instLENat.1 threshold first_index → instLENat.1 threshold second_index → rationalSystem.FieldModel.signature.toOrderedRingSignature.2 (absolute_value_data.1 (rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (sequence first_index) (rationalSystem.FieldModel.signature.neg (sequence second_index)))) epsilon) (fun representative => representative.1) (fun first second index => rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (first.1 index) (second.1 index)) { r := fun first second => ∀ (epsilon : rationalSystem.FieldModel.signature.toCarrierBundle.1), rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.zero epsilon → Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → rationalSystem.FieldModel.signature.toOrderedRingSignature.2 (absolute_value_data.1 ((fun index => rationalSystem.FieldModel.signature.Subtraction (first.sequence index) (second.sequence index)) index)) epsilon, iseqv := ⋯ } fun first second => { sequence := fun index => rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (first.1 index) (second.1 index), sequence_is_cauchy := ⋯ }

Logical form (Lean):

```lean
theorem addition_is_proper
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    BinaryOperationIsProper
      (is_cauchy rationalSystem absolute_value_data)
      (fun representative => representative.sequence)
      (representative_addition rationalSystem absolute_value_data)
      (representative_setoid rationalSystem absolute_value_data)
      (addition rationalSystem absolute_value_data)
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
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    BinaryOperationIsProper
      (is_cauchy rationalSystem absolute_value_data)
      (fun representative => representative.sequence)
      (representative_addition rationalSystem absolute_value_data)
      (representative_setoid rationalSystem absolute_value_data)
      (addition rationalSystem absolute_value_data) := by
  sorry
/--
`negation` TODO

Predicate logic:

  def negation
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (representative : Representative rationalSystem absolute_value_data) :
    Representative rationalSystem absolute_value_data :=
  ⟨representative_negation rationalSystem absolute_value_data representative,
    representative_negation_is_cauchy rationalSystem absolute_value_data representative⟩

Predicate logic (unfolded):

  def negation
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (representative : Representative rationalSystem absolute_value_data) :
    Representative rationalSystem absolute_value_data :=
  ⟨representative_negation rationalSystem absolute_value_data representative,
    representative_negation_is_cauchy rationalSystem absolute_value_data representative⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def negation
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (representative : Representative rationalSystem absolute_value_data) :
    Representative rationalSystem absolute_value_data :=
  ⟨representative_negation rationalSystem absolute_value_data representative,
    representative_negation_is_cauchy rationalSystem absolute_value_data representative⟩
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
def negation
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (representative : Representative rationalSystem absolute_value_data) :
    Representative rationalSystem absolute_value_data :=
  ⟨representative_negation rationalSystem absolute_value_data representative,
    representative_negation_is_cauchy rationalSystem absolute_value_data representative⟩

/--
`negation_is_proper` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), UnaryOperationIsProper (is_cauchy rationalSystem absolute_value_data) (fun representative => representative.sequence) (representative_negation rationalSystem absolute_value_data) (representative_setoid rationalSystem absolute_value_data) (negation rationalSystem absolute_value_data)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem), LRA.Operation.Laws.QuotientCompatible.UnaryOperationIsProper (fun sequence => ∀ (epsilon : rationalSystem.FieldModel.signature.toCarrierBundle.1), rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon → Exists fun threshold => ∀ (first_index second_index : Nat), instLENat.1 threshold first_index → instLENat.1 threshold second_index → rationalSystem.FieldModel.signature.toOrderedRingSignature.2 (absolute_value_data.1 (rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (sequence first_index) (rationalSystem.FieldModel.signature.neg (sequence second_index)))) epsilon) (fun representative => representative.1) (fun representative index => rationalSystem.FieldModel.signature.toRingConceptSignature.2 (representative.1 index)) { r := fun first second => ∀ (epsilon : rationalSystem.FieldModel.signature.toCarrierBundle.1), rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.zero epsilon → Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → rationalSystem.FieldModel.signature.toOrderedRingSignature.2 (absolute_value_data.1 ((fun index => rationalSystem.FieldModel.signature.Subtraction (first.sequence index) (second.sequence index)) index)) epsilon, iseqv := ⋯ } fun representative => { sequence := fun index => rationalSystem.FieldModel.signature.toRingConceptSignature.2 (representative.1 index), sequence_is_cauchy := ⋯ }

Logical form (Lean):

```lean
theorem negation_is_proper
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    UnaryOperationIsProper
      (is_cauchy rationalSystem absolute_value_data)
      (fun representative => representative.sequence)
      (representative_negation rationalSystem absolute_value_data)
      (representative_setoid rationalSystem absolute_value_data)
      (negation rationalSystem absolute_value_data)
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
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    UnaryOperationIsProper
      (is_cauchy rationalSystem absolute_value_data)
      (fun representative => representative.sequence)
      (representative_negation rationalSystem absolute_value_data)
      (representative_setoid rationalSystem absolute_value_data)
      (negation rationalSystem absolute_value_data) := by
  sorry
/--
`multiplication` TODO

Predicate logic:

  def multiplication
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) :
    Representative rationalSystem absolute_value_data :=
  ⟨representative_multiplication rationalSystem absolute_value_data first second,
    representative_multiplication_is_cauchy
      rationalSystem absolute_value_data first second⟩

Predicate logic (unfolded):

  def multiplication
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) :
    Representative rationalSystem absolute_value_data :=
  ⟨representative_multiplication rationalSystem absolute_value_data first second,
    representative_multiplication_is_cauchy
      rationalSystem absolute_value_data first second⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def multiplication
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) :
    Representative rationalSystem absolute_value_data :=
  ⟨representative_multiplication rationalSystem absolute_value_data first second,
    representative_multiplication_is_cauchy
      rationalSystem absolute_value_data first second⟩
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
def multiplication
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) :
    Representative rationalSystem absolute_value_data :=
  ⟨representative_multiplication rationalSystem absolute_value_data first second,
    representative_multiplication_is_cauchy
      rationalSystem absolute_value_data first second⟩

/--
`multiplication_is_proper` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), BinaryOperationIsProper (is_cauchy rationalSystem absolute_value_data) (fun representative => representative.sequence) (representative_multiplication rationalSystem absolute_value_data) (representative_setoid rationalSystem absolute_value_data) (multiplication rationalSystem absolute_value_data)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem), LRA.Operation.Laws.QuotientCompatible.BinaryOperationIsProper (fun sequence => ∀ (epsilon : rationalSystem.FieldModel.signature.toCarrierBundle.1), rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon → Exists fun threshold => ∀ (first_index second_index : Nat), instLENat.1 threshold first_index → instLENat.1 threshold second_index → rationalSystem.FieldModel.signature.toOrderedRingSignature.2 (absolute_value_data.1 (rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (sequence first_index) (rationalSystem.FieldModel.signature.neg (sequence second_index)))) epsilon) (fun representative => representative.1) (fun first second index => rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.3 (first.1 index) (second.1 index)) { r := fun first second => ∀ (epsilon : rationalSystem.FieldModel.signature.toCarrierBundle.1), rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.zero epsilon → Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → rationalSystem.FieldModel.signature.toOrderedRingSignature.2 (absolute_value_data.1 ((fun index => rationalSystem.FieldModel.signature.Subtraction (first.sequence index) (second.sequence index)) index)) epsilon, iseqv := ⋯ } fun first second => { sequence := fun index => rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.3 (first.1 index) (second.1 index), sequence_is_cauchy := ⋯ }

Logical form (Lean):

```lean
theorem multiplication_is_proper
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    BinaryOperationIsProper
      (is_cauchy rationalSystem absolute_value_data)
      (fun representative => representative.sequence)
      (representative_multiplication rationalSystem absolute_value_data)
      (representative_setoid rationalSystem absolute_value_data)
      (multiplication rationalSystem absolute_value_data)
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
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    BinaryOperationIsProper
      (is_cauchy rationalSystem absolute_value_data)
      (fun representative => representative.sequence)
      (representative_multiplication rationalSystem absolute_value_data)
      (representative_setoid rationalSystem absolute_value_data)
      (multiplication rationalSystem absolute_value_data) := by
  sorry
open Classical in

/--
`representative_inverse` TODO

Predicate logic:

  noncomputable def representative_inverse
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (representative : Representative rationalSystem absolute_value_data) :
    Sequence rationalSystem :=
  fun index =>
    if representative.sequence index = rationalSystem.FieldModel.signature.zero
    then rationalSystem.FieldModel.signature.zero
    else rationalSystem.FieldModel.signature.inv (representative.sequence index)

Predicate logic (unfolded):

  noncomputable def representative_inverse
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (representative : Representative rationalSystem absolute_value_data) :
    Sequence rationalSystem :=
  fun index =>
    if representative.sequence index = rationalSystem.FieldModel.signature.zero
    then rationalSystem.FieldModel.signature.zero
    else rationalSystem.FieldModel.signature.inv (representative.sequence index) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def representative_inverse
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (representative : Representative rationalSystem absolute_value_data) :
    Sequence rationalSystem :=
  fun index =>
    if representative.sequence index = rationalSystem.FieldModel.signature.zero
    then rationalSystem.FieldModel.signature.zero
    else rationalSystem.FieldModel.signature.inv (representative.sequence index)
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
noncomputable def representative_inverse
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (representative : Representative rationalSystem absolute_value_data) :
    Sequence rationalSystem :=
  fun index =>
    if representative.sequence index = rationalSystem.FieldModel.signature.zero
    then rationalSystem.FieldModel.signature.zero
    else rationalSystem.FieldModel.signature.inv (representative.sequence index)

/--
`representative_inverse_is_cauchy` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), is_cauchy rationalSystem absolute_value_data (representative_inverse rationalSystem absolute_value_data representative)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (representative : LRA.NumberSystems.RealNumbers.Cauchy.Representative rationalSystem absolute_value_data) (epsilon : rationalSystem.FieldModel.signature.toCarrierBundle.1), rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon → Exists fun threshold => ∀ (first_index second_index : Nat), instLENat.1 threshold first_index → instLENat.1 threshold second_index → rationalSystem.FieldModel.signature.toOrderedRingSignature.2 (absolute_value_data.1 (rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (LRA.NumberSystems.RealNumbers.Cauchy.representative_inverse rationalSystem absolute_value_data representative first_index) (rationalSystem.FieldModel.signature.neg (LRA.NumberSystems.RealNumbers.Cauchy.representative_inverse rationalSystem absolute_value_data representative second_index)))) epsilon

Logical form (Lean):

```lean
theorem representative_inverse_is_cauchy
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (representative : Representative rationalSystem absolute_value_data) :
    is_cauchy rationalSystem absolute_value_data
      (representative_inverse rationalSystem absolute_value_data representative)
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
theorem representative_inverse_is_cauchy
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (representative : Representative rationalSystem absolute_value_data) :
    is_cauchy rationalSystem absolute_value_data
      (representative_inverse rationalSystem absolute_value_data representative) := by
  sorry
/--
`inverse` TODO

Predicate logic:

  noncomputable def inverse
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (representative : Representative rationalSystem absolute_value_data) :
    Representative rationalSystem absolute_value_data :=
  ⟨representative_inverse rationalSystem absolute_value_data representative,
    representative_inverse_is_cauchy rationalSystem absolute_value_data representative⟩

Predicate logic (unfolded):

  noncomputable def inverse
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (representative : Representative rationalSystem absolute_value_data) :
    Representative rationalSystem absolute_value_data :=
  ⟨representative_inverse rationalSystem absolute_value_data representative,
    representative_inverse_is_cauchy rationalSystem absolute_value_data representative⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def inverse
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (representative : Representative rationalSystem absolute_value_data) :
    Representative rationalSystem absolute_value_data :=
  ⟨representative_inverse rationalSystem absolute_value_data representative,
    representative_inverse_is_cauchy rationalSystem absolute_value_data representative⟩
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
    (absolute_value_data : RationalMetricData rationalSystem)
    (representative : Representative rationalSystem absolute_value_data) :
    Representative rationalSystem absolute_value_data :=
  ⟨representative_inverse rationalSystem absolute_value_data representative,
    representative_inverse_is_cauchy rationalSystem absolute_value_data representative⟩

/--
`representative_inverse_respects_equivalence` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), LRA.UniversalAlgebra.Quotient.unary_operation_respects (representative_setoid rationalSystem absolute_value_data) (fun representative => ⟨representative_inverse rationalSystem absolute_value_data representative, representative_inverse_is_cauchy rationalSystem absolute_value_data representative⟩)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (first_representative second_representative : LRA.NumberSystems.RealNumbers.Cauchy.Representative rationalSystem absolute_value_data), (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1 first_representative second_representative → (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1 ((fun representative => { sequence := fun index => Decidable.rec (fun h => (fun x => rationalSystem.FieldModel.signature.2 (representative.sequence index)) h) (fun h => (fun x => rationalSystem.FieldModel.signature.toZeroOneBundle.2) h) (Classical.choice ⋯), sequence_is_cauchy := ⋯ }) first_representative) ((fun representative => { sequence := fun index => Decidable.rec (fun h => (fun x => rationalSystem.FieldModel.signature.2 (representative.sequence index)) h) (fun h => (fun x => rationalSystem.FieldModel.signature.toZeroOneBundle.2) h) (Classical.choice ⋯), sequence_is_cauchy := ⋯ }) second_representative)

Logical form (Lean):

```lean
theorem representative_inverse_respects_equivalence
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.UniversalAlgebra.Quotient.unary_operation_respects
      (representative_setoid rationalSystem absolute_value_data)
      (fun representative =>
        ⟨representative_inverse rationalSystem absolute_value_data representative,
          representative_inverse_is_cauchy
            rationalSystem absolute_value_data representative⟩)
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
theorem representative_inverse_respects_equivalence
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.UniversalAlgebra.Quotient.unary_operation_respects
      (representative_setoid rationalSystem absolute_value_data)
      (fun representative =>
        ⟨representative_inverse rationalSystem absolute_value_data representative,
          representative_inverse_is_cauchy
            rationalSystem absolute_value_data representative⟩) := by
  sorry
/--
`inverse_is_proper` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), UnaryOperationIsProper (is_cauchy rationalSystem absolute_value_data) (fun representative => representative.sequence) (representative_inverse rationalSystem absolute_value_data) (representative_setoid rationalSystem absolute_value_data) (inverse rationalSystem absolute_value_data)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem), LRA.Operation.Laws.QuotientCompatible.UnaryOperationIsProper (fun sequence => ∀ (epsilon : rationalSystem.FieldModel.signature.toCarrierBundle.1), rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon → Exists fun threshold => ∀ (first_index second_index : Nat), instLENat.1 threshold first_index → instLENat.1 threshold second_index → rationalSystem.FieldModel.signature.toOrderedRingSignature.2 (absolute_value_data.1 (rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (sequence first_index) (rationalSystem.FieldModel.signature.neg (sequence second_index)))) epsilon) (fun representative => representative.1) (fun representative index => Decidable.rec (fun h => (fun x => rationalSystem.FieldModel.signature.2 (representative.1 index)) h) (fun h => (fun x => rationalSystem.FieldModel.signature.toZeroOneBundle.2) h) (Classical.choice ⋯)) { r := fun first second => ∀ (epsilon : rationalSystem.FieldModel.signature.toCarrierBundle.1), rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.zero epsilon → Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → rationalSystem.FieldModel.signature.toOrderedRingSignature.2 (absolute_value_data.1 ((fun index => rationalSystem.FieldModel.signature.Subtraction (first.sequence index) (second.sequence index)) index)) epsilon, iseqv := ⋯ } fun representative => { sequence := fun index => Decidable.rec (fun h => (fun x => rationalSystem.FieldModel.signature.2 (representative.1 index)) h) (fun h => (fun x => rationalSystem.FieldModel.signature.toZeroOneBundle.2) h) (Classical.choice ⋯), sequence_is_cauchy := ⋯ }

Logical form (Lean):

```lean
theorem inverse_is_proper
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    UnaryOperationIsProper
      (is_cauchy rationalSystem absolute_value_data)
      (fun representative => representative.sequence)
      (representative_inverse rationalSystem absolute_value_data)
      (representative_setoid rationalSystem absolute_value_data)
      (inverse rationalSystem absolute_value_data)
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
theorem inverse_is_proper
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    UnaryOperationIsProper
      (is_cauchy rationalSystem absolute_value_data)
      (fun representative => representative.sequence)
      (representative_inverse rationalSystem absolute_value_data)
      (representative_setoid rationalSystem absolute_value_data)
      (inverse rationalSystem absolute_value_data) := by
  sorry
/--
`constant_sequence` TODO

Predicate logic:

  def constant_sequence
    (rationalSystem : RationalNumberSystem)
    (value : rationalSystem.FieldModel.signature.carrier) : Sequence rationalSystem :=
  fun _ => value

Predicate logic (unfolded):

  def constant_sequence
    (rationalSystem : RationalNumberSystem)
    (value : rationalSystem.FieldModel.signature.carrier) : Sequence rationalSystem :=
  fun _ => value (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def constant_sequence
    (rationalSystem : RationalNumberSystem)
    (value : rationalSystem.FieldModel.signature.carrier) : Sequence rationalSystem :=
  fun _ => value
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
def constant_sequence
    (rationalSystem : RationalNumberSystem)
    (value : rationalSystem.FieldModel.signature.carrier) : Sequence rationalSystem :=
  fun _ => value

/--
`constant_sequence_is_cauchy` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem ∀ value ∈ rationalSystem.FieldModel.signature.carrier), is_cauchy rationalSystem absolute_value_data (constant_sequence rationalSystem value)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (value epsilon : rationalSystem.FieldModel.signature.toCarrierBundle.1), rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon → Exists fun threshold => ∀ (first_index second_index : Nat), instLENat.1 threshold first_index → instLENat.1 threshold second_index → rationalSystem.FieldModel.signature.toOrderedRingSignature.2 (absolute_value_data.1 (rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (LRA.NumberSystems.RealNumbers.Cauchy.constant_sequence rationalSystem value first_index) (rationalSystem.FieldModel.signature.neg (LRA.NumberSystems.RealNumbers.Cauchy.constant_sequence rationalSystem value second_index)))) epsilon

Logical form (Lean):

```lean
theorem constant_sequence_is_cauchy
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (value : rationalSystem.FieldModel.signature.carrier) :
    is_cauchy rationalSystem absolute_value_data
      (constant_sequence rationalSystem value)
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
theorem constant_sequence_is_cauchy
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (value : rationalSystem.FieldModel.signature.carrier) :
    is_cauchy rationalSystem absolute_value_data
      (constant_sequence rationalSystem value) := by
  sorry
/--
`rational_embedding` TODO

Predicate logic:

  noncomputable def rational_embedding
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (value : rationalSystem.FieldModel.signature.carrier) :
    Representative rationalSystem absolute_value_data :=
  ⟨constant_sequence rationalSystem value,
    constant_sequence_is_cauchy rationalSystem absolute_value_data value⟩

Predicate logic (unfolded):

  noncomputable def rational_embedding
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (value : rationalSystem.FieldModel.signature.carrier) :
    Representative rationalSystem absolute_value_data :=
  ⟨constant_sequence rationalSystem value,
    constant_sequence_is_cauchy rationalSystem absolute_value_data value⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def rational_embedding
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (value : rationalSystem.FieldModel.signature.carrier) :
    Representative rationalSystem absolute_value_data :=
  ⟨constant_sequence rationalSystem value,
    constant_sequence_is_cauchy rationalSystem absolute_value_data value⟩
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
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (value : rationalSystem.FieldModel.signature.carrier) :
    Representative rationalSystem absolute_value_data :=
  ⟨constant_sequence rationalSystem value,
    constant_sequence_is_cauchy rationalSystem absolute_value_data value⟩

/--
`zero_sequence` TODO

Predicate logic:

  def zero_sequence (rationalSystem : RationalNumberSystem) : Sequence rationalSystem :=
  fun _ => rationalSystem.FieldModel.signature.zero

Predicate logic (unfolded):

  def zero_sequence (rationalSystem : RationalNumberSystem) : Sequence rationalSystem :=
  fun _ => rationalSystem.FieldModel.signature.zero (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def zero_sequence (rationalSystem : RationalNumberSystem) : Sequence rationalSystem :=
  fun _ => rationalSystem.FieldModel.signature.zero
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
def zero_sequence (rationalSystem : RationalNumberSystem) : Sequence rationalSystem :=
  fun _ => rationalSystem.FieldModel.signature.zero

/--
`zero_sequence_is_cauchy` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), is_cauchy rationalSystem absolute_value_data (zero_sequence rationalSystem)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (epsilon : rationalSystem.FieldModel.signature.toCarrierBundle.1), rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon → Exists fun threshold => ∀ (first_index second_index : Nat), instLENat.1 threshold first_index → instLENat.1 threshold second_index → rationalSystem.FieldModel.signature.toOrderedRingSignature.2 (absolute_value_data.1 (rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (LRA.NumberSystems.RealNumbers.Cauchy.zero_sequence rationalSystem first_index) (rationalSystem.FieldModel.signature.neg (LRA.NumberSystems.RealNumbers.Cauchy.zero_sequence rationalSystem second_index)))) epsilon

Logical form (Lean):

```lean
theorem zero_sequence_is_cauchy
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    is_cauchy rationalSystem absolute_value_data (zero_sequence rationalSystem)
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
theorem zero_sequence_is_cauchy
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    is_cauchy rationalSystem absolute_value_data (zero_sequence rationalSystem) := by
  sorry
/--
`zero` TODO

Predicate logic:

  def zero
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Representative rationalSystem absolute_value_data :=
  ⟨zero_sequence rationalSystem, zero_sequence_is_cauchy rationalSystem absolute_value_data⟩

Predicate logic (unfolded):

  def zero
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Representative rationalSystem absolute_value_data :=
  ⟨zero_sequence rationalSystem, zero_sequence_is_cauchy rationalSystem absolute_value_data⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def zero
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Representative rationalSystem absolute_value_data :=
  ⟨zero_sequence rationalSystem, zero_sequence_is_cauchy rationalSystem absolute_value_data⟩
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
def zero
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Representative rationalSystem absolute_value_data :=
  ⟨zero_sequence rationalSystem, zero_sequence_is_cauchy rationalSystem absolute_value_data⟩

/--
`one_sequence` TODO

Predicate logic:

  def one_sequence (rationalSystem : RationalNumberSystem) : Sequence rationalSystem :=
  fun _ => rationalSystem.FieldModel.signature.one

Predicate logic (unfolded):

  def one_sequence (rationalSystem : RationalNumberSystem) : Sequence rationalSystem :=
  fun _ => rationalSystem.FieldModel.signature.one (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def one_sequence (rationalSystem : RationalNumberSystem) : Sequence rationalSystem :=
  fun _ => rationalSystem.FieldModel.signature.one
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
def one_sequence (rationalSystem : RationalNumberSystem) : Sequence rationalSystem :=
  fun _ => rationalSystem.FieldModel.signature.one

/--
`one_sequence_is_cauchy` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), is_cauchy rationalSystem absolute_value_data (one_sequence rationalSystem)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (epsilon : rationalSystem.FieldModel.signature.toCarrierBundle.1), rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon → Exists fun threshold => ∀ (first_index second_index : Nat), instLENat.1 threshold first_index → instLENat.1 threshold second_index → rationalSystem.FieldModel.signature.toOrderedRingSignature.2 (absolute_value_data.1 (rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (LRA.NumberSystems.RealNumbers.Cauchy.one_sequence rationalSystem first_index) (rationalSystem.FieldModel.signature.neg (LRA.NumberSystems.RealNumbers.Cauchy.one_sequence rationalSystem second_index)))) epsilon

Logical form (Lean):

```lean
theorem one_sequence_is_cauchy
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    is_cauchy rationalSystem absolute_value_data (one_sequence rationalSystem)
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
theorem one_sequence_is_cauchy
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    is_cauchy rationalSystem absolute_value_data (one_sequence rationalSystem) := by
  sorry
/--
`one` TODO

Predicate logic:

  def one
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Representative rationalSystem absolute_value_data :=
  ⟨one_sequence rationalSystem, one_sequence_is_cauchy rationalSystem absolute_value_data⟩

Predicate logic (unfolded):

  def one
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Representative rationalSystem absolute_value_data :=
  ⟨one_sequence rationalSystem, one_sequence_is_cauchy rationalSystem absolute_value_data⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def one
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Representative rationalSystem absolute_value_data :=
  ⟨one_sequence rationalSystem, one_sequence_is_cauchy rationalSystem absolute_value_data⟩
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
def one
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Representative rationalSystem absolute_value_data :=
  ⟨one_sequence rationalSystem, one_sequence_is_cauchy rationalSystem absolute_value_data⟩

/--
`representative_strict_order` TODO

Predicate logic:

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (first second : LRA.NumberSystems.RealNumbers.Cauchy.Representative rationalSystem absolute_value_data), Exists fun epsilon => (LRA.NumberSystems.RealNumbers.Cauchy.is_positive rationalSystem epsilon ∧ Exists fun threshold => ∀ (index : Nat), instLENat.le threshold index → rationalSystem.FieldModel.signature.le (rationalSystem.FieldModel.signature.add (first.sequence index) epsilon) (second.sequence index))

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (first second : LRA.NumberSystems.RealNumbers.Cauchy.Representative rationalSystem absolute_value_data), Exists fun epsilon => (rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon ∧ Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → rationalSystem.FieldModel.signature.toOrderedRingConceptSignature.2 (rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (first.1 index) epsilon) (second.1 index))

Logical form (Lean):

```lean
def representative_strict_order
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) : Prop :=
  ∃ epsilon : rationalSystem.FieldModel.signature.carrier,
    is_positive rationalSystem epsilon ∧
    ∃ threshold : Nat,
      ∀ index : Nat, threshold ≤ index →
        rationalSystem.FieldModel.signature.le
          (rationalSystem.FieldModel.signature.add
            (first.sequence index) epsilon)
          (second.sequence index)
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
def representative_strict_order
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) : Prop :=
  ∃ epsilon : rationalSystem.FieldModel.signature.carrier,
    is_positive rationalSystem epsilon ∧
    ∃ threshold : Nat,
      ∀ index : Nat, threshold ≤ index →
        rationalSystem.FieldModel.signature.le
          (rationalSystem.FieldModel.signature.add
            (first.sequence index) epsilon)
          (second.sequence index)

/--
`representative_strict_order_trichotomous` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), ∀ first second : Representative rationalSystem absolute_value_data, representative_strict_order rationalSystem absolute_value_data first second ∨ representative_equivalent rationalSystem absolute_value_data first second ∨ representative_strict_order rationalSystem absolute_value_data second first

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (first second : LRA.NumberSystems.RealNumbers.Cauchy.Representative rationalSystem absolute_value_data), Or (Exists fun epsilon => (rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon ∧ Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → rationalSystem.FieldModel.signature.toOrderedRingConceptSignature.2 (rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (first.1 index) epsilon) (second.1 index))) (Or (∀ (epsilon : rationalSystem.FieldModel.signature.toCarrierBundle.1), rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon → Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → rationalSystem.FieldModel.signature.toOrderedRingSignature.2 (absolute_value_data.1 ((fun index => rationalSystem.FieldModel.signature.add (first.sequence index) (rationalSystem.FieldModel.signature.neg (second.sequence index))) index)) epsilon) (Exists fun epsilon => (rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon ∧ Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → rationalSystem.FieldModel.signature.toOrderedRingConceptSignature.2 (rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (second.1 index) epsilon) (first.1 index))))

Logical form (Lean):

```lean
theorem representative_strict_order_trichotomous
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    ∀ first second : Representative rationalSystem absolute_value_data,
      representative_strict_order rationalSystem absolute_value_data first second ∨
        representative_equivalent rationalSystem absolute_value_data first second ∨
        representative_strict_order rationalSystem absolute_value_data second first
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases

-/
theorem representative_strict_order_trichotomous
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    ∀ first second : Representative rationalSystem absolute_value_data,
      representative_strict_order rationalSystem absolute_value_data first second ∨
        representative_equivalent rationalSystem absolute_value_data first second ∨
        representative_strict_order rationalSystem absolute_value_data second first := by
  sorry
/--
`representative_strict_order_transitive` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), ∀ first second third : Representative rationalSystem absolute_value_data, representative_strict_order rationalSystem absolute_value_data first second → representative_strict_order rationalSystem absolute_value_data second third → representative_strict_order rationalSystem absolute_value_data first third

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (first second third : LRA.NumberSystems.RealNumbers.Cauchy.Representative rationalSystem absolute_value_data), (Exists fun epsilon => (rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon ∧ Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → rationalSystem.FieldModel.signature.toOrderedRingConceptSignature.2 (rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (first.1 index) epsilon) (second.1 index)) ∧ Exists fun epsilon => (rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon ∧ Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → rationalSystem.FieldModel.signature.toOrderedRingConceptSignature.2 (rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (second.1 index) epsilon) (third.1 index))) → Exists fun epsilon => (rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon ∧ Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → rationalSystem.FieldModel.signature.toOrderedRingConceptSignature.2 (rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (first.1 index) epsilon) (third.1 index))

Logical form (Lean):

```lean
theorem representative_strict_order_transitive
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    ∀ first second third : Representative rationalSystem absolute_value_data,
      representative_strict_order rationalSystem absolute_value_data first second →
      representative_strict_order rationalSystem absolute_value_data second third →
      representative_strict_order rationalSystem absolute_value_data first third
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
theorem representative_strict_order_transitive
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    ∀ first second third : Representative rationalSystem absolute_value_data,
      representative_strict_order rationalSystem absolute_value_data first second →
      representative_strict_order rationalSystem absolute_value_data second third →
      representative_strict_order rationalSystem absolute_value_data first third := by
  sorry
/--
`representative_addition_preserves_and_reflects_strict_order` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), ∀ first second translation : Representative rationalSystem absolute_value_data, representative_strict_order rationalSystem absolute_value_data first second ↔ representative_strict_order rationalSystem absolute_value_data (addition rationalSystem absolute_value_data first translation) (addition rationalSystem absolute_value_data second translation)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (first second translation : LRA.NumberSystems.RealNumbers.Cauchy.Representative rationalSystem absolute_value_data), Exists fun epsilon => (rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon ∧ Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → rationalSystem.FieldModel.signature.toOrderedRingConceptSignature.2 (rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (first.1 index) epsilon) (second.1 index)) ↔ Exists fun epsilon => (rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon ∧ Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → rationalSystem.FieldModel.signature.toOrderedRingConceptSignature.2 (rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 ((LRA.NumberSystems.RealNumbers.Cauchy.addition rationalSystem absolute_value_data first translation).1 index) epsilon) ((LRA.NumberSystems.RealNumbers.Cauchy.addition rationalSystem absolute_value_data second translation).1 index))

Logical form (Lean):

```lean
theorem representative_addition_preserves_and_reflects_strict_order
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    ∀ first second translation : Representative rationalSystem absolute_value_data,
      representative_strict_order rationalSystem absolute_value_data first second ↔
        representative_strict_order rationalSystem absolute_value_data
          (addition rationalSystem absolute_value_data first translation)
          (addition rationalSystem absolute_value_data second translation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem representative_addition_preserves_and_reflects_strict_order
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    ∀ first second translation : Representative rationalSystem absolute_value_data,
      representative_strict_order rationalSystem absolute_value_data first second ↔
        representative_strict_order rationalSystem absolute_value_data
          (addition rationalSystem absolute_value_data first translation)
          (addition rationalSystem absolute_value_data second translation) := by
  sorry
/--
`representative_strict_order_respects_equivalence` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), LRA.UniversalAlgebra.Quotient.relation_respects (representative_setoid rationalSystem absolute_value_data) (representative_strict_order rationalSystem absolute_value_data)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (first_representative first_replacement second_representative second_replacement : LRA.NumberSystems.RealNumbers.Cauchy.Representative rationalSystem absolute_value_data), ((LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1 first_representative first_replacement ∧ (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absolute_value_data).1 second_representative second_replacement) → Exists fun epsilon => (rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon ∧ Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → rationalSystem.FieldModel.signature.toOrderedRingConceptSignature.2 (rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (first_representative.1 index) epsilon) (second_representative.1 index)) ↔ Exists fun epsilon => (rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon ∧ Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → rationalSystem.FieldModel.signature.toOrderedRingConceptSignature.2 (rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (first_replacement.1 index) epsilon) (second_replacement.1 index))

Logical form (Lean):

```lean
theorem representative_strict_order_respects_equivalence
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.UniversalAlgebra.Quotient.relation_respects
      (representative_setoid rationalSystem absolute_value_data)
      (representative_strict_order rationalSystem absolute_value_data)
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
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.UniversalAlgebra.Quotient.relation_respects
      (representative_setoid rationalSystem absolute_value_data)
      (representative_strict_order rationalSystem absolute_value_data) := by
  sorry
/--
`strict_order_is_proper` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), RelationIsProper (representative_setoid rationalSystem absolute_value_data) (representative_strict_order rationalSystem absolute_value_data)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem), LRA.Operation.Laws.QuotientCompatible.RelationIsProper { r := fun first second => ∀ (epsilon : rationalSystem.FieldModel.signature.toCarrierBundle.1), rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.zero epsilon → Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → rationalSystem.FieldModel.signature.toOrderedRingSignature.2 (absolute_value_data.1 ((fun index => rationalSystem.FieldModel.signature.Subtraction (first.sequence index) (second.sequence index)) index)) epsilon, iseqv := ⋯ } fun first second => Exists fun epsilon => (rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon ∧ Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → rationalSystem.FieldModel.signature.toOrderedRingConceptSignature.2 (rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (first.1 index) epsilon) (second.1 index))

Logical form (Lean):

```lean
theorem strict_order_is_proper
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    RelationIsProper
      (representative_setoid rationalSystem absolute_value_data)
      (representative_strict_order rationalSystem absolute_value_data)
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
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    RelationIsProper
      (representative_setoid rationalSystem absolute_value_data)
      (representative_strict_order rationalSystem absolute_value_data) := by
  sorry
