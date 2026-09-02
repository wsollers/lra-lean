
import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals.Carrier

namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervals
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

variable (rational_model : RationalModel)

/--
`equivalent` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first second : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model) (first_index second_index : Nat), LRA.NumberSystems.RealNumbers.PrimitiveIntervals.overlaps rational_model (first.interval first_index) (second.interval second_index)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first second : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model) (first_index second_index : Nat), Exists fun value => ((rational_model.signature.toOrderedRingConceptSignature.2 (first.interval first_index).1 value ∧ rational_model.signature.toOrderedRingConceptSignature.2 value (first.interval first_index).2) ∧ (rational_model.signature.toOrderedRingConceptSignature.2 (second.interval second_index).1 value ∧ rational_model.signature.toOrderedRingConceptSignature.2 value (second.interval second_index).2))

Logical form (Lean):

```lean
def equivalent
    (first second : Representative rational_model) : Prop :=
  ∀ first_index second_index,
    overlaps rational_model
      (first.interval first_index)
      (second.interval second_index)
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
def equivalent
    (first second : Representative rational_model) : Prop :=
  ∀ first_index second_index,
    overlaps rational_model
      (first.interval first_index)
      (second.interval second_index)

/--
`equivalent_is_equivalence_relation` TODO

Predicate logic:

  Equivalence (equivalent rational_model)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), Equivalence fun first second => ∀ (first_index second_index : Nat), Exists fun value => ((rational_model.signature.toOrderedRingConceptSignature.2 (first.interval first_index).1 value ∧ rational_model.signature.toOrderedRingConceptSignature.2 value (first.interval first_index).2) ∧ (rational_model.signature.toOrderedRingConceptSignature.2 (second.interval second_index).1 value ∧ rational_model.signature.toOrderedRingConceptSignature.2 value (second.interval second_index).2))

Logical form (Lean):

```lean
theorem equivalent_is_equivalence_relation :
    Equivalence (equivalent rational_model)
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
theorem equivalent_is_equivalence_relation :
    Equivalence (equivalent rational_model) := by
  sorry
/--
`representative_setoid` TODO

Predicate logic:

  def representative_setoid : Setoid (Representative rational_model) where
  r := equivalent rational_model
  iseqv := equivalent_is_equivalence_relation rational_model

Predicate logic (unfolded):

  def representative_setoid : Setoid (Representative rational_model) where
  r := equivalent rational_model
  iseqv := equivalent_is_equivalence_relation rational_model (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def representative_setoid : Setoid (Representative rational_model) where
  r := equivalent rational_model
  iseqv := equivalent_is_equivalence_relation rational_model
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
def representative_setoid : Setoid (Representative rational_model) where
  r := equivalent rational_model
  iseqv := equivalent_is_equivalence_relation rational_model

/--
`Carrier` TODO

Predicate logic:

  abbrev Carrier := Quotient (representative_setoid rational_model)

Predicate logic (unfolded):

  abbrev Carrier := Quotient (representative_setoid rational_model) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Carrier := Quotient (representative_setoid rational_model)
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
abbrev Carrier := Quotient (representative_setoid rational_model)

/--
`constant_degenerate_sequence_is_admissible` TODO

Predicate logic:

  ∃ representative ∈ Representative rational_model, ∀ index, representative.interval index = degenerate_interval rational_model value

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (value : rational_model.signature.toCarrierBundle.1), Exists fun representative => ∀ (index : Nat), representative.1 index = { left_endpoint := value, right_endpoint := value, endpoints_are_ordered := ⋯ }

Logical form (Lean):

```lean
theorem constant_degenerate_sequence_is_admissible
    (value : Rational rational_model) :
    ∃ representative : Representative rational_model,
      ∀ index,
        representative.interval index =
          degenerate_interval rational_model value
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
theorem constant_degenerate_sequence_is_admissible
    (value : Rational rational_model) :
    ∃ representative : Representative rational_model,
      ∀ index,
        representative.interval index =
          degenerate_interval rational_model value := by
  sorry
/--
`rational_representative` TODO

Predicate logic:

  noncomputable def rational_representative
    (value : Rational rational_model) : Representative rational_model :=
  Classical.choose
    (constant_degenerate_sequence_is_admissible rational_model value)

Predicate logic (unfolded):

  noncomputable def rational_representative
    (value : Rational rational_model) : Representative rational_model :=
  Classical.choose
    (constant_degenerate_sequence_is_admissible rational_model value) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def rational_representative
    (value : Rational rational_model) : Representative rational_model :=
  Classical.choose
    (constant_degenerate_sequence_is_admissible rational_model value)
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
noncomputable def rational_representative
    (value : Rational rational_model) : Representative rational_model :=
  Classical.choose
    (constant_degenerate_sequence_is_admissible rational_model value)

/--
`rational_embedding` TODO

Predicate logic:

  noncomputable def rational_embedding
    (value : Rational rational_model) : Carrier rational_model :=
  Quotient.mk _ (rational_representative rational_model value)

Predicate logic (unfolded):

  noncomputable def rational_embedding
    (value : Rational rational_model) : Carrier rational_model :=
  Quotient.mk _ (rational_representative rational_model value) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def rational_embedding
    (value : Rational rational_model) : Carrier rational_model :=
  Quotient.mk _ (rational_representative rational_model value)
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
    (value : Rational rational_model) : Carrier rational_model :=
  Quotient.mk _ (rational_representative rational_model value)

/--
`rational_embedding_is_injective` TODO

Predicate logic:

  ∀ first second, rational_embedding rational_model first = rational_embedding rational_model second → first = second

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first second : rational_model.signature.toCarrierBundle.1), Quot.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1 (Classical.indefiniteDescription (fun x => ∀ (index : Nat), x.interval index = LRA.NumberSystems.RealNumbers.PrimitiveIntervals.degenerate_interval rational_model first) ⋯).1 = Quot.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1 (Classical.indefiniteDescription (fun x => ∀ (index : Nat), x.interval index = LRA.NumberSystems.RealNumbers.PrimitiveIntervals.degenerate_interval rational_model second) ⋯).1 → first = second

Logical form (Lean):

```lean
theorem rational_embedding_is_injective :
    ∀ first second,
      rational_embedding rational_model first =
        rational_embedding rational_model second →
      first = second
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
theorem rational_embedding_is_injective :
    ∀ first second,
      rational_embedding rational_model first =
        rational_embedding rational_model second →
      first = second := by
  sorry
end LRA.NumberSystems.RealNumbers.PrimitiveIntervals
