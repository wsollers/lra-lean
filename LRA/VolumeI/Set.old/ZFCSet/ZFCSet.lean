import LRA.VolumeI.Set.ZFC.Model.Membership
import LRA.VolumeI.Set.ZFC.Semantics.SchemaCorrectness
import LRA.VolumeI.Set.NativeSetOperations

namespace LRA.VolumeI.Set

/-!
The from-scratch, Enderton-style ZFC set object.

This is model-internal, matching the first-order presentation: a set is an
object in the domain of a structure satisfying the project's currently
formalized ZFC axioms. There is no ambient universal set and no global external
carrier of all sets.
-/

/-- A ZFC model together with evidence that it satisfies the currently
formalized ZFC axioms, excluding Choice while Choice is tracked separately in
the semantics layer. -/
structure ZFCSetContext where
  Model : LRA.VolumeI.Set.ZFC.ZFCModel
  Axioms : LRA.VolumeI.Set.ZFC.SatisfiesZFCAxiomsWithoutChoiceCleanly Model

/-- An Enderton-style ZFC set: a model-internal object of a ZFC axiom-carrying
context. -/
abbrev ZFCSet (Context : ZFCSetContext) : Type := Context.Model.Domain

/-- Containment for `ZFCSet` values -- the model's own `∈`, restated in
container-first direction. -/
def ZFCSet.Contains {Context : ZFCSetContext}
    (set element : ZFCSet Context) : Prop :=
  LRA.VolumeI.Set.ZFC.zfcSetMembership Context.Model element set

/-- Membership between `ZFCSet` values, wrapped from container-first
containment. -/
def ZFCSet.Member {Context : ZFCSetContext} :
    ZFCSet Context → ZFCSet Context → Prop :=
  MemberOfContains (ZFCSet.Contains (Context := Context))

namespace ZFCSetContext

/-- The named basic ZFC axiom readings available in a `ZFCSetContext`. -/
theorem BasicAxiomSentences
    (Context : ZFCSetContext) :
    LRA.VolumeI.Set.ZFC.SatisfiesZFCBasicAxiomSentences Context.Model :=
  LRA.VolumeI.Set.ZFC.satisfiesZFCAxiomsWithoutChoiceCleanly.basicAxiomSentences
    Context.Axioms

/-- The Separation schema available in a `ZFCSetContext`. -/
theorem Separation
    (Context : ZFCSetContext) :
    LRA.VolumeI.Set.ZFC.SatisfiesSeparationSchemaCleanly Context.Model :=
  LRA.VolumeI.Set.ZFC.satisfiesZFCAxiomsWithoutChoiceCleanly.separation
    Context.Axioms

/-- The Replacement schema available in a `ZFCSetContext`. -/
theorem Replacement
    (Context : ZFCSetContext) :
    LRA.VolumeI.Set.ZFC.SatisfiesReplacementSchemaCleanly Context.Model :=
  LRA.VolumeI.Set.ZFC.satisfiesZFCAxiomsWithoutChoiceCleanly.replacement
    Context.Axioms

end ZFCSetContext

end LRA.VolumeI.Set
