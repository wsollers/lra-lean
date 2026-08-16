import LRA.VolumeI.Operations

namespace LRA.UniversalAlgebra.Signatures

/-!
Reusable type-theoretic algebra operation bundles.

These signatures are deliberately law-free. They name a carrier and the
distinguished elements or operations that later structures interpret. Set-like
models should map their concrete empty set to `zero` and their concrete
universal set to `one` when they instantiate an abstract algebraic reading.
-/

/-- A carrier signature names the underlying type of an algebraic structure;
equivalently, every operation-bundle signature below extends this carrier.

Logical form:

```lean
structure CarrierSignature where
  carrier : Type u
```
-/
structure CarrierSignature where
  carrier : Type u

/-- A zero signature names a distinguished `zero` element of a carrier;
equivalently, in set-like models this is where the empty set will be mapped.

Logical form:

```lean
structure ZeroSignature extends CarrierSignature where
  zero : carrier
```
-/
structure ZeroSignature extends CarrierSignature where
  zero : carrier

/-- A one signature names a distinguished `one` element of a carrier;
equivalently, in set-like models this is where the universal set will be mapped.

Logical form:

```lean
structure OneSignature extends CarrierSignature where
  one : carrier
```
-/
structure OneSignature extends CarrierSignature where
  one : carrier

/-- A zero-one signature names both distinguished elements `zero` and `one`;
equivalently, it is the common constant vocabulary for Boolean rings and
Boolean algebras.

Logical form:

```lean
structure ZeroOneSignature extends CarrierSignature where
  zero : carrier
  one : carrier
```
-/
structure ZeroOneSignature extends CarrierSignature where
  zero : carrier
  one : carrier

/-- An additive signature names one binary operation `add`;
equivalently, it supplies the operation later interpreted as addition or
symmetric difference.

Logical form:

```lean
structure AdditiveSignature extends CarrierSignature where
  add : LRA.Operation.BinaryOperation carrier
```
-/
structure AdditiveSignature extends CarrierSignature where
  add : LRA.Operation.BinaryOperation carrier

/-- A multiplicative signature names one binary operation `multiply`;
equivalently, it supplies the operation later interpreted as multiplication or
intersection.

Logical form:

```lean
structure MultiplicativeSignature extends CarrierSignature where
  multiply : LRA.Operation.BinaryOperation carrier
```
-/
structure MultiplicativeSignature extends CarrierSignature where
  multiply : LRA.Operation.BinaryOperation carrier

/-- A lattice-operation signature names binary `join` and `meet`;
equivalently, it supplies the operations later interpreted as union and
intersection in set-like Boolean algebras.

Logical form:

```lean
structure LatticeOperationSignature extends CarrierSignature where
  join : LRA.Operation.BinaryOperation carrier
  meet : LRA.Operation.BinaryOperation carrier
```
-/
structure LatticeOperationSignature extends CarrierSignature where
  join : LRA.Operation.BinaryOperation carrier
  meet : LRA.Operation.BinaryOperation carrier

/-- A complemented-operation signature names one unary `complement` operation;
equivalently, it supplies the operation later interpreted as Boolean or set
complement.

Logical form:

```lean
structure ComplementOperationSignature extends CarrierSignature where
  complement : LRA.Operation.UnaryOperation carrier
```
-/
structure ComplementOperationSignature extends CarrierSignature where
  complement : LRA.Operation.UnaryOperation carrier

/-- A Boolean-ring operation signature names `zero`, `one`, `add`, and
`multiply`; equivalently, powerset models read these as `∅`, `U`, symmetric
difference, and intersection.

Logical form:

```lean
structure BooleanRingOperationSignature extends ZeroOneSignature where
  add : LRA.Operation.BinaryOperation carrier
  multiply : LRA.Operation.BinaryOperation carrier
```
-/
structure BooleanRingOperationSignature extends ZeroOneSignature where
  add : LRA.Operation.BinaryOperation carrier
  multiply : LRA.Operation.BinaryOperation carrier

/-- A Boolean-algebra operation signature names `zero`, `one`, `join`, `meet`,
and `complement`; equivalently, powerset models read these as `∅`, `U`, union,
intersection, and set complement.

Logical form:

```lean
structure BooleanAlgebraOperationSignature extends ZeroOneSignature where
  join : LRA.Operation.BinaryOperation carrier
  meet : LRA.Operation.BinaryOperation carrier
  complement : LRA.Operation.UnaryOperation carrier
```
-/
structure BooleanAlgebraOperationSignature extends ZeroOneSignature where
  join : LRA.Operation.BinaryOperation carrier
  meet : LRA.Operation.BinaryOperation carrier
  complement : LRA.Operation.UnaryOperation carrier

end LRA.UniversalAlgebra.Signatures
