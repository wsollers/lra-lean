import LRA.VolumeI.Set.WellDefined
import LRA.VolumeI.Set.ZFCSet.NativeOperations

namespace LRA.VolumeI.Set

/-!
Well-foundedness and well-definedness for `ZFCSet`.
-/

/-- Whether `∈` is well-founded for `ZFCSet Model` -- a real, meaningful
question here (single-sorted membership), but not provable from
nothing: it needs Foundation (Regularity), already among `Model`'s
basic axioms, routed through an argument not yet written. -/
theorem ZFCSetWellFounded (Context : ZFCSetContext) :
    IsWellFounded (ZFCSet.Member (Context := Context)) := by
  sorry

/-- `ZFCSet Model` is not itself a quotient type -- it is literally
`Model.Domain` -- so well-definedness reduces to the same free
function-congruence argument as `LRASet`/`MathlibSet`, riding on this
backend's own extensionality (`extensionalityAxiomReading`) rather than
a genuine quotient-respecting proof. Stated against
`ZFCSetNativeOperationsModel`'s `binaryUnion` field as the
representative case; sorry'd, since that field is itself still a
placeholder. -/
theorem ZFCSetBinaryUnionRespectsEquality (Context : ZFCSetContext) :
    RespectsEquivBinary (Eq : ZFCSet Context → ZFCSet Context → Prop)
      (ZFCSetNativeOperationsModel Context).ops.binaryUnion := by
  sorry

/-- `ZFCSet` satisfies the native-set contract once its native operation
bundle, equivalence-respect proofs, and membership foundation proof are
provided.

This is the backend-facing theorem layer: downstream code should depend on
this `Is...` theorem instead of depending directly on how `ZFCSet` packages its
model context. -/
theorem ZFCSetIsNativeSetStructure (Context : ZFCSetContext) :
    IsNativeSetStructureFromContains
      (ZFCSet.Contains (Context := Context))
      (ZFCSetNativeOperationsModel Context).ops
      (Eq : ZFCSet Context → ZFCSet Context → Prop) := by
  sorry

end LRA.VolumeI.Set
