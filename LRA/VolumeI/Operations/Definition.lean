namespace LRA.Operation

universe u v w

/--
**[Abbreviation — Operation]**

A general typed operation from a domain to a codomain.

Logical form:

```lean
abbrev Operation (Domain : Type u) (Codomain : Type v)
```
-/
abbrev Operation (Domain : Type u) (Codomain : Type v) :=
  Domain -> Codomain

/--
**[Abbreviation — NullaryOperation]**

A nullary operation is a selected element of the codomain.

Logical form:

```lean
abbrev NullaryOperation (Codomain : Type u)
```
-/
abbrev NullaryOperation (Codomain : Type u) :=
  Codomain

/--
**[Abbreviation — UnaryOperation]**

A unary operation with possibly different domain and codomain.

Logical form:

```lean
abbrev UnaryOperation (Domain : Type u) (Codomain : Type v)
```
-/
abbrev HeterogeneousUnaryOperation (Domain : Type u) (Codomain : Type v) :=
  Operation Domain Codomain

/--
**[Abbreviation - UnaryOperation]**

A unary operation on one carrier.
-/
abbrev UnaryOperation (Carrier : Type u) :=
  HeterogeneousUnaryOperation Carrier Carrier

/--
**[Abbreviation - ConstantOperation]**

A nullary operation viewed as a constant operation.
-/
abbrev ConstantOperation (Codomain : Type u) :=
  NullaryOperation Codomain

/--
**[Abbreviation — UnaryEndoOperation]**

A unary operation on a single carrier.

Logical form:

```lean
abbrev UnaryEndoOperation (Carrier : Type u)
```
-/
abbrev UnaryEndoOperation (Carrier : Type u) :=
  UnaryOperation Carrier

/--
**[Abbreviation — BinaryOperation]**

A binary operation with possibly different left input, right input, and
codomain types.

Logical form:

```lean
abbrev BinaryOperation
    (Left : Type u) (Right : Type v) (Codomain : Type w)
```
-/
abbrev HeterogeneousBinaryOperation
    (Left : Type u) (Right : Type v) (Codomain : Type w) :=
  Left -> Right -> Codomain

/--
**[Abbreviation - BinaryOperation]**

A binary operation on one carrier.
-/
abbrev BinaryOperation (Carrier : Type u) :=
  HeterogeneousBinaryOperation Carrier Carrier Carrier

/--
**[Abbreviation — BinaryEndoOperation]**

A binary operation on a single carrier.

Logical form:

```lean
abbrev BinaryEndoOperation (Carrier : Type u)
```
-/
abbrev BinaryEndoOperation (Carrier : Type u) :=
  BinaryOperation Carrier

/--
**[Abbreviation — ExternalBinaryOperation]**

An external binary operation, such as scalar multiplication.

Logical form:

```lean
abbrev ExternalBinaryOperation (Scalar : Type u) (Carrier : Type v)
```
-/
abbrev ExternalBinaryOperation (Scalar : Type u) (Carrier : Type v) :=
  HeterogeneousBinaryOperation Scalar Carrier Carrier

/--
**[Definition — EndofunctionComposition]**

Composition as the binary operation on endofunctions.

Logical form:

```lean
def EndofunctionComposition (Carrier : Type u) :
    BinaryEndoOperation (Carrier -> Carrier)
```
-/
def EndofunctionComposition (Carrier : Type u) :
    BinaryEndoOperation (Carrier -> Carrier) :=
  fun second first input => second (first input)

/--
**[Definition — EndofunctionIdentity]**

The identity element for endofunction composition.

Logical form:

```lean
def EndofunctionIdentity (Carrier : Type u) : Carrier -> Carrier
```
-/
def EndofunctionIdentity (Carrier : Type u) : Carrier -> Carrier :=
  fun input => input

/--
**[Definition — PointwiseBinaryOperation]**

Pointwise transfer of a binary operation to a function space.

Logical form:

```lean
def PointwiseBinaryOperation {Domain : Type u} {Codomain : Type v}
    (operation : BinaryEndoOperation Codomain) :
    BinaryEndoOperation (Domain -> Codomain)
```
-/
def PointwiseBinaryOperation {Domain : Type u} {Codomain : Type v}
    (operation : BinaryEndoOperation Codomain) :
    BinaryEndoOperation (Domain -> Codomain) :=
  fun first second input => operation (first input) (second input)

/--
**[Definition — PointwiseUnaryOperation]**

Pointwise transfer of a unary operation to a function space.

Logical form:

```lean
def PointwiseUnaryOperation {Domain : Type u} {Codomain : Type v}
    (operation : UnaryEndoOperation Codomain) :
    UnaryEndoOperation (Domain -> Codomain)
```
-/
def PointwiseUnaryOperation {Domain : Type u} {Codomain : Type v}
    (operation : UnaryEndoOperation Codomain) :
    UnaryEndoOperation (Domain -> Codomain) :=
  fun map input => operation (map input)

/--
**[Structure - PartialUnaryOperation]**

A partial unary operation on a carrier.
-/
structure PartialUnaryOperation (Carrier : Type u) where
  /-- The operation's domain of definition. -/
  Domain : Carrier -> Prop
  /-- The value of the operation at a point in its domain. -/
  Value : forall input, Domain input -> Carrier

/--
**[Structure - PartialBinaryOperation]**

A partial binary operation on a carrier.
-/
structure PartialBinaryOperation (Carrier : Type u) where
  /-- The operation's domain of definition. -/
  Domain : Carrier -> Carrier -> Prop
  /-- The value of the operation at a pair in its domain. -/
  Value : forall left right, Domain left right -> Carrier

end LRA.Operation
