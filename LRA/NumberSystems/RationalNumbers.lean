import LRA.NumberSystems.RationalNumbers.Definition
import LRA.NumberSystems.RationalNumbers.Constructions
import LRA.NumberSystems.RationalNumbers.ComparisonModels
import LRA.NumberSystems.RationalNumbers.Construction
import LRA.NumberSystems.RationalNumbers.ContinuedFractions
import LRA.NumberSystems.RationalNumbers.UniversalProperty

/-!
Canonical import route for the rational-number system. Moved from
`LRA.VolumeII.RationalNumbers` per §7.7.

`RationalNumberSystem` is the rational-specific package: it records a chosen
integer model, an underlying densely ordered field, the integer embedding, and
fraction generation. `Examples.lean` is intentionally opt-in and demonstrates
constructing rational systems over different integer realizations.

The fraction-field universal property is derived from `RationalNumberSystem`
in `UniversalProperty.lean`; it is not stored as a second independent
certificate.

The arithmetic syntax of continued fractions is owned by
`LRA.Arithmetic.ContinuedFractions`; this subject module owns only the rational
interpretation and finite rational expansion theorem.
-/
