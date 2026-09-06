import LRA.Identity.Constructions.Axiomatic.Axioms.Common

namespace LRA.Identity.Construction.Axiomatic

universe u

/--
`Ax_IdentityReflexivity` is the reflexivity axiom for the primitive
axiomatic identity/equality relation.

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

/--
`Ax_EqualityReflexivity` is the legacy equality-facing name for the primitive
identity reflexivity axiom. The axiomatic construction has one primitive
identity/equality relation, so this is a compatibility theorem rather than a
separate axiom.

Logical form:

```lean
theorem Ax_EqualityReflexivity {Carrier : Type u} (x : Carrier) :
    Ax_IdentityRelation x x
```
-/
theorem Ax_EqualityReflexivity {Carrier : Type u} (x : Carrier) :
    Ax_IdentityRelation x x :=
  Ax_IdentityReflexivity x

end LRA.Identity.Construction.Axiomatic
