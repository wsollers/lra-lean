import LRA.VolumeI.Set.ZFC.Core
import LRA.VolumeI.Set.ZFC.Language
import LRA.VolumeI.Set.ZFC.Native
import LRA.VolumeI.Set.ZFC.Derived
import LRA.VolumeI.Set.ZFC.Public
import LRA.VolumeI.Set.ZFC.Model

/-!
Aggregate import for the fresh Enderton/ZFC set track.

This low-level aggregate exposes the language (`zfcSignature`) and
model/structure (`ZFCModel`) pieces. The theory layer lives in
`LRA.VolumeI.Set.ZFC.Theory` and is imported from the Volume I root after
logic syntax, identity, relations, and set imports have all been established.
-/
