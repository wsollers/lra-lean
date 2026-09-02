import LRA.Relation.Interface.Operations.Composition.Characterizations
import LRA.Relation.Interface.Canonical.IdentityRelation.Definition
import LRA.Relation.Interface.Operations.Converse.Definition

namespace LRA.Relation

universe u v w x

/--
`RelationComposition.associative` TODO

Predicate logic:

  RelationComposition thirdRelation (RelationComposition secondRelation firstRelation) = RelationComposition (RelationComposition thirdRelation secondRelation) firstRelation

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {Gamma : Type w} {Delta : Type x} (firstRelation : Alpha → Beta → Prop) (secondRelation : Beta → Gamma → Prop) (thirdRelation : Gamma → Delta → Prop), fun first third => Exists fun middle => (Exists fun middle_1 => (firstRelation first middle_1 ∧ secondRelation middle_1 middle) ∧ thirdRelation middle third) = funfirst third => Exists fun middle => (firstRelation first middle ∧ Exists fun middle_1 => (secondRelation middle middle_1 ∧ thirdRelation middle_1 third))

Logical form (Lean):

```lean
theorem RelationComposition.associative
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w} {Delta : Type x}
    (firstRelation : HeterogeneousBinaryRelation Alpha Beta)
    (secondRelation : HeterogeneousBinaryRelation Beta Gamma)
    (thirdRelation : HeterogeneousBinaryRelation Gamma Delta) :
    RelationComposition thirdRelation
        (RelationComposition secondRelation firstRelation) =
      RelationComposition
        (RelationComposition thirdRelation secondRelation) firstRelation
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
theorem RelationComposition.associative
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w} {Delta : Type x}
    (firstRelation : HeterogeneousBinaryRelation Alpha Beta)
    (secondRelation : HeterogeneousBinaryRelation Beta Gamma)
    (thirdRelation : HeterogeneousBinaryRelation Gamma Delta) :
    RelationComposition thirdRelation
        (RelationComposition secondRelation firstRelation) =
      RelationComposition
        (RelationComposition thirdRelation secondRelation) firstRelation := by
  sorry
/--
`RelationComposition.identity_left` TODO

Predicate logic:

  RelationComposition (IdentityRelation Beta) relation = relation

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} (relation : Alpha → Beta → Prop), fun first third => Exists fun middle => (relation first middle ∧ middle = third) = relation

Logical form (Lean):

```lean
theorem RelationComposition.identity_left
    {Alpha : Type u} {Beta : Type v}
    (relation : HeterogeneousBinaryRelation Alpha Beta) :
    RelationComposition (IdentityRelation Beta) relation = relation
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
theorem RelationComposition.identity_left
    {Alpha : Type u} {Beta : Type v}
    (relation : HeterogeneousBinaryRelation Alpha Beta) :
    RelationComposition (IdentityRelation Beta) relation = relation := by
  sorry
/--
`RelationComposition.identity_right` TODO

Predicate logic:

  RelationComposition relation (IdentityRelation Alpha) = relation

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} (relation : Alpha → Beta → Prop), fun first third => Exists fun middle => (first = middle ∧ relation middle third) = relation

Logical form (Lean):

```lean
theorem RelationComposition.identity_right
    {Alpha : Type u} {Beta : Type v}
    (relation : HeterogeneousBinaryRelation Alpha Beta) :
    RelationComposition relation (IdentityRelation Alpha) = relation
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
theorem RelationComposition.identity_right
    {Alpha : Type u} {Beta : Type v}
    (relation : HeterogeneousBinaryRelation Alpha Beta) :
    RelationComposition relation (IdentityRelation Alpha) = relation := by
  sorry
/--
`Converse.relationComposition` TODO

Predicate logic:

  Converse (RelationComposition rightRelation leftRelation) = RelationComposition (Converse leftRelation) (Converse rightRelation)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (leftRelation rightRelation : Alpha → Alpha → Prop), fun y x => Exists fun middle => (leftRelation x middle ∧ rightRelation middle y) = funfirst third => Exists fun middle => (rightRelation middle first ∧ leftRelation third middle)

Logical form (Lean):

```lean
theorem Converse.relationComposition
    {Alpha : Type u}
    (leftRelation rightRelation : Endorelation Alpha) :
    Converse (RelationComposition rightRelation leftRelation) =
      RelationComposition (Converse leftRelation) (Converse rightRelation)
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
theorem Converse.relationComposition
    {Alpha : Type u}
    (leftRelation rightRelation : Endorelation Alpha) :
    Converse (RelationComposition rightRelation leftRelation) =
      RelationComposition (Converse leftRelation) (Converse rightRelation) := by
  sorry
end LRA.Relation
