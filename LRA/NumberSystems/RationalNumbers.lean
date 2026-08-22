import LRA.NumberSystems.RationalNumbers.Definition
import LRA.NumberSystems.RationalNumbers.Constructions
import LRA.NumberSystems.RationalNumbers.ComparisonModels
import LRA.NumberSystems.RationalNumbers.Construction
import LRA.NumberSystems.RationalNumbers.ContinuedFractions

/-!
Canonical import route for the rational-number system. Moved from
`LRA.VolumeII.RationalNumbers` per §7.7.

`RationalNumberSystem` is the rational-specific package: it records a chosen
integer model, an underlying densely ordered field, the integer embedding, and
fraction generation. `Examples.lean` is intentionally opt-in and demonstrates
constructing rational systems over different integer realizations.

`ContinuedFractions` has now moved here too: Real has been promoted to
`LRA.NumberSystems.RealNumbers` per §7.7 step 5, so the forward dependency
on `RealNumbers.Irrationals` that previously stranded it at
`LRA.VolumeII.RationalNumbers.ContinuedFractions` no longer applies. See
`RationalNumbers/ProofOrder.md`.
-/
