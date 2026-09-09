import LRA.AlgebraicStructures
import LRA.NumberSystems.RealNumbers.Constructions.Cantor.Instances

namespace LRA.NumberSystems.RealNumbers.Cantor

open LRA.AlgebraicStructures

/--
`satisfiesField` The Cantor construction canonically realizes field structure.

Predicate logic:

  ∀ (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), LRA.AlgebraicStructures.FieldLaws (LRA.NumberSystems.RealNumbers.Cantor.Carrier fieldModel)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel
  Prove
    LRA.AlgebraicStructures.FieldLaws (Quot (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid fieldModel).1)

Logical form (Lean):

```lean
theorem satisfiesField
    (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) :
    FieldLaws (Carrier fieldModel)
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
    (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) :
    FieldLaws (Carrier fieldModel) := by
  sorry
/--
`satisfiesOrderedField` The Cantor construction canonically realizes ordered field structure.

Predicate logic:

  ∀ (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), LRA.AlgebraicStructures.OrderedFieldLaws (LRA.NumberSystems.RealNumbers.Cantor.Carrier fieldModel)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel
  Prove
    LRA.AlgebraicStructures.OrderedFieldLaws (Quot (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid fieldModel).1)

Logical form (Lean):

```lean
theorem satisfiesOrderedField
    (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) :
    OrderedFieldLaws (Carrier fieldModel)
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
    (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) :
    OrderedFieldLaws (Carrier fieldModel) := by
  sorry
/--
`satisfiesCompleteOrderedField` The Cantor construction canonically realizes complete ordered field structure.

Predicate logic:

  ∀ (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), LRA.AlgebraicStructures.CompleteOrderedFieldLaws (LRA.NumberSystems.RealNumbers.Cantor.Carrier fieldModel) (Set (LRA.NumberSystems.RealNumbers.Cantor.Carrier fieldModel))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel
  Prove
    (LRA.AlgebraicStructures.OrderedFieldLaws (Quot (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid fieldModel).1) ∧ (LRA.Order.OrderCompletenessLaws (Quot (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid fieldModel).1) (Quot (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid fieldModel).1 → Prop)))

Logical form (Lean):

```lean
theorem satisfiesCompleteOrderedField
    (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) :
    CompleteOrderedFieldLaws (Carrier fieldModel) (Set (Carrier fieldModel))
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
    (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) :
    CompleteOrderedFieldLaws (Carrier fieldModel) (Set (Carrier fieldModel)) := by
  sorry
end LRA.NumberSystems.RealNumbers.Cantor
