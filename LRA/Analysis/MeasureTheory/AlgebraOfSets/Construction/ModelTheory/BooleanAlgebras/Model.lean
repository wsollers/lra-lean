import LRA.Analysis.MeasureTheory.AlgebraOfSets.Construction.ModelTheory.BooleanAlgebras.Language
import LRA.Analysis.MeasureTheory.AlgebraOfSets.Construction.ModelTheory.BooleanAlgebras.Signature

namespace LRA.Logic.ModelTheory.BooleanAlgebras

/-- Build a first-order model of the Boolean-algebra language from a Boolean
algebra operation signature. Powerset models interpret this abstract language
by `zero = ∅`, `one = U`, `join = ∪`, `meet = ∩`, and `complement = Aᶜ`.

Logical form:

```lean
def BuildBooleanAlgebraModel
    (signature : BooleanAlgebraSignature) :
    LRA.Logic.FirstOrder.Model BooleanAlgebraFirstOrderLanguage where
  Domain
```
-/
def BuildBooleanAlgebraModel
    (signature : BooleanAlgebraSignature) :
    LRA.Logic.FirstOrder.Model BooleanAlgebraFirstOrderLanguage where
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

end LRA.Logic.ModelTheory.BooleanAlgebras
