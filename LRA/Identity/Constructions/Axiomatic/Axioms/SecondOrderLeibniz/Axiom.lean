import LRA.Identity.Constructions.Axiomatic.Axioms.Common

namespace LRA.Identity.Construction.Axiomatic

universe u

/--
`Ax_LeibnizLaw` TODO

Predicate logic:

  Property x → Property y end LRA.Identity.Construction.Axiomatic

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    x y : Carrier
    h : Ax_IdentityRelation x y
    Property : Carrier → Prop
  Prove
    LRA.Identity.Construction.Axiomatic.Ax_IdentityRelation x y → ∀ (Property : Carrier → Prop), Property x → Property y

Logical form (Lean):

```lean
axiom Ax_LeibnizLaw {Carrier : Type u} {x y : Carrier}
    (h : Ax_IdentityRelation x y) (Property : Carrier → Prop) :
    Property x → Property y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
axiom Ax_LeibnizLaw {Carrier : Type u} {x y : Carrier}
    (h : Ax_IdentityRelation x y) (Property : Carrier → Prop) :
    Property x → Property y

end LRA.Identity.Construction.Axiomatic
