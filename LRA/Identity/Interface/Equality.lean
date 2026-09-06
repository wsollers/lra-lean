import LRA.Identity.Interface.Identity

namespace LRA.Identity

universe u

/--
`EqualityRelation` is the in-house equality interface. It is intentionally
separate from Lean's native equality; Lean equality belongs at the interop or
model-theory boundary.

Logical form:

```lean
class EqualityRelation (Carrier : Type u) where
  Equal : Carrier → Carrier → Prop
  EqualReflexive : ∀ x : Carrier, Equal x x
  EqualLeibniz :
    ∀ {x y : Carrier}, Equal x y →
      ∀ Property : Carrier → Prop, Property x → Property y
```
-/
class EqualityRelation (Carrier : Type u) where
  Equal : Carrier → Carrier → Prop
  EqualReflexive : ∀ x : Carrier, Equal x x
  EqualLeibniz :
    ∀ {x y : Carrier}, Equal x y →
      ∀ Property : Carrier → Prop, Property x → Property y

export EqualityRelation (Equal EqualReflexive EqualLeibniz)

/--
`EqualityTheory` is the generic theory surface for in-house equality.

Logical form:

```lean
def EqualityTheory (Carrier : Type u) : (Carrier → Carrier → Prop) → Prop :=
  IdentityTheory (FullLeibniz Carrier)
```
-/
def EqualityTheory (Carrier : Type u) : (Carrier → Carrier → Prop) → Prop :=
  IdentityTheory (FullLeibniz Carrier)

/--
`IsEqualityRelation` packages a relation satisfying the in-house equality
theory.

Logical form:

```lean
structure IsEqualityRelation (Equal : Carrier → Carrier → Prop) : Prop where
  satisfiesEqualityTheory : EqualityTheory Carrier Equal
```
-/
structure IsEqualityRelation {Carrier : Type u}
    (Equal : Carrier → Carrier → Prop) : Prop where
  satisfiesEqualityTheory : EqualityTheory Carrier Equal

/--
`EqualityRelation.ofIsEqualityRelation` builds the equality interface from a
proof that a relation satisfies the generic equality theory.

Logical form:

```lean
def EqualityRelation.ofIsEqualityRelation
    {Carrier : Type u} {Equal : Carrier → Carrier → Prop}
    (h : IsEqualityRelation Equal) : EqualityRelation Carrier
```
-/
@[reducible] def EqualityRelation.ofIsEqualityRelation
    {Carrier : Type u} {Equal : Carrier → Carrier → Prop}
    (h : IsEqualityRelation Equal) : EqualityRelation Carrier where
  Equal := Equal
  EqualReflexive := h.satisfiesEqualityTheory.reflexive
  EqualLeibniz :=
    fun {x y} hxy Property hp =>
      h.satisfiesEqualityTheory.leibniz x y hxy Property trivial hp

end LRA.Identity
