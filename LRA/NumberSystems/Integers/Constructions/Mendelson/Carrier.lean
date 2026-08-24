
import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs

namespace LRA.NumberSystems.Integers.Mendelson

/--
`PositiveNaturalPairData` TODO

Predicate logic:

  abbrev PositiveNaturalPairData :=
  QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs

Predicate logic (unfolded):

  abbrev PositiveNaturalPairData :=
  QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev PositiveNaturalPairData :=
  QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs
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
abbrev PositiveNaturalPairData :=
  QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs

/--
`PositivePair` TODO

Predicate logic:

  structure PositivePair (positive_data : PositiveNaturalPairData) where
  left : positive_data.carrier
  right : positive_data.carrier

Predicate logic (unfolded):

  structure PositivePair (positive_data : PositiveNaturalPairData) where
  left : positive_data.carrier
  right : positive_data.carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure PositivePair (positive_data : PositiveNaturalPairData) where
  left : positive_data.carrier
  right : positive_data.carrier
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
structure PositivePair (positive_data : PositiveNaturalPairData) where
  left : positive_data.carrier
  right : positive_data.carrier

end LRA.NumberSystems.Integers.Mendelson
