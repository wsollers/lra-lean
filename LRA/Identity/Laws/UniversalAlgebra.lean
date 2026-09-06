import LRA.Identity.Interface.UniversalAlgebra.Extensionality
import LRA.Identity.Interface.UniversalAlgebra.Quotient
import LRA.Identity.Laws.Primitive

namespace LRA.Identity

universe u v w

/--
`IdentIsCongruence` TODO

Predicate logic:

  IsCongruence structure_ Ident

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    signature : AlgebraicSignature.{v, w}
    structure_ : AlgebraicStructure.{u} signature
  Prove
    LRA.Identity.IsCongruence structure_ inst.1

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
