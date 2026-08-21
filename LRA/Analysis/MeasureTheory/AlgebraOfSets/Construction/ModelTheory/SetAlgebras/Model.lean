import LRA.Analysis.MeasureTheory.AlgebraOfSets.Construction.ModelTheory.SetAlgebras.Signature
import LRA.Analysis.MeasureTheory.AlgebraOfSets.Construction.ModelTheory.SetAlgebras.ConceptSignature

namespace LRA.Logic.ModelTheory.SetAlgebras

/-- Build a first-order model of the set-algebra signature from a set-algebra
operation signature. In powerset models, `zero` is `∅`, `one` is `U`, `join`
is union, `meet` is intersection, and `complement` is relative complement.

Logical form:

```lean
def BuildSetAlgebraModel
    (signature : SetAlgebraConceptSignature) :
    LRA.Logic.FirstOrder.Model SetAlgebraFirstOrderSignature where
  Domain
```
-/
def BuildSetAlgebraModel
    (signature : SetAlgebraConceptSignature) :
    LRA.Logic.FirstOrder.Model SetAlgebraFirstOrderSignature where
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
