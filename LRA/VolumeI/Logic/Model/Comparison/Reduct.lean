import LRA.VolumeI.Logic.Model.Model
import LRA.VolumeI.Logic.Model.Comparison.SignatureEmbedding

namespace LRA.VolumeI.Logic

/-!
Reducts.

Given a signature embedding of `S` into `S'` and a model `M'` of `S'`, the
reduct `M'.reduct e` is the model of `S` obtained by keeping `M'`'s domain
and forgetting the interpretations of whatever `S'`-vocabulary is not in
the image of the embedding. Nothing is chosen here -- the interpretation of
every `S`-symbol is already determined by `M'`, via the embedding, so
reduct is a single deterministic function, unlike expansion.
-/

/-- The reduct of `M'` along a signature embedding `e : S ↪ S'`: the model
of `S` agreeing with `M'` on domain and on the interpretation of every
embedded symbol. -/
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

end LRA.VolumeI.Logic
