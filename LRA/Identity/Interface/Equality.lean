import LRA.Identity.Interface.Identity

namespace LRA.Identity

universe u

/--
`EqualityTheory` TODO

Predicate logic:

  ∀ (Carrier : Type u) (a : Carrier → Carrier → Prop), LRA.Identity.IdentityTheory (LRA.Identity.FullLeibniz Carrier) a

Predicate logic (unfolded):

  ∀ (Carrier : Type u) (a : Carrier → Carrier → Prop), ((∀ (x : Carrier), a x x) ∧ (∀ (x y : Carrier), a x y → ∀ (P : Carrier → Prop), True → P x → P y))

Logical form (Lean):

```lean
abbrev EqualityTheory (Carrier : Type u) :
    (Carrier -> Carrier -> Prop) -> Prop := IsIdentityRelation
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
abbrev EqualityTheory (Carrier : Type u) :
    (Carrier -> Carrier -> Prop) -> Prop := IsIdentityRelation

/--
`EqualityRelation` TODO

Predicate logic:

  class EqualityRelation (Carrier : Type u) where
    Equal : Carrier -> Carrier -> Prop
    satisfiesEqualityTheory : EqualityTheory Carrier Equal

Predicate logic (unfolded):

  class EqualityRelation (Carrier : Type u) where
    Equal : Carrier -> Carrier -> Prop
    satisfiesEqualityTheory : EqualityTheory Carrier Equal

Logical form (Lean):

```lean
class EqualityRelation (Carrier : Type u) where
  Equal : Carrier -> Carrier -> Prop
  satisfiesEqualityTheory : EqualityTheory Carrier Equal
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
class EqualityRelation (Carrier : Type u) where
  Equal : Carrier -> Carrier -> Prop
  satisfiesEqualityTheory : EqualityTheory Carrier Equal

export EqualityRelation (Equal)

/--
`EqualReflexive` TODO

Predicate logic:

  ∀ {Carrier : Type u} [inst : LRA.Identity.EqualityRelation Carrier] (x : Carrier), inst.Equal x x

Predicate logic (unfolded):

  ∀ {Carrier : Type u} [inst : LRA.Identity.EqualityRelation Carrier] (x : Carrier), inst.Equal x x

Logical form (Lean):

```lean
theorem EqualReflexive {Carrier : Type u} [EqualityRelation Carrier] :
    forall x : Carrier, Equal x x
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
theorem EqualReflexive {Carrier : Type u} [EqualityRelation Carrier] :
    forall x : Carrier, Equal x x := by
  sorry

/--
`EqualLeibniz` TODO

Predicate logic:

  ∀ {Carrier : Type u} [inst : LRA.Identity.EqualityRelation Carrier] {x y : Carrier}, inst.Equal x y → ∀ (Property : Carrier → Prop), Property x → Property y

Predicate logic (unfolded):

  ∀ {Carrier : Type u} [inst : LRA.Identity.EqualityRelation Carrier] {x y : Carrier}, inst.Equal x y → ∀ (Property : Carrier → Prop), Property x → Property y

Logical form (Lean):

```lean
theorem EqualLeibniz {Carrier : Type u} [EqualityRelation Carrier]
    {x y : Carrier} (hxy : Equal x y) (Property : Carrier -> Prop) :
    Property x -> Property y
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
theorem EqualLeibniz {Carrier : Type u} [EqualityRelation Carrier]
    {x y : Carrier} (hxy : Equal x y) (Property : Carrier -> Prop) :
    Property x -> Property y := by
  sorry

/--
`IsEqualityRelation` TODO

Predicate logic:

  ∀ {Carrier : Type u} (Equal : Carrier → Carrier → Prop), LRA.Identity.IdentityTheory (LRA.Identity.FullLeibniz Carrier) Equal

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (Equal : Carrier → Carrier → Prop), ((∀ (x : Carrier), Equal x x) ∧ (∀ (x y : Carrier), Equal x y → ∀ (P : Carrier → Prop), True → P x → P y))

Logical form (Lean):

```lean
abbrev IsEqualityRelation {Carrier : Type u}
    (Equal : Carrier -> Carrier -> Prop) : Prop :=
  EqualityTheory Carrier Equal
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
abbrev IsEqualityRelation {Carrier : Type u}
    (Equal : Carrier -> Carrier -> Prop) : Prop :=
  EqualityTheory Carrier Equal

/--
`EqualityRelation.ofIsEqualityRelation` TODO

Predicate logic:

  def EqualityRelation.ofIsEqualityRelation
      {Carrier : Type u} {Equal : Carrier -> Carrier -> Prop}
      (h : IsEqualityRelation Equal) : EqualityRelation Carrier

Predicate logic (unfolded):

  def EqualityRelation.ofIsEqualityRelation
      {Carrier : Type u} {Equal : Carrier -> Carrier -> Prop}
      (h : IsEqualityRelation Equal) : EqualityRelation Carrier

Logical form (Lean):

```lean
def EqualityRelation.ofIsEqualityRelation
    {Carrier : Type u} {Equal : Carrier -> Carrier -> Prop}
    (h : IsEqualityRelation Equal) : EqualityRelation Carrier
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
@[reducible] def EqualityRelation.ofIsEqualityRelation
    {Carrier : Type u} {Equal : Carrier -> Carrier -> Prop}
    (h : IsEqualityRelation Equal) : EqualityRelation Carrier := by
  sorry

end LRA.Identity
