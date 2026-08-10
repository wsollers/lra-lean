import LRA.VolumeI.Set.Primitives

/-!
Predicates used by the native textbook set theory layer.
-/

namespace LRA.VolumeI.Set

/--
`ExistsAndUnique property` means that some set satisfies `property`, and every
other set satisfying `property` is equal to that witness.

Logical form:

```lean
∃ witness : Set,
  property witness ∧
  ∀ other : Set, property other → other = witness
```
-/
def ExistsAndUnique (property : Set -> Prop) : Prop :=
  ∃ witness : Set,
    property witness ∧
    ∀ other : Set, property other -> other = witness

/--
A set is empty exactly when it has no members.

Logical form:

```lean
∀ x : Set, x ∉ A
```
-/
def IsEmptySet (A : Set) : Prop :=
  ∀ x : Set, x ∉ A

/--
A set is the pair set of `x1` and `x2` exactly when those are its only members.

Logical form:

```lean
∀ w : Set, w ∈ P ↔ w = x1 ∨ w = x2
```
-/
def IsPairSet (x1 x2 P : Set) : Prop :=
  ∀ w : Set, w ∈ P ↔ w = x1 ∨ w = x2

end LRA.VolumeI.Set
