import LRA.Identity.Bridges.Diagonal

namespace LRA.Identity.Interop

universe u

open LRA.Identity

theorem toEq {Carrier : Type u} [IdentityRelation Carrier] {x y : Carrier}
    (h : Ident x y) : x = y :=
  (IdentIsDiagonal x y).mp h

theorem ofEq {Carrier : Type u} [IdentityRelation Carrier] {x y : Carrier}
    (h : x = y) : Ident x y :=
  (IdentIsDiagonal x y).mpr h

end LRA.Identity.Interop
