import LRA.Pilot.OrderBounds

/-!
# The supremum (least upper bound)

The supremum of a subset of a poset is its least upper bound: an upper bound
that lies below every other upper bound.  This module carries the canonical
definition, moved here from the general bounds vocabulary so that the supremum
concept family — negations, failure modes, total-order specializations,
examples, and counterexamples — lives in one extractable slice.

The definition is stated over an arbitrary poset with no side conditions.  In
particular it does **not** require the subset to be nonempty: nonemptiness is
an applicability hypothesis for existence theorems, never part of the concept.
The empty-set consequences are recorded explicitly in
`LRA.Pilot.Supremum.SupremumTheorems`.
-/

namespace LRA.Pilot.OrderBounds

open LRA.VolumeI.Order

universe u v

/--
`LeastUpperBound poset subset candidate` means that `candidate` is an
upper bound of `subset` below every other upper bound.

Logical form:

```lean
UpperBound poset subset candidate ∧
  ∀ otherCandidate : poset.Carrier,
    UpperBound poset subset otherCandidate →
    poset.NonStrictOrder candidate otherCandidate
```
-/
@[lraCanonical "order.least-upper-bound"] def LeastUpperBound
    (poset : Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (candidate : poset.Carrier) : Prop :=
  UpperBound poset subset candidate ∧
    ∀ otherCandidate : poset.Carrier,
      UpperBound poset subset otherCandidate →
      poset.NonStrictOrder candidate otherCandidate

/--
`Supremum poset subset candidate` is the standard analysis surface form for
`LeastUpperBound poset subset candidate`.  The definitional content lives on
`LeastUpperBound`; this alias exists so both names elaborate to the same
concept.

Logical form:

```lean
LeastUpperBound poset subset candidate
```
-/
abbrev Supremum
    (poset : Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (candidate : poset.Carrier) : Prop :=
  LeastUpperBound poset subset candidate

/--
`LUB poset subset candidate` is the abbreviated surface form for
`LeastUpperBound poset subset candidate`, matching the common textbook
shorthand.  The definitional content lives on `LeastUpperBound`.

Logical form:

```lean
LeastUpperBound poset subset candidate
```
-/
abbrev LUB
    (poset : Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (candidate : poset.Carrier) : Prop :=
  LeastUpperBound poset subset candidate

namespace FromPartialOrder

/-- A least upper bound using the partial order inferred for the carrier.

Logical form:

```lean
OrderBounds.LeastUpperBound (PosetFromPartialOrder carrier) subset candidate
```
-/
def LeastUpperBound
    {carrier : Type u}
    [partialOrder : _root_.PartialOrder carrier]
    {SetObject : Type v}
    [Membership carrier SetObject]
    (subset : SetObject)
    (candidate : carrier) : Prop :=
  OrderBounds.LeastUpperBound (PosetFromPartialOrder carrier) subset candidate

end FromPartialOrder

end LRA.Pilot.OrderBounds
