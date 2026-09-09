import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Satisfies
import LRA.Identity.Laws.Primitive

namespace LRA.Identity.Constructions.Axiomatic

universe u

/--
`axiomaticIdentRfl` TODO

Predicate logic:

  ∀ {Carrier : Type u} (x : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x x

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (x : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x x

Logical form (Lean):

```lean
theorem axiomaticIdentRfl {Carrier : Type u} (x : Carrier) :
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
theorem axiomaticIdentRfl {Carrier : Type u} (x : Carrier) :
    Ax_IdentityRelation x x := by
  have xRx := axiomaticIdentityRelation_isReflexive Carrier x
  exact xRx

/--
`axiomaticIdentSymmetric` TODO

Predicate logic:

  ∀ {Carrier : Type u} {x y : Carrier}, LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y → LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation y x

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {x y : Carrier}, LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y → LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation y x

Logical form (Lean):

```lean
theorem axiomaticIdentSymmetric {Carrier : Type u} {x y : Carrier}
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
theorem axiomaticIdentSymmetric {Carrier : Type u} {x y : Carrier}
    (h : Ax_IdentityRelation x y) : Ax_IdentityRelation y x := by
  have hx : Ax_IdentityRelation x x := axiomaticIdentityRelation_isReflexive Carrier x
  have hy : Ax_IdentityRelation y x :=
    Ax_LeibnizLaw h (fun z => Ax_IdentityRelation z x) hx
  exact hy

/--
`axiomaticIdentTransitive` TODO

Predicate logic:

  ∀ {Carrier : Type u} {x y z : Carrier}, (LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y ∧ LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation y z) → LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x z

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {x y z : Carrier}, (LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y ∧ LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation y z) → LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x z

Logical form (Lean):

```lean
theorem axiomaticIdentTransitive {Carrier : Type u} {x y z : Carrier}
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
theorem axiomaticIdentTransitive {Carrier : Type u} {x y z : Carrier}
    (hxy : Ax_IdentityRelation x y) (hyz : Ax_IdentityRelation y z) :
    Ax_IdentityRelation x z := by
  have hx : Ax_IdentityRelation x x := axiomaticIdentityRelation_isReflexive Carrier x
  have hy : Ax_IdentityRelation y x :=
    Ax_LeibnizLaw hxy (fun z => Ax_IdentityRelation z x) hx

  sorry

/--
`axiomaticIdentLeibnizIff` TODO

Predicate logic:

  ∀ {Carrier : Type u} {x y : Carrier}, LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y → ∀ (Property : Carrier → Prop), Property x ↔ Property y

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {x y : Carrier}, LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y → ∀ (Property : Carrier → Prop), Property x ↔ Property y

Logical form (Lean):

```lean
theorem axiomaticIdentLeibnizIff {Carrier : Type u} {x y : Carrier}
    (h : Ax_IdentityRelation x y) (Property : Carrier → Prop) :
    Property x ↔ Property y
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
theorem axiomaticIdentLeibnizIff {Carrier : Type u} {x y : Carrier}
    (h : Ax_IdentityRelation x y) (Property : Carrier → Prop) :
    Property x ↔ Property y := by
  sorry

end LRA.Identity.Constructions.Axiomatic
