import LRA.NumberSystems.RealNumbers.Interface.ModelTheory.Theory
import LRA.AlgebraicStructures.OrderedField.Interface.Laws.Definition
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

/--
`RealModel` ℝ's own generic model: a carrier with the raw field/order instances plus the laws a complete ordered field bundles, owned by `RealNumbers` rather than shared across number systems.

Predicate logic:

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

Predicate logic (unfolded):

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
    [completeCert : OrderCompletenessLaws Carrier (Set Carrier)] (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
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

/--
`RealModel.ofCarrier` TODO

Predicate logic:

  def RealModel.ofCarrier (R : Type u)
      [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
      [Nonempty R] [OrderedFieldLaws R] [StrictOrderCompatibilityLaw R]
      [DenseOrderLaw R] [OrderCompletenessLaws R (Set R)] : RealModel :=
    { Carrier := R }

Predicate logic (unfolded):

  def RealModel.ofCarrier (R : Type u)
      [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
      [Nonempty R] [OrderedFieldLaws R] [StrictOrderCompatibilityLaw R]
      [DenseOrderLaw R] [OrderCompletenessLaws R (Set R)] : RealModel :=
    { Carrier := R } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def RealModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [Nonempty R] [OrderedFieldLaws R] [StrictOrderCompatibilityLaw R]
    [DenseOrderLaw R] [OrderCompletenessLaws R (Set R)] : RealModel :=
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
def RealModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [Nonempty R] [OrderedFieldLaws R] [StrictOrderCompatibilityLaw R]
    [DenseOrderLaw R] [OrderCompletenessLaws R (Set R)] : RealModel :=
  { Carrier := R }

/--
`RealModel.signature` TODO

Predicate logic:

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

Predicate logic (unfolded):

  def RealModel.signature (M : RealModel) : OrderedFieldSignature where
    carrier := M.Carrier
    zero := 0
    one := 1
    add := (· + ·)
    neg := (- ·)
    multiply := (· * ·)
    inv := (·⁻¹)
    le := (· ≤ ·)
    StrictOrder := (· < ·) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
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

/--
`mathlibRealModel` TODO

Predicate logic:

  noncomputable def mathlibRealModel : RealModel :=
    RealModel.ofCarrier Real

Predicate logic (unfolded):

  noncomputable def mathlibRealModel : RealModel :=
    RealModel.ofCarrier Real (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def mathlibRealModel : RealModel :=
  RealModel.ofCarrier Real
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
noncomputable def mathlibRealModel : RealModel :=
  RealModel.ofCarrier Real

end LRA.NumberSystems.RealNumbers.Interface.ModelTheory
