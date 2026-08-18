import LRA.VolumeI.Relations.Operations.Composition.AllWithExamples
import LRA.VolumeI.Order.DiscreteOrder.AllWithExamples
import LRA.VolumeI.Order.Laws.LinearOrder.AllWithExamples
import LRA.VolumeI.Order.Laws.OperationCompatibility.AllWithExamples
import LRA.VolumeI.Order.Laws.PartialOrder.AllWithExamples
import LRA.VolumeI.Order.Laws.StrictOrderCompatibility.AllWithExamples

/-!
Keeps the quarantined example and failure-mode leaves of these concepts under a
build gate.

The Volume I/II Mathlib policy in `scripts/check-mathlib-imports.py` requires
core `All.lean` aggregates to stay free of `Examples`, `FailureModes`, and
adapter leaves, so those leaves are reachable only through `AllWithExamples`.
`AllWithExamples` is not part of any production library root, which would leave
the leaves uncompiled; importing them here puts them back in `LRATests` without
putting them back in the production aggregates.
-/
