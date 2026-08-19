import LRA.NumberSystems.RealNumbers.Constructions
import LRA.NumberSystems.RealNumbers.ConstructionModels
import LRA.NumberSystems.RealNumbers.Extensions
import LRA.NumberSystems.RealNumbers.Extended
import LRA.NumberSystems.RealNumbers.IntervalArithmetic
import LRA.NumberSystems.RealNumbers.Irrationals
import LRA.NumberSystems.RealNumbers.Construction

/-!
Canonical import route for the real-number system. Moved from
`LRA.VolumeII.RealNumbers` per §7.7.

`Extensions`, `Extended`, `IntervalArithmetic`, and `Irrationals` are
top-level, system-wide files, not part of any single construction's
§1.6.1 pipeline: each builds derived theory (integer powers/nth roots,
the extended real line, interval arithmetic, irrationality) atop any
already-existing `RealModel`/`RealExtension`, mirroring how Rational's
`ComparisonModels.lean` stayed top-level rather than living inside a
construction's `Constructions/` directory. See `RealNumbers/ProofOrder.md`.
-/
