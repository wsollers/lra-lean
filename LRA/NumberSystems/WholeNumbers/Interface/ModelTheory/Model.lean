import LRA.NumberSystems.WholeNumbers.Interface.ModelTheory.Theory
import LRA.NumberSystems.WholeNumbers.Interface.ModelTheory.LStructure
import LRA.AlgebraicStructures
import LRA.Operation.Addition.Interface.ModelTheory.Model
import LRA.Operation.Multiplication.Interface.ModelTheory.Model

namespace LRA.NumberSystems.WholeNumbers.Interface.ModelTheory

open LRA.AlgebraicStructures
open LRA.AlgebraicStructures.OrderedSemiring.Interface.ModelTheory
open LRA.NumberSystems.WholeNumbers.Interface.Signature
open LRA.Operation.Addition.Interface.ModelTheory (AdditionModel)
open LRA.Operation.Multiplication.Interface.ModelTheory (MultiplicationModel)

universe u

/--
`WholeNumberModel` TODO

Predicate logic:

  structure WholeNumberModel : Type (u + 1) where
    Carrier : Type u
    [addInst : Add Carrier]
    [mulInst : Mul Carrier]
    [zeroInst : OfNat Carrier 0]
    [oneInst : OfNat Carrier 1]
    [ltInst : LT Carrier]
    [leInst : LE Carrier]
    [carrierNonempty : Nonempty Carrier]
    addition : AdditionModel Carrier
    multiplication : MultiplicationModel Carrier
    [laws : OrderedSemiringLaws Carrier]
    [strictOrderCert : LRA.Order.StrictOrderCompatibilityLaw Carrier]

Predicate logic (unfolded):

  structure WholeNumberModel : Type (u + 1) where
    Carrier : Type u
    [addInst : Add Carrier]
    [mulInst : Mul Carrier]
    [zeroInst : OfNat Carrier 0]
    [oneInst : OfNat Carrier 1]
    [ltInst : LT Carrier]
    [leInst : LE Carrier]
    [carrierNonempty : Nonempty Carrier]
    addition : AdditionModel Carrier
    multiplication : MultiplicationModel Carrier
    [laws : OrderedSemiringLaws Carrier]
    [strictOrderCert : LRA.Order.StrictOrderCompatibilityLaw Carrier] (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure WholeNumberModel : Type (u + 1) where
  Carrier : Type u
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [ltInst : LT Carrier]
  [leInst : LE Carrier]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : OrderedSemiringLaws Carrier]
  [strictOrderCert : LRA.Order.StrictOrderCompatibilityLaw Carrier]
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
structure WholeNumberModel : Type (u + 1) where
  Carrier : Type u
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [ltInst : LT Carrier]
  [leInst : LE Carrier]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : OrderedSemiringLaws Carrier]
  [strictOrderCert : LRA.Order.StrictOrderCompatibilityLaw Carrier]

attribute [instance] WholeNumberModel.addInst WholeNumberModel.mulInst
  WholeNumberModel.zeroInst WholeNumberModel.oneInst WholeNumberModel.ltInst
  WholeNumberModel.leInst WholeNumberModel.carrierNonempty WholeNumberModel.laws
  WholeNumberModel.strictOrderCert

/--
`WholeNumberModel.ofCarrier` TODO

Predicate logic:

  def WholeNumberModel.ofCarrier (R : Type u)
      [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] [Nonempty R]
      [OrderedSemiringLaws R] [LRA.Order.StrictOrderCompatibilityLaw R] :
      WholeNumberModel :=
    { Carrier := R
      addition := AdditionModel.ofCarrier R
      multiplication := MultiplicationModel.ofCarrier R }

Predicate logic (unfolded):

  def WholeNumberModel.ofCarrier (R : Type u)
      [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] [Nonempty R]
      [OrderedSemiringLaws R] [LRA.Order.StrictOrderCompatibilityLaw R] :
      WholeNumberModel :=
    { Carrier := R
      addition := AdditionModel.ofCarrier R
      multiplication := MultiplicationModel.ofCarrier R } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def WholeNumberModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] [Nonempty R]
    [OrderedSemiringLaws R] [LRA.Order.StrictOrderCompatibilityLaw R] :
    WholeNumberModel :=
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
def WholeNumberModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] [Nonempty R]
    [OrderedSemiringLaws R] [LRA.Order.StrictOrderCompatibilityLaw R] :
    WholeNumberModel :=
  { Carrier := R
    addition := AdditionModel.ofCarrier R
    multiplication := MultiplicationModel.ofCarrier R }

/--
`WholeNumberModel.signature` TODO

Predicate logic:

  def WholeNumberModel.signature
      (M : WholeNumberModel) :
      OrderedSemiringSignature where
    carrier := M.Carrier
    zero := 0
    one := 1
    add := M.addition.realization.spec.add
    multiply := M.multiplication.realization.spec.mul
    le := (· ≤ ·)
    StrictOrder := (· < ·)

Predicate logic (unfolded):

  def WholeNumberModel.signature
      (M : WholeNumberModel) :
      OrderedSemiringSignature where
    carrier := M.Carrier
    zero := 0
    one := 1
    add := M.addition.realization.spec.add
    multiply := M.multiplication.realization.spec.mul
    le := (· ≤ ·)
    StrictOrder := (· < ·) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def WholeNumberModel.signature
    (M : WholeNumberModel) :
    OrderedSemiringSignature where
  carrier := M.Carrier
  zero := 0
  one := 1
  add := M.addition.realization.spec.add
  multiply := M.multiplication.realization.spec.mul
  le := (· ≤ ·)
  StrictOrder := (· < ·)
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
def WholeNumberModel.signature
    (M : WholeNumberModel) :
    OrderedSemiringSignature where
  carrier := M.Carrier
  zero := 0
  one := 1
  add := M.addition.realization.spec.add
  multiply := M.multiplication.realization.spec.mul
  le := (· ≤ ·)
  StrictOrder := (· < ·)

/--
`WholeNumberModel.firstOrderModel` TODO

Predicate logic:

  def WholeNumberModel.firstOrderModel
      (M : WholeNumberModel) :
      LRA.ModelTheory.FirstOrder.Model WholeNumbersFirstOrderSignature :=
    BuildOrderedSemiringModel M.signature

Predicate logic (unfolded):

  def WholeNumberModel.firstOrderModel
      (M : WholeNumberModel) :
      LRA.ModelTheory.FirstOrder.Model WholeNumbersFirstOrderSignature :=
    BuildOrderedSemiringModel M.signature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def WholeNumberModel.firstOrderModel
    (M : WholeNumberModel) :
    LRA.ModelTheory.FirstOrder.Model WholeNumbersFirstOrderSignature :=
  BuildOrderedSemiringModel M.signature
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
def WholeNumberModel.firstOrderModel
    (M : WholeNumberModel) :
    LRA.ModelTheory.FirstOrder.Model WholeNumbersFirstOrderSignature :=
  BuildOrderedSemiringModel M.signature

/--
`mathlibWholeNumberModel` TODO

Predicate logic:

  def mathlibWholeNumberModel : WholeNumberModel :=
    WholeNumberModel.ofCarrier Nat

Predicate logic (unfolded):

  def mathlibWholeNumberModel : WholeNumberModel :=
    WholeNumberModel.ofCarrier Nat (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def mathlibWholeNumberModel : WholeNumberModel :=
  WholeNumberModel.ofCarrier Nat
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
def mathlibWholeNumberModel : WholeNumberModel :=
  WholeNumberModel.ofCarrier Nat

end LRA.NumberSystems.WholeNumbers.Interface.ModelTheory
