import LRA.Order.Bounds.GreatestElement.Relationships
import LRA.Order.Bounds.LeastElement.Relationships
import LRA.Order.Bounds.MaximalElement.Definition
import LRA.Order.Bounds.MinimalElement.Definition
import LRA.Order.Lattices.CompleteLattice.Definition
import LRA.Order.Lattices.Lattice.Definition
import LRA.Order.OrderedSets.PartialOrder.Definition
import LRA.Order.OrderedSets.WellOrder.Definition
import LRA.Order.Relation.StrictPart.Definition
import LRA.Set.Interop.Mathlib.PredicateSet
import Mathlib.Data.Finite.Defs
import Mathlib.Data.Set.Finite.Basic

namespace LRA.Order

universe u v

/--
`NonemptyFiniteSubsetHasMaximalElement` TODO

Predicate logic:

  (∀ subsetIsFinite ∈ subset.Finite), (exists element, element ∈ subset) → exists maximal, MaximalElement (StrictPart relation) subset maximal

Predicate logic (unfolded):

  ∀ {Element : Type u} {relation : Element → Element → Prop}, (∀ (x : Element), relation x x ∧ (∀ (x y : Element), relation x y → relation y x → x = y ∧ ∀ (x y z : Element), relation x y → relation y z → relation x z)) → ∀ (subset : Element → Prop), (Finite (Subtype fun x => Set.instMembership.1 subset x) ∧ Exists fun element => Set.instMembership.1 subset element) → Exists fun maximal => (Set.instMembership.1 subset maximal ∧ ∀ (element : Element), Set.instMembership.1 subset element → (relation maximal element ∧ maximal = element → False) → False)

Logical form (Lean):

```lean
theorem NonemptyFiniteSubsetHasMaximalElement
    {Element : Type u}
    {relation : LRA.Relation.Endorelation Element}
    (relationIsPartialOrder : PartialOrder relation)
    (subset : Set Element)
    (subsetIsFinite : subset.Finite)
    (subsetIsNonempty : exists element, element ∈ subset) :
    exists maximal, MaximalElement (StrictPart relation) subset maximal
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem NonemptyFiniteSubsetHasMaximalElement
    {Element : Type u}
    {relation : LRA.Relation.Endorelation Element}
    (relationIsPartialOrder : PartialOrder relation)
    (subset : Set Element)
    (subsetIsFinite : subset.Finite)
    (subsetIsNonempty : exists element, element ∈ subset) :
    exists maximal, MaximalElement (StrictPart relation) subset maximal := by
  sorry

/--
`NonemptyFiniteSubsetHasGreatestElement` TODO

Predicate logic:

  (∀ subsetIsFinite ∈ subset.Finite), (exists element, element ∈ subset) → exists greatest, GreatestElement(greatest, subset)

Predicate logic (unfolded):

  ∀ {Element : Type u} {relation : Element → Element → Prop}, ((∀ (x : Element), relation x x ∧ (∀ (x y : Element), relation x y → relation y x → x = y ∧ ∀ (x y z : Element), relation x y → relation y z → relation x z)) ∧ ∀ (x y : Element), Or (relation x y) (relation y x)) → ∀ (subset : Element → Prop), (Finite (Subtype fun x => Set.instMembership.1 subset x) ∧ Exists fun element => Set.instMembership.1 subset element) → Exists fun greatest => (Set.instMembership.1 subset greatest ∧ ∀ (element : Element), Set.instMembership.1 subset element → relation element greatest)

Logical form (Lean):

```lean
theorem NonemptyFiniteSubsetHasGreatestElement
    {Element : Type u}
    {relation : LRA.Relation.Endorelation Element}
    (relationIsLinearOrder : LinearOrder relation)
    (subset : Set Element)
    (subsetIsFinite : subset.Finite)
    (subsetIsNonempty : exists element, element ∈ subset) :
    exists greatest, GreatestElement relation subset greatest
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem NonemptyFiniteSubsetHasGreatestElement
    {Element : Type u}
    {relation : LRA.Relation.Endorelation Element}
    (relationIsLinearOrder : LinearOrder relation)
    (subset : Set Element)
    (subsetIsFinite : subset.Finite)
    (subsetIsNonempty : exists element, element ∈ subset) :
    exists greatest, GreatestElement relation subset greatest := by
  sorry

/--
`NonemptyFiniteSubsetHasMinimalElement` TODO

Predicate logic:

  (∀ subsetIsFinite ∈ subset.Finite), (exists element, element ∈ subset) → exists minimal, MinimalElement (StrictPart relation) subset minimal

Predicate logic (unfolded):

  ∀ {Element : Type u} {relation : Element → Element → Prop}, (∀ (x : Element), relation x x ∧ (∀ (x y : Element), relation x y → relation y x → x = y ∧ ∀ (x y z : Element), relation x y → relation y z → relation x z)) → ∀ (subset : Element → Prop), (Finite (Subtype fun x => Set.instMembership.1 subset x) ∧ Exists fun element => Set.instMembership.1 subset element) → Exists fun minimal => (Set.instMembership.1 subset minimal ∧ ∀ (element : Element), Set.instMembership.1 subset element → (relation element minimal ∧ element = minimal → False) → False)

Logical form (Lean):

```lean
theorem NonemptyFiniteSubsetHasMinimalElement
    {Element : Type u}
    {relation : LRA.Relation.Endorelation Element}
    (relationIsPartialOrder : PartialOrder relation)
    (subset : Set Element)
    (subsetIsFinite : subset.Finite)
    (subsetIsNonempty : exists element, element ∈ subset) :
    exists minimal, MinimalElement (StrictPart relation) subset minimal
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem NonemptyFiniteSubsetHasMinimalElement
    {Element : Type u}
    {relation : LRA.Relation.Endorelation Element}
    (relationIsPartialOrder : PartialOrder relation)
    (subset : Set Element)
    (subsetIsFinite : subset.Finite)
    (subsetIsNonempty : exists element, element ∈ subset) :
    exists minimal, MinimalElement (StrictPart relation) subset minimal := by
  sorry

/--
`NonemptyFiniteSubsetHasLeastElement` TODO

Predicate logic:

  (∀ subsetIsFinite ∈ subset.Finite), (exists element, element ∈ subset) → exists least, LeastElement(least, subset)

Predicate logic (unfolded):

  ∀ {Element : Type u} {relation : Element → Element → Prop}, ((∀ (x : Element), relation x x ∧ (∀ (x y : Element), relation x y → relation y x → x = y ∧ ∀ (x y z : Element), relation x y → relation y z → relation x z)) ∧ ∀ (x y : Element), Or (relation x y) (relation y x)) → ∀ (subset : Element → Prop), (Finite (Subtype fun x => Set.instMembership.1 subset x) ∧ Exists fun element => Set.instMembership.1 subset element) → Exists fun least => (Set.instMembership.1 subset least ∧ ∀ (element : Element), Set.instMembership.1 subset element → relation least element)

Logical form (Lean):

```lean
theorem NonemptyFiniteSubsetHasLeastElement
    {Element : Type u}
    {relation : LRA.Relation.Endorelation Element}
    (relationIsLinearOrder : LinearOrder relation)
    (subset : Set Element)
    (subsetIsFinite : subset.Finite)
    (subsetIsNonempty : exists element, element ∈ subset) :
    exists least, LeastElement relation subset least
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem NonemptyFiniteSubsetHasLeastElement
    {Element : Type u}
    {relation : LRA.Relation.Endorelation Element}
    (relationIsLinearOrder : LinearOrder relation)
    (subset : Set Element)
    (subsetIsFinite : subset.Finite)
    (subsetIsNonempty : exists element, element ∈ subset) :
    exists least, LeastElement relation subset least := by
  sorry

/--
`FiniteLatticeIsComplete` TODO

Predicate logic:

  CompleteLattice (Set Alpha) relation

Predicate logic (unfolded):

  ∀ {Alpha : Type u}, (Finite Alpha ∧ Nonempty Alpha) → ∀ {relation : Alpha → Alpha → Prop}, ((∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) ∧ ∀ (left right : Alpha), (Exists fun join => (relation left join ∧ (relation right join ∧ ∀ (upper : Alpha), relation left upper → relation right upper → relation join upper)) ∧ Exists fun meet => (relation meet left ∧ (relation meet right ∧ ∀ (lower : Alpha), relation lower left → relation lower right → relation lower meet)))) → ((∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) ∧ ∀ (subset : Alpha → Prop), (Exists fun supremum => (∀ (element : Alpha), Set.instMembership.1 subset element → relation element supremum ∧ ∀ (bound : Alpha), (∀ (element : Alpha), Set.instMembership.1 subset element → relation element bound) → relation supremum bound) ∧ Exists fun infimum => (∀ (element : Alpha), Set.instMembership.1 subset element → relation infimum element ∧ ∀ (bound : Alpha), (∀ (element : Alpha), Set.instMembership.1 subset element → relation bound element) → relation bound infimum)))

Logical form (Lean):

```lean
theorem FiniteLatticeIsComplete
    {Alpha : Type u} [Finite Alpha] [Nonempty Alpha]
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsLattice : Lattice relation) :
    CompleteLattice (Set Alpha) relation
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
theorem FiniteLatticeIsComplete
    {Alpha : Type u} [Finite Alpha] [Nonempty Alpha]
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsLattice : Lattice relation) :
    CompleteLattice (Set Alpha) relation := by
  sorry

/--
`FiniteLinearOrderIsWellOrder` TODO

Predicate logic:

  WellOrder (Set Alpha) relation

Predicate logic (unfolded):

  ∀ {Alpha : Type u}, Finite Alpha → ∀ {relation : Alpha → Alpha → Prop}, ((∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) ∧ ∀ (x y : Alpha), Or (relation x y) (relation y x)) → (((∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) ∧ ∀ (x y : Alpha), Or (relation x y) (relation y x)) ∧ ∀ (subset : Alpha → Prop), (Exists fun element => Set.instMembership.1 subset element) → Exists fun least => (Set.instMembership.1 subset least ∧ ∀ (element : Alpha), Set.instMembership.1 subset element → relation least element))

Logical form (Lean):

```lean
theorem FiniteLinearOrderIsWellOrder
    {Alpha : Type u} [Finite Alpha]
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsLinearOrder : LinearOrder relation) :
    WellOrder (Set Alpha) relation
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
theorem FiniteLinearOrderIsWellOrder
    {Alpha : Type u} [Finite Alpha]
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsLinearOrder : LinearOrder relation) :
    WellOrder (Set Alpha) relation := by
  sorry

end LRA.Order
