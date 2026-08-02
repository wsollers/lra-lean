import LRA.VolumeI.Set.ZFC.Model.Model

namespace LRA.VolumeI.Set.ZFC

/-!
Model-internal membership for the ZFC signature.
-/

/-- The element-level membership relation interpreted by a ZFC model. -/
def zfcSetMembership
    (M : ZFCModel)
    (element set : M.Domain) : Prop :=
  M.interpretRelation .member fun argument =>
    match argument with
    | ⟨0, _⟩ => element
    | ⟨1, _⟩ => set

/-- Lean's `element ∈ set` notation for set-objects inside a chosen ZFC model. -/
instance (M : ZFCModel) : Membership M.Domain M.Domain where
  mem set element := zfcSetMembership M element set

end LRA.VolumeI.Set.ZFC
