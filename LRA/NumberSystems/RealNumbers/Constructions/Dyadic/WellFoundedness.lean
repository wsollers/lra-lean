-- LRA/NumberSystems/RealNumbers/Constructions/Dyadic/WellFoundedness.lean
-- The binary-expansion carrier is an ordinary inductive/structure hierarchy,
-- so Lean's generated recursors already provide the needed induction
-- principles.

import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.Equivalence

namespace LRA.NumberSystems.RealNumbers.Dyadic

/-!
`Expansion` is a directly recursive inductive type built from `Sign` and
`NonzeroUnsignedExpansion`; the latter wraps an `UnsignedExpansion`, whose
whole part is a `WholeBinaryNumeral` and whose fractional part is a
`CanonicalFraction`. None of these types is a quotient.

Consequently no additional quotient-induction bridge is required at this
pipeline stage. The later semantic comparison with the quotient-based Cauchy
carrier is handled by the value-map and bijection theorems in
`WellDefinedness.lean`.
-/

end LRA.NumberSystems.RealNumbers.Dyadic
