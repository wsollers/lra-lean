import LRA.Relation.Interface.Calculus.Classes.Definition

namespace LRA.Relation

open LRA.Set
universe u v

/--
`PointImageClassIsSingletonImage` TODO

Predicate logic:

  (∀ x ∈ X), ImageClass R (fun z => z = x) = PointImageClass R x

Predicate logic (unfolded):

  ∀ {X : Type u} {Y : Type v} (R : X → Y → Prop) (x : X), fun y => Exists fun x_1 => ((fun z => z = x)x_1 ∧ R x_1 y) = funy => R x y

Logical form (Lean):

```lean
theorem PointImageClassIsSingletonImage {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (x : X) :
    ImageClass R (fun z => z = x) = PointImageClass R x
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
theorem PointImageClassIsSingletonImage {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (x : X) :
    ImageClass R (fun z => z = x) = PointImageClass R x := by
  sorry

/--
`FiberClassIsSingletonPreimage` TODO

Predicate logic:

  (∀ y ∈ Y), PreimageClass R (fun z => z = y) = FiberClass R y

Predicate logic (unfolded):

  ∀ {X : Type u} {Y : Type v} (R : X → Y → Prop) (y : Y), fun x => Exists fun y_1 => ((fun z => z = y)y_1 ∧ R x y_1) = funx => R x y

Logical form (Lean):

```lean
theorem FiberClassIsSingletonPreimage {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (y : Y) :
    PreimageClass R (fun z => z = y) = FiberClass R y
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
theorem FiberClassIsSingletonPreimage {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) (y : Y) :
    PreimageClass R (fun z => z = y) = FiberClass R y := by
  sorry

end LRA.Relation
