import LRA.VolumeI.Order.OrderedSets.PartialOrder.Characterizations
import LRA.VolumeI.Order.OrderedSets.Preorder.Relationships

namespace LRA.VolumeI.Order.OrderedSets.PartialOrder

universe u

/--
The strict part of a non-strict partial order.

Logical form:

```lean
fun left right => order.relation left right /\ left /= right
```
-/
def StrictPart
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    Relation Carrier :=
  fun left right => order.relation left right /\ left ≠ right

/--
The strict part unfolds to non-strict comparison plus inequality.

Logical form:

```lean
StrictPart order left right <->
  order.relation left right /\ left /= right
```
-/
theorem StrictPartIff
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier)
    (left right : Carrier) :
    StrictPart order left right <->
      order.relation left right /\ left ≠ right :=
  Iff.rfl

/--
The strict part of a non-strict partial order agrees with the
preorder-compatible strict part because antisymmetry is available.

Logical form:

```lean
StrictPart order left right <->
  order.relation left right /\ Not (order.relation right left)
```
-/
theorem StrictPartIffNotConverse
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier)
    (left right : Carrier) :
    StrictPart order left right <->
      order.relation left right /\ Not (order.relation right left) := by
  constructor
  · intro strictPart
    refine And.intro strictPart.1 ?notConverse
    intro rightBelowLeft
    exact strictPart.2
      (NonStrictRelationIsAntisymmetric order left right
        strictPart.1 rightBelowLeft)
  · intro strictPartByNotConverse
    refine And.intro strictPartByNotConverse.1 ?leftNeRight
    intro leftEqualsRight
    apply strictPartByNotConverse.2
    rw [leftEqualsRight]
    exact NonStrictRelationIsReflexive order right

/--
The strict part of a non-strict partial order is a strict partial order.

Logical form:

```lean
StrictPartialOrder Carrier
```
-/
def StrictPartAsStrictPartialOrder
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    StrictPartialOrder Carrier where
  relation := StrictPart order
  isStrictPartialOrder := by
    refine And.intro ?irreflexive ?transitive
    · intro element elementStrictlyBelowItself
      exact elementStrictlyBelowItself.2 rfl
    · intro first second third firstBelowSecond secondBelowThird
      refine And.intro ?firstBelowThird ?firstNeThird
      · exact NonStrictRelationIsTransitive order first second third
          firstBelowSecond.1 secondBelowThird.1
      · intro firstEqualsThird
        have secondEqualsThird :
            second = third :=
          NonStrictRelationIsAntisymmetric order second third
            secondBelowThird.1
            (by
              rw [← firstEqualsThird]
              exact firstBelowSecond.1)
        exact secondBelowThird.2 secondEqualsThird

/--
The reflexive closure of a strict partial order.

Logical form:

```lean
fun left right => order.relation left right \/ left = right
```
-/
def ReflexiveClosure
    {Carrier : Type u}
    (order : StrictPartialOrder Carrier) :
    Relation Carrier :=
  fun left right => order.relation left right \/ left = right

/--
The reflexive closure unfolds to strict comparison or equality.

Logical form:

```lean
ReflexiveClosure order left right <->
  order.relation left right \/ left = right
```
-/
theorem ReflexiveClosureIff
    {Carrier : Type u}
    (order : StrictPartialOrder Carrier)
    (left right : Carrier) :
    ReflexiveClosure order left right <->
      order.relation left right \/ left = right :=
  Iff.rfl

/--
The reflexive closure of a strict partial order is a non-strict partial order.

Logical form:

```lean
NonStrictPartialOrder Carrier
```
-/
def ReflexiveClosureAsNonStrictPartialOrder
    {Carrier : Type u}
    (order : StrictPartialOrder Carrier) :
    NonStrictPartialOrder Carrier where
  relation := ReflexiveClosure order
  isPartialOrder := by
    refine And.intro ?reflexive (And.intro ?antisymmetric ?transitive)
    · intro element
      exact Or.inr rfl
    · intro left right leftBelowRight rightBelowLeft
      cases leftBelowRight with
      | inl leftLessRight =>
          cases rightBelowLeft with
          | inl rightLessLeft =>
              exact False.elim
                (StrictRelationIsAsymmetric order left right
                  leftLessRight rightLessLeft)
          | inr rightEqualsLeft =>
              exact Eq.symm rightEqualsLeft
      | inr leftEqualsRight =>
          exact leftEqualsRight
    · intro first second third firstBelowSecond secondBelowThird
      cases firstBelowSecond with
      | inl firstLessSecond =>
          cases secondBelowThird with
          | inl secondLessThird =>
              exact Or.inl
                (StrictRelationIsTransitive order first second third
                  firstLessSecond secondLessThird)
          | inr secondEqualsThird =>
              rw [← secondEqualsThird]
              exact Or.inl firstLessSecond
      | inr firstEqualsSecond =>
          rw [firstEqualsSecond]
          exact secondBelowThird

/--
Taking reflexive closure and then strict part returns the original strict
partial order relation.

Logical form:

```lean
StrictPart (ReflexiveClosureAsNonStrictPartialOrder order) left right <->
  order.relation left right
```
-/
theorem StrictPartOfReflexiveClosureIff
    {Carrier : Type u}
    (order : StrictPartialOrder Carrier)
    (left right : Carrier) :
    StrictPart (ReflexiveClosureAsNonStrictPartialOrder order) left right <->
      order.relation left right := by
  constructor
  · intro strictPartOfClosure
    cases strictPartOfClosure.1 with
    | inl leftLessRight =>
        exact leftLessRight
    | inr leftEqualsRight =>
        exact False.elim (strictPartOfClosure.2 leftEqualsRight)
  · intro leftLessRight
    refine And.intro ?leftBelowRight ?leftNeRight
    · exact Or.inl leftLessRight
    · intro leftEqualsRight
      rw [leftEqualsRight] at leftLessRight
      exact StrictRelationIsIrreflexive order right leftLessRight

/--
Taking strict part and then reflexive closure returns the original non-strict
partial order relation.

Logical form:

```lean
ReflexiveClosure (StrictPartAsStrictPartialOrder order) left right <->
  order.relation left right
```
-/
theorem ReflexiveClosureOfStrictPartIff
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier)
    (left right : Carrier) :
    ReflexiveClosure (StrictPartAsStrictPartialOrder order) left right <->
      order.relation left right := by
  constructor
  · intro closureOfStrictPart
    cases closureOfStrictPart with
    | inl strictPart =>
        exact strictPart.1
    | inr leftEqualsRight =>
        rw [leftEqualsRight]
        exact NonStrictRelationIsReflexive order right
  · intro leftBelowRight
    classical
    by_cases leftEqualsRight : left = right
    · exact Or.inr leftEqualsRight
    · exact Or.inl (And.intro leftBelowRight leftEqualsRight)

/--
The dual of a non-strict partial order reverses the comparison relation.

Logical form:

```lean
fun left right => order.relation right left
```
-/
def Dual
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    NonStrictPartialOrder Carrier where
  relation := fun left right => order.relation right left
  isPartialOrder := by
    refine And.intro ?reflexive (And.intro ?antisymmetric ?transitive)
    · intro element
      exact NonStrictRelationIsReflexive order element
    · intro left right rightBelowLeft leftBelowRight
      exact NonStrictRelationIsAntisymmetric order left right
        leftBelowRight rightBelowLeft
    · intro first second third secondBelowFirst thirdBelowSecond
      exact NonStrictRelationIsTransitive order third second first
        thirdBelowSecond secondBelowFirst

end LRA.VolumeI.Order.OrderedSets.PartialOrder
