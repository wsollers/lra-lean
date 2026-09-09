import LRA.AlgebraicStructures
import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions.Instances

namespace LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

open LRA.AlgebraicStructures

/--
`satisfiesField` The quotient-of-integer-fractions construction canonically realizes field structure.

Predicate logic:

  ∀ (rationalData : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData), LRA.AlgebraicStructures.FieldLaws (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Carrier rationalData)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    rationalData : IntegerAndPositiveNaturalData
  Prove
    LRA.AlgebraicStructures.FieldLaws (Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rationalData).1)

Logical form (Lean):

```lean
theorem satisfiesField
    (rationalData : IntegerAndPositiveNaturalData) :
    FieldLaws (Carrier rationalData)
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
    (rationalData : IntegerAndPositiveNaturalData) :
    FieldLaws (Carrier rationalData) := by
  sorry
/--
`satisfiesOrderedField` The quotient-of-integer-fractions construction canonically realizes ordered field structure.

Predicate logic:

  ∀ (rationalData : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData), LRA.AlgebraicStructures.OrderedFieldLaws (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Carrier rationalData)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    rationalData : IntegerAndPositiveNaturalData
  Prove
    LRA.AlgebraicStructures.OrderedFieldLaws (Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rationalData).1)

Logical form (Lean):

```lean
theorem satisfiesOrderedField
    (rationalData : IntegerAndPositiveNaturalData) :
    OrderedFieldLaws (Carrier rationalData)
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
    (rationalData : IntegerAndPositiveNaturalData) :
    OrderedFieldLaws (Carrier rationalData) := by
  sorry
end LRA.NumberSystems.RationalNumbers.RationalQuotientFractions
