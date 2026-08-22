import LRA.VolumeII.NumberSystems.Models

namespace LRA.NumberSystems.Models

universe u

/-!
`RationalModel` historically named the generic densely ordered field package.
That package is useful for model-theoretic quantification, but its old name
suggests that it characterizes the rational numbers. It does not: real fields
also satisfy the same structural laws.

`DenselyOrderedFieldModel` is therefore the preferred semantic name during the
migration. `RationalModel` remains available as a compatibility name until the
audited downstream call sites are separated into generic dense-field uses and
actual-rational-number uses.
-/

/-- A densely ordered field model. This is the preferred semantic name for the
existing generic `RationalModel` package.

Logical form:

```lean
abbrev DenselyOrderedFieldModel : Type (u + 1) := RationalModel
```
-/
abbrev DenselyOrderedFieldModel : Type (u + 1) := RationalModel

namespace DenselyOrderedFieldModel

/-- Package any carrier satisfying the generic densely ordered field laws.

Logical form:

```lean
def ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [LRA.AlgebraicStructures.OrderedFieldLaws R]
    [LRA.Order.StrictOrderCompatibilityLaw R]
    [LRA.Order.DenseOrderLaw R] : DenselyOrderedFieldModel :=
  RationalModel.ofCarrier R
```
-/
def ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [LRA.AlgebraicStructures.OrderedFieldLaws R]
    [LRA.Order.StrictOrderCompatibilityLaw R]
    [LRA.Order.DenseOrderLaw R] : DenselyOrderedFieldModel :=
  RationalModel.ofCarrier R

/-- The ordered-field signature of a densely ordered field model.

Logical form:

```lean
def signature (M : DenselyOrderedFieldModel) :
    LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.OrderedFieldSignature :=
  RationalModel.signature M
```
-/
def signature (M : DenselyOrderedFieldModel) :
    LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.OrderedFieldSignature :=
  RationalModel.signature M

end DenselyOrderedFieldModel

end LRA.NumberSystems.Models
