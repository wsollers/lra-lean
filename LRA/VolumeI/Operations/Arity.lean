import LRA.VolumeI.Operations.Definition

namespace LRA.Operation

universe u

/--
An `n`-ary operation on a carrier.

Logical form:

```lean
abbrev NaryOperation (arity : Nat) (Alpha : Type u) :=
  (Fin arity -> Alpha) -> Alpha
```
-/
abbrev NaryOperation (arity : Nat) (Alpha : Type u) :=
  (Fin arity -> Alpha) -> Alpha

/--
A nullary operation presented as a zero-ary operation.

Logical form:

```lean
def NullaryAsNary {Alpha : Type u}
    (constant : NullaryOperation Alpha) : NaryOperation 0 Alpha :=
  fun _ => constant
```
-/
def NullaryAsNary {Alpha : Type u}
    (constant : NullaryOperation Alpha) : NaryOperation 0 Alpha :=
  fun _ => constant

/--
A unary operation presented as a one-ary operation.

Logical form:

```lean
def UnaryAsNary {Alpha : Type u}
    (operation : UnaryOperation Alpha) : NaryOperation 1 Alpha :=
  fun input => operation (input ⟨0, by decide⟩)
```
-/
def UnaryAsNary {Alpha : Type u}
    (operation : UnaryOperation Alpha) : NaryOperation 1 Alpha :=
  fun input => operation (input ⟨0, by decide⟩)

/--
A binary operation presented as a two-ary operation.

Logical form:

```lean
def BinaryAsNary {Alpha : Type u}
    (operation : BinaryOperation Alpha) : NaryOperation 2 Alpha :=
  fun input => operation (input ⟨0, by decide⟩) (input ⟨1, by decide⟩)
```
-/
def BinaryAsNary {Alpha : Type u}
    (operation : BinaryOperation Alpha) : NaryOperation 2 Alpha :=
  fun input => operation (input ⟨0, by decide⟩) (input ⟨1, by decide⟩)

end LRA.Operation
