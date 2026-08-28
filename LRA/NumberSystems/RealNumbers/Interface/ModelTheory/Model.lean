import LRA.NumberSystems.RealNumbers.Interface.ModelTheory.Theory
import LRA.AlgebraicStructures.OrderedField.Laws.Definition
import LRA.Order.Laws.StrictOrderCompatibility.Definition
import LRA.Order.Density.DenseOrder.Definition
import LRA.Order.Bounds.LeastUpperBoundProperty.CompletenessLaws
import LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.LStructure
import LRA.AlgebraicStructures.MathlibBridge
import LRA.Order.Interop.Mathlib.Certificates

namespace LRA.NumberSystems.RealNumbers.Interface.ModelTheory

open LRA.AlgebraicStructures (OrderedFieldLaws)
open LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory (OrderedFieldSignature)
open LRA.Order

universe u

/-- ℝ's own generic model: a carrier with the raw field/order instances plus
the laws a complete ordered field bundles, owned by `RealNumbers` rather than
shared across number systems. -/
structure RealModel : Type (u + 1) where
  Carrier : Type u
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [invInst : Inv Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [ltInst : LT Carrier]
  [leInst : LE Carrier]
  [carrierNonempty : Nonempty Carrier]
  [fieldCert : OrderedFieldLaws Carrier]
  [strictCert : StrictOrderCompatibilityLaw Carrier]
  [denseCert : DenseOrderLaw Carrier]
  [completeCert : OrderCompletenessLaws Carrier (Set Carrier)]

attribute [instance] RealModel.addInst RealModel.mulInst
  RealModel.negInst RealModel.invInst RealModel.zeroInst
  RealModel.oneInst RealModel.ltInst RealModel.leInst
  RealModel.carrierNonempty RealModel.fieldCert
  RealModel.strictCert RealModel.denseCert RealModel.completeCert

def RealModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [Nonempty R] [OrderedFieldLaws R] [StrictOrderCompatibilityLaw R]
    [DenseOrderLaw R] [OrderCompletenessLaws R (Set R)] : RealModel :=
  { Carrier := R }

def RealModel.signature (M : RealModel) : OrderedFieldSignature where
  carrier := M.Carrier
  zero := 0
  one := 1
  add := (· + ·)
  neg := (- ·)
  multiply := (· * ·)
  inv := (·⁻¹)
  le := (· ≤ ·)
  StrictOrder := (· < ·)

noncomputable def mathlibRealModel : RealModel :=
  RealModel.ofCarrier Real

end LRA.NumberSystems.RealNumbers.Interface.ModelTheory
