import LRA.NumberSystems.RealNumbers.Constructions.Computable.Carrier
import LRA.NumberSystems.RealNumbers.Constructions.Computable.Equivalence
import LRA.NumberSystems.RealNumbers.Constructions.Computable.WellFoundedness
import LRA.NumberSystems.RealNumbers.Constructions.Computable.Operations
import LRA.NumberSystems.RealNumbers.Constructions.Computable.WellDefinedness
import LRA.NumberSystems.RealNumbers.Constructions.Computable.Laws
import LRA.NumberSystems.RealNumbers.Constructions.Computable.Behavior

/-!
Canonical import route for the current computable-real representation layer.

This package does **not** realize `LRA.NumberSystems.Models.RealModel`:
computable reals form only a proper, countable subfield of the real numbers and
are not Dedekind complete. The current carrier also still uses arbitrary Lean
functions for approximation data, so a later repair must replace that with a
genuine effective/code-based notion before the countability theorem can be
trusted.
-/
