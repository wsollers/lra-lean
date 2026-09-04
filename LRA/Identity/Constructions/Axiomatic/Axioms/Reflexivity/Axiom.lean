import LRA.Identity.Constructions.Axiomatic.Axioms.Common

namespace LRA.Identity.Construction.Axiomatic

universe u

/--
`Ax_EqualityReflexivity` TODO

Predicate logic:

  (∀ x ∈ Carrier), Ax_IdentityRelation x x end LRA.Identity.Construction.Axiomatic

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    x : Carrier
  Prove
    LRA.Identity.Construction.Axiomatic.Ax_IdentityRelation x x

Logical form (Lean):

```lean
axiom Ax_EqualityReflexivity {Carrier : Type u} (x : Carrier) :
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
axiom Ax_EqualityReflexivity {Carrier : Type u} (x : Carrier) :
    Ax_IdentityRelation x x

end LRA.Identity.Construction.Axiomatic
