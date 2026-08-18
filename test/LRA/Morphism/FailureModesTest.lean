import LRA.Morphism.Properties.PreservesRelation.FailureModes
import LRA.Morphism.Properties.ReflectsRelation.FailureModes
import LRA.Morphism.Properties.RelationEmbedding.FailureModes
import LRA.Morphism.Properties.PreservesNullaryOperation.FailureModes
import LRA.Morphism.Properties.PreservesUnaryOperation.FailureModes
import LRA.Morphism.Properties.PreservesBinaryOperation.FailureModes
import LRA.Morphism.Properties.OperationEmbedding.FailureModes

/-!
Build gate for the `LRA.Morphism` failure-mode leaves.

`FailureModes.lean` is a quarantined leaf: no core `Definition`, `Theorems`, or
router may import it, so the group router does not. Importing it from here keeps
it under a Lake target rather than letting it rot uncompiled.
-/
