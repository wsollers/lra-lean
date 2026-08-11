import LRA.VolumeI.Set.Enderton.Axioms.Axioms
import LRA.VolumeI.Set.Enderton.Definitions
import LRA.VolumeI.Set.Enderton.Theorems.Pairing

/-!
The Axiom of Foundation restated with a named predicate, plus its classic
immediate corollary.

Foundation does not assert existence of a new named set the way Pairing or
Union do; it asserts a property every nonempty set has. So this file has no
`TheFoundationWitness` chosen operation and no uniqueness theorem — Foundation
witnesses are not claimed to be unique, only to exist.
-/

namespace LRA.VolumeI.Set.Enderton

/-- Every nonempty set has a Foundation witness: a member disjoint from it.
This is the Axiom of Foundation restated using the named `IsFoundationWitness`
predicate.

Logical form:

```lean
theorem FoundationWitnessExists
    (A : Set) (nonempty : ∃ w : Set, w ∈ A) :
    ∃ x : Set, IsFoundationWitness A x
```
-/
theorem FoundationWitnessExists
    (A : Set) (nonempty : ∃ w : Set, w ∈ A) :
    ∃ x : Set, IsFoundationWitness A x := by
  sorry

/-- No set is a member of itself.

Classic corollary: apply Foundation to the singleton `{A}` (via `PairSet A A`,
per `TheSingleton`); its only possible Foundation witness is `A` itself, which
forces `A ∉ A`.

Logical form:

```lean
theorem NoSetIsMemberOfItself (A : Set) :
    A ∉ A
```
-/
theorem NoSetIsMemberOfItself (A : Set) :
    A ∉ A := by
  sorry

end LRA.VolumeI.Set.Enderton
