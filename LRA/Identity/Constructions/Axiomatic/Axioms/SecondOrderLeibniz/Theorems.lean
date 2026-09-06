import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Definitions

namespace LRA.Identity

universe u

/--
`IdentRfl` is the in-house reflexivity theorem for identity. Every object is
identical to itself; this is the `Ident`-level analogue of Lean's `rfl`.

Logical form:

```lean
theorem IdentRfl {Carrier : Type u} [IdentityRelation Carrier]
    (x : Carrier) : Ident x x
```
-/
theorem IdentRfl {Carrier : Type u} [IdentityRelation Carrier]
    (x : Carrier) : Ident x x := by
  sorry

/--
`IdentRefl` is a prose-name alias for `IdentRfl`. Every object is identical to
itself.

Logical form:

```lean
theorem IdentRefl {Carrier : Type u} [IdentityRelation Carrier]
    (x : Carrier) : Ident x x
```
-/
theorem IdentRefl {Carrier : Type u} [IdentityRelation Carrier]
    (x : Carrier) : Ident x x := by
  sorry

/--
`IdentIsDiagonal` TODO

Predicate logic:

  (∀ x y ∈ Carrier), Ident x y ↔ x = y

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    x y : Carrier
  Prove
    inst.Ident x y ↔ x = y

Logical form (Lean):

```lean
theorem IdentIsDiagonal {Carrier : Type u} [IdentityRelation Carrier]
    (x y : Carrier) : Ident x y ↔ x = y
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
theorem IdentIsDiagonal {Carrier : Type u} [IdentityRelation Carrier]
    (x y : Carrier) : Ident x y ↔ x = y := by

  constructor
  . --> MP

    intro hxIy
    let inst : IdentityRelation Carrier := inferInstance

    sorry

  . -- <- MPR

    sorry

/--
`IdentSymmetric` TODO

Predicate logic:

  Ident y x

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    x y : Carrier
    h : Ident x y
  Prove
    x ≤ y → y ≤ x

Logical form (Lean):

```lean
theorem IdentSymmetric {Carrier : Type u} [IdentityRelation Carrier]
    {x y : Carrier} (h : Ident x y) : Ident y x
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
theorem IdentSymmetric {Carrier : Type u} [IdentityRelation Carrier]
    {x y : Carrier} (h : Ident x y) : Ident y x := by
  sorry

/--
`IdentTransitive` TODO

Predicate logic:

  Ident x z

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    x y z : Carrier
    hxy : Ident x y
    hyz : Ident y z
  Prove
    (x ≤ y ∧ y ≤ z) → x ≤ z

Logical form (Lean):

```lean
theorem IdentTransitive {Carrier : Type u} [IdentityRelation Carrier]
    {x y z : Carrier} (hxy : Ident x y) (hyz : Ident y z) : Ident x z
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
theorem IdentTransitive {Carrier : Type u} [IdentityRelation Carrier]
    {x y z : Carrier} (hxy : Ident x y) (hyz : Ident y z) : Ident x z := by
  sorry

/--
`IdentLeibnizIff` TODO

Predicate logic:

  Property x ↔ Property y

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    x y : Carrier
    h : Ident x y
    Property : Carrier → Prop
  Prove
    inst.Ident x y → ∀ (Property : Carrier → Prop), Property x ↔ Property y

Logical form (Lean):

```lean
theorem IdentLeibnizIff {Carrier : Type u} [IdentityRelation Carrier]
    {x y : Carrier} (h : Ident x y) (Property : Carrier → Prop) :
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
theorem IdentLeibnizIff {Carrier : Type u} [IdentityRelation Carrier]
    {x y : Carrier} (h : Ident x y) (Property : Carrier → Prop) :
    Property x ↔ Property y := by
  sorry

end LRA.Identity
