import LRA.Identity.Interface.Logic.Theory

namespace LRA.Identity

universe u

/--
`IsIdentityRelation R` is the second-order style characterization of identity
for a binary relation `R` on `Carrier`: reflexivity together with full Leibniz
substitution over arbitrary unary predicates `Carrier → Prop`.
-/
abbrev IsIdentityRelation {Carrier : Type u}
    (R : Carrier → Carrier → Prop) : Prop :=
  IdentityTheory (FullLeibniz Carrier) R

abbrev IdentityRelation.ofIdentityTheory {Carrier : Type u}
    {R : Carrier → Carrier → Prop}
    (h : IdentityTheory (FullLeibniz Carrier) R) : IdentityRelation Carrier where
  Ident := R
  IdentReflexive := h.reflexive
  IdentLeibniz := fun hxy P hp => h.leibniz _ _ hxy P trivial hp

theorem IdentityRelation.satisfiesIdentityTheory (Carrier : Type u)
    [IdentityRelation Carrier] :
    IdentityTheory (FullLeibniz Carrier) (Ident : Carrier → Carrier → Prop) where
  reflexive := IdentReflexive
  leibniz := fun _ _ hxy P _ hp => IdentLeibniz hxy P hp

abbrev IdentityRelation.ofIsIdentityRelation {Carrier : Type u}
    {R : Carrier → Carrier → Prop}
    (h : IsIdentityRelation R) : IdentityRelation Carrier :=
  IdentityRelation.ofIdentityTheory h

end LRA.Identity
