import LRA.Identity.Constructions.Axiomatic.Satisfies.Equality
import LRA.Identity.Laws.Equality

namespace LRA.Identity.Constructions.Axiomatic

universe u

/--
`axiomaticEqualRfl` TODO

Predicate logic:

  ∀ {Carrier : Type u} (x : Carrier), (LRA.Identity.Constructions.Axiomatic.instEqualityRelation Carrier).Equal x x

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (x : Carrier), (LRA.Identity.Constructions.Axiomatic.instEqualityRelation Carrier).Equal x x

Logical form (Lean):

```lean
theorem axiomaticEqualRfl {Carrier : Type u} (x : Carrier) :
    @LRA.Identity.Equal Carrier (instEqualityRelation Carrier) x x
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
theorem axiomaticEqualRfl {Carrier : Type u} (x : Carrier) :
    @LRA.Identity.Equal Carrier (instEqualityRelation Carrier) x x := by
  exact axiomaticIdentityReflexivity x


/--
`axiomaticIdentIsDiagonal` TODO

Predicate logic:

  ∀ {Carrier : Type u} (x y : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y ↔ (LRA.Identity.Constructions.Axiomatic.instEqualityRelation Carrier).Equal x y

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (x y : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y ↔ (LRA.Identity.Constructions.Axiomatic.instEqualityRelation Carrier).Equal x y

Logical form (Lean):

```lean
theorem axiomaticIdentIsDiagonal {Carrier : Type u} (x y : Carrier) :
    Ax_IdentityRelation x y ↔
      @LRA.Identity.Equal Carrier (instEqualityRelation Carrier) x y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem axiomaticIdentIsDiagonal {Carrier : Type u} (x y : Carrier) :
    Ax_IdentityRelation x y ↔
      @LRA.Identity.Equal Carrier (instEqualityRelation Carrier) x y := by
  constructor
  . -- mp ->
    intro xIy

    sorry

  . -- mpr <-

    intro xEy
    sorry


end LRA.Identity.Constructions.Axiomatic
