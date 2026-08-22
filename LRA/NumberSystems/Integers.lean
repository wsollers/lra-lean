import LRA.NumberSystems.Integers.Definition
import LRA.NumberSystems.Integers.UniversalProperty
import LRA.NumberSystems.Integers.Theorems
import LRA.NumberSystems.Integers.Constructions

/-!
Canonical import route for the integer number system.

`IntegerNumberSystem` is the integer-specific package: it records a
`DiscretelyOrderedIntegralDomainModel` together with the generation condition
that every element is a canonical integer numeral. Concrete constructions live
under `Constructions/`. `Examples.lean` is intentionally opt-in.
-/
