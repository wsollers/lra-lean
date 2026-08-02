import LRA.VolumeI.Logic.Model.Model
import LRA.VolumeI.Set.ZFC.Language.Signature

namespace LRA.VolumeI.Set.ZFC

open LRA.VolumeI.Logic

/-!
ZFC models.

The generic first-order model layer already supplies the actual structure
type. This module gives it a ZFC-facing name specialized to the ZFC
signature. Satisfaction of ZFC formulas in such a model, and the
model-facing axiom-satisfaction predicates, live one layer up in
`Semantics/Satisfaction.lean` -- a model is just a structure, so the
naming of the structure belongs here while what it means to *satisfy* a
formula belongs with the semantics.
-/

/-- A first-order model of the ZFC signature. -/
abbrev ZFCModel := FirstOrder.Model zfcSignature

end LRA.VolumeI.Set.ZFC
