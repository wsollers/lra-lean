import LRA.Logic.Language.FirstOrder.Signature

namespace LRA.Logic

/--
`SignatureEmbedding` TODO

Predicate logic:

  structure SignatureEmbedding (S S' : Signature) where
  embedFunction : S.FunctionSymbol -> S'.FunctionSymbol
  embedRelation : S.RelationSymbol -> S'.RelationSymbol
  embedConstant : S.Constants -> S'.Constants

  functionArityPreserved :
    ∀ f, S'.functionArity (embedFunction f) = S.functionArity f
  relationArityPreserved :
    ∀ r, S'.relationArity (embedRelation r) = S.relationArity r

  functionPreimage : S'.FunctionSymbol -> Option S.FunctionSymbol

  relationPreimage : S'.RelationSymbol -> Option S.RelationSymbol

  constantPreimage : S'.Constants -> Option S.Constants

  functionPreimage_embedFunction :
    ∀ f, functionPreimage (embedFunction f) = some f

  relationPreimage_embedRelation :
    ∀ r, relationPreimage (embedRelation r) = some r

  constantPreimage_embedConstant :
    ∀ c, constantPreimage (embedConstant c) = some c

  functionEmbedFunction_of_preimage :
    ∀ f' f, functionPreimage f' = some f -> embedFunction f = f'

  relationEmbedRelation_of_preimage :
    ∀ r' r, relationPreimage r' = some r -> embedRelation r = r'

Predicate logic (unfolded):

  structure SignatureEmbedding (S S' : Signature) where
  embedFunction : S.FunctionSymbol -> S'.FunctionSymbol
  embedRelation : S.RelationSymbol -> S'.RelationSymbol
  embedConstant : S.Constants -> S'.Constants

  functionArityPreserved :
    ∀ f, S'.functionArity (embedFunction f) = S.functionArity f
  relationArityPreserved :
    ∀ r, S'.relationArity (embedRelation r) = S.relationArity r

  functionPreimage : S'.FunctionSymbol -> Option S.FunctionSymbol

  relationPreimage : S'.RelationSymbol -> Option S.RelationSymbol

  constantPreimage : S'.Constants -> Option S.Constants

  functionPreimage_embedFunction :
    ∀ f, functionPreimage (embedFunction f) = some f

  relationPreimage_embedRelation :
    ∀ r, relationPreimage (embedRelation r) = some r

  constantPreimage_embedConstant :
    ∀ c, constantPreimage (embedConstant c) = some c

  functionEmbedFunction_of_preimage :
    ∀ f' f, functionPreimage f' = some f -> embedFunction f = f'

  relationEmbedRelation_of_preimage :
    ∀ r' r, relationPreimage r' = some r -> embedRelation r = r' (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure SignatureEmbedding (S S' : Signature) where
  embedFunction : S.FunctionSymbol -> S'.FunctionSymbol
  embedRelation : S.RelationSymbol -> S'.RelationSymbol
  embedConstant : S.Constants -> S'.Constants

  functionArityPreserved :
    ∀ f, S'.functionArity (embedFunction f) = S.functionArity f
  relationArityPreserved :
    ∀ r, S'.relationArity (embedRelation r) = S.relationArity r

  functionPreimage : S'.FunctionSymbol -> Option S.FunctionSymbol

  relationPreimage : S'.RelationSymbol -> Option S.RelationSymbol

  constantPreimage : S'.Constants -> Option S.Constants

  functionPreimage_embedFunction :
    ∀ f, functionPreimage (embedFunction f) = some f

  relationPreimage_embedRelation :
    ∀ r, relationPreimage (embedRelation r) = some r

  constantPreimage_embedConstant :
    ∀ c, constantPreimage (embedConstant c) = some c

  functionEmbedFunction_of_preimage :
    ∀ f' f, functionPreimage f' = some f -> embedFunction f = f'

  relationEmbedRelation_of_preimage :
    ∀ r' r, relationPreimage r' = some r -> embedRelation r = r'
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
structure SignatureEmbedding (S S' : Signature) where
  embedFunction : S.FunctionSymbol -> S'.FunctionSymbol
  embedRelation : S.RelationSymbol -> S'.RelationSymbol
  embedConstant : S.Constants -> S'.Constants

  functionArityPreserved :
    ∀ f, S'.functionArity (embedFunction f) = S.functionArity f
  relationArityPreserved :
    ∀ r, S'.relationArity (embedRelation r) = S.relationArity r

  functionPreimage : S'.FunctionSymbol -> Option S.FunctionSymbol

  relationPreimage : S'.RelationSymbol -> Option S.RelationSymbol

  constantPreimage : S'.Constants -> Option S.Constants

  functionPreimage_embedFunction :
    ∀ f, functionPreimage (embedFunction f) = some f

  relationPreimage_embedRelation :
    ∀ r, relationPreimage (embedRelation r) = some r

  constantPreimage_embedConstant :
    ∀ c, constantPreimage (embedConstant c) = some c

  functionEmbedFunction_of_preimage :
    ∀ f' f, functionPreimage f' = some f -> embedFunction f = f'

  relationEmbedRelation_of_preimage :
    ∀ r' r, relationPreimage r' = some r -> embedRelation r = r'

end LRA.Logic
