import LRA.NumberSystems.NaturalNumbers
import LRA.NumberSystems.IntegerStructure
import LRA.NumberSystems.Integers
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

The actual integer-number-system interface is owned by
`LRA.NumberSystems.Integers.IntegerNumberSystem`; the broader structural class
is `LRA.NumberSystems.Models.DiscretelyOrderedIntegralDomainModel`. The five
integer constructions (`QuotientOrderedPairs`, `Tao`, `Mendelson`, `Polish`,
`Pfefer`) live under `LRA.NumberSystems.Integers.Constructions`. The generic
two-sided-successor interface remains `LRA.NumberSystems.IntegerStructure`.
See `LRA/NumberSystems/Integers/ProofOrder.md`.

The rational-number system (`RationalQuotientFractions`, `ComparisonModels`,
`Construction`, `ContinuedFractions`) is owned by
`LRA.NumberSystems.RationalNumbers`; `RationalNumberSystem` records an actual
integer system, a densely ordered field, the integer embedding, and fraction
generation. See `LRA/NumberSystems/RationalNumbers/ProofOrder.md`.

The real-number system (six constructions -- Cauchy, Cantor, Dedekind,
Dyadic, PrimitiveIntervals, Computable -- plus `ConstructionModels`,
`Extensions`, `Extended`, `NonNegative`, `IntervalArithmetic`,
`Irrationals`, `ContinuedFractions`, and `Construction`) is owned by
`LRA.NumberSystems.RealNumbers`. See `LRA/NumberSystems/RealNumbers/ProofOrder.md`.

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

Volume II ends with `LRA.EuclideanSpace`, the geometric layer between
`LRA.NumberSystems` and `LRA.Analysis`: it consumes the real numbers this
volume constructs and produces the geometric arena that Volume III's
`LRA.Analysis` generalizes from.
-/
