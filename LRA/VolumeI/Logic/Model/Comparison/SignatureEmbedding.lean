import LRA.VolumeI.Logic.Language.FirstOrder.Signature

namespace LRA.VolumeI.Logic

/-!
Signature embeddings.

A signature embedding of `S` into `S'` witnesses `S`'s vocabulary as a
sub-vocabulary of `S'`'s: every symbol of `S` corresponds to a symbol of
`S'` of the same arity. This is the symbol-level notion needed for reduct
and expansion (forgetting or adding vocabulary while keeping a domain and
the interpretation of shared symbols fixed) -- it is not the same notion as
a model embedding (a domain-element-level map between two models of the
*same* signature, preserving atomic formulas), which is a separate, later
concept built once `Formula` exists.

Because `S.FunctionSymbol` and `S'.FunctionSymbol` are, in general, two
unrelated Lean types with no built-in subset relation (unlike literal
mathematical sets, where `S ⊆ S'` needs no extra data), "S embeds into S'"
has to be witnessed explicitly: a function from each of `S`'s symbol kinds
into the corresponding kind of `S'`, together with a proof that arity is
preserved.

Reduct is a deterministic operation (forgetting vocabulary loses no
choices), but expansion is not (interpreting new vocabulary is a choice).
Building expansion as a total, computable function -- rather than reaching
for `Classical.dec`/`Classical.choice` to decide "is this symbol new" --
requires more than just the embedding functions: it requires an explicit
*partial inverse* for each symbol kind, so that for any symbol of `S'` one
can decide, by computation, whether it came from `S` and if so which
`S`-symbol it is. This is what `functionPreimage`/`relationPreimage`/
`constantPreimage` provide, together with proofs that they actually invert
the corresponding embedding.
-/

/-- A witness that `S`'s vocabulary embeds into `S'`'s: every symbol of `S`
maps to an arity-matching symbol of `S'`, with a computable partial inverse
recovering the `S`-symbol (if any) underlying a given `S'`-symbol. -/
structure SignatureEmbedding (S S' : Signature) where
  embedFunction : S.FunctionSymbol -> S'.FunctionSymbol
  embedRelation : S.RelationSymbol -> S'.RelationSymbol
  embedConstant : S.Constants -> S'.Constants

  functionArityPreserved :
    ∀ f, S'.functionArity (embedFunction f) = S.functionArity f
  relationArityPreserved :
    ∀ r, S'.relationArity (embedRelation r) = S.relationArity r

  /-- Decide, computably, whether an `S'`-function-symbol came from `S`,
  and if so, which one. -/
  functionPreimage : S'.FunctionSymbol -> Option S.FunctionSymbol
  /-- Decide, computably, whether an `S'`-relation-symbol came from `S`,
  and if so, which one. -/
  relationPreimage : S'.RelationSymbol -> Option S.RelationSymbol
  /-- Decide, computably, whether an `S'`-constant came from `S`, and if
  so, which one. -/
  constantPreimage : S'.Constants -> Option S.Constants

  /-- The preimage of an embedded function symbol is that symbol itself --
  `functionPreimage` genuinely inverts `embedFunction`, not merely agrees
  with it on some symbols. -/
  functionPreimage_embedFunction :
    ∀ f, functionPreimage (embedFunction f) = some f
  /-- The preimage of an embedded relation symbol is that symbol itself. -/
  relationPreimage_embedRelation :
    ∀ r, relationPreimage (embedRelation r) = some r
  /-- The preimage of an embedded constant is that constant itself. -/
  constantPreimage_embedConstant :
    ∀ c, constantPreimage (embedConstant c) = some c

  /-- The converse direction: if `f'`'s preimage is `some f`, then `f'`
  really is `embedFunction f`, not merely some other `S'`-symbol that
  happens to be *assigned* preimage `f` by `functionPreimage`. Without this,
  `functionPreimage` could report a preimage for a symbol that was never
  actually produced by `embedFunction`, which would make expansion
  (`Model.expand`) unsound: it needs to recover the *original* `S`-arity
  argument tuple by casting along `S'.functionArity f' = S.functionArity f`,
  and that equation is only available once `f'` is known to equal
  `embedFunction f`. -/
  functionEmbedFunction_of_preimage :
    ∀ f' f, functionPreimage f' = some f -> embedFunction f = f'
  /-- The converse direction for relations, matching
  `functionEmbedFunction_of_preimage`. -/
  relationEmbedRelation_of_preimage :
    ∀ r' r, relationPreimage r' = some r -> embedRelation r = r'

end LRA.VolumeI.Logic
