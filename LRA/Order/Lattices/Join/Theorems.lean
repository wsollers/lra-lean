import LRA.Order.Lattices.Join.Definition
import LRA.Relation.Properties.Definition
import LRA.Order.OrderedSets.PartialOrder.Definition

namespace LRA.Order

universe u

/--
`JoinUnique` TODO

Predicate logic:

  first = second

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {relation : Alpha → Alpha → Prop}, (∀ (x y : Alpha), relation x y → relation y x → x = y) → ∀ {left right first second : Alpha}, ((relation left first ∧ (relation right first ∧ ∀ (upper : Alpha), relation left upper → relation right upper → relation first upper)) ∧ (relation left second ∧ (relation right second ∧ ∀ (upper : Alpha), relation left upper → relation right upper → relation second upper))) → first = second

Logical form (Lean):

```lean
theorem JoinUnique
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {left right first second : Alpha}
    (firstIsJoin : Join relation left right first)
    (secondIsJoin : Join relation left right second) :
    first = second
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
theorem JoinUnique
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {left right first second : Alpha}
    (firstIsJoin : Join relation left right first)
    (secondIsJoin : Join relation left right second) :
    first = second := by
  sorry

/--
`JoinCommutes` TODO

Predicate logic:

  (∀ left right join ∈ Alpha), Join relation left right join ↔ Join relation right left join

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation : Alpha → Alpha → Prop) (left right join : Alpha), (relation left join ∧ (relation right join ∧ ∀ (upper : Alpha), relation left upper → relation right upper → relation join upper)) ↔ (relation right join ∧ (relation left join ∧ ∀ (upper : Alpha), relation right upper → relation left upper → relation join upper))

Logical form (Lean):

```lean
theorem JoinCommutes
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha)
    (left right join : Alpha) :
    Join relation left right join ↔ Join relation right left join
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
theorem JoinCommutes
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha)
    (left right join : Alpha) :
    Join relation left right join ↔ Join relation right left join := by
  sorry

/--
`JoinIdempotent` TODO

Predicate logic:

  (∀ element ∈ Alpha), Join relation element element element

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {relation : Alpha → Alpha → Prop}, (∀ (x : Alpha), relation x x) → ∀ (element : Alpha), (relation element element ∧ (relation element element ∧ ∀ (upper : Alpha), relation element upper → relation element upper → relation element upper))

Logical form (Lean):

```lean
theorem JoinIdempotent
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    (element : Alpha) :
    Join relation element element element
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
theorem JoinIdempotent
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    (element : Alpha) :
    Join relation element element element := by
  sorry

/--
`JoinAssociative` TODO

Predicate logic:

  firstAssociation = secondAssociation

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {relation : Alpha → Alpha → Prop}, (∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) → ∀ {left middle right leftMiddle firstAssociation middleRight secondAssociation : Alpha}, ((relation left leftMiddle ∧ (relation middle leftMiddle ∧ ∀ (upper : Alpha), relation left upper → relation middle upper → relation leftMiddle upper)) ∧ ((relation leftMiddle firstAssociation ∧ (relation right firstAssociation ∧ ∀ (upper : Alpha), relation leftMiddle upper → relation right upper → relation firstAssociation upper)) ∧ ((relation middle middleRight ∧ (relation right middleRight ∧ ∀ (upper : Alpha), relation middle upper → relation right upper → relation middleRight upper)) ∧ (relation left secondAssociation ∧ (relation middleRight secondAssociation ∧ ∀ (upper : Alpha), relation left upper → relation middleRight upper → relation secondAssociation upper))))) → firstAssociation = secondAssociation

Logical form (Lean):

```lean
theorem JoinAssociative
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation)
    {left middle right leftMiddle firstAssociation
      middleRight secondAssociation : Alpha}
    (leftMiddleIsJoin : Join relation left middle leftMiddle)
    (firstAssociationIsJoin : Join relation leftMiddle right firstAssociation)
    (middleRightIsJoin : Join relation middle right middleRight)
    (secondAssociationIsJoin : Join relation left middleRight secondAssociation) :
    firstAssociation = secondAssociation
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
theorem JoinAssociative
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation)
    {left middle right leftMiddle firstAssociation
      middleRight secondAssociation : Alpha}
    (leftMiddleIsJoin : Join relation left middle leftMiddle)
    (firstAssociationIsJoin : Join relation leftMiddle right firstAssociation)
    (middleRightIsJoin : Join relation middle right middleRight)
    (secondAssociationIsJoin : Join relation left middleRight secondAssociation) :
    firstAssociation = secondAssociation := by
  sorry

end LRA.Order
