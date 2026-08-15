import LRA.VolumeI.Operations.Operations

namespace LRA.Algebra.Operation

universe u

/--
Associativity of a binary operation.

Logical form:

```lean
def Associative {alpha : Type u}
    (operation : BinaryOperation alpha) : Prop :=
  forall first second third,
    operation (operation first second) third =
      operation first (operation second third)
```
-/
def Associative {alpha : Type u}
    (operation : BinaryOperation alpha) : Prop :=
  forall first second third,
    operation (operation first second) third =
      operation first (operation second third)

/--
Commutativity of a binary operation.

Logical form:

```lean
def Commutative {alpha : Type u}
    (operation : BinaryOperation alpha) : Prop :=
  forall first second, operation first second = operation second first
```
-/
def Commutative {alpha : Type u}
    (operation : BinaryOperation alpha) : Prop :=
  forall first second, operation first second = operation second first

/--
Left-identity law for a binary operation.

Logical form:

```lean
def LeftIdentity {alpha : Type u}
    (operation : BinaryOperation alpha) (identity : alpha) : Prop :=
  forall element, operation identity element = element
```
-/
def LeftIdentity {alpha : Type u}
    (operation : BinaryOperation alpha) (identity : alpha) : Prop :=
  forall element, operation identity element = element

/--
Right-identity law for a binary operation.

Logical form:

```lean
def RightIdentity {alpha : Type u}
    (operation : BinaryOperation alpha) (identity : alpha) : Prop :=
  forall element, operation element identity = element
```
-/
def RightIdentity {alpha : Type u}
    (operation : BinaryOperation alpha) (identity : alpha) : Prop :=
  forall element, operation element identity = element

/--
Two-sided identity law for a binary operation.

Logical form:

```lean
def Identity {alpha : Type u}
    (operation : BinaryOperation alpha) (identity : alpha) : Prop :=
  LeftIdentity operation identity /\ RightIdentity operation identity
```
-/
def Identity {alpha : Type u}
    (operation : BinaryOperation alpha) (identity : alpha) : Prop :=
  LeftIdentity operation identity /\ RightIdentity operation identity

/--
Left-inverse law for a unary inverse relative to a binary operation.

Logical form:

```lean
def LeftInverse {alpha : Type u}
    (operation : BinaryOperation alpha) (identity : alpha)
    (inverse : UnaryOperation alpha) : Prop :=
  forall element, operation (inverse element) element = identity
```
-/
def LeftInverse {alpha : Type u}
    (operation : BinaryOperation alpha) (identity : alpha)
    (inverse : UnaryOperation alpha) : Prop :=
  forall element, operation (inverse element) element = identity

/--
Right-inverse law for a unary inverse relative to a binary operation.

Logical form:

```lean
def RightInverse {alpha : Type u}
    (operation : BinaryOperation alpha) (identity : alpha)
    (inverse : UnaryOperation alpha) : Prop :=
  forall element, operation element (inverse element) = identity
```
-/
def RightInverse {alpha : Type u}
    (operation : BinaryOperation alpha) (identity : alpha)
    (inverse : UnaryOperation alpha) : Prop :=
  forall element, operation element (inverse element) = identity

/--
Two-sided inverse law for a unary inverse relative to a binary operation.

Logical form:

```lean
def Inverse {alpha : Type u}
    (operation : BinaryOperation alpha) (identity : alpha)
    (inverseOperation : UnaryOperation alpha) : Prop :=
  LeftInverse operation identity inverseOperation /\
    RightInverse operation identity inverseOperation
```
-/
def Inverse {alpha : Type u}
    (operation : BinaryOperation alpha) (identity : alpha)
    (inverseOperation : UnaryOperation alpha) : Prop :=
  LeftInverse operation identity inverseOperation /\
    RightInverse operation identity inverseOperation

/--
Idempotence of a binary operation.

Logical form:

```lean
def Idempotent {alpha : Type u}
    (operation : BinaryOperation alpha) : Prop :=
  forall element, operation element element = element
```
-/
def Idempotent {alpha : Type u}
    (operation : BinaryOperation alpha) : Prop :=
  forall element, operation element element = element

/--
Left-distributivity of one operation over another.

Logical form:

```lean
def LeftDistributive {alpha : Type u}
    (mul add : BinaryOperation alpha) : Prop :=
  forall left right third,
    mul left (add right third) = add (mul left right) (mul left third)
```
-/
def LeftDistributive {alpha : Type u}
    (mul add : BinaryOperation alpha) : Prop :=
  forall left right third,
    mul left (add right third) = add (mul left right) (mul left third)

/--
Right-distributivity of one operation over another.

Logical form:

```lean
def RightDistributive {alpha : Type u}
    (mul add : BinaryOperation alpha) : Prop :=
  forall left right third,
    mul (add left right) third = add (mul left third) (mul right third)
```
-/
def RightDistributive {alpha : Type u}
    (mul add : BinaryOperation alpha) : Prop :=
  forall left right third,
    mul (add left right) third = add (mul left third) (mul right third)

/--
Two-sided distributivity of one operation over another.

Logical form:

```lean
def Distributive {alpha : Type u}
    (mul add : BinaryOperation alpha) : Prop :=
  LeftDistributive mul add /\ RightDistributive mul add
```
-/
def Distributive {alpha : Type u}
    (mul add : BinaryOperation alpha) : Prop :=
  LeftDistributive mul add /\ RightDistributive mul add

/--
A left-absorbing element for a binary operation.

Logical form:

```lean
def LeftAbsorbing {alpha : Type u}
    (operation : BinaryOperation alpha) (absorber : alpha) : Prop :=
  forall element, operation absorber element = absorber
```
-/
def LeftAbsorbing {alpha : Type u}
    (operation : BinaryOperation alpha) (absorber : alpha) : Prop :=
  forall element, operation absorber element = absorber

/--
A right-absorbing element for a binary operation.

Logical form:

```lean
def RightAbsorbing {alpha : Type u}
    (operation : BinaryOperation alpha) (absorber : alpha) : Prop :=
  forall element, operation element absorber = absorber
```
-/
def RightAbsorbing {alpha : Type u}
    (operation : BinaryOperation alpha) (absorber : alpha) : Prop :=
  forall element, operation element absorber = absorber

/--
A two-sided absorbing element for a binary operation.

Logical form:

```lean
def Absorbing {alpha : Type u}
    (operation : BinaryOperation alpha) (absorber : alpha) : Prop :=
  LeftAbsorbing operation absorber /\ RightAbsorbing operation absorber
```
-/
def Absorbing {alpha : Type u}
    (operation : BinaryOperation alpha) (absorber : alpha) : Prop :=
  LeftAbsorbing operation absorber /\ RightAbsorbing operation absorber

end LRA.Algebra.Operation
