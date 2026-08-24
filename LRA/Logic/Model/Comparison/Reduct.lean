import LRA.Logic.Model.Model
import LRA.Logic.Model.Comparison.SignatureEmbedding

namespace LRA.Logic.FirstOrder

/--
`Model.reduct` TODO

Predicate logic:

  def Model.reduct
    {S S' : Signature} (e : SignatureEmbedding S S') (M' : Model S') : Model S where
  Domain := M'.Domain
  domainNonempty := M'.domainNonempty
  interpretFunction f args :=
    M'.interpretFunction (e.embedFunction f)
      (fun i => args (e.functionArityPreserved f ▸ i))
  interpretRelation r args :=
    M'.interpretRelation (e.embedRelation r)
      (fun i => args (e.relationArityPreserved r ▸ i))
  interpretConstant c :=
    M'.interpretConstant (e.embedConstant c)

Predicate logic (unfolded):

  def Model.reduct
    {S S' : Signature} (e : SignatureEmbedding S S') (M' : Model S') : Model S where
  Domain := M'.Domain
  domainNonempty := M'.domainNonempty
  interpretFunction f args :=
    M'.interpretFunction (e.embedFunction f)
      (fun i => args (e.functionArityPreserved f ▸ i))
  interpretRelation r args :=
    M'.interpretRelation (e.embedRelation r)
      (fun i => args (e.relationArityPreserved r ▸ i))
  interpretConstant c :=
    M'.interpretConstant (e.embedConstant c) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Model.reduct
    {S S' : Signature} (e : SignatureEmbedding S S') (M' : Model S') : Model S where
  Domain := M'.Domain
  domainNonempty := M'.domainNonempty
  interpretFunction f args :=
    M'.interpretFunction (e.embedFunction f)
      (fun i => args (e.functionArityPreserved f ▸ i))
  interpretRelation r args :=
    M'.interpretRelation (e.embedRelation r)
      (fun i => args (e.relationArityPreserved r ▸ i))
  interpretConstant c :=
    M'.interpretConstant (e.embedConstant c)
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
def Model.reduct
    {S S' : Signature} (e : SignatureEmbedding S S') (M' : Model S') : Model S where
  Domain := M'.Domain
  domainNonempty := M'.domainNonempty
  interpretFunction f args :=
    M'.interpretFunction (e.embedFunction f)
      (fun i => args (e.functionArityPreserved f ▸ i))
  interpretRelation r args :=
    M'.interpretRelation (e.embedRelation r)
      (fun i => args (e.relationArityPreserved r ▸ i))
  interpretConstant c :=
    M'.interpretConstant (e.embedConstant c)

end LRA.Logic.FirstOrder
