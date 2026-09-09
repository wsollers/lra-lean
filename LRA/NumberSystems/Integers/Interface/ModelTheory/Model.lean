import LRA.NumberSystems.Integers.Interface.ModelTheory.Theory
import LRA.AlgebraicStructures.IntegralDomain.Interface.Laws.Definition
import LRA.Order.Laws.LinearOrder.Definition
import LRA.Order.Laws.StrictOrderCompatibility.Definition
import LRA.Order.Laws.OperationCompatibility.Definition
import LRA.Order.DiscreteOrder.Definition
import LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory.LStructure
import LRA.AlgebraicStructures.MathlibBridge

namespace LRA.NumberSystems.Integers.Interface.ModelTheory

open LRA.AlgebraicStructures (IntegralDomainLaws)
open LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory (OrderedRingSignature)
open LRA.Order

universe u

/--
`IntegerModel` ℤ's own generic model: a carrier with the raw ring/order instances plus the laws `DiscretelyOrderedIntegralDomainLaws` bundles, owned by `Integers` rather than shared across number systems.

Predicate logic:

  structure IntegerModel : Type (u + 1) where
    Carrier : Type u
    [addInst : Add Carrier]
    [mulInst : Mul Carrier]
    [negInst : Neg Carrier]
    [zeroInst : OfNat Carrier 0]
    [oneInst : OfNat Carrier 1]
    [ltInst : LT Carrier]
    [leInst : LE Carrier]
    [carrierNonempty : Nonempty Carrier]
    [domainCert : IntegralDomainLaws Carrier]
    [orderCert : LinearOrderLaws Carrier]
    [strictCert : StrictOrderCompatibilityLaw Carrier]
    [addOrderCert : AdditionRespectsOrderLaws Carrier]
    [mulOrderCert : MultiplicationRespectsOrderLaws Carrier]
    [discreteCert : OrderDiscretenessLaw Carrier]

Predicate logic (unfolded):

  structure IntegerModel : Type (u + 1) where
    Carrier : Type u
    [addInst : Add Carrier]
    [mulInst : Mul Carrier]
    [negInst : Neg Carrier]
    [zeroInst : OfNat Carrier 0]
    [oneInst : OfNat Carrier 1]
    [ltInst : LT Carrier]
    [leInst : LE Carrier]
    [carrierNonempty : Nonempty Carrier]
    [domainCert : IntegralDomainLaws Carrier]
    [orderCert : LinearOrderLaws Carrier]
    [strictCert : StrictOrderCompatibilityLaw Carrier]
    [addOrderCert : AdditionRespectsOrderLaws Carrier]
    [mulOrderCert : MultiplicationRespectsOrderLaws Carrier]
    [discreteCert : OrderDiscretenessLaw Carrier] (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure IntegerModel : Type (u + 1) where
  Carrier : Type u
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [ltInst : LT Carrier]
  [leInst : LE Carrier]
  [carrierNonempty : Nonempty Carrier]
  [domainCert : IntegralDomainLaws Carrier]
  [orderCert : LinearOrderLaws Carrier]
  [strictCert : StrictOrderCompatibilityLaw Carrier]
  [addOrderCert : AdditionRespectsOrderLaws Carrier]
  [mulOrderCert : MultiplicationRespectsOrderLaws Carrier]
  [discreteCert : OrderDiscretenessLaw Carrier]
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
structure IntegerModel : Type (u + 1) where
  Carrier : Type u
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [ltInst : LT Carrier]
  [leInst : LE Carrier]
  [carrierNonempty : Nonempty Carrier]
  [domainCert : IntegralDomainLaws Carrier]
  [orderCert : LinearOrderLaws Carrier]
  [strictCert : StrictOrderCompatibilityLaw Carrier]
  [addOrderCert : AdditionRespectsOrderLaws Carrier]
  [mulOrderCert : MultiplicationRespectsOrderLaws Carrier]
  [discreteCert : OrderDiscretenessLaw Carrier]

attribute [instance] IntegerModel.addInst IntegerModel.mulInst
  IntegerModel.negInst IntegerModel.zeroInst IntegerModel.oneInst
  IntegerModel.ltInst IntegerModel.leInst IntegerModel.carrierNonempty
  IntegerModel.domainCert IntegerModel.orderCert IntegerModel.strictCert
  IntegerModel.addOrderCert IntegerModel.mulOrderCert IntegerModel.discreteCert

/--
`IntegerModel.ofCarrier` TODO

Predicate logic:

  def IntegerModel.ofCarrier (R : Type u)
      [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] [Nonempty R]
      [IntegralDomainLaws R] [LinearOrderLaws R] [StrictOrderCompatibilityLaw R]
      [AdditionRespectsOrderLaws R] [MultiplicationRespectsOrderLaws R]
      [OrderDiscretenessLaw R] : IntegerModel :=
    { Carrier := R }

Predicate logic (unfolded):

  def IntegerModel.ofCarrier (R : Type u)
      [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] [Nonempty R]
      [IntegralDomainLaws R] [LinearOrderLaws R] [StrictOrderCompatibilityLaw R]
      [AdditionRespectsOrderLaws R] [MultiplicationRespectsOrderLaws R]
      [OrderDiscretenessLaw R] : IntegerModel :=
    { Carrier := R } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def IntegerModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] [Nonempty R]
    [IntegralDomainLaws R] [LinearOrderLaws R] [StrictOrderCompatibilityLaw R]
    [AdditionRespectsOrderLaws R] [MultiplicationRespectsOrderLaws R]
    [OrderDiscretenessLaw R] : IntegerModel :=
  { Carrier := R }
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
def IntegerModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] [Nonempty R]
    [IntegralDomainLaws R] [LinearOrderLaws R] [StrictOrderCompatibilityLaw R]
    [AdditionRespectsOrderLaws R] [MultiplicationRespectsOrderLaws R]
    [OrderDiscretenessLaw R] : IntegerModel :=
  { Carrier := R }

/--
`IntegerModel.signature` TODO

Predicate logic:

  def IntegerModel.signature (M : IntegerModel) : OrderedRingSignature where
    carrier := M.Carrier
    zero := 0
    one := 1
    add := (· + ·)
    neg := (- ·)
    multiply := (· * ·)
    le := (· ≤ ·)
    StrictOrder := (· < ·)

Predicate logic (unfolded):

  def IntegerModel.signature (M : IntegerModel) : OrderedRingSignature where
    carrier := M.Carrier
    zero := 0
    one := 1
    add := (· + ·)
    neg := (- ·)
    multiply := (· * ·)
    le := (· ≤ ·)
    StrictOrder := (· < ·) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def IntegerModel.signature (M : IntegerModel) : OrderedRingSignature where
  carrier := M.Carrier
  zero := 0
  one := 1
  add := (· + ·)
  neg := (- ·)
  multiply := (· * ·)
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
def IntegerModel.signature (M : IntegerModel) : OrderedRingSignature where
  carrier := M.Carrier
  zero := 0
  one := 1
  add := (· + ·)
  neg := (- ·)
  multiply := (· * ·)
  le := (· ≤ ·)
  StrictOrder := (· < ·)

/--
`mathlibIntegerModel` TODO

Predicate logic:

  def mathlibIntegerModel : IntegerModel :=
    IntegerModel.ofCarrier Int

Predicate logic (unfolded):

  def mathlibIntegerModel : IntegerModel :=
    IntegerModel.ofCarrier Int (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def mathlibIntegerModel : IntegerModel :=
  IntegerModel.ofCarrier Int
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
def mathlibIntegerModel : IntegerModel :=
  IntegerModel.ofCarrier Int

end LRA.NumberSystems.Integers.Interface.ModelTheory
