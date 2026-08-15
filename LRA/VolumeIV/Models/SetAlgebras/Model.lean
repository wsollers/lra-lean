import LRA.VolumeIV.Models.SetAlgebras.Language
import LRA.VolumeIV.Models.SetAlgebras.Signature

namespace LRA.Logic.ModelTheory.SetAlgebras

/-- Build a first-order model of the set-algebra language from a set-algebra
operation signature. In powerset models, `zero` is `∅`, `one` is `U`, `join`
is union, `meet` is intersection, and `complement` is relative complement.

Logical form:

```lean
def BuildSetAlgebraModel
    (signature : SetAlgebraSignature) :
    LRA.Logic.FirstOrder.Model SetAlgebraFirstOrderLanguage where
  Domain
```
-/
def BuildSetAlgebraModel
    (signature : SetAlgebraSignature) :
    LRA.Logic.FirstOrder.Model SetAlgebraFirstOrderLanguage where
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

end LRA.Logic.ModelTheory.SetAlgebras
