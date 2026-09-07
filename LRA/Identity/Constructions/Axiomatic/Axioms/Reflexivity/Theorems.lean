import LRA.Identity.Constructions.Axiomatic.Axioms.Reflexivity.Axiom
import LRA.Identity.Constructions.Axiomatic.Axioms.Reflexivity.Definitions

namespace LRA.Identity.Construction.Axiomatic

universe u

/--
`axiomaticIdentityReflexivity` is the immediate theorem wrapper around the
primitive axiomatic identity/equality reflexivity axiom.

Logical form:

```lean
theorem axiomaticIdentityReflexivity {Carrier : Type u} (x : Carrier) :
    Ax_IdentityRelation x x
```
-/
theorem axiomaticIdentityReflexivity {Carrier : Type u} (x : Carrier) :
    Ax_IdentityRelation x x :=
  Ax_IdentityReflexivity x

/--
`Ax_EqualityReflexivity` is the legacy equality-facing theorem wrapper for
the primitive identity/equality reflexivity axiom. The axiomatic construction
has one primitive identity/equality relation, so this is a compatibility
theorem rather than a separate axiom.

Logical form:

```lean
theorem Ax_EqualityReflexivity {Carrier : Type u} (x : Carrier) :
    Ax_IdentityRelation x x
```
-/
theorem Ax_EqualityReflexivity {Carrier : Type u} (x : Carrier) :
    Ax_IdentityRelation x x :=
  axiomaticIdentityReflexivity x

/--
`axiomaticIdentityRelation_isReflexive` TODO

Predicate logic:

  LRA.Identity.IsReflexiveIdentityRelation Ax_IdentityRelation ∈ Carrier → Carrier → Prop

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    (none)
  Prove
    LRA.Identity.Construction.Axiomatic.Ax_IdentityRelation x x

Logical form (Lean):

```lean
theorem axiomaticIdentityRelation_isReflexive (Carrier : Type u) :
    LRA.Identity.IsReflexiveIdentityRelation (Ax_IdentityRelation : Carrier → Carrier → Prop)
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
theorem axiomaticIdentityRelation_isReflexive (Carrier : Type u) :
    LRA.Identity.IsReflexiveIdentityRelation (Ax_IdentityRelation : Carrier → Carrier → Prop) := by
  intro x
  exact axiomaticIdentityReflexivity x


end LRA.Identity.Construction.Axiomatic
