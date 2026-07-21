import Mathlib.Logic.Function.Basic
import LRA.VolumeI.Logic.Model.Model

namespace LRA.VolumeI.Logic.FirstOrder

/-!
Model embeddings.

A model embedding of `M₁` into `M₂` (two models of the *same* signature
`S`) is an injective map on domains that preserves the interpretation of
every symbol of `S`: function symbols and constants strictly (the map
commutes with them), relation symbols strongly (the map reflects them as
well as preserves them -- membership in `M₁`'s relation holds exactly when
it holds for the mapped tuple in `M₂`).

This is a different notion from `SignatureEmbedding`, which compares two
different signatures at the symbol level to support reduct and expansion.
A model embedding compares two models of one fixed signature at the level
of actual domain elements -- the formal counterpart of "`Z` sits inside
`Q` without collapsing anything and without any strict-order fact
appearing or disappearing along the way."

Only atomic preservation is required here (function, constant, and relation
symbols). The stronger fact that an embedding preserves the truth of every
formula, not just atomic ones, is a theorem to prove once `Formula` and
satisfaction exist -- it is not part of this definition, and does not need
to be: atomic preservation is exactly what a model embedding *is*, and
formula-level preservation follows from it by structural induction later.
-/

/-- An embedding of `M₁` into `M₂`, two models of the same signature `S`:
an injective domain map commuting with every function symbol and constant,
and reflecting every relation symbol. -/
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

end LRA.VolumeI.Logic.FirstOrder
