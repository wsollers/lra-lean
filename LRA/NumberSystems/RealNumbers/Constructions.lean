import LRA.NumberSystems.RealNumbers.Constructions.Cauchy
import LRA.NumberSystems.RealNumbers.Constructions.Cantor
import LRA.NumberSystems.RealNumbers.Constructions.Dedekind
import LRA.NumberSystems.RealNumbers.Constructions.Dyadic
import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals
import LRA.NumberSystems.RealNumbers.Constructions.Computable

/-!
Aggregate import for real-number constructions: Cauchy sequences (the
foundational construction, transported-through by Dyadic and compared
against by Cantor and PrimitiveIntervals), Cantor nested intervals,
Dedekind cuts (the reference construction), binary/dyadic expansions,
primitive rational intervals, and computable reals. Each realizes
`LRA.NumberSystems.Models.RealModel` via its own `Instances.lean`
(all `sorry` -- see `RealNumbers/ProofOrder.md`).

`ConstructionModels.lean` holds thinner alternate-model existence claims
and pairwise isomorphism theorems for four of these six, not full
constructions run through the §1.6.1 pipeline -- see the note there.
-/
