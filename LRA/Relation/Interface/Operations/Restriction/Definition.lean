import LRA.Relation.Interface.Definitions
import LRA.Set.SetClass.Definition

namespace LRA.Relation

open LRA.Set
universe u v

/--
`RestrictDomain` TODO

Predicate logic:

  ∀ {X : Type u} {Y : Type v} (R : LRA.Relation.HeterogeneousBinaryRelation X Y) (A : LRA.Set.SetClass X) (a : X) (a_1 : Y), (A a ∧ R a a_1)

Predicate logic (unfolded):

  ∀ {X : Type u} {Y : Type v} (R : X → Y → Prop) (A : X → Prop) (a : X) (a_1 : Y), (A a ∧ R a a_1)

Logical form (Lean):

```lean
def RestrictDomain {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (A : SetClass X) :
    HeterogeneousBinaryRelation X Y :=
  fun x y => A x ∧ R x y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def RestrictDomain {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (A : SetClass X) :
    HeterogeneousBinaryRelation X Y :=
  fun x y => A x ∧ R x y

/--
`RestrictCodomain` TODO

Predicate logic:

  ∀ {X : Type u} {Y : Type v} (R : LRA.Relation.HeterogeneousBinaryRelation X Y) (B : LRA.Set.SetClass Y) (a : X) (a_1 : Y), (R a a_1 ∧ B a_1)

Predicate logic (unfolded):

  ∀ {X : Type u} {Y : Type v} (R : X → Y → Prop) (B : Y → Prop) (a : X) (a_1 : Y), (R a a_1 ∧ B a_1)

Logical form (Lean):

```lean
def RestrictCodomain {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (B : SetClass Y) :
    HeterogeneousBinaryRelation X Y :=
  fun x y => R x y ∧ B y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def RestrictCodomain {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (B : SetClass Y) :
    HeterogeneousBinaryRelation X Y :=
  fun x y => R x y ∧ B y

/--
`Restrict` TODO

Predicate logic:

  ∀ {X : Type u} {Y : Type v} (R : LRA.Relation.HeterogeneousBinaryRelation X Y) (A : LRA.Set.SetClass X) (B : LRA.Set.SetClass Y) (a : X) (a_1 : Y), (A a ∧ (R a a_1 ∧ B a_1))

Predicate logic (unfolded):

  ∀ {X : Type u} {Y : Type v} (R : X → Y → Prop) (A : X → Prop) (B : Y → Prop) (a : X) (a_1 : Y), (A a ∧ (R a a_1 ∧ B a_1))

Logical form (Lean):

```lean
def Restrict {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (A : SetClass X) (B : SetClass Y) :
    HeterogeneousBinaryRelation X Y :=
  fun x y => A x ∧ R x y ∧ B y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def Restrict {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (A : SetClass X) (B : SetClass Y) :
    HeterogeneousBinaryRelation X Y :=
  fun x y => A x ∧ R x y ∧ B y

end LRA.Relation
