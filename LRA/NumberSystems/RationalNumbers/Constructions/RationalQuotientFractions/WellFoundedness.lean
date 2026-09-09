
import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions.Equivalence

namespace LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

/--
`induction_on_representatives` TODO

Predicate logic:

  ∀ (rational_data : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData) (motive : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Carrier rational_data → Prop), (∀ (representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), motive (Quotient.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data) representative)) → ∀ (value : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Carrier rational_data), motive value

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    rational_data : IntegerAndPositiveNaturalData
    motive : Carrier rational_data → Prop
  Prove
    (∀ (representative : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Representative rational_data), motive (Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1 representative)) → ∀ (value : Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rational_data).1), motive value

Logical form (Lean):

```lean
theorem induction_on_representatives
    (rational_data : IntegerAndPositiveNaturalData)
    (motive : Carrier rational_data → Prop)
    (onRepresentative :
      ∀ representative : Representative rational_data,
        motive (Quotient.mk _ representative)) :
    ∀ value : Carrier rational_data, motive value
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
theorem induction_on_representatives
    (rational_data : IntegerAndPositiveNaturalData)
    (motive : Carrier rational_data → Prop)
    (onRepresentative :
      ∀ representative : Representative rational_data,
        motive (Quotient.mk _ representative)) :
    ∀ value : Carrier rational_data, motive value := by
  sorry
end LRA.NumberSystems.RationalNumbers.RationalQuotientFractions
