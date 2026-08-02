import LRA.VolumeI.Set.ZFC.Model.Model

namespace LRA.VolumeI.Set.ZFC

/-!
Model-internal membership for the ZFC signature.

This is the primitive interpreted membership relation of a ZFC-typed
first-order structure. Axiom readings and concrete set-object backends build on
this relation; it is not itself an axiom reading.
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
