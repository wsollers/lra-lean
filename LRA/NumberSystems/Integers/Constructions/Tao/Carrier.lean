
import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs

namespace LRA.NumberSystems.Integers.Tao

/--
`WholeNumberArithmeticForTaoFormalDifferences` TODO

Predicate logic:

  abbrev WholeNumberArithmeticForTaoFormalDifferences :=
  QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs

Predicate logic (unfolded):

  abbrev WholeNumberArithmeticForTaoFormalDifferences :=
  QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev WholeNumberArithmeticForTaoFormalDifferences :=
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
abbrev WholeNumberArithmeticForTaoFormalDifferences :=
  QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs

/--
`FormalDifference` TODO

Predicate logic:

  structure FormalDifference (whole_data : WholeNumberArithmeticForTaoFormalDifferences) where
  minuend : whole_data.carrier
  subtrahend : whole_data.carrier

Predicate logic (unfolded):

  structure FormalDifference (whole_data : WholeNumberArithmeticForTaoFormalDifferences) where
  minuend : whole_data.carrier
  subtrahend : whole_data.carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure FormalDifference (whole_data : WholeNumberArithmeticForTaoFormalDifferences) where
  minuend : whole_data.carrier
  subtrahend : whole_data.carrier
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
structure FormalDifference (whole_data : WholeNumberArithmeticForTaoFormalDifferences) where
  minuend : whole_data.carrier
  subtrahend : whole_data.carrier

end LRA.NumberSystems.Integers.Tao
