import LRA.VolumeI.Set.ZFC.Semantics.Satisfaction
import LRA.VolumeI.Set.ZFC.Semantics.ClosedAxioms
import LRA.VolumeI.Set.ZFC.Semantics.SchemaCorrectness
import LRA.VolumeI.Set.ZFC.Semantics.Examples

/-!
Aggregate import shim for `Set/ZFC/Semantics/`: satisfaction of ZFC
formulas in a ZFC model (`satisfiesZFCFormula`), the model-facing
predicates asserting a model satisfies the ZFC axioms
(`SatisfiesZFCBasicAxioms`, the Separation/Replacement schema predicates,
and the aggregate ZFC-without-Choice predicate), assignment-independence for
closed named axioms, semantic readings and correctness lemmas for the schema
constructors, including the cleaned Separation/Replacement model-facing schema
bridges preferred for downstream arguments, and semantic checkpoints.
-/
