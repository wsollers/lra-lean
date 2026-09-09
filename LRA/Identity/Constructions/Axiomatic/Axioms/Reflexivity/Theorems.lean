import LRA.Identity.Constructions.Axiomatic.Axioms.Reflexivity.Axiom
import LRA.Identity.Constructions.Axiomatic.Axioms.Reflexivity.Definitions

namespace LRA.Identity.Constructions.Axiomatic

universe u

/--
`axiomaticIdentityReflexivity` TODO

Predicate logic:

  ∀ {Carrier : Type u} (x : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x x

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (x : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x x

Logical form (Lean):

```lean
theorem axiomaticIdentityReflexivity {Carrier : Type u} (x : Carrier) :
    Ax_IdentityRelation x x := by
  have xRx
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
theorem axiomaticIdentityReflexivity {Carrier : Type u} (x : Carrier) :
    Ax_IdentityRelation x x := by
  have xRx := Ax_IdentityReflexivity x
  exact xRx



/--
`Ax_EqualityReflexivity` TODO

Predicate logic:

  ∀ {Carrier : Type u} (x : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x x

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (x : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x x

Logical form (Lean):

```lean
theorem Ax_EqualityReflexivity {Carrier : Type u} (x : Carrier) :
    Ax_IdentityRelation x x := by
  have xIx
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
theorem Ax_EqualityReflexivity {Carrier : Type u} (x : Carrier) :
    Ax_IdentityRelation x x := by
  have xIx := Ax_IdentityReflexivity x
  exact xIx


/--
`axiomaticIdentityRelation_isReflexive` TODO

Predicate logic:

  ∀ (Carrier : Type u), LRA.Identity.IsReflexiveIdentityRelation LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation

Predicate logic (unfolded):

  ∀ (Carrier : Type u) (x : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x x

Logical form (Lean):

```lean
theorem axiomaticIdentityRelation_isReflexive (Carrier : Type u) :
    LRA.Identity.IsReflexiveIdentityRelation (Ax_IdentityRelation : Carrier → Carrier → Prop) := by
  intro x
  have xIx
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
  have xIx := Ax_IdentityReflexivity x
  exact xIx



end LRA.Identity.Constructions.Axiomatic
