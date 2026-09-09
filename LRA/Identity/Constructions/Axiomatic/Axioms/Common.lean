import LRA.Identity.Interface.Identity

namespace LRA.Identity.Constructions.Axiomatic

universe u

/--
`Ax_IdentityRelation` TODO

Predicate logic:

  fun {Carrier : Type u} (left right : Carrier) => Ax_IdentityRelation left right

Predicate logic (unfolded):

  fun {Carrier : Type u} (left right : Carrier) => Ax_IdentityRelation left right (opaque predicate axiom; no body to unfold)

Logical form (Lean):

```lean
axiom Ax_IdentityRelation {Carrier : Type u} : Carrier → Carrier → Prop
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
axiom Ax_IdentityRelation {Carrier : Type u} : Carrier → Carrier → Prop

end LRA.Identity.Constructions.Axiomatic
