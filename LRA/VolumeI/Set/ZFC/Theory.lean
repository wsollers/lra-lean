import LRA.VolumeI.Set.ZFC.Theory.Axioms
import LRA.VolumeI.Set.ZFC.Theory.Schemas
import LRA.VolumeI.Set.ZFC.Theory.Examples

/-!
Aggregate import shim for `Set/ZFC/Theory/`: the asserted content of ZFC.
The named non-schema axioms (Extensionality, Empty set, Pairing, Union,
Power set, Foundation, Infinity, and Choice) as fixed formulas, and the
Separation and Replacement axiom *schemas* as constructors taking a
predicate formula to an axiom instance. Choice is present as a documented
formula (the pairwise-disjoint transversal form) for completeness, but is
not yet part of the model-facing satisfaction predicates.
-/
