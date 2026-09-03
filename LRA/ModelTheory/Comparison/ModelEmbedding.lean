import Mathlib.Logic.Function.Basic
import LRA.ModelTheory.Model

open LRA.Logic

namespace LRA.ModelTheory.FirstOrder

/--
`ModelEmbedding` TODO

Predicate logic:

  structure ModelEmbedding {S : Signature} (M₁ M₂ : Model S) where
  toFun : M₁.Domain -> M₂.Domain
  injective : Function.Injective toFun
  preservesFunction :
    ∀ (f : S.FunctionSymbol) (args : Fin (S.functionArity f) -> M₁.Domain),
      toFun (M₁.interpretFunction f args) =
        M₂.interpretFunction f (fun i => toFun (args i))
  preservesConstant :
    ∀ c, toFun (M₁.interpretConstant c) = M₂.interpretConstant c
  preservesRelation :
    ∀ (r : S.RelationSymbol) (args : Fin (S.relationArity r) -> M₁.Domain),
      M₁.interpretRelation r args ↔
        M₂.interpretRelation r (fun i => toFun (args i))

Predicate logic (unfolded):

  structure ModelEmbedding {S : Signature} (M₁ M₂ : Model S) where
  toFun : M₁.Domain -> M₂.Domain
  injective : Function.Injective toFun
  preservesFunction :
    ∀ (f : S.FunctionSymbol) (args : Fin (S.functionArity f) -> M₁.Domain),
      toFun (M₁.interpretFunction f args) =
        M₂.interpretFunction f (fun i => toFun (args i))
  preservesConstant :
    ∀ c, toFun (M₁.interpretConstant c) = M₂.interpretConstant c
  preservesRelation :
    ∀ (r : S.RelationSymbol) (args : Fin (S.relationArity r) -> M₁.Domain),
      M₁.interpretRelation r args ↔
        M₂.interpretRelation r (fun i => toFun (args i)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure ModelEmbedding {S : Signature} (M₁ M₂ : Model S) where
  toFun : M₁.Domain -> M₂.Domain
  injective : Function.Injective toFun
  preservesFunction :
    ∀ (f : S.FunctionSymbol) (args : Fin (S.functionArity f) -> M₁.Domain),
      toFun (M₁.interpretFunction f args) =
        M₂.interpretFunction f (fun i => toFun (args i))
  preservesConstant :
    ∀ c, toFun (M₁.interpretConstant c) = M₂.interpretConstant c
  preservesRelation :
    ∀ (r : S.RelationSymbol) (args : Fin (S.relationArity r) -> M₁.Domain),
      M₁.interpretRelation r args ↔
        M₂.interpretRelation r (fun i => toFun (args i))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
structure ModelEmbedding {S : Signature} (M₁ M₂ : Model S) where
  toFun : M₁.Domain -> M₂.Domain
  injective : Function.Injective toFun
  preservesFunction :
    ∀ (f : S.FunctionSymbol) (args : Fin (S.functionArity f) -> M₁.Domain),
      toFun (M₁.interpretFunction f args) =
        M₂.interpretFunction f (fun i => toFun (args i))
  preservesConstant :
    ∀ c, toFun (M₁.interpretConstant c) = M₂.interpretConstant c
  preservesRelation :
    ∀ (r : S.RelationSymbol) (args : Fin (S.relationArity r) -> M₁.Domain),
      M₁.interpretRelation r args ↔
        M₂.interpretRelation r (fun i => toFun (args i))

end LRA.ModelTheory.FirstOrder
