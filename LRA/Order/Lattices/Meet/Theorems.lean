import LRA.Order.Lattices.Meet.Definition
import LRA.Relation.Interface.Laws.Definition
import LRA.Order.OrderedSets.PartialOrder.Definition

namespace LRA.Order

universe u

/--
`MeetUnique` TODO

Predicate logic:

  ∀ {Alpha : Type u} {relation : LRA.Relation.Endorelation Alpha}, LRA.Relation.Antisymmetric relation → ∀ {left right first second : Alpha}, (LRA.Order.Meet relation left right first ∧ LRA.Order.Meet relation left right second) → first = second

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : LRA.Relation.Endorelation Alpha
    relationIsAntisymmetric : LRA.Relation.Antisymmetric relation
    left right first second : Alpha
    firstIsMeet : Meet relation left right first
    secondIsMeet : Meet relation left right second
  Prove
    (∀ (x y : Alpha), relation x y → relation y x → x = y) → ∀ {left right first second : Alpha}, ((relation first left ∧ (relation first right ∧ (∀ (lower : Alpha), relation lower left → relation lower right → relation lower first))) ∧ (relation second left ∧ (relation second right ∧ (∀ (lower : Alpha), relation lower left → relation lower right → relation lower second)))) → first = second

Logical form (Lean):

```lean
theorem MeetUnique
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {left right first second : Alpha}
    (firstIsMeet : Meet relation left right first)
    (secondIsMeet : Meet relation left right second) :
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
theorem MeetUnique
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {left right first second : Alpha}
    (firstIsMeet : Meet relation left right first)
    (secondIsMeet : Meet relation left right second) :
    first = second := by
  sorry
/--
`MeetCommutes` TODO

Predicate logic:

  ∀ {Alpha : Type u} (relation : LRA.Relation.Endorelation Alpha) (left right meet : Alpha), LRA.Order.Meet relation left right meet ↔ LRA.Order.Meet relation right left meet

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : LRA.Relation.Endorelation Alpha
    left right meet : Alpha
  Prove
    LRA.Order.Meet relation left right meet ↔ LRA.Order.Meet relation right left meet

Logical form (Lean):

```lean
theorem MeetCommutes
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha)
    (left right meet : Alpha) :
    Meet relation left right meet ↔ Meet relation right left meet
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
theorem MeetCommutes
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha)
    (left right meet : Alpha) :
    Meet relation left right meet ↔ Meet relation right left meet := by
  sorry
/--
`MeetIdempotent` TODO

Predicate logic:

  ∀ {Alpha : Type u} {relation : LRA.Relation.Endorelation Alpha}, LRA.Relation.Reflexive relation → ∀ (element : Alpha), LRA.Order.Meet relation element element element

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : LRA.Relation.Endorelation Alpha
    relationIsReflexive : LRA.Relation.Reflexive relation
    element : Alpha
  Prove
    (∀ (x : Alpha), relation x x) → ∀ (element : Alpha), (relation element element ∧ (relation element element ∧ (∀ (lower : Alpha), relation lower element → relation lower element → relation lower element)))

Logical form (Lean):

```lean
theorem MeetIdempotent
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    (element : Alpha) :
    Meet relation element element element
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
theorem MeetIdempotent
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    (element : Alpha) :
    Meet relation element element element := by
  sorry
/--
`MeetAssociative` TODO

Predicate logic:

  ∀ {Alpha : Type u} {relation : LRA.Relation.Endorelation Alpha}, LRA.Order.PartialOrder relation → ∀ {left middle right leftMiddle firstAssociation middleRight secondAssociation : Alpha}, (LRA.Order.Meet relation left middle leftMiddle ∧ (LRA.Order.Meet relation leftMiddle right firstAssociation ∧ (LRA.Order.Meet relation middle right middleRight ∧ LRA.Order.Meet relation left middleRight secondAssociation))) → firstAssociation = secondAssociation

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : LRA.Relation.Endorelation Alpha
    relationIsPartialOrder : PartialOrder relation
    left middle right leftMiddle firstAssociation middleRight secondAssociation : Alpha
    leftMiddleIsMeet : Meet relation left middle leftMiddle
    firstAssociationIsMeet : Meet relation leftMiddle right firstAssociation
    middleRightIsMeet : Meet relation middle right middleRight
    secondAssociationIsMeet : Meet relation left middleRight secondAssociation
  Prove
    ((∀ (x : Alpha), relation x x) ∧ ((∀ (x y : Alpha), relation x y → relation y x → x = y) ∧ (∀ (x y z : Alpha), relation x y → relation y z → relation x z))) → ∀ {left middle right leftMiddle firstAssociation middleRight secondAssociation : Alpha}, ((relation leftMiddle left ∧ (relation leftMiddle middle ∧ (∀ (lower : Alpha), relation lower left → relation lower middle → relation lower leftMiddle))) ∧ ((relation firstAssociation leftMiddle ∧ (relation firstAssociation right ∧ (∀ (lower : Alpha), relation lower leftMiddle → relation lower right → relation lower firstAssociation))) ∧ ((relation middleRight middle ∧ (relation middleRight right ∧ (∀ (lower : Alpha), relation lower middle → relation lower right → relation lower middleRight))) ∧ (relation secondAssociation left ∧ (relation secondAssociation middleRight ∧ (∀ (lower : Alpha), relation lower left → relation lower middleRight → relation lower secondAssociation)))))) → firstAssociation = secondAssociation

Logical form (Lean):

```lean
theorem MeetAssociative
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation)
    {left middle right leftMiddle firstAssociation
      middleRight secondAssociation : Alpha}
    (leftMiddleIsMeet : Meet relation left middle leftMiddle)
    (firstAssociationIsMeet : Meet relation leftMiddle right firstAssociation)
    (middleRightIsMeet : Meet relation middle right middleRight)
    (secondAssociationIsMeet : Meet relation left middleRight secondAssociation) :
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
theorem MeetAssociative
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation)
    {left middle right leftMiddle firstAssociation
      middleRight secondAssociation : Alpha}
    (leftMiddleIsMeet : Meet relation left middle leftMiddle)
    (firstAssociationIsMeet : Meet relation leftMiddle right firstAssociation)
    (middleRightIsMeet : Meet relation middle right middleRight)
    (secondAssociationIsMeet : Meet relation left middleRight secondAssociation) :
    firstAssociation = secondAssociation := by
  sorry
end LRA.Order
