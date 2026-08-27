import LRA.Identity.Interface.Definitions.IdentityRelation

namespace LRA.Identity

universe u

variable {Carrier : Type u} [IdentityRelation Carrier]

theorem IdentSymmetric {x y : Carrier} (h : Ident x y) : Ident y x :=
  IdentLeibniz h (fun z => Ident z x) (IdentReflexive x)

theorem IdentTransitive {x y z : Carrier} (hxy : Ident x y) (hyz : Ident y z) :
    Ident x z :=
  IdentLeibniz hyz (fun w => Ident x w) hxy

theorem IdentLeibnizIff {x y : Carrier} (h : Ident x y)
    (Property : Carrier → Prop) : Property x ↔ Property y :=
  ⟨IdentLeibniz h Property, IdentLeibniz (IdentSymmetric h) Property⟩

end LRA.Identity
