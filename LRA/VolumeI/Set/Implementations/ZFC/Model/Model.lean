import LRA.VolumeI.Logic.Model.Model
import LRA.VolumeI.Set.Implementations.ZFC.Language

namespace LRA.VolumeI.Set.Implementations.ZFC

open LRA.VolumeI.Logic

/-!
ZFC first-order models.
-/

/-- A first-order model of the ZFC signature. -/
abbrev ZFCModel := FirstOrder.Model zfcSignature

end LRA.VolumeI.Set.Implementations.ZFC
