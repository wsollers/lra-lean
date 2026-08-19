import LRA.NumberSystems.NaturalNumbers
import LRA.VolumeII.NumberSystems
import LRA.VolumeII.PeanoSystems
import LRA.VolumeII.WholeNumbers
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
`VonNeumann` and `Presburger` constructions there; `WholeNumbers` imports it
from its new location. Number-system modules will be imported here after
their foundation dependencies are in place.
-/
