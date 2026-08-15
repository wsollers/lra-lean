import LRA.VolumeI.Identity.Model.Theory
import LRA.VolumeI.Identity.Theorems.Core

namespace LRA.Identity

universe u v

/-!
Native-interface card for equality.

Lean's native equality is the implementation backend for the axiomatic
equality chapter. The declarations here keep that backend small and explicit:
the logical relation is identity on a type, and functions or relations respect
it automatically by substitution.
-/

/--
Native equality on a carrier, exposed as a binary relation.

Logical form:

```lean
def NativeEquality (Carrier : Type u) : Carrier -> Carrier -> Prop :=
  EqualityDiagonal Carrier
```
-/
def NativeEquality (Carrier : Type u) : Carrier -> Carrier -> Prop :=
  EqualityDiagonal Carrier

/--
Native equality is the canonical diagonal relation.

Logical form:

```lean
theorem NativeEqualityIsDiagonal (Carrier : Type u) :
    ∀ left right, NativeEquality Carrier left right ↔ left = right
```
-/
theorem NativeEqualityIsDiagonal (Carrier : Type u) :
    ∀ left right, NativeEquality Carrier left right ↔ left = right := by
  intro left right
  rfl

/--
Unary function congruence for native equality.

Logical form:

```lean
theorem FunctionCongruence {Domain : Type u} {Codomain : Type v}
    {left right : Domain}
    (ObjectsAreEqual : left = right)
    (function : Domain -> Codomain) :
    function left = function right
```
-/
theorem FunctionCongruence {Domain : Type u} {Codomain : Type v}
    {left right : Domain}
    (ObjectsAreEqual : left = right)
    (function : Domain -> Codomain) :
    function left = function right :=
  SubstitutionPreservesFunctions ObjectsAreEqual function

/--
Binary function congruence, the common algebraic operation case.

Logical form:

```lean
theorem BinaryFunctionCongruence {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left' right'
```
-/
theorem BinaryFunctionCongruence {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left' right' :=
  SubstitutionPreservesOperations LeftsAreEqual RightsAreEqual operation

/--
Unary relation congruence for native equality.

Logical form:

```lean
theorem RelationCongruence {Carrier : Type u}
    {left right : Carrier}
    (ObjectsAreEqual : left = right)
    (relation : Carrier -> Prop) :
    relation left ↔ relation right
```
-/
theorem RelationCongruence {Carrier : Type u}
    {left right : Carrier}
    (ObjectsAreEqual : left = right)
    (relation : Carrier -> Prop) :
    relation left ↔ relation right :=
  SubstitutionPreservesPredicates ObjectsAreEqual relation

/--
Binary relation congruence in both coordinates.

Logical form:

```lean
theorem BinaryRelationCongruence {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right')
    (relation : Carrier -> Carrier -> Prop) :
    relation left right ↔ relation left' right'
```
-/
theorem BinaryRelationCongruence {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right')
    (relation : Carrier -> Carrier -> Prop) :
    relation left right ↔ relation left' right' :=
  SubstitutionPreservesRelations LeftsAreEqual RightsAreEqual relation

end LRA.Identity
