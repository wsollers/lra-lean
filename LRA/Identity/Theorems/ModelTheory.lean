import LRA.Identity.Interface.ModelTheory.LStructure
import LRA.Identity.Interface.Definitions.IdentityRelation
import LRA.Identity.Bridges.Diagonal

namespace LRA.Identity

universe u

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

theorem EqualityStructure.isDiagonal (S : EqualityStructure.{u}) :
    ∀ left right, S.equalityInterpretation left right ↔ EqualityDiagonal S.Carrier left right :=
  fun left right =>
    @IdentIsDiagonal S.Carrier (IdentityRelation.ofIdentityTheory S.satisfiesIdentityTheory)
      left right

def EqualityStructure.ofReflexiveLeibnizRelation
    (Carrier : Type u) [Nonempty Carrier] {R : Carrier → Carrier → Prop}
    (reflexive : ∀ x, R x x)
    (leibniz : ∀ x y, R x y → ∀ P : Carrier → Prop, P x → P y) :
    EqualityStructure.{u} where
  Carrier := Carrier
  carrierNonempty := inferInstance
  equalityInterpretation := R
  satisfiesIdentityTheory := ⟨reflexive, fun x y h P _ => leibniz x y h P⟩

end LRA.Identity
