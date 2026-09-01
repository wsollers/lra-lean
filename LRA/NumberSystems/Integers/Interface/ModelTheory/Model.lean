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

/-- ℤ's own generic model: a carrier with the raw ring/order instances plus
the laws `DiscretelyOrderedIntegralDomainLaws` bundles, owned by `Integers`
rather than shared across number systems. -/
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

def IntegerModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] [Nonempty R]
    [IntegralDomainLaws R] [LinearOrderLaws R] [StrictOrderCompatibilityLaw R]
    [AdditionRespectsOrderLaws R] [MultiplicationRespectsOrderLaws R]
    [OrderDiscretenessLaw R] : IntegerModel :=
  { Carrier := R }

def IntegerModel.signature (M : IntegerModel) : OrderedRingSignature where
  carrier := M.Carrier
  zero := 0
  one := 1
  add := (· + ·)
  neg := (- ·)
  multiply := (· * ·)
  le := (· ≤ ·)
  StrictOrder := (· < ·)

def mathlibIntegerModel : IntegerModel :=
  IntegerModel.ofCarrier Int

end LRA.NumberSystems.Integers.Interface.ModelTheory
