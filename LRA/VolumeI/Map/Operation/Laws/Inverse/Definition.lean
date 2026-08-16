import LRA.VolumeI.Map.Operation.Definition

namespace LRA.Map.Operation.Laws.Inverse

open LRA.Map.Operation

universe u

/--
**[Definition — LeftInverse]**

Left-inverse law for a unary endo-operation relative to a binary
endo-operation and identity element.

Logical form:

```lean
def LeftInverse {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier)
    (inverse : UnaryEndoOperation Carrier) : Prop
```
-/
def LeftInverse {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier)
    (inverse : UnaryEndoOperation Carrier) : Prop :=
  forall element, operation (inverse element) element = identity

/--
**[Definition — RightInverse]**

Right-inverse law for a unary endo-operation relative to a binary
endo-operation and identity element.

Logical form:

```lean
def RightInverse {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier)
    (inverse : UnaryEndoOperation Carrier) : Prop
```
-/
def RightInverse {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier)
    (inverse : UnaryEndoOperation Carrier) : Prop :=
  forall element, operation element (inverse element) = identity

/--
**[Definition — LeftInverseOf]**

An element has a specified left inverse relative to an operation and identity.
-/
def LeftInverseOf {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity element inverse : Carrier) : Prop :=
  operation inverse element = identity

/--
**[Definition — RightInverseOf]**

An element has a specified right inverse relative to an operation and identity.
-/
def RightInverseOf {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity element inverse : Carrier) : Prop :=
  operation element inverse = identity

/--
**[Definition — TwoSidedInverseOf]**

An element has a specified two-sided inverse relative to an operation and
identity.
-/
def TwoSidedInverseOf {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity element inverse : Carrier) : Prop :=
  LeftInverseOf operation identity element inverse /\
    RightInverseOf operation identity element inverse

/--
**[Definition — LeftInvertibleOn]**

Every eligible element has some left inverse.
-/
def LeftInvertibleOn {Carrier : Type u}
    (eligible : Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier) : Prop :=
  forall element, eligible element ->
    exists inverse, LeftInverseOf operation identity element inverse

/--
**[Definition — RightInvertibleOn]**

Every eligible element has some right inverse.
-/
def RightInvertibleOn {Carrier : Type u}
    (eligible : Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier) : Prop :=
  forall element, eligible element ->
    exists inverse, RightInverseOf operation identity element inverse

/--
**[Definition — TwoSidedInvertibleOn]**

Every eligible element has some two-sided inverse.
-/
def TwoSidedInvertibleOn {Carrier : Type u}
    (eligible : Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier) : Prop :=
  forall element, eligible element ->
    exists inverse, TwoSidedInverseOf operation identity element inverse

/--
**[Definition — TwoSidedInverse]**

Two-sided inverse law for a unary endo-operation relative to a binary
endo-operation and identity element.

Logical form:

```lean
def TwoSidedInverse {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier)
    (inverse : UnaryEndoOperation Carrier) : Prop
```
-/
def TwoSidedInverse {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier)
    (inverse : UnaryEndoOperation Carrier) : Prop :=
  LeftInverse operation identity inverse /\
    RightInverse operation identity inverse

end LRA.Map.Operation.Laws.Inverse
