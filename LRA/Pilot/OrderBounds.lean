import LRA.Pilot.Metadata
import LRA.VolumeI.Order.OrderStructures.Poset

/-!
# The Rigorous Definition

Let $(P, \le)$ be a partially ordered set, and let $S$ be a subset of $P$
($S \subseteq P$). An element $u \in P$ is called an **upper bound** of $S$
if and only if:

$$\forall x \in S, \quad x \le u$$

## Key Structural Remarks

**Ambient Set Requirement:** An upper bound $u$ must belong to the
universe/ambient set $P$, but it **does not** need to belong to the subset $S$
itself.

*Example:* If $P = \mathbb{R}$ and $S = (0, 1)$, then $1 \in \mathbb{R}$ is
an upper bound of $S$, even though $1 \notin S$.

**Existence:** A subset $S$ may have:

**Infinitely many upper bounds:** If $u$ is an upper bound for
$S \subseteq \mathbb{R}$, any $v > u$ is also an upper bound.

**No upper bounds at all:** The subset
$S = \{x \in \mathbb{R} : x > 0\}$ has no upper bound in $\mathbb{R}$.
In this case, $S$ is said to be *unbounded above*.

**Vacuous Truth:** The empty set $\emptyset \subseteq P$ is bounded above by
**every** element $u \in P$, because the condition
$\forall x \in \emptyset, x \le u$ holds vacuously.

## Related Concepts

**Bounded Above:** A set $S \subseteq P$ is said to be **bounded above** if
there exists at least one element $u \in P$ that is an upper bound for $S$:

$$\exists u \in P \quad \text{such that} \quad
  \forall x \in S, \; x \le u$$

**Maximum (Greatest Element):** An element $m \in S$ is the **maximum** of
$S$ if $m$ is an upper bound of $S$ **and** $m \in S$:

$$m \in S \quad \land \quad \forall x \in S, \; x \le m$$

**Least Upper Bound (Supremum):** An element $L \in P$ is the **supremum** of
$S$ (written $L = \sup S$) if:

1. $L$ is an upper bound of $S$ ($\forall x \in S, x \le L$).
2. $L$ is less than or equal to every other upper bound of $S$:

$$\forall u \in P, \quad
  (\forall x \in S, x \le u) \implies L \le u$$
-/

namespace LRA.Pilot.OrderBounds

open LRA.VolumeI.Order

universe u v

/--
`PosetFromPartialOrder carrier` packages Lean's inferred partial order on
`carrier` as an explicit LRA poset.

Logical form:

```lean
Poset where
  Carrier := carrier
  NonStrictOrder := (· ≤ ·)
  NonStrictOrderIsPartialOrder := ⟨le_refl, le_antisymm, le_trans⟩
```
-/
@[reducible] def PosetFromPartialOrder
    (carrier : Type u)
    [partialOrder : _root_.PartialOrder carrier] : Poset where
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
`PartialOrderFromPoset poset` exposes an explicit LRA poset as a Lean partial
order on its carrier. Install it locally with `letI` when typeclass-driven
Mathlib declarations should use `poset.NonStrictOrder` as `≤`.

Logical form:

```lean
_root_.PartialOrder poset.Carrier where
  le := poset.NonStrictOrder
  le_refl := poset.NonStrictOrderIsPartialOrder.1
  le_antisymm := poset.NonStrictOrderIsPartialOrder.2.1
  le_trans := poset.NonStrictOrderIsPartialOrder.2.2
```
-/
@[reducible] def PartialOrderFromPoset (poset : Poset) :
    _root_.PartialOrder poset.Carrier where
  le := poset.NonStrictOrder
  le_refl := poset.NonStrictOrderIsPartialOrder.1
  le_trans := poset.NonStrictOrderIsPartialOrder.2.2
  le_antisymm := poset.NonStrictOrderIsPartialOrder.2.1

/--
`UpperBound poset subset candidate` means that every member of `subset`
is related to `candidate` by the partial order carried by `poset`.

Logical form:

```lean
∀ element : poset.Carrier,
  element ∈ subset → poset.NonStrictOrder element candidate
```
-/
@[lraCanonical "order.upper-bound"] def UpperBound
    (poset : Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (candidate : poset.Carrier) : Prop :=
  ∀ element : poset.Carrier,
    element ∈ subset → poset.NonStrictOrder element candidate

/--
`LowerBound poset subset candidate` means that `candidate` is related to
every member of `subset` by the partial order carried by `poset`.

Logical form:

```lean
∀ element : poset.Carrier,
  element ∈ subset → poset.NonStrictOrder candidate element
```
-/
@[lraCanonical "order.lower-bound"] def LowerBound
    (poset : Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (candidate : poset.Carrier) : Prop :=
  ∀ element : poset.Carrier,
    element ∈ subset → poset.NonStrictOrder candidate element

/--
`BoundedAbove poset subset` means that some candidate in the carrier of
`poset` is an upper bound of `subset`.

Logical form:

```lean
∃ candidate : poset.Carrier,
  UpperBound poset subset candidate
```
-/
@[lraCanonical "order.bounded-above"] def BoundedAbove
    (poset : Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject) : Prop :=
  ∃ candidate : poset.Carrier,
    UpperBound poset subset candidate

/--
`BoundedBelow poset subset` means that some candidate in the carrier of
`poset` is a lower bound of `subset`.

Logical form:

```lean
∃ candidate : poset.Carrier,
  LowerBound poset subset candidate
```
-/
@[lraCanonical "order.bounded-below"] def BoundedBelow
    (poset : Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject) : Prop :=
  ∃ candidate : poset.Carrier,
    LowerBound poset subset candidate

/--
`Bounded poset subset` means that `subset` is bounded both above and below
in `poset`.

Logical form:

```lean
BoundedAbove poset subset ∧ BoundedBelow poset subset
```
-/
@[lraCanonical "order.bounded"] def Bounded
    (poset : Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject) : Prop :=
  BoundedAbove poset subset ∧ BoundedBelow poset subset

/--
`MinimalElement poset subset candidate` means that `candidate` belongs to
`subset` and every member of `subset` below it is equal to it.

Logical form:

```lean
candidate ∈ subset ∧
  ∀ element : poset.Carrier,
    element ∈ subset →
    poset.NonStrictOrder element candidate →
    element = candidate
```
-/
@[lraCanonical "order.minimal-element"] def MinimalElement
    (poset : Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (candidate : poset.Carrier) : Prop :=
  candidate ∈ subset ∧
    ∀ element : poset.Carrier,
      element ∈ subset →
      poset.NonStrictOrder element candidate →
      element = candidate

/--
`MaximalElement poset subset candidate` means that `candidate` belongs to
`subset` and every member of `subset` above it is equal to it.

Logical form:

```lean
candidate ∈ subset ∧
  ∀ element : poset.Carrier,
    element ∈ subset →
    poset.NonStrictOrder candidate element →
    element = candidate
```
-/
@[lraCanonical "order.maximal-element"] def MaximalElement
    (poset : Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (candidate : poset.Carrier) : Prop :=
  candidate ∈ subset ∧
    ∀ element : poset.Carrier,
      element ∈ subset →
      poset.NonStrictOrder candidate element →
      element = candidate

/--
`LeastElement poset subset candidate` means that `candidate` belongs to
`subset` and is a lower bound of `subset`.

Logical form:

```lean
candidate ∈ subset ∧ LowerBound poset subset candidate
```
-/
@[lraCanonical "order.least-element"] def LeastElement
    (poset : Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (candidate : poset.Carrier) : Prop :=
  candidate ∈ subset ∧ LowerBound poset subset candidate

/--
`GreatestElement poset subset candidate` means that `candidate` belongs
to `subset` and is an upper bound of `subset`.

Logical form:

```lean
candidate ∈ subset ∧ UpperBound poset subset candidate
```
-/
@[lraCanonical "order.greatest-element"] def GreatestElement
    (poset : Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (candidate : poset.Carrier) : Prop :=
  candidate ∈ subset ∧ UpperBound poset subset candidate

/--
`GreatestLowerBound poset subset candidate` means that `candidate` is a
lower bound of `subset` above every other lower bound.

Logical form:

```lean
LowerBound poset subset candidate ∧
  ∀ otherCandidate : poset.Carrier,
    LowerBound poset subset otherCandidate →
    poset.NonStrictOrder otherCandidate candidate
```
-/
@[lraCanonical "order.greatest-lower-bound"] def GreatestLowerBound
    (poset : Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (candidate : poset.Carrier) : Prop :=
  LowerBound poset subset candidate ∧
    ∀ otherCandidate : poset.Carrier,
      LowerBound poset subset otherCandidate →
      poset.NonStrictOrder otherCandidate candidate

/-!
## Inferred partial-order interface

These definitions expose the same predicates to Lean types carrying Mathlib's
`PartialOrder` class. Standard carriers such as `Nat`, `Int`, `Rat`, and `Real`
already carry that instance, so Lean infers the ambient order and the wrapper
constructed by `PosetFromPartialOrder` is invisible at call sites.
-/

namespace FromPartialOrder

/-- An upper bound using the partial order inferred for the carrier.

Logical form:

```lean
OrderBounds.UpperBound (PosetFromPartialOrder carrier) subset candidate
```
-/
def UpperBound
    {carrier : Type u}
    [partialOrder : _root_.PartialOrder carrier]
    {SetObject : Type v}
    [Membership carrier SetObject]
    (subset : SetObject)
    (candidate : carrier) : Prop :=
  OrderBounds.UpperBound (PosetFromPartialOrder carrier) subset candidate

/-- A lower bound using the partial order inferred for the carrier.

Logical form:

```lean
OrderBounds.LowerBound (PosetFromPartialOrder carrier) subset candidate
```
-/
def LowerBound
    {carrier : Type u}
    [partialOrder : _root_.PartialOrder carrier]
    {SetObject : Type v}
    [Membership carrier SetObject]
    (subset : SetObject)
    (candidate : carrier) : Prop :=
  OrderBounds.LowerBound (PosetFromPartialOrder carrier) subset candidate

/-- Bounded above using the partial order inferred for the carrier.

Logical form:

```lean
OrderBounds.BoundedAbove (PosetFromPartialOrder carrier) subset
```
-/
def BoundedAbove
    {carrier : Type u}
    [partialOrder : _root_.PartialOrder carrier]
    {SetObject : Type v}
    [Membership carrier SetObject]
    (subset : SetObject) : Prop :=
  OrderBounds.BoundedAbove (PosetFromPartialOrder carrier) subset

/-- Bounded below using the partial order inferred for the carrier.

Logical form:

```lean
OrderBounds.BoundedBelow (PosetFromPartialOrder carrier) subset
```
-/
def BoundedBelow
    {carrier : Type u}
    [partialOrder : _root_.PartialOrder carrier]
    {SetObject : Type v}
    [Membership carrier SetObject]
    (subset : SetObject) : Prop :=
  OrderBounds.BoundedBelow (PosetFromPartialOrder carrier) subset

/-- Bounded above and below using the partial order inferred for the carrier.

Logical form:

```lean
OrderBounds.Bounded (PosetFromPartialOrder carrier) subset
```
-/
def Bounded
    {carrier : Type u}
    [partialOrder : _root_.PartialOrder carrier]
    {SetObject : Type v}
    [Membership carrier SetObject]
    (subset : SetObject) : Prop :=
  OrderBounds.Bounded (PosetFromPartialOrder carrier) subset

/-- A minimal element using the partial order inferred for the carrier.

Logical form:

```lean
OrderBounds.MinimalElement (PosetFromPartialOrder carrier) subset candidate
```
-/
def MinimalElement
    {carrier : Type u}
    [partialOrder : _root_.PartialOrder carrier]
    {SetObject : Type v}
    [Membership carrier SetObject]
    (subset : SetObject)
    (candidate : carrier) : Prop :=
  OrderBounds.MinimalElement (PosetFromPartialOrder carrier) subset candidate

/-- A maximal element using the partial order inferred for the carrier.

Logical form:

```lean
OrderBounds.MaximalElement (PosetFromPartialOrder carrier) subset candidate
```
-/
def MaximalElement
    {carrier : Type u}
    [partialOrder : _root_.PartialOrder carrier]
    {SetObject : Type v}
    [Membership carrier SetObject]
    (subset : SetObject)
    (candidate : carrier) : Prop :=
  OrderBounds.MaximalElement (PosetFromPartialOrder carrier) subset candidate

/-- A least element using the partial order inferred for the carrier.

Logical form:

```lean
OrderBounds.LeastElement (PosetFromPartialOrder carrier) subset candidate
```
-/
def LeastElement
    {carrier : Type u}
    [partialOrder : _root_.PartialOrder carrier]
    {SetObject : Type v}
    [Membership carrier SetObject]
    (subset : SetObject)
    (candidate : carrier) : Prop :=
  OrderBounds.LeastElement (PosetFromPartialOrder carrier) subset candidate

/-- A greatest element using the partial order inferred for the carrier.

Logical form:

```lean
OrderBounds.GreatestElement (PosetFromPartialOrder carrier) subset candidate
```
-/
def GreatestElement
    {carrier : Type u}
    [partialOrder : _root_.PartialOrder carrier]
    {SetObject : Type v}
    [Membership carrier SetObject]
    (subset : SetObject)
    (candidate : carrier) : Prop :=
  OrderBounds.GreatestElement (PosetFromPartialOrder carrier) subset candidate

/-- A greatest lower bound using the partial order inferred for the carrier.

Logical form:

```lean
OrderBounds.GreatestLowerBound (PosetFromPartialOrder carrier) subset candidate
```
-/
def GreatestLowerBound
    {carrier : Type u}
    [partialOrder : _root_.PartialOrder carrier]
    {SetObject : Type v}
    [Membership carrier SetObject]
    (subset : SetObject)
    (candidate : carrier) : Prop :=
  OrderBounds.GreatestLowerBound (PosetFromPartialOrder carrier) subset candidate

end FromPartialOrder

end LRA.Pilot.OrderBounds
