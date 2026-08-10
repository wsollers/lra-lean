import LRA.VolumeI.Identity.Axioms.Axioms
import LRA.VolumeI.Set.Axioms.Axioms

/-!
The textbook biconditional form of set extensionality.
-/

namespace LRA.VolumeI.Set

/-- Two sets are equal if and only if they have the same members.

The forward direction is identity substitution. The reverse direction is the
Axiom of Extensionality.

Logical form:

```lean
A = B ↔ ∀ x : Set, x ∈ A ↔ x ∈ B
```
-/
theorem SetEqualityIffSameMembers (A B : Set) :
    A = B ↔ ∀ x : Set, x ∈ A ↔ x ∈ B := by
  constructor
  · intro SetsAreEqual
    intro x
    exact LRA.VolumeI.Identity.LeibnizLaw SetsAreEqual
      (fun Candidate : Set => x ∈ Candidate)
  · intro SameMembers
    exact Extensionality A B SameMembers

end LRA.VolumeI.Set
