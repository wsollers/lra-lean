import Mathlib.Order.Bounds.Basic
import LRA.Order.Bounds
import LRA.Order.OrderedSets.Poset.Definition

namespace LRA.Interop.Mathlib.Order

open LRA.Order

universe u

/--
`PosetFromPartialOrder` TODO

Predicate logic:

  def PosetFromPartialOrder
    (carrier : Type u) [partialOrder : _root_.PartialOrder carrier] : Poset where
  Carrier := carrier
  NonStrictOrder := fun left right => left ≤ right
  NonStrictOrderIsPartialOrder := by
    refine ⟨?_, ?_, ?_⟩
    · intro element
      exact le_refl element
    · intro left right leftLeRight rightLeLeft
      exact le_antisymm leftLeRight rightLeLeft
    · intro first second third firstLeSecond secondLeThird
      exact le_trans firstLeSecond secondLeThird

Predicate logic (unfolded):

  def PosetFromPartialOrder
    (carrier : Type u) [partialOrder : _root_.PartialOrder carrier] : Poset where
  Carrier := carrier
  NonStrictOrder := fun left right => left ≤ right
  NonStrictOrderIsPartialOrder := by
    refine ⟨?_, ?_, ?_⟩
    · intro element
      exact le_refl element
    · intro left right leftLeRight rightLeLeft
      exact le_antisymm leftLeRight rightLeLeft
    · intro first second third firstLeSecond secondLeThird
      exact le_trans firstLeSecond secondLeThird (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PosetFromPartialOrder
    (carrier : Type u) [partialOrder : _root_.PartialOrder carrier] : Poset where
  Carrier := carrier
  NonStrictOrder := fun left right => left ≤ right
  NonStrictOrderIsPartialOrder := by
    refine ⟨?_, ?_, ?_⟩
    · intro element
      exact le_refl element
    · intro left right leftLeRight rightLeLeft
      exact le_antisymm leftLeRight rightLeLeft
    · intro first second third firstLeSecond secondLeThird
      exact le_trans firstLeSecond secondLeThird
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
@[reducible] def PosetFromPartialOrder
    (carrier : Type u) [partialOrder : _root_.PartialOrder carrier] : Poset where
  Carrier := carrier
  NonStrictOrder := fun left right => left ≤ right
  NonStrictOrderIsPartialOrder := by
    refine ⟨?_, ?_, ?_⟩
    · intro element
      exact le_refl element
    · intro left right leftLeRight rightLeLeft
      exact le_antisymm leftLeRight rightLeLeft
    · intro first second third firstLeSecond secondLeThird
      exact le_trans firstLeSecond secondLeThird

/--
`PartialOrderFromPoset` TODO

Predicate logic:

  def PartialOrderFromPoset (poset : Poset) :
    _root_.PartialOrder poset.Carrier where
  le := poset.NonStrictOrder
  le_refl := poset.NonStrictOrderIsPartialOrder.1
  le_trans := poset.NonStrictOrderIsPartialOrder.2.2
  le_antisymm := poset.NonStrictOrderIsPartialOrder.2.1

Predicate logic (unfolded):

  def PartialOrderFromPoset (poset : Poset) :
    _root_.PartialOrder poset.Carrier where
  le := poset.NonStrictOrder
  le_refl := poset.NonStrictOrderIsPartialOrder.1
  le_trans := poset.NonStrictOrderIsPartialOrder.2.2
  le_antisymm := poset.NonStrictOrderIsPartialOrder.2.1 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PartialOrderFromPoset (poset : Poset) :
    _root_.PartialOrder poset.Carrier where
  le := poset.NonStrictOrder
  le_refl := poset.NonStrictOrderIsPartialOrder.1
  le_trans := poset.NonStrictOrderIsPartialOrder.2.2
  le_antisymm := poset.NonStrictOrderIsPartialOrder.2.1
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
@[reducible] def PartialOrderFromPoset (poset : Poset) :
    _root_.PartialOrder poset.Carrier where
  le := poset.NonStrictOrder
  le_refl := poset.NonStrictOrderIsPartialOrder.1
  le_trans := poset.NonStrictOrderIsPartialOrder.2.2
  le_antisymm := poset.NonStrictOrderIsPartialOrder.2.1

/--
`upperBound_iff_mem_upperBounds` TODO

Predicate logic:

  (∀ candidate ∈ Alpha), UpperBound fun left right ∈ Alpha => left ≤ right subset candidate ↔ candidate ∈ upperBounds subset

Predicate logic (unfolded):

  ∀ {Alpha : Type u} [inst : LE Alpha] (subset : Alpha → Prop) (candidate : Alpha), ∀ (element : Alpha), Set.instMembership.1 subset element → (fun left right => inst.1 left right) element candidate ↔ Set.instMembership.1 (fun x => ∀ ⦃a : Alpha⦄, Set.instMembership.1 subset a → inst.1 a x) candidate

Logical form (Lean):

```lean
theorem upperBound_iff_mem_upperBounds
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) (candidate : Alpha) :
    UpperBound (fun left right : Alpha => left ≤ right) subset candidate ↔
      candidate ∈ upperBounds subset
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
theorem upperBound_iff_mem_upperBounds
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) (candidate : Alpha) :
    UpperBound (fun left right : Alpha => left ≤ right) subset candidate ↔
      candidate ∈ upperBounds subset := by
  sorry
/--
`lowerBound_iff_mem_lowerBounds` TODO

Predicate logic:

  (∀ candidate ∈ Alpha), LowerBound fun left right ∈ Alpha => left ≤ right subset candidate ↔ candidate ∈ lowerBounds subset

Predicate logic (unfolded):

  ∀ {Alpha : Type u} [inst : LE Alpha] (subset : Alpha → Prop) (candidate : Alpha), ∀ (element : Alpha), Set.instMembership.1 subset element → (fun left right => inst.1 left right) candidate element ↔ Set.instMembership.1 (fun x => ∀ ⦃a : Alpha⦄, Set.instMembership.1 subset a → inst.1 x a) candidate

Logical form (Lean):

```lean
theorem lowerBound_iff_mem_lowerBounds
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) (candidate : Alpha) :
    LowerBound (fun left right : Alpha => left ≤ right) subset candidate ↔
      candidate ∈ lowerBounds subset
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
theorem lowerBound_iff_mem_lowerBounds
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) (candidate : Alpha) :
    LowerBound (fun left right : Alpha => left ≤ right) subset candidate ↔
      candidate ∈ lowerBounds subset := by
  sorry
/--
`leastElement_iff_isLeast` TODO

Predicate logic:

  (∀ candidate ∈ Alpha), LeastElement fun left right ∈ Alpha => left ≤ right subset candidate ↔ IsLeast subset candidate

Predicate logic (unfolded):

  ∀ {Alpha : Type u} [inst : LE Alpha] (subset : Alpha → Prop) (candidate : Alpha), (Set.instMembership.1 subset candidate ∧ ∀ (element : Alpha), Set.instMembership.1 subset element → (fun left right => inst.1 left right) candidate element) ↔ (Set.instMembership.1 subset candidate ∧ Set.instMembership.1 (fun x => ∀ ⦃a : Alpha⦄, Set.instMembership.1 subset a → inst.1 x a) candidate)

Logical form (Lean):

```lean
theorem leastElement_iff_isLeast
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) (candidate : Alpha) :
    LeastElement (fun left right : Alpha => left ≤ right) subset candidate ↔
      IsLeast subset candidate
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
theorem leastElement_iff_isLeast
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) (candidate : Alpha) :
    LeastElement (fun left right : Alpha => left ≤ right) subset candidate ↔
      IsLeast subset candidate := by
  sorry
/--
`greatestElement_iff_isGreatest` TODO

Predicate logic:

  (∀ candidate ∈ Alpha), GreatestElement fun left right ∈ Alpha => left ≤ right subset candidate ↔ IsGreatest subset candidate

Predicate logic (unfolded):

  ∀ {Alpha : Type u} [inst : LE Alpha] (subset : Alpha → Prop) (candidate : Alpha), (Set.instMembership.1 subset candidate ∧ ∀ (element : Alpha), Set.instMembership.1 subset element → (fun left right => inst.1 left right) element candidate) ↔ (Set.instMembership.1 subset candidate ∧ Set.instMembership.1 (fun x => ∀ ⦃a : Alpha⦄, Set.instMembership.1 subset a → inst.1 a x) candidate)

Logical form (Lean):

```lean
theorem greatestElement_iff_isGreatest
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) (candidate : Alpha) :
    GreatestElement (fun left right : Alpha => left ≤ right) subset candidate ↔
      IsGreatest subset candidate
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
theorem greatestElement_iff_isGreatest
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) (candidate : Alpha) :
    GreatestElement (fun left right : Alpha => left ≤ right) subset candidate ↔
      IsGreatest subset candidate := by
  sorry
/--
`supremum_iff_isLUB` TODO

Predicate logic:

  (∀ candidate ∈ Alpha), Supremum fun left right ∈ Alpha => left ≤ right subset candidate ↔ IsLUB subset candidate

Predicate logic (unfolded):

  ∀ {Alpha : Type u} [inst : LE Alpha] (subset : Alpha → Prop) (candidate : Alpha), (∀ (element : Alpha), Set.instMembership.1 subset element → (fun left right => inst.1 left right) element candidate ∧ ∀ (bound : Alpha), (∀ (element : Alpha), Set.instMembership.1 subset element → (fun left right => inst.1 left right) element bound) → (fun left right => inst.1 left right) candidate bound) ↔ (Set.instMembership.1 (fun x => ∀ ⦃a : Alpha⦄, Set.instMembership.1 subset a → inst.1 a x) candidate ∧ Set.instMembership.1 (fun x => ∀ ⦃a : Alpha⦄, Set.instMembership.1 (upperBounds subset) a → inst.1 x a) candidate)

Logical form (Lean):

```lean
theorem supremum_iff_isLUB
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) (candidate : Alpha) :
    Supremum (fun left right : Alpha => left ≤ right) subset candidate ↔
      IsLUB subset candidate
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
theorem supremum_iff_isLUB
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) (candidate : Alpha) :
    Supremum (fun left right : Alpha => left ≤ right) subset candidate ↔
      IsLUB subset candidate := by
  sorry
/--
`infimum_iff_isGLB` TODO

Predicate logic:

  (∀ candidate ∈ Alpha), Infimum fun left right ∈ Alpha => left ≤ right subset candidate ↔ IsGLB subset candidate

Predicate logic (unfolded):

  ∀ {Alpha : Type u} [inst : LE Alpha] (subset : Alpha → Prop) (candidate : Alpha), (∀ (element : Alpha), Set.instMembership.1 subset element → (fun left right => inst.1 left right) candidate element ∧ ∀ (bound : Alpha), (∀ (element : Alpha), Set.instMembership.1 subset element → (fun left right => inst.1 left right) bound element) → (fun left right => inst.1 left right) bound candidate) ↔ (Set.instMembership.1 (fun x => ∀ ⦃a : Alpha⦄, Set.instMembership.1 subset a → inst.1 x a) candidate ∧ Set.instMembership.1 (fun x => ∀ ⦃a : Alpha⦄, Set.instMembership.1 (lowerBounds subset) a → inst.1 a x) candidate)

Logical form (Lean):

```lean
theorem infimum_iff_isGLB
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) (candidate : Alpha) :
    Infimum (fun left right : Alpha => left ≤ right) subset candidate ↔
      IsGLB subset candidate
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
theorem infimum_iff_isGLB
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) (candidate : Alpha) :
    Infimum (fun left right : Alpha => left ≤ right) subset candidate ↔
      IsGLB subset candidate := by
  sorry
/--
`boundedAbove_iff_bddAbove` TODO

Predicate logic:

  BoundedAbove fun left right ∈ Alpha => left ≤ right subset ↔ BddAbove subset

Predicate logic (unfolded):

  ∀ {Alpha : Type u} [inst : LE Alpha] (subset : Alpha → Prop), Exists fun bound => ∀ (element : Alpha), Set.instMembership.1 subset element → (fun left right => inst.1 left right) element bound ↔ Exists fun x => Set.instMembership.1 (fun x => ∀ ⦃a : Alpha⦄, Set.instMembership.1 subset a → inst.1 a x) x

Logical form (Lean):

```lean
theorem boundedAbove_iff_bddAbove
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) :
    BoundedAbove (fun left right : Alpha => left ≤ right) subset ↔
      BddAbove subset
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
theorem boundedAbove_iff_bddAbove
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) :
    BoundedAbove (fun left right : Alpha => left ≤ right) subset ↔
      BddAbove subset := by
  sorry
/--
`boundedBelow_iff_bddBelow` TODO

Predicate logic:

  BoundedBelow fun left right ∈ Alpha => left ≤ right subset ↔ BddBelow subset

Predicate logic (unfolded):

  ∀ {Alpha : Type u} [inst : LE Alpha] (subset : Alpha → Prop), Exists fun bound => ∀ (element : Alpha), Set.instMembership.1 subset element → (fun left right => inst.1 left right) bound element ↔ Exists fun x => Set.instMembership.1 (fun x => ∀ ⦃a : Alpha⦄, Set.instMembership.1 subset a → inst.1 x a) x

Logical form (Lean):

```lean
theorem boundedBelow_iff_bddBelow
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) :
    BoundedBelow (fun left right : Alpha => left ≤ right) subset ↔
      BddBelow subset
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
theorem boundedBelow_iff_bddBelow
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) :
    BoundedBelow (fun left right : Alpha => left ≤ right) subset ↔
      BddBelow subset := by
  sorry
end LRA.Interop.Mathlib.Order
