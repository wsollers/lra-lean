
import LRA.NumberSystems.RealNumbers.Constructions.Cauchy.Carrier

namespace LRA.NumberSystems.RealNumbers.Cauchy
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers

/--
`representative_equivalent` TODO

Predicate logic:

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (first second : LRA.NumberSystems.RealNumbers.Cauchy.Representative rationalSystem absolute_value_data) (epsilon : rationalSystem.FieldModel.signature.carrier), LRA.NumberSystems.RealNumbers.Cauchy.is_positive rationalSystem epsilon → Exists fun threshold => ∀ (index : Nat), instLENat.le threshold index → rationalSystem.FieldModel.signature.StrictOrder (absolute_value_data.absolute_value ((fun index => rationalSystem.FieldModel.signature.Subtraction (first.sequence index) (second.sequence index)) index)) epsilon

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem) (first second : LRA.NumberSystems.RealNumbers.Cauchy.Representative rationalSystem absolute_value_data) (epsilon : rationalSystem.FieldModel.signature.toCarrierBundle.1), rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon → Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → rationalSystem.FieldModel.signature.toOrderedRingSignature.2 (absolute_value_data.1 ((fun index => rationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (first.1 index) (rationalSystem.FieldModel.signature.toRingConceptSignature.2 (second.1 index))) index)) epsilon

Logical form (Lean):

```lean
def representative_equivalent
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) : Prop :=
  equivalent rationalSystem absolute_value_data first.sequence second.sequence
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
def representative_equivalent
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) : Prop :=
  equivalent rationalSystem absolute_value_data first.sequence second.sequence

/--
`representative_equivalent_is_equivalence` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), Equivalence (representative_equivalent rationalSystem absolute_value_data)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absolute_value_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem), Equivalence fun first second => ∀ (epsilon : rationalSystem.FieldModel.signature.toCarrierBundle.1), rationalSystem.FieldModel.signature.toOrderedRingSignature.2 rationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon → Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → rationalSystem.FieldModel.signature.toOrderedRingSignature.2 (absolute_value_data.1 ((fun index => rationalSystem.FieldModel.signature.add (first.sequence index) (rationalSystem.FieldModel.signature.neg (second.sequence index))) index)) epsilon

Logical form (Lean):

```lean
theorem representative_equivalent_is_equivalence
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Equivalence
      (representative_equivalent rationalSystem absolute_value_data)
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
theorem representative_equivalent_is_equivalence
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Equivalence
      (representative_equivalent rationalSystem absolute_value_data) := by
  sorry

/--
`representative_setoid` TODO

Predicate logic:

  def representative_setoid
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Setoid (Representative rationalSystem absolute_value_data) where
  r := representative_equivalent rationalSystem absolute_value_data
  iseqv := representative_equivalent_is_equivalence
    rationalSystem absolute_value_data

Predicate logic (unfolded):

  def representative_setoid
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Setoid (Representative rationalSystem absolute_value_data) where
  r := representative_equivalent rationalSystem absolute_value_data
  iseqv := representative_equivalent_is_equivalence
    rationalSystem absolute_value_data (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def representative_setoid
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Setoid (Representative rationalSystem absolute_value_data) where
  r := representative_equivalent rationalSystem absolute_value_data
  iseqv := representative_equivalent_is_equivalence
    rationalSystem absolute_value_data
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
def representative_setoid
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Setoid (Representative rationalSystem absolute_value_data) where
  r := representative_equivalent rationalSystem absolute_value_data
  iseqv := representative_equivalent_is_equivalence
    rationalSystem absolute_value_data

/--
`Carrier` TODO

Predicate logic:

  abbrev Carrier
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :=
  Quotient (representative_setoid rationalSystem absolute_value_data)

Predicate logic (unfolded):

  abbrev Carrier
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :=
  Quotient (representative_setoid rationalSystem absolute_value_data) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Carrier
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :=
  Quotient (representative_setoid rationalSystem absolute_value_data)
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
abbrev Carrier
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :=
  Quotient (representative_setoid rationalSystem absolute_value_data)

end LRA.NumberSystems.RealNumbers.Cauchy
