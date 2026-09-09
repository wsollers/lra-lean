import LRA.Identity.Interface.UniversalAlgebra.Extensionality
import LRA.Identity.Interface.UniversalAlgebra.Quotient
import LRA.Identity.Laws.Primitive

namespace LRA.Identity

universe u v w

/--
`IdentIsCongruence` TODO

Predicate logic:

  ∀ {signature : LRA.Identity.AlgebraicSignature} (structure_ : LRA.Identity.AlgebraicStructure signature) [inst : LRA.Identity.IdentityRelation structure_.Carrier], LRA.Identity.IsCongruence structure_ inst.Ident

Predicate logic (unfolded):

  ∀ {signature : LRA.Identity.AlgebraicSignature} (structure_ : LRA.Identity.AlgebraicStructure signature) [inst : LRA.Identity.IdentityRelation structure_.Carrier], ((∀ (x : structure_.Carrier), inst.Ident x x) ∧ ((∀ {x y : structure_.Carrier}, inst.Ident x y → inst.Ident y x) ∧ ((∀ {x y z : structure_.Carrier}, inst.Ident x y → inst.Ident y z → inst.Ident x z) ∧ (∀ (symbol : signature.OperationSymbol) (left right : Fin (signature.arity symbol) → structure_.Carrier), (∀ (index : Fin (signature.arity symbol)), inst.Ident (left index) (right index)) → inst.Ident (structure_.interpretOperation symbol left) (structure_.interpretOperation symbol right)))))

Logical form (Lean):

```lean
theorem IdentIsCongruence
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure.{u} signature)
    [IdentityRelation structure_.Carrier] :
    IsCongruence structure_ Ident
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem IdentIsCongruence
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure.{u} signature)
    [IdentityRelation structure_.Carrier] :
    IsCongruence structure_ Ident := by
  sorry

end LRA.Identity
