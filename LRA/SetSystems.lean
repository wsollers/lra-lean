import LRA.SetSystems.Closure
import LRA.SetSystems.RingOfSets
import LRA.SetSystems.AlgebraOfSets
import LRA.SetSystems.SigmaAlgebra
import LRA.SetSystems.DeltaAlgebra
import LRA.SetSystems.GeneratedSigmaAlgebra

/-!
Canonical subject for structured collections of sets.

`SetSystems` owns rings of sets, algebras of sets, sigma-structures, delta
structures, and generated sigma-algebra machinery. Raw set families and set
operations remain owned by `LRA.Set`. Examples are opt-in.
-/
