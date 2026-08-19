import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.Carrier
import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.Equivalence
import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.WellFoundedness
import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.Operations
import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.WellDefinedness
import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.Laws
import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.Behavior
import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.Instances

/-!
Canonical import route for the binary/dyadic-expansion construction of the
reals. Moved from `LRA.VolumeII.RealNumbers.Dyadic` (previously one
995-line file) and split into the §1.6.1 pipeline. This construction
transports a full ordered-field structure onto binary signed expansions
through a bijection with `LRA.NumberSystems.RealNumbers.Cauchy.Carrier`.
See `RealNumbers/ProofOrder.md`.
-/
