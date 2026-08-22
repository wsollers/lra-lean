import LRA.NumberSystems.NaturalNumbers
import LRA.NumberSystems.IntegerStructure
import LRA.VolumeII.NumberSystems
import LRA.VolumeII.PeanoSystems
import LRA.VolumeII.Integers
import LRA.NumberSystems.GaussianIntegers
import LRA.NumberSystems.RationalNumbers
import LRA.NumberSystems.RealNumbers
import LRA.NumberSystems.ComplexNumbers
import LRA.VolumeII.Arithmetic
import LRA.EuclideanSpace

/-!
Aggregate import for Volume II.

The generic Peano-system axioms have promoted to `LRA.NumberSystems.PeanoSystem`
per §1.6.10/§7.7 step 4; `PeanoSystems` here now carries only Presburger
arithmetic. The one-based natural-number construction (`NModel`,
`NAddition`/`NMultiplication`/`NExponentiation`) has promoted to
`LRA.NumberSystems.NaturalNumbers.Constructions.Landau`, alongside the
`VonNeumann` and `Presburger` constructions there. `WholeNumbers` has
promoted too, to `LRA.NumberSystems.NaturalNumbers.Constructions.WholeNumbers`
-- it turned out to be a fourth construction of the natural numbers (adjoin
a zero to a one-based Peano system), not a separate system in its own right,
so there is no `LRA.VolumeII.WholeNumbers` here any more.

The five integer constructions (`QuotientOrderedPairs`, `Tao`, `Mendelson`,
`Polish`, `Pfefer`) have promoted to
`LRA.NumberSystems.Integers.Constructions`, imported transitively via
`LRA.VolumeII.Integers` -> `Implementation` -> `Constructions.Polish`. The
generic two-sided-successor interface they realize (Polish's
`TwoSidedSuccessor`, specifically) has promoted to
`LRA.NumberSystems.IntegerStructure`, mirroring `LRA.NumberSystems.PeanoSystem`
per §1.6.10. See `LRA/NumberSystems/Integers/ProofOrder.md`.

The rational-number system (`RationalQuotientFractions`, `ComparisonModels`,
`Construction`, `ContinuedFractions`) has promoted to
`LRA.NumberSystems.RationalNumbers`, with no switch to retire
(`rationalNumbersModel` takes its `DenselyOrderedFieldModel` as an explicit
parameter). See `LRA/NumberSystems/RationalNumbers/ProofOrder.md`.

The real-number system (six constructions -- Cauchy, Cantor, Dedekind,
Dyadic, PrimitiveIntervals, Computable -- plus `ConstructionModels`,
`Extensions`, `Extended`, `NonNegative`, `IntervalArithmetic`,
`Irrationals`, and `Construction`) has promoted to
`LRA.NumberSystems.RealNumbers`, likewise with no switch to retire
(`realNumbersModel` takes its `RealModel` as an explicit parameter). See
`LRA/NumberSystems/RealNumbers/ProofOrder.md`.

The complex-number system (`OrderedPairs`, generic over any certified
carrier `R`, plus `Construction`) has promoted to
`LRA.NumberSystems.ComplexNumbers`, likewise with no switch to retire.
The Gaussian-integer system (`OrderedPairs`, plus the active
instantiation over `LRA.NumberSystems.Integers.Z` in `Construction`) has
promoted to `LRA.NumberSystems.GaussianIntegers`; unlike Complex, it
*does* sit downstream of Integer's still-active switch
(`LRA.VolumeII.Integers.Implementation`), unchanged by this move. See
`LRA/NumberSystems/ComplexNumbers/ProofOrder.md` and
`LRA/NumberSystems/GaussianIntegers/ProofOrder.md`.

Volume II ends with `LRA.EuclideanSpace`, the new geometric layer between
`LRA.NumberSystems` and `LRA.Analysis`: it consumes the real numbers this
volume constructs and produces the geometric arena (coordinates, points,
lines, planes, surfaces, intervals) that Volume III's `LRA.Analysis`
generalizes from. See `LRA/EuclideanSpace.lean` for its agreed scope and
the design discussion recorded in `LRA/VolumeII/Arithmetic/DesignDoc.md`.
-/
