import LRA.Identity.Constructions.Axiomatic.Axioms.Common
import LRA.Identity.Interface.UniversalAlgebra.Congruence

namespace LRA.Identity.Constructions.Axiomatic

universe u v w

/--
`SatisfiesUniversalAlgebraIdentity` TODO

Predicate logic:

  ∀ {signature : LRA.Identity.AlgebraicSignature} (structure_ : LRA.Identity.AlgebraicStructure signature), LRA.Identity.IsCongruence structure_ LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation

Predicate logic (unfolded):

  ∀ {signature : LRA.Identity.AlgebraicSignature} (structure_ : LRA.Identity.AlgebraicStructure signature), ((∀ (x : structure_.Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x x) ∧ ((∀ {x y : structure_.Carrier}, LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y → LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation y x) ∧ ((∀ {x y z : structure_.Carrier}, LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y → LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation y z → LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x z) ∧ (∀ (symbol : signature.OperationSymbol) (left right : Fin (signature.arity symbol) → structure_.Carrier), (∀ (index : Fin (signature.arity symbol)), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation (left index) (right index)) → LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation (structure_.interpretOperation symbol left) (structure_.interpretOperation symbol right)))))

Logical form (Lean):

```lean
theorem SatisfiesUniversalAlgebraIdentity
    {signature : LRA.Identity.AlgebraicSignature.{v, w}}
    (structure_ : LRA.Identity.AlgebraicStructure.{u} signature) :
    LRA.Identity.IsCongruence structure_
      (Ax_IdentityRelation : structure_.Carrier -> structure_.Carrier -> Prop)
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
theorem SatisfiesUniversalAlgebraIdentity
    {signature : LRA.Identity.AlgebraicSignature.{v, w}}
    (structure_ : LRA.Identity.AlgebraicStructure.{u} signature) :
    LRA.Identity.IsCongruence structure_
      (Ax_IdentityRelation : structure_.Carrier -> structure_.Carrier -> Prop) := by
  sorry

end LRA.Identity.Constructions.Axiomatic
