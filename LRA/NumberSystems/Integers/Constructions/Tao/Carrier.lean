-- LRA/NumberSystems/Integers/Constructions/Tao/Carrier.lean
-- Tao's formal-difference pre-carrier.

import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs

namespace LRA.NumberSystems.Integers.Tao

/-!
Volume II label: integers-tao-construction
Lean module: LRA.NumberSystems.Integers.Tao.Carrier
Source: docs/number-systems/gpt-02a-integers-tao.md
Verification status: definitions complete; proofs pending

Tao's construction presents integers as formal differences `a -- b` of whole
numbers, with equality given by cross-addition.  This module keeps that
presentation explicit while reusing the same whole-number arithmetic interface
as the default quotient-ordered-pairs construction.

Moved from `LRA.VolumeII.Integers.Tao.Construction.Model` (previously one
file covering the whole pipeline); split per §1.6.1 into `Carrier` (this
file), `Equivalence`, `WellFoundedness`, `Operations`, `WellDefinedness`,
`Laws`, `Behavior`, `Instances`. `tao_compares_with_quotient_ordered_pairs`
(a cross-construction isomorphism claim, not this construction's own
carrier/law/behavior) is deleted per the research note in
`Integers/ProofOrder.md`.
-/

/--
**[Abbrev — WholeNumberArithmeticForTaoFormalDifferences]**

Logical form:

```lean
abbrev WholeNumberArithmeticForTaoFormalDifferences :=
  QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs
```
-/
abbrev WholeNumberArithmeticForTaoFormalDifferences :=
  QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs


/-- Definition 1.1: Tao formal integer expression `a -- b`.

Logical form:

```lean
structure FormalDifference (whole_data : WholeNumberArithmeticForTaoFormalDifferences) where
  minuend : whole_data.carrier
  subtrahend : whole_data.carrier
```
-/
structure FormalDifference (whole_data : WholeNumberArithmeticForTaoFormalDifferences) where
  minuend : whole_data.carrier
  subtrahend : whole_data.carrier

end LRA.NumberSystems.Integers.Tao
