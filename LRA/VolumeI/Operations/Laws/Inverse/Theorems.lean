import LRA.VolumeI.Operations.Laws.Inverse.Definition

namespace LRA.Operation.Laws.Inverse

open LRA.Operation

universe u

/--
**[Theorem — LeftInverse]**

Apply a left-inverse law to an element.

Logical form:

```lean
theorem LeftInverse.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : LeftInverse operation identity inverse)
    (element : Carrier) :
    operation (inverse element) element = identity
```
-/
theorem LeftInverse.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : LeftInverse operation identity inverse)
    (element : Carrier) :
    operation (inverse element) element = identity := by
  sorry
/--
**[Theorem — RightInverse]**

Apply a right-inverse law to an element.

Logical form:

```lean
theorem RightInverse.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : RightInverse operation identity inverse)
    (element : Carrier) :
    operation element (inverse element) = identity
```
-/
theorem RightInverse.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : RightInverse operation identity inverse)
    (element : Carrier) :
    operation element (inverse element) = identity := by
  sorry

/-- Apply a left-inverse-of law. -/
theorem LeftInverseOf.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element inverse : Carrier}
    (law : LeftInverseOf operation identity element inverse) :
    operation inverse element = identity := by
  sorry

/-- Apply a right-inverse-of law. -/
theorem RightInverseOf.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element inverse : Carrier}
    (law : RightInverseOf operation identity element inverse) :
    operation element inverse = identity := by
  sorry

/-- A two-sided inverse-of law supplies a left inverse-of law. -/
theorem TwoSidedInverseOf.left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element inverse : Carrier}
    (law : TwoSidedInverseOf operation identity element inverse) :
    LeftInverseOf operation identity element inverse := by
  sorry

/-- A two-sided inverse-of law supplies a right inverse-of law. -/
theorem TwoSidedInverseOf.right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element inverse : Carrier}
    (law : TwoSidedInverseOf operation identity element inverse) :
    RightInverseOf operation identity element inverse := by
  sorry

/-- Left and right inverse-of laws assemble into a two-sided inverse-of law. -/
theorem TwoSidedInverseOf.of_left_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element inverse : Carrier}
    (leftLaw : LeftInverseOf operation identity element inverse)
    (rightLaw : RightInverseOf operation identity element inverse) :
    TwoSidedInverseOf operation identity element inverse := by
  sorry

/-- Apply a restricted left-invertibility law. -/
theorem LeftInvertibleOn.apply {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    {identity element : Carrier}
    (law : LeftInvertibleOn eligible operation identity)
    (eligible_element : eligible element) :
    exists inverse, LeftInverseOf operation identity element inverse := by
  sorry

/-- Apply a restricted right-invertibility law. -/
theorem RightInvertibleOn.apply {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    {identity element : Carrier}
    (law : RightInvertibleOn eligible operation identity)
    (eligible_element : eligible element) :
    exists inverse, RightInverseOf operation identity element inverse := by
  sorry

/-- Apply a restricted two-sided invertibility law. -/
theorem TwoSidedInvertibleOn.apply {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    {identity element : Carrier}
    (law : TwoSidedInvertibleOn eligible operation identity)
    (eligible_element : eligible element) :
    exists inverse, TwoSidedInverseOf operation identity element inverse := by
  sorry
/--
**[Theorem — TwoSidedInverse]**

A two-sided inverse law supplies a left inverse law.

Logical form:

```lean
theorem TwoSidedInverse.left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : TwoSidedInverse operation identity inverse) :
    LeftInverse operation identity inverse
```
-/
theorem TwoSidedInverse.left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : TwoSidedInverse operation identity inverse) :
    LeftInverse operation identity inverse := by
  sorry
/--
**[Theorem — TwoSidedInverse]**

A two-sided inverse law supplies a right inverse law.

Logical form:

```lean
theorem TwoSidedInverse.right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : TwoSidedInverse operation identity inverse) :
    RightInverse operation identity inverse
```
-/
theorem TwoSidedInverse.right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : TwoSidedInverse operation identity inverse) :
    RightInverse operation identity inverse := by
  sorry
/--
**[Theorem — TwoSidedInverse]**

Left and right inverse laws assemble into a two-sided inverse law.

Logical form:

```lean
theorem TwoSidedInverse.of_left_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (leftLaw : LeftInverse operation identity inverse)
    (rightLaw : RightInverse operation identity inverse) :
    TwoSidedInverse operation identity inverse
```
-/
theorem TwoSidedInverse.of_left_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (leftLaw : LeftInverse operation identity inverse)
    (rightLaw : RightInverse operation identity inverse) :
    TwoSidedInverse operation identity inverse := by
  sorry
end LRA.Operation.Laws.Inverse
