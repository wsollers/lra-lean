import LRA.VolumeII.NumberSystems
import LRA.VolumeII.PeanoSystems
import LRA.VolumeII.NaturalNumbers
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
arithmetic. Number-system modules will be imported here after their
foundation dependencies are in place.
-/
