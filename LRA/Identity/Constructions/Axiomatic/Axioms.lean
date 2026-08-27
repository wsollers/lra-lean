namespace LRA.Identity.Construction.Axiomatic

universe u

axiom Ax_IdentityRelation {Carrier : Type u} : Carrier → Carrier → Prop

axiom Ax_EqualityReflexivity {Carrier : Type u} (x : Carrier) :
    Ax_IdentityRelation x x

axiom Ax_LeibnizLaw {Carrier : Type u} {x y : Carrier}
    (h : Ax_IdentityRelation x y) (Property : Carrier → Prop) :
    Property x → Property y

end LRA.Identity.Construction.Axiomatic
