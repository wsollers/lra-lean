import LRA.Identity.Interface.Definitions.IdentityRelation

namespace LRA.Identity

universe u

structure IdentityTheory {Carrier : Type u}
    (Admissible : (Carrier → Prop) → Prop)
    (R : Carrier → Carrier → Prop) : Prop where
  reflexive : ∀ x, R x x
  leibniz : ∀ x y, R x y → ∀ P : Carrier → Prop, Admissible P → P x → P y

abbrev FullLeibniz (Carrier : Type u) : (Carrier → Prop) → Prop :=
  fun _ => True

end LRA.Identity
