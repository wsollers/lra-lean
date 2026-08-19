import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.Carrier
import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.Equivalence
import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.WellFoundedness
import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.Operations
import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.WellDefinedness
import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.Laws
import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.Behavior
import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.Instances

/-!
Canonical import route for the reference Dedekind-cut construction of the
reals. Moved from `LRA.VolumeII.RealNumbers.Dedekind` (previously one
1388-line file) and split into the §1.6.1 pipeline. `Cut` is a subtype
(not a quotient), so `Equivalence.lean` carries the order structure in
place of a representative/equivalence layer, and the packaged `Cut`-valued
operations live in `WellDefinedness.lean` alongside their closure proofs
rather than in `Operations.lean`, since packaging into the subtype
requires the closure proof at construction time. See
`RealNumbers/ProofOrder.md`.
-/
