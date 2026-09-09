import LRA.AlgebraicStructures
import LRA.NumberSystems.RealNumbers.Constructions.EffectiveCauchy.Instances

namespace LRA.NumberSystems.RealNumbers.EffectiveCauchy

open LRA.AlgebraicStructures

/--
`satisfiesField` The effective-Cauchy construction canonically realizes field structure.

Predicate logic:

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem), LRA.AlgebraicStructures.FieldLaws (LRA.NumberSystems.RealNumbers.EffectiveCauchy.EffectiveCauchyReal rationalSystem)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem
  Prove
    LRA.AlgebraicStructures.FieldLaws (Quot (LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem).1)

Logical form (Lean):

```lean
theorem satisfiesField
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) :
    FieldLaws (EffectiveCauchyReal rationalSystem)
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
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) :
    FieldLaws (EffectiveCauchyReal rationalSystem) := by
  sorry
/--
`satisfiesOrderedField` The effective-Cauchy construction canonically realizes ordered field structure.

Predicate logic:

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem), LRA.AlgebraicStructures.OrderedFieldLaws (LRA.NumberSystems.RealNumbers.EffectiveCauchy.EffectiveCauchyReal rationalSystem)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem
  Prove
    LRA.AlgebraicStructures.OrderedFieldLaws (Quot (LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem).1)

Logical form (Lean):

```lean
theorem satisfiesOrderedField
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) :
    OrderedFieldLaws (EffectiveCauchyReal rationalSystem)
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
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) :
    OrderedFieldLaws (EffectiveCauchyReal rationalSystem) := by
  sorry
/--
`satisfiesCompleteOrderedField` The effective-Cauchy construction canonically realizes complete ordered field structure.

Predicate logic:

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem), LRA.AlgebraicStructures.CompleteOrderedFieldLaws (LRA.NumberSystems.RealNumbers.EffectiveCauchy.EffectiveCauchyReal rationalSystem) (Set (LRA.NumberSystems.RealNumbers.EffectiveCauchy.EffectiveCauchyReal rationalSystem))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem
  Prove
    (LRA.AlgebraicStructures.OrderedFieldLaws (Quot (LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem).1) ∧ (LRA.Order.OrderCompletenessLaws (Quot (LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem).1) (Quot (LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem).1 → Prop)))

Logical form (Lean):

```lean
theorem satisfiesCompleteOrderedField
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) :
    CompleteOrderedFieldLaws
      (EffectiveCauchyReal rationalSystem)
      (Set (EffectiveCauchyReal rationalSystem))
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
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) :
    CompleteOrderedFieldLaws
      (EffectiveCauchyReal rationalSystem)
      (Set (EffectiveCauchyReal rationalSystem)) := by
  sorry
end LRA.NumberSystems.RealNumbers.EffectiveCauchy
