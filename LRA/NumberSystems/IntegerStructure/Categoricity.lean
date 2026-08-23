-- LRA/NumberSystems/IntegerStructure/Categoricity.lean
-- Uniqueness of integer structures up to isomorphism.

import LRA.NumberSystems.IntegerStructure.Definition

namespace LRA.NumberSystems.IntegerStructure

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
**[Theorem - Uniqueness of Fully Adequate Integer Structures up to Isomorphism]**

Any two integer structures equipped with full two-sided predicate induction are
isomorphic: there is a bijection between their carriers that fixes zero and
commutes with both successor and predecessor. The canonical witness sends
`0 ↦ 0`, `Sⁿ 0 ↦ Sⁿ 0`, and `Pⁿ 0 ↦ Pⁿ 0` on the other structure -- the
forward/backward rays generated from the base -- exactly as
`UniquenessOfPeanoSystemsUpToIsomorphism` does for the one-sided case, per
`PeanoSystem.Categoricity`.

Mathematical statement (Lean): `theorem UniquenessOfIntegerStructuresUpToIsomorphism`.

Logical form:

```lean
theorem UniquenessOfIntegerStructuresUpToIsomorphism
    {SecondElement : Type u} {SecondSetObject : Type v}
    [Membership SecondElement SecondSetObject]
    (first : IntegerStructure Element SetObject)
    (firstFullInduction : FullTwoSidedPredicateInduction first)
    (second : IntegerStructure SecondElement SecondSetObject) :
    FullTwoSidedPredicateInduction second ->
    exists forward : Element -> SecondElement,
      exists backward : SecondElement -> Element,
        forward first.zero = second.zero /\
        backward second.zero = first.zero /\
        (forall element : Element,
          forward (first.successor element) =
            second.successor (forward element)) /\
        (forall element : Element,
          forward (first.predecessor element) =
            second.predecessor (forward element)) /\
        (forall element : SecondElement,
          backward (second.successor element) =
            first.successor (backward element)) /\
        (forall element : SecondElement,
          backward (second.predecessor element) =
            first.predecessor (backward element)) /\
        (forall element : Element, backward (forward element) = element) /\
        (forall element : SecondElement, forward (backward element) = element)
```
-/
theorem UniquenessOfIntegerStructuresUpToIsomorphism
    {SecondElement : Type u} {SecondSetObject : Type v}
    [Membership SecondElement SecondSetObject]
    (first : IntegerStructure Element SetObject)
    (firstFullInduction : FullTwoSidedPredicateInduction first)
    (second : IntegerStructure SecondElement SecondSetObject) :
    FullTwoSidedPredicateInduction second ->
    exists forward : Element -> SecondElement,
      exists backward : SecondElement -> Element,
        forward first.zero = second.zero /\
        backward second.zero = first.zero /\
        (forall element : Element,
          forward (first.successor element) =
            second.successor (forward element)) /\
        (forall element : Element,
          forward (first.predecessor element) =
            second.predecessor (forward element)) /\
        (forall element : SecondElement,
          backward (second.successor element) =
            first.successor (backward element)) /\
        (forall element : SecondElement,
          backward (second.predecessor element) =
            first.predecessor (backward element)) /\
        (forall element : Element, backward (forward element) = element) /\
        (forall element : SecondElement, forward (backward element) = element) := by
  intro secondFullInduction
  let _ := firstFullInduction
  let _ := secondFullInduction
  sorry

end LRA.NumberSystems.IntegerStructure
