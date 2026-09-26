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
  let P : Carrier -> Prop := fun t => Ident x t
  have hP : P x <-> P y := h P
  have hx : P x := IdentRfl x
  have hy : P y := hP.mp hx
  exact hy

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

  constructor
  . -- mp

    intro hxIy
    exact IndiscernibilityOfIdenticals hxIy

  . -- mpr
    let P : Carrier -> Prop := fun t => Ident x t
    intro arbProp
    have hP : P x <-> P y := arbProp P
    have hx : P x := IdentRfl x
    exact hP.mp hx



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
  intro l r
  constructor
  . --
    intro h_lRr
    unfold EqualityDiagonal
    -- Step 1: Define the predicate "being equal to l"
    let P_lEr : Carrier → Prop := fun x => l = x

    -- Step 2: Show that P_lEr is admissible (which is just `True`)
    have h_adm : FullLeibniz Carrier P_lEr := trivial

    -- Step 3: Show that P_lEr holds for l (which is `l = l`)
    have h_Pl : P_lEr l := rfl

    -- Step 4: Extract the Leibniz property from h for the pair (l, r)
    have h_subst := h.leibniz l r h_lRr

    -- Step 5: Specialize the Leibniz property to our predicate P
    have h_step := h_subst P_lEr h_adm

    -- Step 6: Conclude P_lEr r, which is definitionally `l = r`
    exact h_step h_Pl
  . --
    intro h_diag_equal

    have h_eq : l = r := h_diag_equal
    rw [h_eq]
    exact h.reflexive r



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
    {R : Carrier → Carrier → Prop} :
    IsIdentityRelation R ↔ ∀ left right, R left right ↔ left = right := by
  constructor
  · -- Forward direction (→)
    intro h_identrelation left right
    constructor
    · -- R left right → left = right
      intro h_R
      exact h_identrelation.leibniz left right h_R (fun x => left = x) trivial rfl
    · -- left = right → R left right
      intro h_eq
      rw [h_eq]
      exact h_identrelation.reflexive right
  · -- Reverse direction (←)
    intro h_iff
    constructor
    · -- Reflexivity: ∀ x, R x x
      intro x
      exact (h_iff x x).mpr rfl
    · -- Leibniz property
      intro x y h_R P _h_adm h_Px
      have h_eq : x = y := (h_iff x y).mp h_R
      rw [← h_eq]
      exact h_Px


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
    {R : Carrier → Carrier → Prop} :
    IsIdentityRelation R ↔ R = EqualityDiagonal Carrier := by
  constructor
  · intro h_id
    ext left right
    have h_iff := (IsIdentityRelation.IffForallIffEquality.mp h_id) left right
    -- EqualityDiagonal Carrier left right is definitionally left = right
    exact h_iff
  · intro h_eq
    rw [h_eq]
    rw [IsIdentityRelation.IffForallIffEquality]
    intro left right
    rfl

theorem EqualityStructure.IsDiagonal (S : EqualityStructure.{u}) :
    ∀ left right,
      S.equalityInterpretation left right ↔ EqualityDiagonal S.Carrier left right := by
  intro left right
  have h_id : IsIdentityRelation S.equalityInterpretation := S.satisfiesIdentityTheory
  exact (IsIdentityRelation.IffForallIffEquality.mp h_id) left right



end LRA.Identity
