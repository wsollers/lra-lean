namespace LRA.Identity

universe u

/--
`IdentityTheory` is the construction-independent identity contract relative to
a stated class of admissible predicates. It requires reflexivity and one-way
Leibniz transport for every admissible predicate.

Logical form:

```lean
structure IdentityTheory {Carrier : Type u}
    (Admissible : (Carrier → Prop) → Prop)
    (R : Carrier → Carrier → Prop) : Prop where
  reflexive : ∀ x, R x x
  leibniz : ∀ x y, R x y →
    ∀ P : Carrier → Prop, Admissible P → P x → P y
```
-/
structure IdentityTheory {Carrier : Type u}
    (Admissible : (Carrier → Prop) → Prop)
    (R : Carrier → Carrier → Prop) : Prop where
  reflexive : ∀ x, R x x
  leibniz : ∀ x y, R x y →
    ∀ P : Carrier → Prop, Admissible P → P x → P y

/--
`FullLeibniz` admits every predicate on a carrier. It is the unrestricted
predicate domain used by ambient and full second-order identity.

Logical form:

```lean
abbrev FullLeibniz (Carrier : Type u) : (Carrier → Prop) → Prop :=
  fun _ => True
```
-/
abbrev FullLeibniz (Carrier : Type u) : (Carrier → Prop) → Prop :=
  fun _ => True

/--
`IdentityRelation` is the strong ambient identity interface: its relation is
reflexive and transports every predicate on the carrier.

Logical form:

```lean
class IdentityRelation (Carrier : Type u) where
  Ident : Carrier → Carrier → Prop
  IdentReflexive : ∀ x : Carrier, Ident x x
  IdentLeibniz : ∀ {x y : Carrier}, Ident x y →
    ∀ Property : Carrier → Prop, Property x → Property y
```
-/
class IdentityRelation (Carrier : Type u) where
  Ident : Carrier → Carrier → Prop
  IdentReflexive : ∀ x : Carrier, Ident x x
  IdentLeibniz : ∀ {x y : Carrier}, Ident x y →
    ∀ Property : Carrier → Prop, Property x → Property y

export IdentityRelation (Ident IdentReflexive IdentLeibniz)

/--
`IsIdentityRelation` states that a relation satisfies the unrestricted
Leibniz identity theory.

Logical form:

```lean
abbrev IsIdentityRelation {Carrier : Type u}
    (R : Carrier → Carrier → Prop) : Prop :=
  IdentityTheory (FullLeibniz Carrier) R
```
-/
abbrev IsIdentityRelation {Carrier : Type u}
    (R : Carrier → Carrier → Prop) : Prop :=
  IdentityTheory (FullLeibniz Carrier) R

/--
`IdentityRelation.ofIdentityTheory` installs a strong identity interface from
a proof of the unrestricted identity theory.

Logical form:

```lean
@[reducible] def IdentityRelation.ofIdentityTheory {Carrier : Type u}
    {R : Carrier → Carrier → Prop}
    (h : IdentityTheory (FullLeibniz Carrier) R) : IdentityRelation Carrier
```
-/
@[reducible] def IdentityRelation.ofIdentityTheory {Carrier : Type u}
    {R : Carrier → Carrier → Prop}
    (h : IdentityTheory (FullLeibniz Carrier) R) : IdentityRelation Carrier := by
  sorry

/--
`IdentityRelation.ofIsIdentityRelation` installs the ambient identity
interface from its named unrestricted satisfaction certificate.

Logical form:

```lean
@[reducible] def IdentityRelation.ofIsIdentityRelation {Carrier : Type u}
    {R : Carrier → Carrier → Prop}
    (h : IsIdentityRelation R) : IdentityRelation Carrier
```
-/
@[reducible] def IdentityRelation.ofIsIdentityRelation {Carrier : Type u}
    {R : Carrier → Carrier → Prop}
    (h : IsIdentityRelation R) : IdentityRelation Carrier := by
  sorry

end LRA.Identity
