import LRA.VolumeI.Map.Operation.Laws.Identity.Definition

namespace LRA.Map.Operation.Laws.Identity

open LRA.Map.Operation

universe u

/--
**[Theorem — LeftIdentity]**

Apply a left-identity law to an element.

Logical form:

```lean
theorem LeftIdentity.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (law : LeftIdentity operation identity)
    (element : Carrier) :
    operation identity element = element
```
-/
theorem LeftIdentity.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (law : LeftIdentity operation identity)
    (element : Carrier) :
    operation identity element = element := by
  sorry
/--
**[Theorem — RightIdentity]**

Apply a right-identity law to an element.

Logical form:

```lean
theorem RightIdentity.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (law : RightIdentity operation identity)
    (element : Carrier) :
    operation element identity = element
```
-/
theorem RightIdentity.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (law : RightIdentity operation identity)
    (element : Carrier) :
    operation element identity = element := by
  sorry
/--
**[Theorem — TwoSidedIdentity]**

A two-sided identity supplies a left identity.

Logical form:

```lean
theorem TwoSidedIdentity.left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (law : TwoSidedIdentity operation identity) :
    LeftIdentity operation identity
```
-/
theorem TwoSidedIdentity.left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (law : TwoSidedIdentity operation identity) :
    LeftIdentity operation identity := by
  sorry
/--
**[Theorem — TwoSidedIdentity]**

A two-sided identity supplies a right identity.

Logical form:

```lean
theorem TwoSidedIdentity.right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (law : TwoSidedIdentity operation identity) :
    RightIdentity operation identity
```
-/
theorem TwoSidedIdentity.right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (law : TwoSidedIdentity operation identity) :
    RightIdentity operation identity := by
  sorry
/--
**[Theorem — TwoSidedIdentity]**

Left and right identity laws assemble into a two-sided identity law.

Logical form:

```lean
theorem TwoSidedIdentity.of_left_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (leftLaw : LeftIdentity operation identity)
    (rightLaw : RightIdentity operation identity) :
    TwoSidedIdentity operation identity
```
-/
theorem TwoSidedIdentity.of_left_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (leftLaw : LeftIdentity operation identity)
    (rightLaw : RightIdentity operation identity) :
    TwoSidedIdentity operation identity := by
  sorry
end LRA.Map.Operation.Laws.Identity
