import LRA.Analysis.Completeness.Completeness.Definition
import LRA.Analysis.Completeness.Completeness.Theorems

/-!
Aggregate import for the `Completeness` concept: the leftover core
completeness material not owned by `ArchimedeanProperty`, `Density`,
`NestedIntervalProperty`, or `Equivalence`. Each source file
(`AxiomOfCompleteness.lean`, `CompletenessProcesses.lean`,
`CompletenessAdditions.lean`, `OrderSeparation.lean`) gets its own leaf file
under `Definition/` and `Theorems/`, migrated one at a time. Failure material
stays opt-in via `Completeness/Failures`.
-/
