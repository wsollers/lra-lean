import LRA.VolumeIV.Models.SetRings.Language
import LRA.VolumeIV.Models.SetRings.Signature

namespace LRA.VolumeIV.Models.SetRings

/-- Build a first-order model of the set-ring language from a set-ring
operation signature. The distinguished constant `zero` is interpreted by the
signature's `zero`, and the function symbols are interpreted by `join`, `meet`,
and `difference`. -/
def BuildSetRingModel
    (signature : SetRingSignature) :
    LRA.VolumeI.Logic.FirstOrder.Model SetRingFirstOrderLanguage where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .join, args =>
        signature.join (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .meet, args =>
        signature.meet (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .difference, args =>
        signature.difference (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .zero => signature.zero

end LRA.VolumeIV.Models.SetRings
