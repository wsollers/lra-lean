namespace LRA.Map.Operation

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
abbrev UnaryOperation (Domain : Type u) (Codomain : Type v) :=
  Operation Domain Codomain

/--
**[Abbreviation — UnaryEndoOperation]**

A unary operation on a single carrier.

Logical form:

```lean
abbrev UnaryEndoOperation (Carrier : Type u)
```
-/
abbrev UnaryEndoOperation (Carrier : Type u) :=
  UnaryOperation Carrier Carrier

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
abbrev BinaryOperation
    (Left : Type u) (Right : Type v) (Codomain : Type w) :=
  Left -> Right -> Codomain

/--
**[Abbreviation — BinaryEndoOperation]**

A binary operation on a single carrier.

Logical form:

```lean
abbrev BinaryEndoOperation (Carrier : Type u)
```
-/
abbrev BinaryEndoOperation (Carrier : Type u) :=
  BinaryOperation Carrier Carrier Carrier

/--
**[Abbreviation — ExternalBinaryOperation]**

An external binary operation, such as scalar multiplication.

Logical form:

```lean
abbrev ExternalBinaryOperation (Scalar : Type u) (Carrier : Type v)
```
-/
abbrev ExternalBinaryOperation (Scalar : Type u) (Carrier : Type v) :=
  BinaryOperation Scalar Carrier Carrier

/--
**[Definition — EndomapComposition]**

Composition as the binary operation on endomaps.

Logical form:

```lean
def EndomapComposition (Carrier : Type u) :
    BinaryEndoOperation (Carrier -> Carrier)
```
-/
def EndomapComposition (Carrier : Type u) :
    BinaryEndoOperation (Carrier -> Carrier) :=
  fun second first input => second (first input)

/--
**[Definition — EndomapIdentity]**

The identity element for endomap composition.

Logical form:

```lean
def EndomapIdentity (Carrier : Type u) : Carrier -> Carrier
```
-/
def EndomapIdentity (Carrier : Type u) : Carrier -> Carrier :=
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

end LRA.Map.Operation
