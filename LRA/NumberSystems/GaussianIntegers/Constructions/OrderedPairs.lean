import LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.Carrier
import LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.Equivalence
import LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.WellFoundedness
import LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.Operations
import LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.WellDefinedness
import LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.Laws
import LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.Behavior
import LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.Instances

/-!
Canonical import route for the ordered-pair construction of the Gaussian
integers over any certified commutative-ring carrier `R`. Moved from
`LRA.VolumeII.GaussianIntegers.Construction.Model` (previously one
400-line file, also covering the active instantiation and first-order
model -- see `GaussianIntegers/Construction.lean` for those) and split
into the §1.6.1 pipeline. See `GaussianIntegers/ProofOrder.md`.
-/
