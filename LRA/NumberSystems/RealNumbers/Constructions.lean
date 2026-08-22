import LRA.NumberSystems.RealNumbers.Constructions.Cauchy
import LRA.NumberSystems.RealNumbers.Constructions.Cantor
import LRA.NumberSystems.RealNumbers.Constructions.Dedekind
import LRA.NumberSystems.RealNumbers.Constructions.Dyadic
import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals
import LRA.NumberSystems.RealNumbers.Constructions.EffectiveCauchy

/-!
Aggregate import for real-number constructions and representation layers:
Cauchy sequences (the foundational construction, transported-through by Dyadic
and compared against by Cantor and PrimitiveIntervals), Cantor nested
intervals, Dedekind cuts (the reference construction), binary/dyadic
expansions, primitive rational intervals, and modulus-tracked rational Cauchy
approximations.

`EffectiveCauchy` is deliberately not named `Computable`: arbitrary Lean
functions equipped with a mathematical modulus are not by themselves
computable functions, and no countability or detached `RealModel` realization
is asserted for that package.

`ConstructionModels.lean` holds thinner alternate-model existence claims and
pairwise comparison statements, not full constructions run through the
§1.6.1 pipeline; see the note there.
-/
