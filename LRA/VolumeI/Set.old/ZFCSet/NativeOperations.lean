import LRA.VolumeI.Set.ZFCSet.ZFCSet
import LRA.VolumeI.Set.NativeSetOperations

namespace LRA.VolumeI.Set

/-!
`ZFCSet`'s native operations.

Not filled in for real yet: most of the underlying axiom-readings
(`powerSetAxiomReading`, a Separation-instance reading, a
Replacement-instance reading, a Successor/Infinity reading) don't exist
yet in `ZFC/Semantics/AxiomReadings.lean` -- only `emptySetAxiomReading`,
`pairingAxiomReading`, and `unionAxiomReading` do. This is one
placeholder for the whole bundle rather than several smaller ones, since
building it properly means adding those readings first, then routing
each operation through `Classical.choose` the way the old
`ZFCProvidesEmptySet` pattern already showed.
-/

/-- `ZFCSet`'s operations and their correctness, bundled. Placeholder. -/
noncomputable def ZFCSetNativeOperationsModel (Context : ZFCSetContext) :
    NativeSetOperationsModel (ZFCSet Context) (ZFCSet.Member (Context := Context)) := by
  sorry

end LRA.VolumeI.Set
