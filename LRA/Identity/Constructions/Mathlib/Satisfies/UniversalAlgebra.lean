import LRA.Identity.Constructions.Mathlib.Primitives
import LRA.Identity.Interface.UniversalAlgebra.Congruence

namespace LRA.Identity.Constructions.Mathlib

universe u v w

/--
`SatisfiesUniversalAlgebraIdentity` TODO

Predicate logic:

  ∀ {signature : LRA.Identity.AlgebraicSignature} (structure_ : LRA.Identity.AlgebraicStructure signature), LRA.Identity.IsCongruence structure_ LRA.Identity.Constructions.Mathlib.NativeIdentity

Predicate logic (unfolded):

  ∀ {signature : LRA.Identity.AlgebraicSignature} (structure_ : LRA.Identity.AlgebraicStructure signature), ((∀ (x : structure_.Carrier), x = x) ∧ ((∀ {x y : structure_.Carrier}, x = y → y = x) ∧ ((∀ {x y z : structure_.Carrier}, x = y → y = z → x = z) ∧ (∀ (symbol : signature.OperationSymbol) (left right : Fin (signature.arity symbol) → structure_.Carrier), (∀ (index : Fin (signature.arity symbol)), left index = right index) → structure_.interpretOperation symbol left = structure_.interpretOperation symbol right))))

Logical form (Lean):

```lean
theorem SatisfiesUniversalAlgebraIdentity
    {signature : LRA.Identity.AlgebraicSignature.{v, w}}
    (structure_ : LRA.Identity.AlgebraicStructure.{u} signature) :
    LRA.Identity.IsCongruence structure_
      (NativeIdentity : structure_.Carrier -> structure_.Carrier -> Prop)
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
      (NativeIdentity : structure_.Carrier -> structure_.Carrier -> Prop) := by
  sorry

end LRA.Identity.Constructions.Mathlib
