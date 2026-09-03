import LRA.NumberSystems.Arithmetic.Model.FirstOrderSignature
import LRA.Operation

namespace LRA.NumberSystems.Arithmetic.Model

universe u

/--
`ArithmeticRingSignature` TODO

Predicate logic:

  structure ArithmeticRingSignature where
  carrier : Type u
  zero : LRA.Operation.NullaryOperation carrier
  one : LRA.Operation.NullaryOperation carrier
  addition : LRA.Operation.BinaryOperation carrier
  multiplication : LRA.Operation.BinaryOperation carrier

Predicate logic (unfolded):

  structure ArithmeticRingSignature where
  carrier : Type u
  zero : LRA.Operation.NullaryOperation carrier
  one : LRA.Operation.NullaryOperation carrier
  addition : LRA.Operation.BinaryOperation carrier
  multiplication : LRA.Operation.BinaryOperation carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure ArithmeticRingSignature where
  carrier : Type u
  zero : LRA.Operation.NullaryOperation carrier
  one : LRA.Operation.NullaryOperation carrier
  addition : LRA.Operation.BinaryOperation carrier
  multiplication : LRA.Operation.BinaryOperation carrier
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
structure ArithmeticRingSignature where
  carrier : Type u
  zero : LRA.Operation.NullaryOperation carrier
  one : LRA.Operation.NullaryOperation carrier
  addition : LRA.Operation.BinaryOperation carrier
  multiplication : LRA.Operation.BinaryOperation carrier

/--
`BuildArithmeticRingModel` TODO

Predicate logic:

  def BuildArithmeticRingModel
    (signature : ArithmeticRingSignature) :
    LRA.ModelTheory.FirstOrder.Model ArithmeticRingFirstOrderSignature where
  Domain

Predicate logic (unfolded):

  def BuildArithmeticRingModel
    (signature : ArithmeticRingSignature) :
    LRA.ModelTheory.FirstOrder.Model ArithmeticRingFirstOrderSignature where
  Domain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BuildArithmeticRingModel
    (signature : ArithmeticRingSignature) :
    LRA.ModelTheory.FirstOrder.Model ArithmeticRingFirstOrderSignature where
  Domain
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def BuildArithmeticRingModel
    (signature : ArithmeticRingSignature) :
    LRA.ModelTheory.FirstOrder.Model ArithmeticRingFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.addition (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiplication (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

/--
`arithmeticRingFirstOrderModel` TODO

Predicate logic:

  def arithmeticRingFirstOrderModel (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] :
    LRA.ModelTheory.FirstOrder.Model ArithmeticRingFirstOrderSignature :=
  BuildArithmeticRingModel
    { carrier := R, zero := 0, one := 1, addition := (· + ·),
      multiplication := (· * ·) }

Predicate logic (unfolded):

  def arithmeticRingFirstOrderModel (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] :
    LRA.ModelTheory.FirstOrder.Model ArithmeticRingFirstOrderSignature :=
  BuildArithmeticRingModel
    { carrier := R, zero := 0, one := 1, addition := (· + ·),
      multiplication := (· * ·) } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def arithmeticRingFirstOrderModel (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] :
    LRA.ModelTheory.FirstOrder.Model ArithmeticRingFirstOrderSignature :=
  BuildArithmeticRingModel
    { carrier := R, zero := 0, one := 1, addition := (· + ·),
      multiplication := (· * ·) }
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def arithmeticRingFirstOrderModel (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] :
    LRA.ModelTheory.FirstOrder.Model ArithmeticRingFirstOrderSignature :=
  BuildArithmeticRingModel
    { carrier := R, zero := 0, one := 1, addition := (· + ·),
      multiplication := (· * ·) }

end LRA.NumberSystems.Arithmetic.Model
