import LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.Theory
import LRA.AlgebraicStructures.OrderedField.Interface.Laws.Definition
import LRA.Order.Laws.StrictOrderCompatibility.Definition
import LRA.Order.Density.DenseOrder.Definition
import LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.LStructure
import LRA.AlgebraicStructures.MathlibBridge
import LRA.Order.Interop.Mathlib.Certificates

namespace LRA.NumberSystems.RationalNumbers.Interface.ModelTheory

open LRA.AlgebraicStructures (OrderedFieldLaws)
open LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory (OrderedFieldSignature)
open LRA.Order

universe u

/--
`RationalModel` ℚ's own generic model: a carrier with the raw field/order instances plus the laws a densely-ordered field bundles, owned by `RationalNumbers` rather than shared across number systems.

Predicate logic:

  structure RationalModel : Type (u + 1) where
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

Predicate logic (unfolded):

  structure RationalModel : Type (u + 1) where
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
    [denseCert : DenseOrderLaw Carrier] (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure RationalModel : Type (u + 1) where
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
structure RationalModel : Type (u + 1) where
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

attribute [instance] RationalModel.addInst RationalModel.mulInst
  RationalModel.negInst RationalModel.invInst RationalModel.zeroInst
  RationalModel.oneInst RationalModel.ltInst RationalModel.leInst
  RationalModel.carrierNonempty RationalModel.fieldCert
  RationalModel.strictCert RationalModel.denseCert

/--
`RationalModel.ofCarrier` TODO

Predicate logic:

  def RationalModel.ofCarrier (R : Type u)
      [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
      [Nonempty R] [OrderedFieldLaws R] [StrictOrderCompatibilityLaw R]
      [DenseOrderLaw R] : RationalModel :=
    { Carrier := R }

Predicate logic (unfolded):

  def RationalModel.ofCarrier (R : Type u)
      [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
      [Nonempty R] [OrderedFieldLaws R] [StrictOrderCompatibilityLaw R]
      [DenseOrderLaw R] : RationalModel :=
    { Carrier := R } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def RationalModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [Nonempty R] [OrderedFieldLaws R] [StrictOrderCompatibilityLaw R]
    [DenseOrderLaw R] : RationalModel :=
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
def RationalModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [Nonempty R] [OrderedFieldLaws R] [StrictOrderCompatibilityLaw R]
    [DenseOrderLaw R] : RationalModel :=
  { Carrier := R }

/--
`RationalModel.signature` TODO

Predicate logic:

  def RationalModel.signature (M : RationalModel) : OrderedFieldSignature where
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

  def RationalModel.signature (M : RationalModel) : OrderedFieldSignature where
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
def RationalModel.signature (M : RationalModel) : OrderedFieldSignature where
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
def RationalModel.signature (M : RationalModel) : OrderedFieldSignature where
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
`mathlibRationalModel` TODO

Predicate logic:

  def mathlibRationalModel : RationalModel :=
    RationalModel.ofCarrier Rat

Predicate logic (unfolded):

  def mathlibRationalModel : RationalModel :=
    RationalModel.ofCarrier Rat (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def mathlibRationalModel : RationalModel :=
  RationalModel.ofCarrier Rat
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
def mathlibRationalModel : RationalModel :=
  RationalModel.ofCarrier Rat

end LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
