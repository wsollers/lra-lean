import LRA.VolumeI.Map.Operation.Laws.Absorbing.Definition

namespace LRA.Map.Operation.Laws.Absorbing

open LRA.Map.Operation

universe u

/--
**[Theorem — LeftAbsorbing]**

Apply a left-absorbing law to an element.

Logical form:

```lean
theorem LeftAbsorbing.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (law : LeftAbsorbing operation absorber)
    (element : Carrier) :
    operation absorber element = absorber
```
-/
theorem LeftAbsorbing.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (law : LeftAbsorbing operation absorber)
    (element : Carrier) :
    operation absorber element = absorber := by
  sorry
/--
**[Theorem — RightAbsorbing]**

Apply a right-absorbing law to an element.

Logical form:

```lean
theorem RightAbsorbing.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (law : RightAbsorbing operation absorber)
    (element : Carrier) :
    operation element absorber = absorber
```
-/
theorem RightAbsorbing.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (law : RightAbsorbing operation absorber)
    (element : Carrier) :
    operation element absorber = absorber := by
  sorry
/--
**[Theorem — TwoSidedAbsorbing]**

A two-sided absorbing law supplies a left absorbing law.

Logical form:

```lean
theorem TwoSidedAbsorbing.left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (law : TwoSidedAbsorbing operation absorber) :
    LeftAbsorbing operation absorber
```
-/
theorem TwoSidedAbsorbing.left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (law : TwoSidedAbsorbing operation absorber) :
    LeftAbsorbing operation absorber := by
  sorry
/--
**[Theorem — TwoSidedAbsorbing]**

A two-sided absorbing law supplies a right absorbing law.

Logical form:

```lean
theorem TwoSidedAbsorbing.right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (law : TwoSidedAbsorbing operation absorber) :
    RightAbsorbing operation absorber
```
-/
theorem TwoSidedAbsorbing.right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (law : TwoSidedAbsorbing operation absorber) :
    RightAbsorbing operation absorber := by
  sorry
/--
**[Theorem — TwoSidedAbsorbing]**

Left and right absorbing laws assemble into a two-sided absorbing law.

Logical form:

```lean
theorem TwoSidedAbsorbing.of_left_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (leftLaw : LeftAbsorbing operation absorber)
    (rightLaw : RightAbsorbing operation absorber) :
    TwoSidedAbsorbing operation absorber
```
-/
theorem TwoSidedAbsorbing.of_left_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (leftLaw : LeftAbsorbing operation absorber)
    (rightLaw : RightAbsorbing operation absorber) :
    TwoSidedAbsorbing operation absorber := by
  sorry
end LRA.Map.Operation.Laws.Absorbing
