import LRA.UniversalAlgebra.Homomorphism.Definition

namespace LRA.UniversalAlgebra

open LRA.Logic
open LRA.Logic.FirstOrder

universe u v

/--
`Embedding` TODO

Predicate logic:

  structure Embedding {S : Signature}
    (M : Model.{u} S) (N : Model.{v} S) extends Homomorphism M N where
  injective :
    ∀ first second : M.Domain, map first = map second → first = second
  reflectsRelation :
    ∀ (relationSymbol : S.RelationSymbol)
      (arguments : Fin (S.relationArity relationSymbol) → M.Domain),
      N.interpretRelation relationSymbol (fun i => map (arguments i)) →
        M.interpretRelation relationSymbol arguments

Predicate logic (unfolded):

  structure Embedding {S : Signature}
    (M : Model.{u} S) (N : Model.{v} S) extends Homomorphism M N where
  injective :
    ∀ first second : M.Domain, map first = map second → first = second
  reflectsRelation :
    ∀ (relationSymbol : S.RelationSymbol)
      (arguments : Fin (S.relationArity relationSymbol) → M.Domain),
      N.interpretRelation relationSymbol (fun i => map (arguments i)) →
        M.interpretRelation relationSymbol arguments (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure Embedding {S : Signature}
    (M : Model.{u} S) (N : Model.{v} S) extends Homomorphism M N where
  injective :
    ∀ first second : M.Domain, map first = map second → first = second
  reflectsRelation :
    ∀ (relationSymbol : S.RelationSymbol)
      (arguments : Fin (S.relationArity relationSymbol) → M.Domain),
      N.interpretRelation relationSymbol (fun i => map (arguments i)) →
        M.interpretRelation relationSymbol arguments
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
structure Embedding {S : Signature}
    (M : Model.{u} S) (N : Model.{v} S) extends Homomorphism M N where
  injective :
    ∀ first second : M.Domain, map first = map second → first = second
  reflectsRelation :
    ∀ (relationSymbol : S.RelationSymbol)
      (arguments : Fin (S.relationArity relationSymbol) → M.Domain),
      N.interpretRelation relationSymbol (fun i => map (arguments i)) →
        M.interpretRelation relationSymbol arguments

/--
`Embedding.id` TODO

Predicate logic:

  def Embedding.id {S : Signature} (M : Model.{u} S) : Embedding M M where
  toHomomorphism := Homomorphism.id M
  injective := fun _ _ equality => equality
  reflectsRelation := fun _ _ holds => holds

Predicate logic (unfolded):

  def Embedding.id {S : Signature} (M : Model.{u} S) : Embedding M M where
  toHomomorphism := Homomorphism.id M
  injective := fun _ _ equality => equality
  reflectsRelation := fun _ _ holds => holds (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Embedding.id {S : Signature} (M : Model.{u} S) : Embedding M M where
  toHomomorphism := Homomorphism.id M
  injective := fun _ _ equality => equality
  reflectsRelation := fun _ _ holds => holds
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
def Embedding.id {S : Signature} (M : Model.{u} S) : Embedding M M where
  toHomomorphism := Homomorphism.id M
  injective := fun _ _ equality => equality
  reflectsRelation := fun _ _ holds => holds

end LRA.UniversalAlgebra
