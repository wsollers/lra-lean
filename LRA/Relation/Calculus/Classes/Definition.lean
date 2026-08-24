import LRA.Relation.Definition
import LRA.Set.SetClass.Definition

namespace LRA.Relation

open LRA.Set
universe u v

/--
`DomainClass` TODO

Predicate logic:

  ∀ {X : Type u} {Y : Type v} (R : LRA.Relation.HeterogeneousBinaryRelation X Y) (a : X), Exists fun y => R a y

Predicate logic (unfolded):

  ∀ {X : Type u} {Y : Type v} (R : X → Y → Prop) (a : X), Exists fun y => R a y

Logical form (Lean):

```lean
def DomainClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) : SetClass X :=
  fun x => ∃ y, R x y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
def DomainClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) : SetClass X :=
  fun x => ∃ y, R x y

/--
`RangeClass` TODO

Predicate logic:

  ∀ {X : Type u} {Y : Type v} (R : LRA.Relation.HeterogeneousBinaryRelation X Y) (a : Y), Exists fun x => R x a

Predicate logic (unfolded):

  ∀ {X : Type u} {Y : Type v} (R : X → Y → Prop) (a : Y), Exists fun x => R x a

Logical form (Lean):

```lean
def RangeClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) : SetClass Y :=
  fun y => ∃ x, R x y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
def RangeClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) : SetClass Y :=
  fun y => ∃ x, R x y

/--
`PointImageClass` TODO

Predicate logic:

  ∀ {X : Type u} {Y : Type v} (R : LRA.Relation.HeterogeneousBinaryRelation X Y) (x : X) (a : Y), R x a

Predicate logic (unfolded):

  ∀ {X : Type u} {Y : Type v} (R : X → Y → Prop) (x : X) (a : Y), R x a

Logical form (Lean):

```lean
def PointImageClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (x : X) : SetClass Y :=
  fun y => R x y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def PointImageClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (x : X) : SetClass Y :=
  fun y => R x y

/--
`ImageClass` TODO

Predicate logic:

  ∀ {X : Type u} {Y : Type v} (R : LRA.Relation.HeterogeneousBinaryRelation X Y) (A : LRA.Set.SetClass X) (a : Y), Exists fun x => (A x ∧ R x a)

Predicate logic (unfolded):

  ∀ {X : Type u} {Y : Type v} (R : X → Y → Prop) (A : X → Prop) (a : Y), Exists fun x => (A x ∧ R x a)

Logical form (Lean):

```lean
def ImageClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (A : SetClass X) : SetClass Y :=
  fun y => ∃ x, A x ∧ R x y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use, unfold

-/
def ImageClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (A : SetClass X) : SetClass Y :=
  fun y => ∃ x, A x ∧ R x y

/--
`PreimageClass` TODO

Predicate logic:

  ∀ {X : Type u} {Y : Type v} (R : LRA.Relation.HeterogeneousBinaryRelation X Y) (B : LRA.Set.SetClass Y) (a : X), Exists fun y => (B y ∧ R a y)

Predicate logic (unfolded):

  ∀ {X : Type u} {Y : Type v} (R : X → Y → Prop) (B : Y → Prop) (a : X), Exists fun y => (B y ∧ R a y)

Logical form (Lean):

```lean
def PreimageClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (B : SetClass Y) : SetClass X :=
  fun x => ∃ y, B y ∧ R x y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use, unfold

-/
def PreimageClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (B : SetClass Y) : SetClass X :=
  fun x => ∃ y, B y ∧ R x y

/--
`FiberClass` TODO

Predicate logic:

  ∀ {X : Type u} {Y : Type v} (R : LRA.Relation.HeterogeneousBinaryRelation X Y) (y : Y) (a : X), R a y

Predicate logic (unfolded):

  ∀ {X : Type u} {Y : Type v} (R : X → Y → Prop) (y : Y) (a : X), R a y

Logical form (Lean):

```lean
def FiberClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (y : Y) : SetClass X :=
  fun x => R x y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FiberClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (y : Y) : SetClass X :=
  fun x => R x y

/--
`LeftSectionClass` TODO

Predicate logic:

  ∀ {X : Type u} {Y : Type v} (R : LRA.Relation.HeterogeneousBinaryRelation X Y) (y : Y) (a : X), R a y

Predicate logic (unfolded):

  ∀ {X : Type u} {Y : Type v} (R : X → Y → Prop) (y : Y) (a : X), R a y

Logical form (Lean):

```lean
abbrev LeftSectionClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (y : Y) : SetClass X := FiberClass R y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev LeftSectionClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (y : Y) : SetClass X := FiberClass R y

/--
`RightSectionClass` TODO

Predicate logic:

  ∀ {X : Type u} {Y : Type v} (R : LRA.Relation.HeterogeneousBinaryRelation X Y) (x : X) (a : Y), R x a

Predicate logic (unfolded):

  ∀ {X : Type u} {Y : Type v} (R : X → Y → Prop) (x : X) (a : Y), R x a

Logical form (Lean):

```lean
abbrev RightSectionClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (x : X) : SetClass Y := PointImageClass R x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev RightSectionClass {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (x : X) : SetClass Y := PointImageClass R x

end LRA.Relation
