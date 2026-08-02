import Mathlib.SetTheory.ZFC.Basic
import LRA.VolumeI.Set.ZFC.Model.Model

namespace LRA.VolumeI.Set.ZFC

/-!
Concrete first-order ZFC-language model over Mathlib's `ZFSet`.
-/

/-- The ZFC signature interpreted over Mathlib's `ZFSet`. -/
def zfSetModel : ZFCModel where
  Domain := ZFSet
  domainNonempty := ⟨∅⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation
    | .member, args => args ⟨0, by decide⟩ ∈ args ⟨1, by decide⟩
  interpretConstant := Empty.elim

/-- Checkpoint: the model interprets `∈` as genuine `ZFSet` membership. -/
theorem zfSetModel.interpretsMembership (a b : ZFSet) :
    zfSetModel.interpretRelation .member (fun i => if i.val = 0 then a else b)
      = (a ∈ b) := by
  sorry

end LRA.VolumeI.Set.ZFC
