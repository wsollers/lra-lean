import LRA.VolumeI.Set.ZFC.Model.Model
import LRA.VolumeI.Set.ZFC.Model.ZFSetModel

/-!
Aggregate import shim for `Set/ZFC/Model/`: the `ZFCModel` alias for a
first-order model of the ZFC signature, and `zfSetModel`, the concrete
interpretation of that signature over Mathlib's `ZFSet`. The per-axiom
satisfaction proofs and the `ModelIsomorphism` to a second set
representation ("the switch") are added here as they are built.
-/
