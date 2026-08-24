import LRA.AlgebraicStructures.OrderedField.Interface.Signature.Definition
import LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory.Model
import LRA.Operation

namespace LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory

universe u

open LRA.AlgebraicStructures.OrderedField.Interface.Signature

/--
`OrderedFieldSignature` TODO

Predicate logic:

  structure OrderedFieldSignature extends
    LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory.OrderedRingSignature where
  inv : LRA.Operation.UnaryOperation carrier

Predicate logic (unfolded):

  structure OrderedFieldSignature extends
    LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory.OrderedRingSignature where
  inv : LRA.Operation.UnaryOperation carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure OrderedFieldSignature extends
    LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory.OrderedRingSignature where
  inv : LRA.Operation.UnaryOperation carrier
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
structure OrderedFieldSignature extends
    LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory.OrderedRingSignature where
  inv : LRA.Operation.UnaryOperation carrier

namespace OrderedFieldSignature

/--
`InverseDomain` TODO

Predicate logic:

  ∀ (signature : LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.OrderedFieldSignature) (value : signature.carrier), value = signature.zero → False

Predicate logic (unfolded):

  ∀ (signature : LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.OrderedFieldSignature) (value : signature.toCarrierBundle.1), value = signature.toZeroOneBundle.2 → False

Logical form (Lean):

```lean
def InverseDomain
    (signature : OrderedFieldSignature)
    (value : signature.carrier) : Prop :=
  value ≠ signature.zero
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
def InverseDomain
    (signature : OrderedFieldSignature)
    (value : signature.carrier) : Prop :=
  value ≠ signature.zero

/--
`PartialInverse` TODO

Predicate logic:

  def PartialInverse
    (signature : OrderedFieldSignature) :
    LRA.Operation.PartialUnaryOperation signature.carrier where
  Domain := InverseDomain signature
  Value := fun value _ => signature.inv value

Predicate logic (unfolded):

  def PartialInverse
    (signature : OrderedFieldSignature) :
    LRA.Operation.PartialUnaryOperation signature.carrier where
  Domain := InverseDomain signature
  Value := fun value _ => signature.inv value (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PartialInverse
    (signature : OrderedFieldSignature) :
    LRA.Operation.PartialUnaryOperation signature.carrier where
  Domain := InverseDomain signature
  Value := fun value _ => signature.inv value
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
def PartialInverse
    (signature : OrderedFieldSignature) :
    LRA.Operation.PartialUnaryOperation signature.carrier where
  Domain := InverseDomain signature
  Value := fun value _ => signature.inv value

/--
`PartialDivision` TODO

Predicate logic:

  def PartialDivision
    (signature : OrderedFieldSignature) :
    LRA.Operation.PartialBinaryOperation signature.carrier where
  Domain := fun _ divisor => divisor ≠ signature.zero
  Value := fun dividend divisor _ =>
    signature.multiply dividend (signature.inv divisor)

Predicate logic (unfolded):

  def PartialDivision
    (signature : OrderedFieldSignature) :
    LRA.Operation.PartialBinaryOperation signature.carrier where
  Domain := fun _ divisor => divisor ≠ signature.zero
  Value := fun dividend divisor _ =>
    signature.multiply dividend (signature.inv divisor) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PartialDivision
    (signature : OrderedFieldSignature) :
    LRA.Operation.PartialBinaryOperation signature.carrier where
  Domain := fun _ divisor => divisor ≠ signature.zero
  Value := fun dividend divisor _ =>
    signature.multiply dividend (signature.inv divisor)
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
def PartialDivision
    (signature : OrderedFieldSignature) :
    LRA.Operation.PartialBinaryOperation signature.carrier where
  Domain := fun _ divisor => divisor ≠ signature.zero
  Value := fun dividend divisor _ =>
    signature.multiply dividend (signature.inv divisor)

end OrderedFieldSignature

/--
`BuildOrderedFieldModel` TODO

Predicate logic:

  def BuildOrderedFieldModel
    (signature : OrderedFieldSignature) :
    LRA.Logic.FirstOrder.Model OrderedFieldFirstOrderSignature where
  Domain

Predicate logic (unfolded):

  def BuildOrderedFieldModel
    (signature : OrderedFieldSignature) :
    LRA.Logic.FirstOrder.Model OrderedFieldFirstOrderSignature where
  Domain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BuildOrderedFieldModel
    (signature : OrderedFieldSignature) :
    LRA.Logic.FirstOrder.Model OrderedFieldFirstOrderSignature where
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
def BuildOrderedFieldModel
    (signature : OrderedFieldSignature) :
    LRA.Logic.FirstOrder.Model OrderedFieldFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .neg, args => signature.neg (args ⟨0, by decide⟩)
    | .inv, args => signature.inv (args ⟨0, by decide⟩)
  interpretRelation
    | .lt, args =>
        signature.StrictOrder (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

/--
`orderedFieldFirstOrderModel` TODO

Predicate logic:

  def orderedFieldFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.Logic.FirstOrder.Model OrderedFieldFirstOrderSignature :=
  BuildOrderedFieldModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      neg := (- ·), multiply := (· * ·), inv := (·⁻¹), le := (· ≤ ·),
      StrictOrder := (· < ·) }

Predicate logic (unfolded):

  def orderedFieldFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.Logic.FirstOrder.Model OrderedFieldFirstOrderSignature :=
  BuildOrderedFieldModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      neg := (- ·), multiply := (· * ·), inv := (·⁻¹), le := (· ≤ ·),
      StrictOrder := (· < ·) } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def orderedFieldFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.Logic.FirstOrder.Model OrderedFieldFirstOrderSignature :=
  BuildOrderedFieldModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      neg := (- ·), multiply := (· * ·), inv := (·⁻¹), le := (· ≤ ·),
      StrictOrder := (· < ·) }
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
def orderedFieldFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.Logic.FirstOrder.Model OrderedFieldFirstOrderSignature :=
  BuildOrderedFieldModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      neg := (- ·), multiply := (· * ·), inv := (·⁻¹), le := (· ≤ ·),
      StrictOrder := (· < ·) }

end LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory
