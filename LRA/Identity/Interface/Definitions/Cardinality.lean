import LRA.Identity.Interface.Definitions.Distinctness

namespace LRA.Identity

universe u

def AtLeastTwo (Carrier : Type u) [IdentityRelation Carrier] : Prop :=
  ∃ x y : Carrier, Distinct x y

def AtMostTwo (Carrier : Type u) [IdentityRelation Carrier] : Prop :=
  ∀ x y z : Carrier, Ident x y ∨ Ident y z ∨ Ident x z

end LRA.Identity
