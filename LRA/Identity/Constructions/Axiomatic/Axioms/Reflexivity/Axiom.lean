import LRA.Identity.Constructions.Axiomatic.Axioms.Common

namespace LRA.Identity.Constructions.Axiomatic

universe u

/--
`Ax_IdentityReflexivity` TODO

Predicate logic:

  ∀ {Carrier : Type u} (x : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x x

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (x : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x x

Logical form (Lean):

```lean
axiom Ax_IdentityReflexivity {Carrier : Type u} (x : Carrier) :
    Ax_IdentityRelation x x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
axiom Ax_IdentityReflexivity {Carrier : Type u} (x : Carrier) :
    Ax_IdentityRelation x x

end LRA.Identity.Constructions.Axiomatic
