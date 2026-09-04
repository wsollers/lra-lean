import LRA.Identity.Interface.ModelTheory
import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Definitions
import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Theorems

namespace LRA.Identity

universe u

/--
`IsIdentityRelation.isDiagonal` TODO

Predicate logic:

  (IsIdentityRelation R) → ∀ left right, R left right ↔ EqualityDiagonal Carrier left right

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    R : Carrier → Carrier → Prop
  Prove
    LRA.Identity.IsIdentityRelation R → ∀ (left right : Carrier), R left right ↔ LRA.Identity.EqualityDiagonal Carrier left right

Logical form (Lean):

```lean
theorem IsIdentityRelation.isDiagonal {Carrier : Type u}
    {R : Carrier → Carrier → Prop}
    (h : IsIdentityRelation R) :
    ∀ left right, R left right ↔ EqualityDiagonal Carrier left right
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
theorem IsIdentityRelation.isDiagonal {Carrier : Type u}
    {R : Carrier → Carrier → Prop}
    (h : IsIdentityRelation R) :
    ∀ left right, R left right ↔ EqualityDiagonal Carrier left right := by
  sorry

/--
`IsIdentityRelation.iff_forall_iff_eq` TODO

Predicate logic:

  IsIdentityRelation R ↔ ∀ left right, R left right ↔ left = right

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    R : Carrier → Carrier → Prop
  Prove
    LRA.Identity.IsIdentityRelation R ↔ ∀ (left right : Carrier), R left right ↔ left = right

Logical form (Lean):

```lean
theorem IsIdentityRelation.iff_forall_iff_eq {Carrier : Type u}
    {R : Carrier → Carrier → Prop} :
    IsIdentityRelation R ↔ ∀ left right, R left right ↔ left = right
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
theorem IsIdentityRelation.iff_forall_iff_eq {Carrier : Type u}
    {R : Carrier → Carrier → Prop} :
    IsIdentityRelation R ↔ ∀ left right, R left right ↔ left = right := by
  sorry

/--
`IsIdentityRelation.iff_eq_diagonal` TODO

Predicate logic:

  IsIdentityRelation R ↔ R = EqualityDiagonal Carrier

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    R : Carrier → Carrier → Prop
  Prove
    LRA.Identity.IsIdentityRelation R ↔ R = LRA.Identity.EqualityDiagonal Carrier

Logical form (Lean):

```lean
theorem IsIdentityRelation.iff_eq_diagonal {Carrier : Type u}
    {R : Carrier → Carrier → Prop} :
    IsIdentityRelation R ↔ R = EqualityDiagonal Carrier
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
theorem IsIdentityRelation.iff_eq_diagonal {Carrier : Type u}
    {R : Carrier → Carrier → Prop} :
    IsIdentityRelation R ↔ R = EqualityDiagonal Carrier := by
  sorry

/--
`EqualityStructure.ofReflexiveLeibnizRelation` TODO

Predicate logic:

  def EqualityStructure.ofReflexiveLeibnizRelation
      (Carrier : Type u) [Nonempty Carrier] {R : Carrier → Carrier → Prop}
      (reflexive : ∀ x, R x x)
      (leibniz : ∀ x y, R x y → ∀ P : Carrier → Prop, P x → P y) :
      EqualityStructure.{u} where
    Carrier := Carrier
    carrierNonempty := inferInstance
    equalityInterpretation := R
    satisfiesIdentityTheory := ⟨reflexive, fun x y h P _ => leibniz x y h P⟩

Predicate logic (unfolded):

  def EqualityStructure.ofReflexiveLeibnizRelation
      (Carrier : Type u) [Nonempty Carrier] {R : Carrier → Carrier → Prop}
      (reflexive : ∀ x, R x x)
      (leibniz : ∀ x y, R x y → ∀ P : Carrier → Prop, P x → P y) :
      EqualityStructure.{u} where
    Carrier := Carrier
    carrierNonempty := inferInstance
    equalityInterpretation := R
    satisfiesIdentityTheory := ⟨reflexive, fun x y h P _ => leibniz x y h P⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def EqualityStructure.ofReflexiveLeibnizRelation
    (Carrier : Type u) [Nonempty Carrier] {R : Carrier → Carrier → Prop}
    (reflexive : ∀ x, R x x)
    (leibniz : ∀ x y, R x y → ∀ P : Carrier → Prop, P x → P y) :
    EqualityStructure.{u} where
  Carrier := Carrier
  carrierNonempty := inferInstance
  equalityInterpretation := R
  satisfiesIdentityTheory := ⟨reflexive, fun x y h P _ => leibniz x y h P⟩
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def EqualityStructure.ofReflexiveLeibnizRelation
    (Carrier : Type u) [Nonempty Carrier] {R : Carrier → Carrier → Prop}
    (reflexive : ∀ x, R x x)
    (leibniz : ∀ x y, R x y → ∀ P : Carrier → Prop, P x → P y) :
    EqualityStructure.{u} where
  Carrier := Carrier
  carrierNonempty := inferInstance
  equalityInterpretation := R
  satisfiesIdentityTheory := ⟨reflexive, fun x y h P _ => leibniz x y h P⟩

/--
`EqualityStructure.ofIsIdentityRelation` TODO

Predicate logic:

  abbrev EqualityStructure.ofIsIdentityRelation
      (Carrier : Type u) [Nonempty Carrier] {R : Carrier → Carrier → Prop}
      (h : IsIdentityRelation R) : EqualityStructure.{u} :=
    EqualityStructure.ofReflexiveLeibnizRelation Carrier h.reflexive
      (fun x y hxy P hx => h.leibniz x y hxy P trivial hx)

Predicate logic (unfolded):

  abbrev EqualityStructure.ofIsIdentityRelation
      (Carrier : Type u) [Nonempty Carrier] {R : Carrier → Carrier → Prop}
      (h : IsIdentityRelation R) : EqualityStructure.{u} :=
    EqualityStructure.ofReflexiveLeibnizRelation Carrier h.reflexive
      (fun x y hxy P hx => h.leibniz x y hxy P trivial hx) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev EqualityStructure.ofIsIdentityRelation
    (Carrier : Type u) [Nonempty Carrier] {R : Carrier → Carrier → Prop}
    (h : IsIdentityRelation R) : EqualityStructure.{u} :=
  EqualityStructure.ofReflexiveLeibnizRelation Carrier h.reflexive
    (fun x y hxy P hx => h.leibniz x y hxy P trivial hx)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
abbrev EqualityStructure.ofIsIdentityRelation
    (Carrier : Type u) [Nonempty Carrier] {R : Carrier → Carrier → Prop}
    (h : IsIdentityRelation R) : EqualityStructure.{u} :=
  EqualityStructure.ofReflexiveLeibnizRelation Carrier h.reflexive
    (fun x y hxy P hx => h.leibniz x y hxy P trivial hx)

end LRA.Identity
