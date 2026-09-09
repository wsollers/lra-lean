import LRA.AlgebraicStructures
import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals.Instances

namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervals

open LRA.AlgebraicStructures

/--
`satisfiesField` The primitive-interval construction canonically realizes field structure.

Predicate logic:

  ∀ (rationalModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), LRA.AlgebraicStructures.FieldLaws (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Carrier rationalModel)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    rationalModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel
  Prove
    LRA.AlgebraicStructures.FieldLaws (Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rationalModel).1)

Logical form (Lean):

```lean
theorem satisfiesField
    (rationalModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) :
    FieldLaws (Carrier rationalModel)
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
    (rationalModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) :
    FieldLaws (Carrier rationalModel) := by
  sorry
/--
`satisfiesOrderedField` The primitive-interval construction canonically realizes ordered field structure.

Predicate logic:

  ∀ (rationalModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), LRA.AlgebraicStructures.OrderedFieldLaws (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Carrier rationalModel)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    rationalModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel
  Prove
    LRA.AlgebraicStructures.OrderedFieldLaws (Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rationalModel).1)

Logical form (Lean):

```lean
theorem satisfiesOrderedField
    (rationalModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) :
    OrderedFieldLaws (Carrier rationalModel)
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
    (rationalModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) :
    OrderedFieldLaws (Carrier rationalModel) := by
  sorry
/--
`satisfiesCompleteOrderedField` The primitive-interval construction canonically realizes complete ordered field structure.

Predicate logic:

  ∀ (rationalModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), LRA.AlgebraicStructures.CompleteOrderedFieldLaws (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Carrier rationalModel) (Set (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Carrier rationalModel))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    rationalModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel
  Prove
    (LRA.AlgebraicStructures.OrderedFieldLaws (Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rationalModel).1) ∧ (LRA.Order.OrderCompletenessLaws (Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rationalModel).1) (Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rationalModel).1 → Prop)))

Logical form (Lean):

```lean
theorem satisfiesCompleteOrderedField
    (rationalModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) :
    CompleteOrderedFieldLaws (Carrier rationalModel) (Set (Carrier rationalModel))
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
    (rationalModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) :
    CompleteOrderedFieldLaws (Carrier rationalModel) (Set (Carrier rationalModel)) := by
  sorry
end LRA.NumberSystems.RealNumbers.PrimitiveIntervals
