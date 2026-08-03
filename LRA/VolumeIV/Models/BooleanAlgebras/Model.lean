import LRA.VolumeIV.Models.BooleanAlgebras.Language
import LRA.VolumeIV.Models.BooleanAlgebras.Signature

namespace LRA.VolumeIV.Models.BooleanAlgebras

/-- Build a first-order model of the Boolean-algebra language from a Boolean
algebra operation signature. Powerset models interpret this abstract language
by `zero = ∅`, `one = U`, `join = ∪`, `meet = ∩`, and `complement = Aᶜ`. -/
def BuildBooleanAlgebraModel
    (signature : BooleanAlgebraSignature) :
    LRA.VolumeI.Logic.FirstOrder.Model BooleanAlgebraFirstOrderLanguage where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .join, args =>
        signature.join (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .meet, args =>
        signature.meet (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .complement, args =>
        signature.complement (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

end LRA.VolumeIV.Models.BooleanAlgebras
