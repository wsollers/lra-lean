import LRA.VolumeI.Operations

namespace LRA.UniversalAlgebra.InterpretedOperationBundles

/-!
Reusable interpreted type-theoretic algebra operation bundles.

These bundles are deliberately law-free. They name a carrier and the
distinguished elements or operations used by native Lean presentations of
algebraic structures. They are not universal-algebraic signatures in the
formal symbol-and-arity sense; that formal vocabulary lives under
`LRA.UniversalAlgebra.Signature.FormalVocabulary`.

Set-like models should map their concrete empty set to `zero` and their
concrete universal set to `one` when they instantiate an abstract algebraic
reading.
-/

/-- A carrier bundle names the underlying type of an algebraic structure;
equivalently, every operation-bundle signature below extends this carrier.

Logical form:

```lean
structure CarrierBundle where
  carrier : Type u
```
-/
structure CarrierBundle where
  carrier : Type u

/-- A zero bundle names a distinguished `zero` element of a carrier;
equivalently, in set-like models this is where the empty set will be mapped.

Logical form:

```lean
structure ZeroBundle extends CarrierBundle where
  zero : carrier
```
-/
structure ZeroBundle extends CarrierBundle where
  zero : carrier

/-- A one bundle names a distinguished `one` element of a carrier;
equivalently, in set-like models this is where the universal set will be mapped.

Logical form:

```lean
structure OneBundle extends CarrierBundle where
  one : carrier
```
-/
structure OneBundle extends CarrierBundle where
  one : carrier

/-- A zero-one bundle names both distinguished elements `zero` and `one`;
equivalently, it is the common constant vocabulary for Boolean rings and
Boolean algebras.

Logical form:

```lean
structure ZeroOneBundle extends CarrierBundle where
  zero : carrier
  one : carrier
```
-/
structure ZeroOneBundle extends CarrierBundle where
  zero : carrier
  one : carrier

/-- An additive operation bundle names one binary operation `add`;
equivalently, it supplies the operation later interpreted as addition or
symmetric difference.

Logical form:

```lean
structure AdditiveOperationBundle extends CarrierBundle where
  add : LRA.Operation.BinaryOperation carrier
```
-/
structure AdditiveOperationBundle extends CarrierBundle where
  add : LRA.Operation.BinaryOperation carrier

/-- A multiplicative operation bundle names one binary operation `multiply`;
equivalently, it supplies the operation later interpreted as multiplication or
intersection.

Logical form:

```lean
structure MultiplicativeOperationBundle extends CarrierBundle where
  multiply : LRA.Operation.BinaryOperation carrier
```
-/
structure MultiplicativeOperationBundle extends CarrierBundle where
  multiply : LRA.Operation.BinaryOperation carrier

/-- A lattice-operation bundle names binary `join` and `meet`;
equivalently, it supplies the operations later interpreted as union and
intersection in set-like Boolean algebras.

Logical form:

```lean
structure LatticeOperationBundle extends CarrierBundle where
  join : LRA.Operation.BinaryOperation carrier
  meet : LRA.Operation.BinaryOperation carrier
```
-/
structure LatticeOperationBundle extends CarrierBundle where
  join : LRA.Operation.BinaryOperation carrier
  meet : LRA.Operation.BinaryOperation carrier

/-- A complemented-operation bundle names one unary `complement` operation;
equivalently, it supplies the operation later interpreted as Boolean or set
complement.

Logical form:

```lean
structure ComplementOperationBundle extends CarrierBundle where
  complement : LRA.Operation.UnaryOperation carrier
```
-/
structure ComplementOperationBundle extends CarrierBundle where
  complement : LRA.Operation.UnaryOperation carrier

/-- A Boolean-ring operation bundle names `zero`, `one`, `add`, and
`multiply`; equivalently, powerset models read these as `∅`, `U`, symmetric
difference, and intersection.

Logical form:

```lean
structure BooleanRingOperationBundle extends ZeroOneBundle where
  add : LRA.Operation.BinaryOperation carrier
  multiply : LRA.Operation.BinaryOperation carrier
```
-/
structure BooleanRingOperationBundle extends ZeroOneBundle where
  add : LRA.Operation.BinaryOperation carrier
  multiply : LRA.Operation.BinaryOperation carrier

/-- A Boolean-algebra operation bundle names `zero`, `one`, `join`, `meet`,
and `complement`; equivalently, powerset models read these as `∅`, `U`, union,
intersection, and set complement.

Logical form:

```lean
structure BooleanAlgebraOperationBundle extends ZeroOneBundle where
  join : LRA.Operation.BinaryOperation carrier
  meet : LRA.Operation.BinaryOperation carrier
  complement : LRA.Operation.UnaryOperation carrier
```
-/
structure BooleanAlgebraOperationBundle extends ZeroOneBundle where
  join : LRA.Operation.BinaryOperation carrier
  meet : LRA.Operation.BinaryOperation carrier
  complement : LRA.Operation.UnaryOperation carrier

end LRA.UniversalAlgebra.InterpretedOperationBundles
