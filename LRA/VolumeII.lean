import LRA.NumberSystems.NaturalNumbers
import LRA.NumberSystems.IntegerStructure
import LRA.VolumeII.NumberSystems
import LRA.VolumeII.PeanoSystems
import LRA.VolumeII.Integers
import LRA.VolumeII.GaussianIntegers
import LRA.VolumeII.RationalNumbers
import LRA.VolumeII.RealNumbers
import LRA.VolumeII.RationalNumbers.ContinuedFractions
import LRA.VolumeII.ComplexNumbers
import LRA.VolumeII.Arithmetic

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
per §1.6.10. See `LRA/NumberSystems/Integers/ProofOrder.md`. Number-system
modules will be imported here after their foundation dependencies are in
place.
-/
