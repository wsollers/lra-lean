-- LRA/NumberSystems/Integers/Constructions/QuotientOrderedPairs/Instances.lean
-- Registration into the system's interface.

import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs.Behavior
import LRA.VolumeII.NumberSystems.Models

namespace LRA.NumberSystems.Integers.QuotientOrderedPairs

/-!
New content: this construction has no `succ`/`pred` operations (it is
ring-first, not successor-first, unlike Polish's `TwoSidedSuccessor`), so it
realizes `NumberSystems.Models.IntegerModel` -- the ring-and-order interface
-- rather than the successor-based `IntegerStructure` interface Polish
realizes. Assembling the instance from the (mostly `sorry`) law lemmas above
is itself new work under this migration's policy, so it is stated whole,
`sorry`, rather than composed field-by-field without a toolchain to check
the composition. Tracked in `Integers/ProofOrder.md`.
-/

/-- `Carrier whole_data` realizes the generic ring-and-order `IntegerModel`
interface, given a computable choice of quotient operations. -/
noncomputable def QuotientOrderedPairsRealizesIntegerModel
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.NumberSystems.Models.IntegerModel := by
  sorry

end LRA.NumberSystems.Integers.QuotientOrderedPairs
