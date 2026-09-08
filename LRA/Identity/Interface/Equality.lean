import LRA.Identity.Interface.Identity

namespace LRA.Identity

universe u

/-- `EqualityTheory` presents the generic full identity contract under the
equality vocabulary.

Logical form:
```lean
abbrev EqualityTheory (Carrier : Type u) :
    (Carrier -> Carrier -> Prop) -> Prop := IsIdentityRelation
```
-/
abbrev EqualityTheory (Carrier : Type u) :
    (Carrier -> Carrier -> Prop) -> Prop := IsIdentityRelation

/-- `EqualityRelation` designates an equality presentation and certifies that
its relation satisfies the generic identity contract. The identity laws are
not duplicated as equality-specific class fields.

Logical form:
```lean
class EqualityRelation (Carrier : Type u) where
  Equal : Carrier -> Carrier -> Prop
  satisfiesEqualityTheory : EqualityTheory Carrier Equal
```
-/
class EqualityRelation (Carrier : Type u) where
  Equal : Carrier -> Carrier -> Prop
  satisfiesEqualityTheory : EqualityTheory Carrier Equal

export EqualityRelation (Equal)

/-- Equality is reflexive because its presentation satisfies the generic
identity theory.

Logical form: `forall x, Equal x x`.
-/
theorem EqualReflexive {Carrier : Type u} [EqualityRelation Carrier] :
    forall x : Carrier, Equal x x := by
  sorry

/-- Equality transports every predicate because its presentation satisfies
the generic full-Leibniz identity theory.

Logical form: `Equal x y -> P x -> P y`.
-/
theorem EqualLeibniz {Carrier : Type u} [EqualityRelation Carrier]
    {x y : Carrier} (hxy : Equal x y) (Property : Carrier -> Prop) :
    Property x -> Property y := by
  sorry

/-- `IsEqualityRelation` is the named equality presentation certificate.

Logical form: `EqualityTheory Carrier Equal`.
-/
abbrev IsEqualityRelation {Carrier : Type u}
    (Equal : Carrier -> Carrier -> Prop) : Prop :=
  EqualityTheory Carrier Equal

/-- Build an equality presentation from its generic identity certificate.

Logical form: `IsEqualityRelation Equal -> EqualityRelation Carrier`.
-/
@[reducible] def EqualityRelation.ofIsEqualityRelation
    {Carrier : Type u} {Equal : Carrier -> Carrier -> Prop}
    (h : IsEqualityRelation Equal) : EqualityRelation Carrier := by
  sorry

end LRA.Identity
