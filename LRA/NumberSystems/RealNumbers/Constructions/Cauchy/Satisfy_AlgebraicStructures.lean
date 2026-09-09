import LRA.AlgebraicStructures
import LRA.NumberSystems.RealNumbers.Constructions.Cauchy.Instances

namespace LRA.NumberSystems.RealNumbers.Cauchy

open LRA.AlgebraicStructures

/--
`satisfiesField` The Cauchy-sequence construction canonically realizes field structure.

Predicate logic:

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absoluteValueData : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem), LRA.AlgebraicStructures.FieldLaws (LRA.NumberSystems.RealNumbers.Cauchy.Carrier rationalSystem absoluteValueData)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem
    absoluteValueData : RationalMetricData rationalSystem
  Prove
    LRA.AlgebraicStructures.FieldLaws (Quot (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absoluteValueData).1)

Logical form (Lean):

```lean
theorem satisfiesField
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem)
    (absoluteValueData : RationalMetricData rationalSystem) :
    FieldLaws (Carrier rationalSystem absoluteValueData)
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
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem)
    (absoluteValueData : RationalMetricData rationalSystem) :
    FieldLaws (Carrier rationalSystem absoluteValueData) := by
  sorry
/--
`satisfiesOrderedField` The Cauchy-sequence construction canonically realizes ordered field structure.

Predicate logic:

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absoluteValueData : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem), LRA.AlgebraicStructures.OrderedFieldLaws (LRA.NumberSystems.RealNumbers.Cauchy.Carrier rationalSystem absoluteValueData)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem
    absoluteValueData : RationalMetricData rationalSystem
  Prove
    LRA.AlgebraicStructures.OrderedFieldLaws (Quot (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absoluteValueData).1)

Logical form (Lean):

```lean
theorem satisfiesOrderedField
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem)
    (absoluteValueData : RationalMetricData rationalSystem) :
    OrderedFieldLaws (Carrier rationalSystem absoluteValueData)
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
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem)
    (absoluteValueData : RationalMetricData rationalSystem) :
    OrderedFieldLaws (Carrier rationalSystem absoluteValueData) := by
  sorry
/--
`satisfiesCompleteOrderedField` The Cauchy-sequence construction canonically realizes complete ordered field structure.

Predicate logic:

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (absoluteValueData : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem), LRA.AlgebraicStructures.CompleteOrderedFieldLaws (LRA.NumberSystems.RealNumbers.Cauchy.Carrier rationalSystem absoluteValueData) (Set (LRA.NumberSystems.RealNumbers.Cauchy.Carrier rationalSystem absoluteValueData))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem
    absoluteValueData : RationalMetricData rationalSystem
  Prove
    (LRA.AlgebraicStructures.OrderedFieldLaws (Quot (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absoluteValueData).1) ∧ (LRA.Order.OrderCompletenessLaws (Quot (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absoluteValueData).1) (Quot (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem absoluteValueData).1 → Prop)))

Logical form (Lean):

```lean
theorem satisfiesCompleteOrderedField
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem)
    (absoluteValueData : RationalMetricData rationalSystem) :
    CompleteOrderedFieldLaws
      (Carrier rationalSystem absoluteValueData)
      (Set (Carrier rationalSystem absoluteValueData))
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
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem)
    (absoluteValueData : RationalMetricData rationalSystem) :
    CompleteOrderedFieldLaws
      (Carrier rationalSystem absoluteValueData)
      (Set (Carrier rationalSystem absoluteValueData)) := by
  sorry
end LRA.NumberSystems.RealNumbers.Cauchy
