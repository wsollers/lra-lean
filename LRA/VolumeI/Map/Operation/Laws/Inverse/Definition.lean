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
