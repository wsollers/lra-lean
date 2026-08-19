-- LRA/NumberSystems/GaussianIntegers/Constructions/OrderedPairs/WellFoundedness.lean
-- The induction principle the carrier supports.

import LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.Equivalence

namespace LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs

/-!
No new content at this stage, for the same reason as
`ComplexNumbers.Constructions.OrderedPairs.WellFoundedness`:
`GaussianInteger R` is a plain two-field structure over `R`, not a
quotient of a coarser representative type, so Lean's ordinary structure
recursor already gives every predicate on `GaussianInteger R` reduction
to a predicate on its two fields.
-/

end LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs
