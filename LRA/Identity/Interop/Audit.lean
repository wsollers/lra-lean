import LRA.Identity.Interop.Adapters
import LRA.Identity.Constructions.Axiomatic
import LRA.Identity.Constructions.Mathlib

namespace LRA.Identity.Interop

universe u

open LRA.Identity

theorem axiomaticIsEq {Carrier : Type u} (x y : Carrier) :
    LRA.Identity.Construction.Axiomatic.Ax_IdentityRelation x y ↔ x = y :=
  @IdentIsDiagonal Carrier
    (LRA.Identity.Construction.Axiomatic.instIdentityRelation Carrier) x y

#print axioms IdentIsDiagonal
#print axioms LRA.Identity.Construction.Mathlib.instIdentityRelation
#print axioms axiomaticIsEq

end LRA.Identity.Interop
