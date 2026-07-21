import LRA.VolumeI.Logic.Model.Model
import LRA.VolumeI.Logic.Model.Comparison.SignatureEmbedding

namespace LRA.VolumeI.Logic

/-!
Expansions.

Given a signature embedding of `S` into `S'` and a model `M` of `S`, an
expansion of `M` to `S'` is a model of `S'` agreeing with `M` on domain and
on the interpretation of every embedded `S`-symbol, together with a chosen
interpretation of whatever `S'`-vocabulary is genuinely new (not in the
image of the embedding). Unlike reduct, this is not a single deterministic
function: the caller must supply the new interpretations, since nothing
about `M` or the embedding determines them.

`Model.expand` is nonetheless a total, computable function once those new
interpretations are supplied, by using the embedding's preimage functions
to decide, for each `S'`-symbol, whether to defer to `M`'s existing
interpretation (if the symbol is embedded) or to the caller-supplied one
(if it is new) -- no `Classical.dec`/`Classical.choice` needed anywhere.

Recovering `M`'s interpretation for an embedded symbol `f'` (with
`functionPreimage f' = some f`) needs an argument tuple indexed by
`S.functionArity f`, but the tuple on hand is indexed by
`S'.functionArity f'`. Bridging the two needs `S'.functionArity f' =
S.functionArity f` as an equation -- which is not available from
`functionPreimage f' = some f` alone (a bare fact about `Option` values),
only after combining it with `functionEmbedFunction_of_preimage` (giving
`embedFunction f = f'`) and `functionArityPreserved` (giving
`S'.functionArity (embedFunction f) = S.functionArity f`), rewriting the
first equation into the second.
-/

/-- An expansion of `M` to `S'` along a signature embedding `e : S ↪ S'`,
given a chosen interpretation of the vocabulary genuinely new to `S'` (not
in the image of `e`). Agrees with `M` on domain and on every embedded
symbol's interpretation; falls back to the supplied new interpretation
whenever `e`'s preimage functions report a symbol as not embedded. -/
def Model.expand
    {S S' : Signature} (e : SignatureEmbedding S S') (M : Model S)
    (newFunctions :
      (f' : S'.FunctionSymbol) -> (Fin (S'.functionArity f') -> M.Domain) -> M.Domain)
    (newRelations :
      (r' : S'.RelationSymbol) -> (Fin (S'.relationArity r') -> M.Domain) -> Prop)
    (newConstants : S'.Constants -> M.Domain) :
    Model S' where
  Domain := M.Domain
  domainNonempty := M.domainNonempty
  interpretFunction f' args :=
    match h : e.functionPreimage f' with
    | some f =>
        M.interpretFunction f
          (fun i =>
            args
              (((e.functionEmbedFunction_of_preimage f' f h) ▸
                (e.functionArityPreserved f)).symm ▸ i))
    | none => newFunctions f' args
  interpretRelation r' args :=
    match h : e.relationPreimage r' with
    | some r =>
        M.interpretRelation r
          (fun i =>
            args
              (((e.relationEmbedRelation_of_preimage r' r h) ▸
                (e.relationArityPreserved r)).symm ▸ i))
    | none => newRelations r' args
  interpretConstant c' :=
    match e.constantPreimage c' with
    | some c => M.interpretConstant c
    | none => newConstants c'

end LRA.VolumeI.Logic
