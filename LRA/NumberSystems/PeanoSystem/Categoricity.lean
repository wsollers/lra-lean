import LRA.NumberSystems.PeanoSystem.Definition

namespace LRA.NumberSystems.PeanoSystem

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
**[Theorem - Uniqueness of Peano Systems up to Isomorphism]**

Any two Peano systems are isomorphic: there is a bijection between their
carriers that fixes the distinguished element and commutes with successor.

This is the uniqueness-up-to-isomorphism theorem §1.6.3 needs, proved here
for the Peano case specifically, per §1.6.10 -- `NumberSystems/Theory/` cites
this rather than re-deriving it, and `NaturalNumbersZeroBased`/`OneBased`'s
`Realization.lean` files read as "our construction is a model of this
system's axioms, shifted or unshifted as the base requires."

Mathematical statement (Lean): `theorem UniquenessOfPeanoSystemsUpToIsomorphism`.

Logical form:

```lean
theorem UniquenessOfPeanoSystemsUpToIsomorphism
    {SecondElement : Type u} {SecondSetObject : Type v}
    [Membership SecondElement SecondSetObject]
    (first : PeanoSystem Element SetObject)
    (second : PeanoSystem SecondElement SecondSetObject) :
    exists forward : Element -> SecondElement,
      exists backward : SecondElement -> Element,
        forward first.one = second.one /\
        backward second.one = first.one /\
        (forall element : Element,
          forward (first.successor element) =
            second.successor (forward element)) /\
        (forall element : SecondElement,
          backward (second.successor element) =
            first.successor (backward element)) /\
        (forall element : Element, backward (forward element) = element) /\
        (forall element : SecondElement, forward (backward element) = element)
```
-/
theorem UniquenessOfPeanoSystemsUpToIsomorphism
    {SecondElement : Type u} {SecondSetObject : Type v}
    [Membership SecondElement SecondSetObject]
    (first : PeanoSystem Element SetObject)
    (second : PeanoSystem SecondElement SecondSetObject) :
    exists forward : Element -> SecondElement,
      exists backward : SecondElement -> Element,
        forward first.one = second.one /\
        backward second.one = first.one /\
        (forall element : Element,
          forward (first.successor element) =
            second.successor (forward element)) /\
        (forall element : SecondElement,
          backward (second.successor element) =
            first.successor (backward element)) /\
        (forall element : Element, backward (forward element) = element) /\
        (forall element : SecondElement, forward (backward element) = element) := by
  sorry

end LRA.NumberSystems.PeanoSystem
