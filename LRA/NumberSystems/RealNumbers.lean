import LRA.NumberSystems.RealNumbers.Constructions
import LRA.NumberSystems.RealNumbers.ConstructionModels
import LRA.NumberSystems.RealNumbers.Extensions
import LRA.NumberSystems.RealNumbers.Extended
import LRA.NumberSystems.RealNumbers.NonNegative
import LRA.NumberSystems.RealNumbers.IntervalArithmetic
import LRA.NumberSystems.RealNumbers.Irrationals
import LRA.NumberSystems.RealNumbers.Construction

/-!
Canonical import route for the real-number system. Moved from
`LRA.VolumeII.RealNumbers` per §7.7.

`Extensions`, `Extended`, `NonNegative`, `IntervalArithmetic`, and
`Irrationals` are top-level, system-wide files, not part of any single
construction's §1.6.1 pipeline: each builds derived theory (integer
powers/nth roots, the extended real line, non-negative (extended) reals,
interval arithmetic, irrationality) atop any already-existing
`RealModel`/`RealExtension`, mirroring how Rational's
`ComparisonModels.lean` stayed top-level rather than living inside a
construction's `Constructions/` directory. See `RealNumbers/ProofOrder.md`.

`NonNegative`'s Mathlib bridge theorems live at
`RealNumbers/Interop/Mathlib/{Extended,NonNegative}.lean`, deliberately
NOT imported here: the quarantine (lakefile.lean's `Interop` carve-out)
keeps this router, and everything that depends on it, Mathlib-free. Those
files are still compiled by the `LRAAll` full-coverage target.
-/
