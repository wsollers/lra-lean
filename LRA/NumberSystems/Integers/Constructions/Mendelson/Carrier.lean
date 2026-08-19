-- LRA/NumberSystems/Integers/Constructions/Mendelson/Carrier.lean
-- Mendelson's positive-pair pre-carrier.

import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs

namespace LRA.NumberSystems.Integers.Mendelson

/-!
Volume II label: integers-mendelson-construction
Lean module: LRA.NumberSystems.Integers.Mendelson.Carrier
Source: docs/number-systems/gpt-02b-integers-mendelson.md
Verification status: definitions complete; proofs pending

Moved from `LRA.VolumeII.Integers.Mendelson.Construction.Model` (previously
one file covering the whole pipeline); split per §1.6.1 into `Carrier`
(this file), `Equivalence`, `WellFoundedness`, `Operations`,
`WellDefinedness`, `Laws`, `Instances`.
`mendelson_compares_with_quotient_ordered_pairs` (a cross-construction
isomorphism claim, not this construction's own carrier/law/behavior) is
deleted per the research note in `Integers/ProofOrder.md`.
-/

/--
**[Abbrev — PositiveNaturalPairData]**

Logical form:

```lean
abbrev PositiveNaturalPairData :=
  QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs
```
-/
abbrev PositiveNaturalPairData :=
  QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs


/-- Definition 1.1: a Mendelson representative is a pair of positive naturals.

Logical form:

```lean
structure PositivePair (positive_data : PositiveNaturalPairData) where
  left : positive_data.carrier
  right : positive_data.carrier
```
-/
structure PositivePair (positive_data : PositiveNaturalPairData) where
  left : positive_data.carrier
  right : positive_data.carrier

end LRA.NumberSystems.Integers.Mendelson
