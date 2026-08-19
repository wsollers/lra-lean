-- LRA/NumberSystems/ComplexNumbers/Constructions/OrderedPairs/WellFoundedness.lean
-- The induction principle the carrier supports.

import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.Equivalence

namespace LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

/-!
No new content at this stage, unlike the quotient-based constructions
elsewhere in this migration (e.g. `RealNumbers.Cauchy`, whose
`WellFoundedness.lean` adds a `sorry`-stated induction-on-representatives
principle). `ComplexNumber R` is a plain two-field structure over `R`,
not a quotient of a coarser representative type, so Lean's ordinary
structure recursor (`ComplexNumber.rec`, generated automatically) already
gives every predicate on `ComplexNumber R` reduction to a predicate on
its two fields -- there is no representative/quotient gap analogous to
Cauchy's "every class has a representative sequence" to fill.
-/

end LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs
