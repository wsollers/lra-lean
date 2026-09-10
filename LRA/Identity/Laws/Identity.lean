import LRA.Identity.Interface.Identity
import LRA.Identity.Interface.ModelTheory.LStructure

namespace LRA.Identity

universe u

variable {Carrier : Type u} [IdentityRelation Carrier]

/--
`IdentRfl` TODO

Predicate logic:

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] (x : Carrier), inst.Ident x x

Predicate logic (unfolded):

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] (x : Carrier), inst.Ident x x

Logical form (Lean):

```lean
theorem IdentRfl (x : Carrier) : Ident x x
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
theorem IdentRfl (x : Carrier) : Ident x x := by
  let inst := (inferInstance : IdentityRelation Carrier)
  have hIdent := inst.IdentReflexive
  have ident := hIdent x
  exact ident

/--
`IdentRefl` TODO

Predicate logic:

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] (x : Carrier), inst.Ident x x

Predicate logic (unfolded):

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] (x : Carrier), inst.Ident x x

Logical form (Lean):

```lean
theorem IdentRefl (x : Carrier) : Ident x x
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
theorem IdentRefl (x : Carrier) : Ident x x := by
  exact IdentRfl x

/--
`IdentSymmetric` TODO

Predicate logic:

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] {x y : Carrier}, inst.Ident x y → inst.Ident y x

Predicate logic (unfolded):

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] {x y : Carrier}, inst.Ident x y → inst.Ident y x

Logical form (Lean):

```lean
theorem IdentSymmetric {x y : Carrier} (h : Ident x y) : Ident y x
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
theorem IdentSymmetric {x y : Carrier} (h : Ident x y) : Ident y x := by

  let inst : IdentityRelation Carrier := inferInstance
  have hx : Ident x x := IdentRfl x
  have hswap : Ident y x := inst.IdentLeibniz h (fun t => Ident t x) hx
  exact hswap

/--
`IdentTransitive` TODO

Predicate logic:

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] {x y z : Carrier}, (inst.Ident x y ∧ inst.Ident y z) → inst.Ident x z

Predicate logic (unfolded):

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] {x y z : Carrier}, (inst.Ident x y ∧ inst.Ident y z) → inst.Ident x z

Logical form (Lean):

```lean
theorem IdentTransitive {x y z : Carrier}
    (hxy : Ident x y) (hyz : Ident y z) : Ident x z
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
theorem IdentTransitive {x y z : Carrier}
    (hxy : Ident x y) (hyz : Ident y z) : Ident x z := by
  let inst : IdentityRelation Carrier := inferInstance
  have hswap : Ident x z := inst.IdentLeibniz hyz (fun t => Ident x t) hxy
  exact hswap


/--
`IndiscernibilityOfIdenticals` TODO

Predicate logic:

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] {x y : Carrier}, inst.Ident x y → ∀ (Property : Carrier → Prop), Property x ↔ Property y

Predicate logic (unfolded):

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] {x y : Carrier}, inst.Ident x y → ∀ (Property : Carrier → Prop), Property x ↔ Property y

Logical form (Lean):

```lean
theorem IndiscernibilityOfIdenticals {x y : Carrier} (h : Ident x y) :
    forall Property : Carrier -> Prop, Property x <-> Property y
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
theorem IndiscernibilityOfIdenticals {x y : Carrier} (h : Ident x y) :
    forall Property : Carrier -> Prop, Property x <-> Property y := by
  let inst : IdentityRelation Carrier := inferInstance
  intro arbProp
  constructor
  . -- mp
    intro Px
    exact inst.IdentLeibniz h arbProp Px

  . -- mpr
    intro Py
    have yIx : Ident y x :=  IdentSymmetric h
    exact inst.IdentLeibniz yIx arbProp Py



/--
`IdentityOfIndiscernibles` TODO

Predicate logic:

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] {x y : Carrier}, (∀ (Property : Carrier → Prop), Property x ↔ Property y) → inst.Ident x y

Predicate logic (unfolded):

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] {x y : Carrier}, (∀ (Property : Carrier → Prop), Property x ↔ Property y) → inst.Ident x y

Logical form (Lean):

```lean
theorem IdentityOfIndiscernibles {x y : Carrier}
    (h : forall Property : Carrier -> Prop, Property x <-> Property y) :
    Ident x y
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
theorem IdentityOfIndiscernibles {x y : Carrier}
    (h : forall Property : Carrier -> Prop, Property x <-> Property y) :
    Ident x y := by
  sorry

/--
`IdentLeibnizIff` TODO

Predicate logic:

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] {x y : Carrier}, inst.Ident x y ↔ ∀ (Property : Carrier → Prop), Property x ↔ Property y

Predicate logic (unfolded):

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] {x y : Carrier}, inst.Ident x y ↔ ∀ (Property : Carrier → Prop), Property x ↔ Property y

Logical form (Lean):

```lean
theorem IdentLeibnizIff {x y : Carrier} :
    Ident x y <-> forall Property : Carrier -> Prop, Property x <-> Property y
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
theorem IdentLeibnizIff {x y : Carrier} :
    Ident x y <-> forall Property : Carrier -> Prop, Property x <-> Property y := by
  sorry

/--
`IsIdentityRelation.IsDiagonal` TODO

Predicate logic:

  ∀ {Carrier : Type u} {R : Carrier → Carrier → Prop}, LRA.Identity.IsIdentityRelation R → ∀ (left right : Carrier), R left right ↔ LRA.Identity.EqualityDiagonal Carrier left right

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {R : Carrier → Carrier → Prop}, ((∀ (x : Carrier), R x x) ∧ (∀ (x y : Carrier), R x y → ∀ (P : Carrier → Prop), True → P x → P y)) → ∀ (left right : Carrier), R left right ↔ left = right

Logical form (Lean):

```lean
theorem IsIdentityRelation.IsDiagonal {Carrier : Type u}
    {R : Carrier -> Carrier -> Prop} (h : IsIdentityRelation R) :
    forall left right, R left right <-> EqualityDiagonal Carrier left right
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
theorem IsIdentityRelation.IsDiagonal {Carrier : Type u}
    {R : Carrier -> Carrier -> Prop} (h : IsIdentityRelation R) :
    forall left right, R left right <-> EqualityDiagonal Carrier left right := by
  sorry

/--
`IsIdentityRelation.IffForallIffEquality` TODO

Predicate logic:

  ∀ {Carrier : Type u} {R : Carrier → Carrier → Prop}, LRA.Identity.IsIdentityRelation R ↔ ∀ (left right : Carrier), R left right ↔ left = right

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {R : Carrier → Carrier → Prop}, ((∀ (x : Carrier), R x x) ∧ (∀ (x y : Carrier), R x y → ∀ (P : Carrier → Prop), True → P x → P y)) ↔ ∀ (left right : Carrier), R left right ↔ left = right

Logical form (Lean):

```lean
theorem IsIdentityRelation.IffForallIffEquality {Carrier : Type u}
    {R : Carrier -> Carrier -> Prop} :
    IsIdentityRelation R <-> forall left right, R left right <-> left = right
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
theorem IsIdentityRelation.IffForallIffEquality {Carrier : Type u}
    {R : Carrier -> Carrier -> Prop} :
    IsIdentityRelation R <-> forall left right, R left right <-> left = right := by
  sorry

/--
`IsIdentityRelation.IffEqualityDiagonal` TODO

Predicate logic:

  ∀ {Carrier : Type u} {R : Carrier → Carrier → Prop}, LRA.Identity.IsIdentityRelation R ↔ R = LRA.Identity.EqualityDiagonal Carrier

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {R : Carrier → Carrier → Prop}, ((∀ (x : Carrier), R x x) ∧ (∀ (x y : Carrier), R x y → ∀ (P : Carrier → Prop), True → P x → P y)) ↔ R = LRA.Identity.EqualityDiagonal Carrier

Logical form (Lean):

```lean
theorem IsIdentityRelation.IffEqualityDiagonal {Carrier : Type u}
    {R : Carrier -> Carrier -> Prop} :
    IsIdentityRelation R <-> R = EqualityDiagonal Carrier
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
theorem IsIdentityRelation.IffEqualityDiagonal {Carrier : Type u}
    {R : Carrier -> Carrier -> Prop} :
    IsIdentityRelation R <-> R = EqualityDiagonal Carrier := by
  sorry

/--
`EqualityStructure.IsDiagonal` TODO

Predicate logic:

  ∀ (S : LRA.Identity.EqualityStructure) (left right : S.Carrier), S.equalityInterpretation left right ↔ LRA.Identity.EqualityDiagonal S.Carrier left right

Predicate logic (unfolded):

  ∀ (S : LRA.Identity.EqualityStructure) (left right : S.Carrier), S.equalityInterpretation left right ↔ left = right

Logical form (Lean):

```lean
theorem EqualityStructure.IsDiagonal (S : EqualityStructure.{u}) :
    forall left right,
      S.equalityInterpretation left right <-> EqualityDiagonal S.Carrier left right
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
theorem EqualityStructure.IsDiagonal (S : EqualityStructure.{u}) :
    forall left right,
      S.equalityInterpretation left right <-> EqualityDiagonal S.Carrier left right := by
  sorry

end LRA.Identity
