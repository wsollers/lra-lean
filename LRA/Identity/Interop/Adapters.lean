import LRA.Identity.Laws.Primitive
import LRA.Identity.Interface.UniversalAlgebra.Quotient

namespace LRA.Identity.Interop

universe u v w

open LRA.Identity

/--
`IdentAgreesWithLeanEq` TODO

Predicate logic:

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] (x y : Carrier), inst.Ident x y ↔ x = y

Predicate logic (unfolded):

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] (x y : Carrier), inst.Ident x y ↔ x = y

Logical form (Lean):

```lean
theorem IdentAgreesWithLeanEq {Carrier : Type u} [IdentityRelation Carrier]
    (x y : Carrier) : Ident x y ↔ x = y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem IdentAgreesWithLeanEq {Carrier : Type u} [IdentityRelation Carrier]
    (x y : Carrier) : Ident x y ↔ x = y := by
  sorry

/--
`toEq` TODO

Predicate logic:

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] {x y : Carrier}, inst.Ident x y → x = y

Predicate logic (unfolded):

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] {x y : Carrier}, inst.Ident x y → x = y

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
`IdentToEq` TODO

Predicate logic:

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] {x y : Carrier}, inst.Ident x y → x = y

Predicate logic (unfolded):

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] {x y : Carrier}, inst.Ident x y → x = y

Logical form (Lean):

```lean
theorem IdentToEq {Carrier : Type u} [IdentityRelation Carrier] {x y : Carrier}
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
theorem IdentToEq {Carrier : Type u} [IdentityRelation Carrier] {x y : Carrier}
    (h : Ident x y) : x = y := by
  sorry

/--
`ofEq` TODO

Predicate logic:

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] {x y : Carrier}, x = y → inst.Ident x y

Predicate logic (unfolded):

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] {x y : Carrier}, x = y → inst.Ident x y

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
`EqToIdent` TODO

Predicate logic:

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] {x y : Carrier}, x = y → inst.Ident x y

Predicate logic (unfolded):

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] {x y : Carrier}, x = y → inst.Ident x y

Logical form (Lean):

```lean
theorem EqToIdent {Carrier : Type u} [IdentityRelation Carrier] {x y : Carrier}
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
theorem EqToIdent {Carrier : Type u} [IdentityRelation Carrier] {x y : Carrier}
    (h : x = y) : Ident x y := by
  sorry

/--
`quotientByIdentToCarrier` TODO

Predicate logic:

  def quotientByIdentToCarrier
      {signature : AlgebraicSignature.{v, w}}
      (structure_ : AlgebraicStructure.{u} signature)
      [IdentityRelation structure_.Carrier] :
      CongruenceQuotient structure_ Ident → structure_.Carrier :=
    Quot.lift id fun _ _ h => toEq h

Predicate logic (unfolded):

  def quotientByIdentToCarrier
      {signature : AlgebraicSignature.{v, w}}
      (structure_ : AlgebraicStructure.{u} signature)
      [IdentityRelation structure_.Carrier] :
      CongruenceQuotient structure_ Ident → structure_.Carrier :=
    Quot.lift id fun _ _ h => toEq h

Logical form (Lean):

```lean
def quotientByIdentToCarrier
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure.{u} signature)
    [IdentityRelation structure_.Carrier] :
    CongruenceQuotient structure_ Ident → structure_.Carrier :=
  Quot.lift id fun _ _ h => toEq h
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def quotientByIdentToCarrier
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure.{u} signature)
    [IdentityRelation structure_.Carrier] :
    CongruenceQuotient structure_ Ident → structure_.Carrier :=
  Quot.lift id fun _ _ h => toEq h

/--
`quotientByIdentToCarrier_leftInverse` TODO

Predicate logic:

  ∀ {signature : LRA.Identity.AlgebraicSignature} (structure_ : LRA.Identity.AlgebraicStructure signature) [inst : LRA.Identity.IdentityRelation structure_.Carrier] (element : structure_.Carrier), LRA.Identity.Interop.quotientByIdentToCarrier structure_ (Quot.mk inst.Ident element) = element

Predicate logic (unfolded):

  ∀ {signature : LRA.Identity.AlgebraicSignature} (structure_ : LRA.Identity.AlgebraicStructure signature) [inst : LRA.Identity.IdentityRelation structure_.Carrier] (element : structure_.Carrier), LRA.Identity.Interop.quotientByIdentToCarrier structure_ (Quot.mk inst.Ident element) = element

Logical form (Lean):

```lean
theorem quotientByIdentToCarrier_leftInverse
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure.{u} signature)
    [IdentityRelation structure_.Carrier]
    (element : structure_.Carrier) :
    quotientByIdentToCarrier structure_ (Quot.mk _ element) = element
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
theorem quotientByIdentToCarrier_leftInverse
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure.{u} signature)
    [IdentityRelation structure_.Carrier]
    (element : structure_.Carrier) :
    quotientByIdentToCarrier structure_ (Quot.mk _ element) = element := by
  sorry

/--
`quotientByIdentToCarrier_rightInverse` TODO

Predicate logic:

  ∀ {signature : LRA.Identity.AlgebraicSignature} (structure_ : LRA.Identity.AlgebraicStructure signature) [inst : LRA.Identity.IdentityRelation structure_.Carrier] (classOf : LRA.Identity.CongruenceQuotient structure_ inst.Ident), Quot.mk inst.Ident (LRA.Identity.Interop.quotientByIdentToCarrier structure_ classOf) = classOf

Predicate logic (unfolded):

  ∀ {signature : LRA.Identity.AlgebraicSignature} (structure_ : LRA.Identity.AlgebraicStructure signature) [inst : LRA.Identity.IdentityRelation structure_.Carrier] (classOf : LRA.Identity.CongruenceQuotient structure_ inst.Ident), Quot.mk inst.Ident (LRA.Identity.Interop.quotientByIdentToCarrier structure_ classOf) = classOf

Logical form (Lean):

```lean
theorem quotientByIdentToCarrier_rightInverse
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure.{u} signature)
    [IdentityRelation structure_.Carrier]
    (classOf : CongruenceQuotient structure_ Ident) :
    Quot.mk _ (quotientByIdentToCarrier structure_ classOf) = classOf
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
theorem quotientByIdentToCarrier_rightInverse
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure.{u} signature)
    [IdentityRelation structure_.Carrier]
    (classOf : CongruenceQuotient structure_ Ident) :
    Quot.mk _ (quotientByIdentToCarrier structure_ classOf) = classOf := by
  sorry

end LRA.Identity.Interop
