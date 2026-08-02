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

end LRA.VolumeI.Set.ZFC
