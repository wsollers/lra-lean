import LRA.Identity.Interface.ModelTheory
import LRA.Identity.Interface.Definitions.IdentityRelation
import LRA.Identity.Bridges.Diagonal

namespace LRA.Identity

universe u

theorem IsIdentityRelation.isDiagonal {Carrier : Type u}
    {R : Carrier → Carrier → Prop}
    (h : IsIdentityRelation R) :
    ∀ left right, R left right ↔ EqualityDiagonal Carrier left right := by
  sorry

theorem IsIdentityRelation.iff_forall_iff_eq {Carrier : Type u}
    {R : Carrier → Carrier → Prop} :
    IsIdentityRelation R ↔ ∀ left right, R left right ↔ left = right := by
  sorry

theorem IsIdentityRelation.iff_eq_diagonal {Carrier : Type u}
    {R : Carrier → Carrier → Prop} :
    IsIdentityRelation R ↔ R = EqualityDiagonal Carrier := by
  sorry

def EqualityStructure.ofReflexiveLeibnizRelation
    (Carrier : Type u) [Nonempty Carrier] {R : Carrier → Carrier → Prop}
    (reflexive : ∀ x, R x x)
    (leibniz : ∀ x y, R x y → ∀ P : Carrier → Prop, P x → P y) :
    EqualityStructure.{u} where
  Carrier := Carrier
  carrierNonempty := inferInstance
  equalityInterpretation := R
  satisfiesIdentityTheory := ⟨reflexive, fun x y h P _ => leibniz x y h P⟩

abbrev EqualityStructure.ofIsIdentityRelation
    (Carrier : Type u) [Nonempty Carrier] {R : Carrier → Carrier → Prop}
    (h : IsIdentityRelation R) : EqualityStructure.{u} :=
  EqualityStructure.ofReflexiveLeibnizRelation Carrier h.reflexive
    (fun x y hxy P hx => h.leibniz x y hxy P trivial hx)

end LRA.Identity
