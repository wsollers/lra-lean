import LRA.Morphism.Properties.PreservesRelation.FailureModes
import LRA.Morphism.Properties.ReflectsRelation.FailureModes
import LRA.Morphism.Properties.RelationEmbedding.FailureModes
import LRA.Morphism.Properties.PreservesNullaryOperation.FailureModes
import LRA.Morphism.Properties.PreservesUnaryOperation.FailureModes
import LRA.Morphism.Properties.PreservesBinaryOperation.FailureModes
import LRA.Morphism.Properties.OperationEmbedding.FailureModes
import LRA.Function.Calculus.Classes.FailureModes
import LRA.Function.Operations.Inverse.FailureModes
import LRA.Function.Properties.FailureModes
import LRA.Function.Operations.Composition.FailureModes
import LRA.Function.Calculus.Restriction.FailureModes
import LRA.Function.Examples.Canonical
import LRA.Function.Examples.FailureModes

/-!
Build gate for the `LRA.Morphism` and `LRA.Function` failure-mode leaves.

`Examples.lean` and `FailureModes.lean` are quarantined leaves: no core `Definition`, `Theorems`, or
router may import them, so the group routers do not. Importing them from here
keeps them under a Lake target rather than letting them rot uncompiled.
-/
