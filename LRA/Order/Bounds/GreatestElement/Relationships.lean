import LRA.Order.Bounds.GreatestElement.Definition
import LRA.Order.Bounds.MaximalElement.Definition
import LRA.Order.Bounds.Supremum.Definition
import LRA.Order.Relation.StrictPart.Definition
import LRA.Order.OrderedSets.LinearOrder.Definition
import LRA.Relation.Interface.Laws.Definition

namespace LRA.Order

universe u v

/--
`GreatestElementIsMaximal` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : LRA.Relation.Endorelation Element}, LRA.Relation.Antisymmetric relation → ∀ {subset : SetObject} {greatest : Element}, LRA.Order.GreatestElement relation subset greatest → LRA.Order.MaximalElement (LRA.Order.StrictPart relation) subset greatest

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    relationIsAntisymmetric : LRA.Relation.Antisymmetric relation
    subset : SetObject
    greatest : Element
    greatestIsGreatest : GreatestElement relation subset greatest
  Prove
    (∀ (x y : Element), relation x y → relation y x → x = y) → ∀ {subset : SetObject} {greatest : Element}, (inst.1 subset greatest ∧ (∀ (element : Element), inst.1 subset element → relation element greatest)) → (inst.1 subset greatest ∧ (∀ (element : Element), inst.1 subset element → (relation greatest element ∧ (greatest = element → False)) → False))

Logical form (Lean):

```lean
theorem GreatestElementIsMaximal
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {greatest : Element}
    (greatestIsGreatest : GreatestElement relation subset greatest) :
    MaximalElement (StrictPart relation) subset greatest
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
theorem GreatestElementIsMaximal
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {greatest : Element}
    (greatestIsGreatest : GreatestElement relation subset greatest) :
    MaximalElement (StrictPart relation) subset greatest := by
  sorry
/--
`GreatestElementIsUniqueMaximalElement` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : LRA.Relation.Endorelation Element}, LRA.Relation.Antisymmetric relation → ∀ {subset : SetObject} {greatest maximal : Element}, (LRA.Order.GreatestElement relation subset greatest ∧ LRA.Order.MaximalElement (LRA.Order.StrictPart relation) subset maximal) → maximal = greatest

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    relationIsAntisymmetric : LRA.Relation.Antisymmetric relation
    subset : SetObject
    greatest maximal : Element
    greatestIsGreatest : GreatestElement relation subset greatest
    maximalIsMaximal : MaximalElement (StrictPart relation) subset maximal
  Prove
    (∀ (x y : Element), relation x y → relation y x → x = y) → ∀ {subset : SetObject} {greatest maximal : Element}, ((inst.1 subset greatest ∧ (∀ (element : Element), inst.1 subset element → relation element greatest)) ∧ (inst.1 subset maximal ∧ (∀ (element : Element), inst.1 subset element → (relation maximal element ∧ (maximal = element → False)) → False))) → maximal = greatest

Logical form (Lean):

```lean
theorem GreatestElementIsUniqueMaximalElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {greatest maximal : Element}
    (greatestIsGreatest : GreatestElement relation subset greatest)
    (maximalIsMaximal : MaximalElement (StrictPart relation) subset maximal) :
    maximal = greatest
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
theorem GreatestElementIsUniqueMaximalElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {greatest maximal : Element}
    (greatestIsGreatest : GreatestElement relation subset greatest)
    (maximalIsMaximal : MaximalElement (StrictPart relation) subset maximal) :
    maximal = greatest := by
  sorry
/--
`MaximalElementIsGreatestInLinearOrder` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : LRA.Relation.Endorelation Element}, LRA.Order.LinearOrder relation → ∀ {subset : SetObject} {maximal : Element}, LRA.Order.MaximalElement (LRA.Order.StrictPart relation) subset maximal → LRA.Order.GreatestElement relation subset maximal

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    relationIsLinearOrder : LinearOrder relation
    subset : SetObject
    maximal : Element
    maximalIsMaximal : MaximalElement (StrictPart relation) subset maximal
  Prove
    (((∀ (x : Element), relation x x) ∧ ((∀ (x y : Element), relation x y → relation y x → x = y) ∧ (∀ (x y z : Element), relation x y → relation y z → relation x z))) ∧ (∀ (x y : Element), Or (relation x y) (relation y x))) → ∀ {subset : SetObject} {maximal : Element}, (inst.1 subset maximal ∧ (∀ (element : Element), inst.1 subset element → (relation maximal element ∧ (maximal = element → False)) → False)) → (inst.1 subset maximal ∧ (∀ (element : Element), inst.1 subset element → relation element maximal))

Logical form (Lean):

```lean
theorem MaximalElementIsGreatestInLinearOrder
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsLinearOrder : LinearOrder relation)
    {subset : SetObject} {maximal : Element}
    (maximalIsMaximal : MaximalElement (StrictPart relation) subset maximal) :
    GreatestElement relation subset maximal
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
theorem MaximalElementIsGreatestInLinearOrder
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsLinearOrder : LinearOrder relation)
    {subset : SetObject} {maximal : Element}
    (maximalIsMaximal : MaximalElement (StrictPart relation) subset maximal) :
    GreatestElement relation subset maximal := by
  sorry
/--
`GreatestElementIsSupremum` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : LRA.Relation.Endorelation Element} {subset : SetObject} {greatest : Element}, LRA.Order.GreatestElement relation subset greatest → LRA.Order.Supremum relation subset greatest

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    subset : SetObject
    greatest : Element
    greatestIsGreatest : GreatestElement relation subset greatest
  Prove
    (inst.1 subset greatest ∧ (∀ (element : Element), inst.1 subset element → relation element greatest)) → ((∀ (element : Element), inst.1 subset element → relation element greatest) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation greatest bound))

Logical form (Lean):

```lean
theorem GreatestElementIsSupremum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {greatest : Element}
    (greatestIsGreatest : GreatestElement relation subset greatest) :
    Supremum relation subset greatest
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
theorem GreatestElementIsSupremum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {greatest : Element}
    (greatestIsGreatest : GreatestElement relation subset greatest) :
    Supremum relation subset greatest := by
  sorry
/--
`GreatestElementIffSupremumAndMembership` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : LRA.Relation.Endorelation Element}, LRA.Relation.Reflexive relation → ∀ {subset : SetObject} {candidate : Element}, LRA.Order.GreatestElement relation subset candidate ↔ (LRA.Order.Supremum relation subset candidate ∧ candidate ∈ subset)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    relationIsReflexive : LRA.Relation.Reflexive relation
    subset : SetObject
    candidate : Element
  Prove
    LRA.Relation.Reflexive relation → ∀ {subset : SetObject} {candidate : Element}, LRA.Order.GreatestElement relation subset candidate ↔ (LRA.Order.Supremum relation subset candidate ∧ candidate ∈ subset)

Logical form (Lean):

```lean
theorem GreatestElementIffSupremumAndMembership
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    {subset : SetObject} {candidate : Element} :
    GreatestElement relation subset candidate ↔
      Supremum relation subset candidate /\ candidate ∈ subset
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases

-/
theorem GreatestElementIffSupremumAndMembership
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    {subset : SetObject} {candidate : Element} :
    GreatestElement relation subset candidate ↔
      Supremum relation subset candidate /\ candidate ∈ subset := by
  sorry
end LRA.Order
