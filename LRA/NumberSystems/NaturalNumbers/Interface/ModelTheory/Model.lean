import LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory.Theory
import LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory.LStructure
import LRA.AlgebraicStructures
import LRA.Operation.Addition.Interface.ModelTheory.Model
import LRA.Operation.Multiplication.Interface.ModelTheory.Model

namespace LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory

open LRA.AlgebraicStructures
open LRA.NumberSystems.NaturalNumbers.Interface.Signature
open LRA.Operation.Addition.Interface.ModelTheory (AdditionModel)
open LRA.Operation.Multiplication.Interface.ModelTheory (MultiplicationModel)

universe u

/--
`NaturalNumberModel` TODO

Predicate logic:

  structure NaturalNumberModel : Type (u + 1) where
    Carrier : Type u
    [addInst : Add Carrier]
    [mulInst : Mul Carrier]
    [zeroInst : OfNat Carrier 0]
    [oneInst : OfNat Carrier 1]
    [carrierNonempty : Nonempty Carrier]
    addition : AdditionModel Carrier
    multiplication : MultiplicationModel Carrier
    [laws : CommutativeSemiringLaws Carrier]

Predicate logic (unfolded):

  structure NaturalNumberModel : Type (u + 1) where
    Carrier : Type u
    [addInst : Add Carrier]
    [mulInst : Mul Carrier]
    [zeroInst : OfNat Carrier 0]
    [oneInst : OfNat Carrier 1]
    [carrierNonempty : Nonempty Carrier]
    addition : AdditionModel Carrier
    multiplication : MultiplicationModel Carrier
    [laws : CommutativeSemiringLaws Carrier] (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure NaturalNumberModel : Type (u + 1) where
  Carrier : Type u
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : CommutativeSemiringLaws Carrier]
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
structure NaturalNumberModel : Type (u + 1) where
  Carrier : Type u
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : CommutativeSemiringLaws Carrier]

attribute [instance] NaturalNumberModel.addInst NaturalNumberModel.mulInst
  NaturalNumberModel.zeroInst NaturalNumberModel.oneInst
  NaturalNumberModel.carrierNonempty NaturalNumberModel.laws

/--
`NaturalNumberModel.ofCarrier` TODO

Predicate logic:

  def NaturalNumberModel.ofCarrier (R : Type u)
      [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [Nonempty R]
      [CommutativeSemiringLaws R] : NaturalNumberModel :=
    { Carrier := R
      addition := AdditionModel.ofCarrier R
      multiplication := MultiplicationModel.ofCarrier R }

Predicate logic (unfolded):

  def NaturalNumberModel.ofCarrier (R : Type u)
      [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [Nonempty R]
      [CommutativeSemiringLaws R] : NaturalNumberModel :=
    { Carrier := R
      addition := AdditionModel.ofCarrier R
      multiplication := MultiplicationModel.ofCarrier R } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NaturalNumberModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [Nonempty R]
    [CommutativeSemiringLaws R] : NaturalNumberModel :=
  { Carrier := R
    addition := AdditionModel.ofCarrier R
    multiplication := MultiplicationModel.ofCarrier R }
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
def NaturalNumberModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [Nonempty R]
    [CommutativeSemiringLaws R] : NaturalNumberModel :=
  { Carrier := R
    addition := AdditionModel.ofCarrier R
    multiplication := MultiplicationModel.ofCarrier R }

/--
`NaturalNumberModel.signature` TODO

Predicate logic:

  def NaturalNumberModel.signature
      (M : NaturalNumberModel) :
      LRA.AlgebraicStructures.CommutativeSemiringWithoutZeroConceptSignature where
    carrier := M.Carrier
    add := M.addition.realization.spec.add
    one := 1
    multiply := M.multiplication.realization.spec.mul

Predicate logic (unfolded):

  def NaturalNumberModel.signature
      (M : NaturalNumberModel) :
      LRA.AlgebraicStructures.CommutativeSemiringWithoutZeroConceptSignature where
    carrier := M.Carrier
    add := M.addition.realization.spec.add
    one := 1
    multiply := M.multiplication.realization.spec.mul (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NaturalNumberModel.signature
    (M : NaturalNumberModel) :
    LRA.AlgebraicStructures.CommutativeSemiringWithoutZeroConceptSignature where
  carrier := M.Carrier
  add := M.addition.realization.spec.add
  one := 1
  multiply := M.multiplication.realization.spec.mul
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
def NaturalNumberModel.signature
    (M : NaturalNumberModel) :
    LRA.AlgebraicStructures.CommutativeSemiringWithoutZeroConceptSignature where
  carrier := M.Carrier
  add := M.addition.realization.spec.add
  one := 1
  multiply := M.multiplication.realization.spec.mul

/--
`NaturalNumberModel.firstOrderModel` TODO

Predicate logic:

  def NaturalNumberModel.firstOrderModel
      (M : NaturalNumberModel) :
      LRA.ModelTheory.FirstOrder.Model NaturalNumbersFirstOrderSignature :=
    naturalNumbersModel M.signature

Predicate logic (unfolded):

  def NaturalNumberModel.firstOrderModel
      (M : NaturalNumberModel) :
      LRA.ModelTheory.FirstOrder.Model NaturalNumbersFirstOrderSignature :=
    naturalNumbersModel M.signature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NaturalNumberModel.firstOrderModel
    (M : NaturalNumberModel) :
    LRA.ModelTheory.FirstOrder.Model NaturalNumbersFirstOrderSignature :=
  naturalNumbersModel M.signature
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
def NaturalNumberModel.firstOrderModel
    (M : NaturalNumberModel) :
    LRA.ModelTheory.FirstOrder.Model NaturalNumbersFirstOrderSignature :=
  naturalNumbersModel M.signature

/--
`mathlibNaturalNumberModel` TODO

Predicate logic:

  def mathlibNaturalNumberModel : NaturalNumberModel :=
    NaturalNumberModel.ofCarrier Nat

Predicate logic (unfolded):

  def mathlibNaturalNumberModel : NaturalNumberModel :=
    NaturalNumberModel.ofCarrier Nat (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def mathlibNaturalNumberModel : NaturalNumberModel :=
  NaturalNumberModel.ofCarrier Nat
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
def mathlibNaturalNumberModel : NaturalNumberModel :=
  NaturalNumberModel.ofCarrier Nat

end LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory
