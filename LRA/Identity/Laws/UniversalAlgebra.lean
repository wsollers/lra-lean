import LRA.Identity.Interface.UniversalAlgebra.Extensionality
import LRA.Identity.Interface.UniversalAlgebra.Quotient
import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Theorems
import LRA.Identity.Interop.Adapters

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

/--
`quotientByIdentToCarrier` TODO

Predicate logic:

  def quotientByIdentToCarrier
      {signature : AlgebraicSignature.{v, w}}
      (structure_ : AlgebraicStructure.{u} signature)
      [IdentityRelation structure_.Carrier] :
      CongruenceQuotient structure_ Ident → structure_.Carrier :=
    Quot.lift id fun _ _ h => Interop.toEq h

Predicate logic (unfolded):

  def quotientByIdentToCarrier
      {signature : AlgebraicSignature.{v, w}}
      (structure_ : AlgebraicStructure.{u} signature)
      [IdentityRelation structure_.Carrier] :
      CongruenceQuotient structure_ Ident → structure_.Carrier :=
    Quot.lift id fun _ _ h => Interop.toEq h (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def quotientByIdentToCarrier
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure.{u} signature)
    [IdentityRelation structure_.Carrier] :
    CongruenceQuotient structure_ Ident → structure_.Carrier :=
  Quot.lift id fun _ _ h => Interop.toEq h
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
  Quot.lift id fun _ _ h => Interop.toEq h

/--
`quotientByIdentToCarrier_leftInverse` TODO

Predicate logic:

  (∀ element ∈ structure_.Carrier), quotientByIdentToCarrier structure_ (Quot.mk _ element) = element

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    signature : AlgebraicSignature.{v, w}
    structure_ : AlgebraicStructure.{u} signature
    element : structure_.Carrier
  Prove
    Quot.lift (fun a => a) ⋯ (Quot.mk element) ≤ =element

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

  Quot.mk _ (quotientByIdentToCarrier structure_ classOf) = classOf

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    signature : AlgebraicSignature.{v, w}
    structure_ : AlgebraicStructure.{u} signature
    classOf : CongruenceQuotient structure_ Ident
  Prove
    ≤ Quot.mk Quot.lift (fun a => a) ⋯ classOf ≤ = classOf

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

end LRA.Identity
