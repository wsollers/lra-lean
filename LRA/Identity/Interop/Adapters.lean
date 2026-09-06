import LRA.Identity.Laws.Primitive
import LRA.Identity.Interface.UniversalAlgebra.Quotient

namespace LRA.Identity.Interop

universe u v w

open LRA.Identity

/--
`IdentAgreesWithLeanEq` is the interop bridge between in-house identity and
Lean's native equality. Pure in-house laws should use `IdentIsDiagonal`
instead.

Logical form:

```lean
theorem IdentAgreesWithLeanEq {Carrier : Type u} [IdentityRelation Carrier]
    (x y : Carrier) : Ident x y ↔ x = y
```
-/
theorem IdentAgreesWithLeanEq {Carrier : Type u} [IdentityRelation Carrier]
    (x y : Carrier) : Ident x y ↔ x = y := by
  sorry

/--
`toEq` TODO

Predicate logic:

  x = y

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    x y : Carrier
    h : Ident x y
  Prove
    x ≤ y → x = y

Logical form (Lean):

```lean
theorem toEq {Carrier : Type u} [IdentityRelation Carrier] {x y : Carrier}
    (h : Ident x y) : x = y
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
theorem toEq {Carrier : Type u} [IdentityRelation Carrier] {x y : Carrier}
    (h : Ident x y) : x = y :=
  by sorry

/--
`IdentToEq` is the source-facing PascalCase alias for `toEq`.

Logical form:

```lean
theorem IdentToEq {Carrier : Type u} [IdentityRelation Carrier] {x y : Carrier}
    (h : Ident x y) : x = y
```
-/
theorem IdentToEq {Carrier : Type u} [IdentityRelation Carrier] {x y : Carrier}
    (h : Ident x y) : x = y := by
  sorry

/--
`ofEq` TODO

Predicate logic:

  (x = y) → Ident x y

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    x y : Carrier
  Prove
    x = y → x ≤ y

Logical form (Lean):

```lean
theorem ofEq {Carrier : Type u} [IdentityRelation Carrier] {x y : Carrier}
    (h : x = y) : Ident x y
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
theorem ofEq {Carrier : Type u} [IdentityRelation Carrier] {x y : Carrier}
    (h : x = y) : Ident x y :=
  by sorry

/--
`EqToIdent` is the source-facing PascalCase alias for `ofEq`.

Logical form:

```lean
theorem EqToIdent {Carrier : Type u} [IdentityRelation Carrier] {x y : Carrier}
    (h : x = y) : Ident x y
```
-/
theorem EqToIdent {Carrier : Type u} [IdentityRelation Carrier] {x y : Carrier}
    (h : x = y) : Ident x y := by
  sorry

/--
`quotientByIdentToCarrier` collapses the quotient by in-house identity back to
the carrier using the Lean equality interop bridge.

Logical form:

```lean
def quotientByIdentToCarrier
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure.{u} signature)
    [IdentityRelation structure_.Carrier] :
    CongruenceQuotient structure_ Ident → structure_.Carrier
```
-/
def quotientByIdentToCarrier
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure.{u} signature)
    [IdentityRelation structure_.Carrier] :
    CongruenceQuotient structure_ Ident → structure_.Carrier :=
  Quot.lift id fun _ _ h => toEq h

/--
`quotientByIdentToCarrier_leftInverse` is the left inverse law for the Lean
interop quotient collapse.

Logical form:

```lean
theorem quotientByIdentToCarrier_leftInverse
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure.{u} signature)
    [IdentityRelation structure_.Carrier]
    (element : structure_.Carrier) :
    quotientByIdentToCarrier structure_ (Quot.mk _ element) = element
```
-/
theorem quotientByIdentToCarrier_leftInverse
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure.{u} signature)
    [IdentityRelation structure_.Carrier]
    (element : structure_.Carrier) :
    quotientByIdentToCarrier structure_ (Quot.mk _ element) = element := by
  sorry

/--
`quotientByIdentToCarrier_rightInverse` is the right inverse law for the Lean
interop quotient collapse.

Logical form:

```lean
theorem quotientByIdentToCarrier_rightInverse
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure.{u} signature)
    [IdentityRelation structure_.Carrier]
    (classOf : CongruenceQuotient structure_ Ident) :
    Quot.mk _ (quotientByIdentToCarrier structure_ classOf) = classOf
```
-/
theorem quotientByIdentToCarrier_rightInverse
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure.{u} signature)
    [IdentityRelation structure_.Carrier]
    (classOf : CongruenceQuotient structure_ Ident) :
    Quot.mk _ (quotientByIdentToCarrier structure_ classOf) = classOf := by
  sorry

end LRA.Identity.Interop
