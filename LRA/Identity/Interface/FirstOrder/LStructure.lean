import LRA.Logic.Language.FirstOrder.Signature
import LRA.Logic.Syntax.FirstOrder.Formula

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

/--
`BinaryArguments` places a left and right argument into the two positions of
the distinguished identity symbol.

Logical form:

```lean
def BinaryArguments (L : LStructure) {α : Type} (left right : α) :
    Fin (L.signature.relationArity L.identitySymbol) → α
```
-/
def BinaryArguments (L : LStructure) {α : Type} (left right : α) :
    Fin (L.signature.relationArity L.identitySymbol) → α :=
  fun index =>
    Fin.cases left (Fin.cases right Fin.elim0) (Fin.cast L.identityArity index)

/--
`IdentityFormula` is the atomic first-order formula asserting that the
distinguished identity relation holds between two variables.

Logical form:

```lean
def IdentityFormula (L : LStructure) {Variable : Type}
    (left right : Variable) :
    LRA.Logic.FirstOrder.Formula L.signature Variable :=
  .relation L.identitySymbol
    (fun index => .var (BinaryArguments L left right index))
```
-/
def IdentityFormula (L : LStructure) {Variable : Type}
    (left right : Variable) :
    LRA.Logic.FirstOrder.Formula L.signature Variable :=
  .relation L.identitySymbol
    (fun index => .var (BinaryArguments L left right index))

end LRA.Identity.Interface.FirstOrder
