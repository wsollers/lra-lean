import LRA.Order.Bounds.Infimum.Definition
import LRA.Order.Bounds.LeastElement.Definition
import LRA.Order.Bounds.MinimalElement.Definition
import LRA.Order.Relation.StrictPart.Definition
import LRA.Order.OrderedSets.LinearOrder.Definition
import LRA.Relation.Interface.Laws.Definition

namespace LRA.Order

universe u v

/--
`LeastElementIsMinimal` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : LRA.Relation.Endorelation Element}, LRA.Relation.Antisymmetric relation → ∀ {subset : SetObject} {least : Element}, LRA.Order.LeastElement relation subset least → LRA.Order.MinimalElement (LRA.Order.StrictPart relation) subset least

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    relationIsAntisymmetric : LRA.Relation.Antisymmetric relation
    subset : SetObject
    least : Element
    leastIsLeast : LeastElement relation subset least
  Prove
    (∀ (x y : Element), relation x y → relation y x → x = y) → ∀ {subset : SetObject} {least : Element}, (inst.1 subset least ∧ (∀ (element : Element), inst.1 subset element → relation least element)) → (inst.1 subset least ∧ (∀ (element : Element), inst.1 subset element → (relation element least ∧ (element = least → False)) → False))

Logical form (Lean):

```lean
theorem LeastElementIsMinimal
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {least : Element}
    (leastIsLeast : LeastElement relation subset least) :
    MinimalElement (StrictPart relation) subset least
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
theorem LeastElementIsMinimal
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {least : Element}
    (leastIsLeast : LeastElement relation subset least) :
    MinimalElement (StrictPart relation) subset least := by
  sorry
/--
`LeastElementIsUniqueMinimalElement` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : LRA.Relation.Endorelation Element}, LRA.Relation.Antisymmetric relation → ∀ {subset : SetObject} {least minimal : Element}, (LRA.Order.LeastElement relation subset least ∧ LRA.Order.MinimalElement (LRA.Order.StrictPart relation) subset minimal) → minimal = least

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    relationIsAntisymmetric : LRA.Relation.Antisymmetric relation
    subset : SetObject
    least minimal : Element
    leastIsLeast : LeastElement relation subset least
    minimalIsMinimal : MinimalElement (StrictPart relation) subset minimal
  Prove
    (∀ (x y : Element), relation x y → relation y x → x = y) → ∀ {subset : SetObject} {least minimal : Element}, ((inst.1 subset least ∧ (∀ (element : Element), inst.1 subset element → relation least element)) ∧ (inst.1 subset minimal ∧ (∀ (element : Element), inst.1 subset element → (relation element minimal ∧ (element = minimal → False)) → False))) → minimal = least

Logical form (Lean):

```lean
theorem LeastElementIsUniqueMinimalElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {least minimal : Element}
    (leastIsLeast : LeastElement relation subset least)
    (minimalIsMinimal : MinimalElement (StrictPart relation) subset minimal) :
    minimal = least
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
theorem LeastElementIsUniqueMinimalElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {least minimal : Element}
    (leastIsLeast : LeastElement relation subset least)
    (minimalIsMinimal : MinimalElement (StrictPart relation) subset minimal) :
    minimal = least := by
  sorry
/--
`MinimalElementIsLeastInLinearOrder` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : LRA.Relation.Endorelation Element}, LRA.Order.LinearOrder relation → ∀ {subset : SetObject} {minimal : Element}, LRA.Order.MinimalElement (LRA.Order.StrictPart relation) subset minimal → LRA.Order.LeastElement relation subset minimal

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    relationIsLinearOrder : LinearOrder relation
    subset : SetObject
    minimal : Element
    minimalIsMinimal : MinimalElement (StrictPart relation) subset minimal
  Prove
    (((∀ (x : Element), relation x x) ∧ ((∀ (x y : Element), relation x y → relation y x → x = y) ∧ (∀ (x y z : Element), relation x y → relation y z → relation x z))) ∧ (∀ (x y : Element), Or (relation x y) (relation y x))) → ∀ {subset : SetObject} {minimal : Element}, (inst.1 subset minimal ∧ (∀ (element : Element), inst.1 subset element → (relation element minimal ∧ (element = minimal → False)) → False)) → (inst.1 subset minimal ∧ (∀ (element : Element), inst.1 subset element → relation minimal element))

Logical form (Lean):

```lean
theorem MinimalElementIsLeastInLinearOrder
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsLinearOrder : LinearOrder relation)
    {subset : SetObject} {minimal : Element}
    (minimalIsMinimal : MinimalElement (StrictPart relation) subset minimal) :
    LeastElement relation subset minimal
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
theorem MinimalElementIsLeastInLinearOrder
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsLinearOrder : LinearOrder relation)
    {subset : SetObject} {minimal : Element}
    (minimalIsMinimal : MinimalElement (StrictPart relation) subset minimal) :
    LeastElement relation subset minimal := by
  sorry
/--
`LeastElementIsInfimum` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : LRA.Relation.Endorelation Element} {subset : SetObject} {least : Element}, LRA.Order.LeastElement relation subset least → LRA.Order.Infimum relation subset least

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    subset : SetObject
    least : Element
    leastIsLeast : LeastElement relation subset least
  Prove
    (inst.1 subset least ∧ (∀ (element : Element), inst.1 subset element → relation least element)) → ((∀ (element : Element), inst.1 subset element → relation least element) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound least))

Logical form (Lean):

```lean
theorem LeastElementIsInfimum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {least : Element}
    (leastIsLeast : LeastElement relation subset least) :
    Infimum relation subset least
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
theorem LeastElementIsInfimum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {least : Element}
    (leastIsLeast : LeastElement relation subset least) :
    Infimum relation subset least := by
  sorry
/--
`LeastElementIffInfimumAndMembership` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : LRA.Relation.Endorelation Element}, LRA.Relation.Reflexive relation → ∀ {subset : SetObject} {candidate : Element}, LRA.Order.LeastElement relation subset candidate ↔ (LRA.Order.Infimum relation subset candidate ∧ candidate ∈ subset)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    relationIsReflexive : LRA.Relation.Reflexive relation
    subset : SetObject
    candidate : Element
  Prove
    LRA.Relation.Reflexive relation → ∀ {subset : SetObject} {candidate : Element}, LRA.Order.LeastElement relation subset candidate ↔ (LRA.Order.Infimum relation subset candidate ∧ candidate ∈ subset)

Logical form (Lean):

```lean
theorem LeastElementIffInfimumAndMembership
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    {subset : SetObject} {candidate : Element} :
    LeastElement relation subset candidate ↔
      Infimum relation subset candidate /\ candidate ∈ subset
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
theorem LeastElementIffInfimumAndMembership
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    {subset : SetObject} {candidate : Element} :
    LeastElement relation subset candidate ↔
      Infimum relation subset candidate /\ candidate ∈ subset := by
  sorry
end LRA.Order
