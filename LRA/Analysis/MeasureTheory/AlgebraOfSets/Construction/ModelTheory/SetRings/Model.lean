import LRA.Analysis.MeasureTheory.AlgebraOfSets.Construction.ModelTheory.SetRings.Signature
import LRA.Analysis.MeasureTheory.AlgebraOfSets.Construction.ModelTheory.SetRings.ConceptSignature

namespace LRA.Logic.ModelTheory.SetRings

/--
`BuildSetRingModel` TODO

Predicate logic:

  def BuildSetRingModel
    (signature : SetRingConceptSignature) :
    LRA.Logic.FirstOrder.Model SetRingFirstOrderSignature where
  Domain

Predicate logic (unfolded):

  def BuildSetRingModel
    (signature : SetRingConceptSignature) :
    LRA.Logic.FirstOrder.Model SetRingFirstOrderSignature where
  Domain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BuildSetRingModel
    (signature : SetRingConceptSignature) :
    LRA.Logic.FirstOrder.Model SetRingFirstOrderSignature where
  Domain
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def BuildSetRingModel
    (signature : SetRingConceptSignature) :
    LRA.Logic.FirstOrder.Model SetRingFirstOrderSignature where
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

end LRA.Logic.ModelTheory.SetRings
