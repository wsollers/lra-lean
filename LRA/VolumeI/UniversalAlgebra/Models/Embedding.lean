import LRA.VolumeI.UniversalAlgebra.Models.Homomorphism

namespace LRA.UniversalAlgebra.Models

open LRA.Logic
open LRA.Logic.FirstOrder

universe u v

/-!
Volume I label: universal-algebra-embedding
Lean module: LRA.UniversalAlgebra.Models.Embedding
Verification status: checked definitions

An embedding of algebras: an injective homomorphism that also
*reflects* relations (for algebraic signatures the relation clause is
vacuous, and an embedding is exactly an injective homomorphism). This
is the algebraic counterpart of `Logic.FirstOrder.ModelEmbedding`;
an embedding exhibits its source as (isomorphic to) a subalgebra of
its target — the S of Birkhoff's HSP, seen from the outside.
-/

/-- An embedding: an injective homomorphism reflecting relations.

Logical form:

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

/-- The identity embedding.

Logical form:

```lean
def Embedding.id {S : Signature} (M : Model.{u} S) : Embedding M M where
  toHomomorphism := Homomorphism.id M
  injective := fun _ _ equality => equality
  reflectsRelation := fun _ _ holds => holds
```
-/
def Embedding.id {S : Signature} (M : Model.{u} S) : Embedding M M where
  toHomomorphism := Homomorphism.id M
  injective := fun _ _ equality => equality
  reflectsRelation := fun _ _ holds => holds

end LRA.UniversalAlgebra.Models
