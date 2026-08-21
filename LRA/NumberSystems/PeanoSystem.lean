import LRA.NumberSystems.PeanoSystem.Definition
import LRA.NumberSystems.PeanoSystem.Theorems
import LRA.NumberSystems.PeanoSystem.Interface.Signature.Definition
import LRA.NumberSystems.PeanoSystem.Interface.ModelTheory.LStructure
import LRA.NumberSystems.PeanoSystem.Interface.ModelTheory.Theory
import LRA.NumberSystems.PeanoSystem.Interface.ModelTheory.Model
import LRA.NumberSystems.PeanoSystem.Induction
import LRA.NumberSystems.PeanoSystem.Recursion
import LRA.NumberSystems.PeanoSystem.Categoricity

/-!
Canonical import route for the generic Peano-system axiomatic layer.

Per §1.6.10, `PeanoSystem` is not a sixth number system: it is the generic,
base-agnostic characterization -- one distinguished element, one successor,
base-not-a-successor, successor-injective, induction -- that
`NaturalNumbersZeroBased` and `NaturalNumbersOneBased` both realize,
unqualified. It selects no construction and has no `Realization.lean` of its
own: nothing outside itself realizes here, this is what gets realized.
-/
