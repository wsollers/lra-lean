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

  (∀ A ∈ U ∀ x ∈ Element), MinimalElement (StrictPart relation) A x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : Element → Element → Prop}, (∀ (x y : Element), relation x y → relation y x → x = y) → ∀ {subset : SetObject} {least : Element}, (inst.1 subset least ∧ ∀ (element : Element), inst.1 subset element → relation least element) → (inst.1 subset least ∧ ∀ (element : Element), inst.1 subset element → (relation element least ∧ element = least → False) → False)

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

  (∀ A ∈ U ∀ x y ∈ Element), y = x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : Element → Element → Prop}, (∀ (x y : Element), relation x y → relation y x → x = y) → ∀ {subset : SetObject} {least minimal : Element}, ((inst.1 subset least ∧ ∀ (element : Element), inst.1 subset element → relation least element) ∧ (inst.1 subset minimal ∧ ∀ (element : Element), inst.1 subset element → (relation element minimal ∧ element = minimal → False) → False)) → minimal = least

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

  (∀ A ∈ U ∀ x ∈ Element), LeastElement(x, A)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : Element → Element → Prop}, ((∀ (x : Element), relation x x ∧ (∀ (x y : Element), relation x y → relation y x → x = y ∧ ∀ (x y z : Element), relation x y → relation y z → relation x z)) ∧ ∀ (x y : Element), Or (relation x y) (relation y x)) → ∀ {subset : SetObject} {minimal : Element}, (inst.1 subset minimal ∧ ∀ (element : Element), inst.1 subset element → (relation element minimal ∧ element = minimal → False) → False) → (inst.1 subset minimal ∧ ∀ (element : Element), inst.1 subset element → relation minimal element)

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

  (∀ A ∈ U ∀ x ∈ Element), Infimum relation A x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : Element → Element → Prop} {subset : SetObject} {least : Element}, (inst.1 subset least ∧ ∀ (element : Element), inst.1 subset element → relation least element) → (∀ (element : Element), inst.1 subset element → relation least element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound least)

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

  (∀ A ∈ U ∀ x ∈ Element), LeastElement(x, A) ↔ Infimum relation A x ∧ x ∈ A

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : Element → Element → Prop}, (∀ (x : Element), relation x x) → ∀ {subset : SetObject} {candidate : Element}, (inst.1 subset candidate ∧ ∀ (element : Element), inst.1 subset element → relation candidate element) ↔ ((∀ (element : Element), inst.1 subset element → relation candidate element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound candidate) ∧ inst.1 subset candidate)

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
