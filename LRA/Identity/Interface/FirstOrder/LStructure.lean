import LRA.Logic.Language.FirstOrder.Signature

namespace LRA.Identity.Interface.FirstOrder

/--
`LStructure` TODO

Predicate logic:

  structure LStructure where
    signature : LRA.Logic.Signature
    identitySymbol : signature.RelationSymbol
    identityArity : signature.relationArity identitySymbol = 2

Predicate logic (unfolded):

  structure LStructure where
    signature : LRA.Logic.Signature
    identitySymbol : signature.RelationSymbol
    identityArity : signature.relationArity identitySymbol = 2

Logical form (Lean):

```lean
structure LStructure where
  signature : LRA.Logic.Signature
  identitySymbol : signature.RelationSymbol
  identityArity : signature.relationArity identitySymbol = 2
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
structure LStructure where
  signature : LRA.Logic.Signature
  identitySymbol : signature.RelationSymbol
  identityArity : signature.relationArity identitySymbol = 2

end LRA.Identity.Interface.FirstOrder
