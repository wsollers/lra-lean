import LRA.VolumeI.Set

namespace LRA.VolumeI.Operations

universe u v

/--
A nullary operation on a carrier.

Logical form:

```lean
abbrev NullaryOperation (alpha : Type u) := alpha
```
-/
abbrev NullaryOperation (alpha : Type u) := alpha

/--
Compatibility synonym for a nullary operation.

Logical form:

```lean
abbrev ConstantOperation (alpha : Type u) :=
  NullaryOperation alpha
```
-/
abbrev ConstantOperation (alpha : Type u) :=
  NullaryOperation alpha

/--
A unary endo-operation on a carrier.

Logical form:

```lean
abbrev UnaryOperation (alpha : Type u) := alpha -> alpha
```
-/
abbrev UnaryOperation (alpha : Type u) := alpha -> alpha

/--
A binary operation on a carrier.

Logical form:

```lean
abbrev BinaryOperation (alpha : Type u) := alpha -> alpha -> alpha
```
-/
abbrev BinaryOperation (alpha : Type u) := alpha -> alpha -> alpha

/--
An external binary operation, such as scalar multiplication.

Logical form:

```lean
abbrev ExternalBinaryOperation (scalar carrier : Type u) :=
  scalar -> carrier -> carrier
```
-/
abbrev ExternalBinaryOperation (scalar carrier : Type u) :=
  scalar -> carrier -> carrier

/--
A partial unary operation on a carrier.

Logical form:

```lean
structure PartialUnaryOperation (alpha : Type u) where
  Domain : alpha -> Prop
  Value : forall input, Domain input -> alpha
```
-/
structure PartialUnaryOperation (alpha : Type u) where
  /-- The operation's domain of definition. -/
  Domain : alpha -> Prop
  /-- The value of the operation at a point in its domain. -/
  Value : forall input, Domain input -> alpha

/--
A partial binary operation on a carrier.

Logical form:

```lean
structure PartialBinaryOperation (alpha : Type u) where
  Domain : alpha -> alpha -> Prop
  Value : forall left right, Domain left right -> alpha
```
-/
structure PartialBinaryOperation (alpha : Type u) where
  /-- The operation's domain of definition. -/
  Domain : alpha -> alpha -> Prop
  /-- The value of the operation at a pair in its domain. -/
  Value : forall left right, Domain left right -> alpha

end LRA.VolumeI.Operations
