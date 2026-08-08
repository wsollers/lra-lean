import LRA.VolumeI.Set.Implementations.LRASet.LRASet
import LRA.VolumeI.Set.Implementations.LRASet.Public
import LRA.VolumeI.Set.Implementations.LRASet.Boolean
import LRA.VolumeI.Set.Implementations.LRASet.Comprehension
import LRA.VolumeI.Set.Implementations.LRASet.PowerSet
import LRA.VolumeI.Set.Implementations.LRASet.Operations
import LRA.VolumeI.Set.Implementations.LRASet.Laws
import LRA.VolumeI.Set.Implementations.LRASet.CollectionAlgebra

/-!
Aggregate import for the `LRASet` predicate-set backend.

This module exposes the concrete backend operations, laws, and adapters. Public
algebra and topology theorem targets live in the generic collection-algebra
surface, not in implementation-local LRASet modules.
-/
