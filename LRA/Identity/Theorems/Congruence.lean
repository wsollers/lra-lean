import LRA.Identity.Theorems.Equivalence

namespace LRA.Identity

universe u

variable {Carrier : Type u} [IdentityRelation Carrier]

theorem IdentPreservesFunctions {Codomain : Type u} [IdentityRelation Codomain]
    {x y : Carrier} (h : Ident x y) (f : Carrier → Codomain) :
    Ident (f x) (f y) :=
  IdentLeibniz h (fun w => Ident (f x) (f w)) (IdentReflexive (f x))

theorem IdentPreservesRelations {x x' y y' : Carrier}
    (hx : Ident x x') (hy : Ident y y') (R : Carrier → Carrier → Prop) :
    R x y ↔ R x' y' := by
  constructor
  · intro hR
    exact IdentLeibniz hy (fun w => R x' w) (IdentLeibniz hx (fun w => R w y) hR)
  · intro hR
    exact IdentLeibniz (IdentSymmetric hy) (fun w => R x w)
      (IdentLeibniz (IdentSymmetric hx) (fun w => R w y') hR)

theorem IdentPreservesOperations {x x' y y' : Carrier}
    (hx : Ident x x') (hy : Ident y y') (op : Carrier → Carrier → Carrier) :
    Ident (op x y) (op x' y') :=
  IdentTransitive
    (IdentPreservesFunctions hx (fun w => op w y))
    (IdentPreservesFunctions hy (fun w => op x' w))

end LRA.Identity
