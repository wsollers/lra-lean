import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions.Instances

namespace LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

/--
`satisfiesGeneric` The quotient-of-integer-fractions construction satisfies the generic ℚ interface: for any integer-and-positive-natural data, its quotient carrier is a `RationalModel`.

Predicate logic:

  noncomputable abbrev satisfiesGeneric
      (rationalData : IntegerAndPositiveNaturalData) :
      LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel :=
    RationalQuotientFractionsRealizesRationalModel rationalData

Predicate logic (unfolded):

  noncomputable abbrev satisfiesGeneric
      (rationalData : IntegerAndPositiveNaturalData) :
      LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel :=
    RationalQuotientFractionsRealizesRationalModel rationalData (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable abbrev satisfiesGeneric
    (rationalData : IntegerAndPositiveNaturalData) :
    LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel :=
  RationalQuotientFractionsRealizesRationalModel rationalData
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
noncomputable abbrev satisfiesGeneric
    (rationalData : IntegerAndPositiveNaturalData) :
    LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel :=
  RationalQuotientFractionsRealizesRationalModel rationalData

end LRA.NumberSystems.RationalNumbers.RationalQuotientFractions
