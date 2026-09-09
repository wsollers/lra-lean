import LRA.Identity.Constructions.Axiomatic.Axioms
import LRA.Relation.Interface.Structures.Equivalence.Definition

namespace LRA.Identity.Constructions.Axiomatic.Laws

universe u

/--
`Reflexivity` TODO

Predicate logic:

  ∀ {Carrier : Type u} (x : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x x

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (x : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x x

Logical form (Lean):

```lean
theorem Reflexivity {Carrier : Type u} (x : Carrier) :
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
theorem Reflexivity {Carrier : Type u} (x : Carrier) :
    Ax_IdentityRelation x x := by
  have xRx := axiomaticIdentityRelation_isReflexive Carrier x
  exact xRx

/--
`Symmetry` TODO

Predicate logic:

  ∀ {Carrier : Type u} {x y : Carrier}, LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y → LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation y x

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {x y : Carrier}, LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y → LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation y x

Logical form (Lean):

```lean
theorem Symmetry {Carrier : Type u} {x y : Carrier}
    (h : Ax_IdentityRelation x y) : Ax_IdentityRelation y x
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
theorem Symmetry {Carrier : Type u} {x y : Carrier}
    (h : Ax_IdentityRelation x y) : Ax_IdentityRelation y x := by

  sorry

/--
`Transitivity` TODO

Predicate logic:

  ∀ {Carrier : Type u} {x y z : Carrier}, (LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y ∧ LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation y z) → LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x z

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {x y z : Carrier}, (LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y ∧ LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation y z) → LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x z

Logical form (Lean):

```lean
theorem Transitivity {Carrier : Type u} {x y z : Carrier}
    (hxy : Ax_IdentityRelation x y) (hyz : Ax_IdentityRelation y z) :
    Ax_IdentityRelation x z
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
theorem Transitivity {Carrier : Type u} {x y z : Carrier}
    (hxy : Ax_IdentityRelation x y) (hyz : Ax_IdentityRelation y z) :
    Ax_IdentityRelation x z := by
  sorry

/--
`IndiscernibilityOfIdenticals` TODO

Predicate logic:

  ∀ {Carrier : Type u} {x y : Carrier}, LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y → ∀ (P : Carrier → Prop), P x ↔ P y

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {x y : Carrier}, LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y → ∀ (P : Carrier → Prop), P x ↔ P y

Logical form (Lean):

```lean
theorem IndiscernibilityOfIdenticals {Carrier : Type u} {x y : Carrier}
    (h : Ax_IdentityRelation x y) :
    forall P : Carrier -> Prop, P x <-> P y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem IndiscernibilityOfIdenticals {Carrier : Type u} {x y : Carrier}
    (h : Ax_IdentityRelation x y) :
    forall P : Carrier -> Prop, P x <-> P y := by
  sorry

/--
`IdentityOfIndiscernibles` TODO

Predicate logic:

  ∀ {Carrier : Type u} {x y : Carrier}, (∀ (P : Carrier → Prop), P x ↔ P y) → LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {x y : Carrier}, (∀ (P : Carrier → Prop), P x ↔ P y) → LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y

Logical form (Lean):

```lean
theorem IdentityOfIndiscernibles {Carrier : Type u} {x y : Carrier}
    (h : forall P : Carrier -> Prop, P x <-> P y) :
    Ax_IdentityRelation x y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem IdentityOfIndiscernibles {Carrier : Type u} {x y : Carrier}
    (h : forall P : Carrier -> Prop, P x <-> P y) :
    Ax_IdentityRelation x y := by
  sorry

/--
`LeibnizIff` TODO

Predicate logic:

  ∀ {Carrier : Type u} {x y : Carrier}, LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y ↔ ∀ (P : Carrier → Prop), P x ↔ P y

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {x y : Carrier}, LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y ↔ ∀ (P : Carrier → Prop), P x ↔ P y

Logical form (Lean):

```lean
theorem LeibnizIff {Carrier : Type u} {x y : Carrier} :
    Ax_IdentityRelation x y <-> forall P : Carrier -> Prop, P x <-> P y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem LeibnizIff {Carrier : Type u} {x y : Carrier} :
    Ax_IdentityRelation x y <-> forall P : Carrier -> Prop, P x <-> P y := by
  sorry

/--
`Equivalence` TODO

Predicate logic:

  ∀ {Carrier : Type u}, LRA.Relation.EquivalenceRelation LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation

Predicate logic (unfolded):

  ∀ {Carrier : Type u}, ((∀ (x : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x x) ∧ ((∀ (x y : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y → LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation y x) ∧ (∀ (x y z : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y → LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation y z → LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x z)))

Logical form (Lean):

```lean
theorem Equivalence {Carrier : Type u} :
    LRA.Relation.EquivalenceRelation
      (Ax_IdentityRelation : Carrier -> Carrier -> Prop)
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
theorem Equivalence {Carrier : Type u} :
    LRA.Relation.EquivalenceRelation
      (Ax_IdentityRelation : Carrier -> Carrier -> Prop) := by
  sorry

/--
`Congruence` TODO

Predicate logic:

  ∀ {Carrier Codomain : Type u} {x y : Carrier}, LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y → ∀ (f : Carrier → Codomain), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation (f x) (f y)

Predicate logic (unfolded):

  ∀ {Carrier Codomain : Type u} {x y : Carrier}, LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y → ∀ (f : Carrier → Codomain), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation (f x) (f y)

Logical form (Lean):

```lean
theorem Congruence {Carrier Codomain : Type u} {x y : Carrier}
    (h : Ax_IdentityRelation x y) (f : Carrier -> Codomain) :
    Ax_IdentityRelation (f x) (f y)
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
theorem Congruence {Carrier Codomain : Type u} {x y : Carrier}
    (h : Ax_IdentityRelation x y) (f : Carrier -> Codomain) :
    Ax_IdentityRelation (f x) (f y) := by
  sorry

end LRA.Identity.Constructions.Axiomatic.Laws
