import LRA.NumberSystems.RationalNumbers.Constructions
import LRA.NumberSystems.RationalNumbers.ComparisonModels
import LRA.NumberSystems.RationalNumbers.Construction

/-!
Canonical import route for the rational-number system. Moved from
`LRA.VolumeII.RationalNumbers` per §7.7.

`LRA.VolumeII.RationalNumbers.ContinuedFractions` stays at its old path
for now: it imports `LRA.VolumeII.RealNumbers.Irrationals`, a forward
dependency on the not-yet-migrated Real system, so moving it here would
strand that import. It will move once Real is promoted. See
`RationalNumbers/ProofOrder.md`.
-/
