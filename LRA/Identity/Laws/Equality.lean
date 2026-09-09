import LRA.Identity.Interface.Equality
import LRA.Identity.Laws.Primitive

namespace LRA.Identity

universe u

variable {Carrier : Type u}

/--
`EqualRfl` TODO

Predicate logic:

  ∀ {Carrier : Type u} [inst : LRA.Identity.EqualityRelation Carrier] (x : Carrier), inst.Equal x x

Predicate logic (unfolded):

  ∀ {Carrier : Type u} [inst : LRA.Identity.EqualityRelation Carrier] (x : Carrier), inst.Equal x x

Logical form (Lean):

```lean
theorem EqualRfl [EqualityRelation Carrier] (x : Carrier) : Equal x x
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
theorem EqualRfl [EqualityRelation Carrier] (x : Carrier) : Equal x x := by
  sorry

/--
`EqualRefl` TODO

Predicate logic:

  ∀ {Carrier : Type u} [inst : LRA.Identity.EqualityRelation Carrier] (x : Carrier), inst.Equal x x

Predicate logic (unfolded):

  ∀ {Carrier : Type u} [inst : LRA.Identity.EqualityRelation Carrier] (x : Carrier), inst.Equal x x

Logical form (Lean):

```lean
theorem EqualRefl [EqualityRelation Carrier] (x : Carrier) : Equal x x
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
theorem EqualRefl [EqualityRelation Carrier] (x : Carrier) : Equal x x := by
  sorry

/--
`EqualSymmetric` TODO

Predicate logic:

  ∀ {Carrier : Type u} [inst : LRA.Identity.EqualityRelation Carrier] {x y : Carrier}, inst.Equal x y → inst.Equal y x

Predicate logic (unfolded):

  ∀ {Carrier : Type u} [inst : LRA.Identity.EqualityRelation Carrier] {x y : Carrier}, inst.Equal x y → inst.Equal y x

Logical form (Lean):

```lean
theorem EqualSymmetric [EqualityRelation Carrier]
    {x y : Carrier} (h : Equal x y) : Equal y x
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
theorem EqualSymmetric [EqualityRelation Carrier]
    {x y : Carrier} (h : Equal x y) : Equal y x := by
  sorry

/--
`EqualTransitive` TODO

Predicate logic:

  ∀ {Carrier : Type u} [inst : LRA.Identity.EqualityRelation Carrier] {x y z : Carrier}, (inst.Equal x y ∧ inst.Equal y z) → inst.Equal x z

Predicate logic (unfolded):

  ∀ {Carrier : Type u} [inst : LRA.Identity.EqualityRelation Carrier] {x y z : Carrier}, (inst.Equal x y ∧ inst.Equal y z) → inst.Equal x z

Logical form (Lean):

```lean
theorem EqualTransitive [EqualityRelation Carrier]
    {x y z : Carrier} (hxy : Equal x y) (hyz : Equal y z) : Equal x z
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
theorem EqualTransitive [EqualityRelation Carrier]
    {x y z : Carrier} (hxy : Equal x y) (hyz : Equal y z) : Equal x z := by
  sorry

/--
`EqualLeibnizIff` TODO

Predicate logic:

  ∀ {Carrier : Type u} [inst : LRA.Identity.EqualityRelation Carrier] {x y : Carrier}, inst.Equal x y → ∀ (Property : Carrier → Prop), Property x ↔ Property y

Predicate logic (unfolded):

  ∀ {Carrier : Type u} [inst : LRA.Identity.EqualityRelation Carrier] {x y : Carrier}, inst.Equal x y → ∀ (Property : Carrier → Prop), Property x ↔ Property y

Logical form (Lean):

```lean
theorem EqualLeibnizIff [EqualityRelation Carrier]
    {x y : Carrier} (h : Equal x y)
    (Property : Carrier → Prop) : Property x ↔ Property y
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
theorem EqualLeibnizIff [EqualityRelation Carrier]
    {x y : Carrier} (h : Equal x y)
    (Property : Carrier → Prop) : Property x ↔ Property y := by
  sorry

/--
`IdentIsDiagonal` TODO

Predicate logic:

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] [inst_1 : LRA.Identity.EqualityRelation Carrier] (x y : Carrier), inst.Ident x y ↔ inst_1.Equal x y

Predicate logic (unfolded):

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] [inst_1 : LRA.Identity.EqualityRelation Carrier] (x y : Carrier), inst.Ident x y ↔ inst_1.Equal x y

Logical form (Lean):

```lean
theorem IdentIsDiagonal [IdentityRelation Carrier] [EqualityRelation Carrier]
    (x y : Carrier) : Ident x y ↔ Equal x y
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
theorem IdentIsDiagonal [IdentityRelation Carrier] [EqualityRelation Carrier]
    (x y : Carrier) : Ident x y ↔ Equal x y := by
  sorry

end LRA.Identity
