import LRA.Identity.Interface.Definitions.IdentityRelation

namespace LRA.Identity

universe u

theorem IdentIsDiagonal {Carrier : Type u} [IdentityRelation Carrier]
    (x y : Carrier) : Ident x y ↔ x = y :=
  ⟨fun h => IdentLeibniz h (fun z => x = z) rfl,
   fun h => h ▸ IdentReflexive x⟩

end LRA.Identity
