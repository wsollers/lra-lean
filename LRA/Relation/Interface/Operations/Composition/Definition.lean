import LRA.Relation.Interface.Definitions

namespace LRA.Relation

universe u v w

/--
`RelationComposition` TODO

Predicate logic:

  ∀ {Alpha : Type u} {Beta : Type v} {Gamma : Type w} (rightRelation : LRA.Relation.HeterogeneousBinaryRelation Beta Gamma) (leftRelation : LRA.Relation.HeterogeneousBinaryRelation Alpha Beta) (a : Alpha) (a_1 : Gamma), Exists fun middle => (leftRelation a middle ∧ rightRelation middle a_1)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {Gamma : Type w} (rightRelation : Beta → Gamma → Prop) (leftRelation : Alpha → Beta → Prop) (a : Alpha) (a_1 : Gamma), Exists fun middle => (leftRelation a middle ∧ rightRelation middle a_1)

Logical form (Lean):

```lean
def RelationComposition
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    (rightRelation : HeterogeneousBinaryRelation Beta Gamma)
    (leftRelation : HeterogeneousBinaryRelation Alpha Beta) :
    HeterogeneousBinaryRelation Alpha Gamma :=
  fun first third =>
    ∃ middle, leftRelation first middle ∧ rightRelation middle third
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
def RelationComposition
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    (rightRelation : HeterogeneousBinaryRelation Beta Gamma)
    (leftRelation : HeterogeneousBinaryRelation Alpha Beta) :
    HeterogeneousBinaryRelation Alpha Gamma :=
  fun first third =>
    ∃ middle, leftRelation first middle ∧ rightRelation middle third

end LRA.Relation
