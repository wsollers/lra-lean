-- LRA/VolumeII/NumberSystems/ComparisonMatrix.lean
-- Formal ledger for comparing number systems and canonical maps.

import LRA.VolumeII.NumberSystems.CharacteristicCardinality
import LRA.VolumeII.NumberSystems.CanonicalEmbeddings

namespace LRA.NumberSystems.Models.ComparisonMatrix

/-!
Volume II label: number-system-comparison-matrix
Lean module: LRA.NumberSystems.Models.ComparisonMatrix
Source: docs/number-systems/gpt-10-comparison-matrix.md
Verification status: statement-accepted-proof-pending
-/
/--
`SystemLedger` exposes this formal declaration.

Logical form:

```lean
structure SystemLedger (carrier : Type _) where
  HasAdditiveStructure : Prop
  HasMultiplicativeStructure : Prop
  HasRingOrFieldStructure : Prop
  HasOrder : Prop
  HasCompletenessProperty : Prop
  HasCharacteristicZero : Prop
  CardinalityStatement : Prop
```
-/

structure SystemLedger (carrier : Type _) where
  HasAdditiveStructure : Prop
  HasMultiplicativeStructure : Prop
  HasRingOrFieldStructure : Prop
  HasOrder : Prop
  HasCompletenessProperty : Prop
  HasCharacteristicZero : Prop
  CardinalityStatement : Prop
/--
`CanonicalMapLedger` exposes this formal declaration.

Logical form:

```lean
structure CanonicalMapLedger {source target : Type}
    (map : source → target) where
  injective : Prop
  PreservesAddition : Prop
  PreservesMultiplication : Prop
  PreservesIdentities : Prop
  PreservesAndReflectsOrder : Prop
  DenseImage : Prop
  UniversalRole : Prop
```
-/

structure CanonicalMapLedger {source target : Type}
    (map : source → target) where
  injective : Prop
  PreservesAddition : Prop
  PreservesMultiplication : Prop
  PreservesIdentities : Prop
  PreservesAndReflectsOrder : Prop
  DenseImage : Prop
  UniversalRole : Prop

/--
`ZQRComparisonMatrix` ties the system and map ledgers to the exact carriers and
canonical embeddings selected in a Z/Q/R tower.

Logical form:

```lean
structure ZQRComparisonMatrix
    (SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel)
    (SelectedArchimedeanDenseOrderedFieldExtension :
      ArchimedeanDenseOrderedFieldExtension SelectedIntegerModel)
    (SelectedCofinalRealExtension :
      CofinalRealExtension
        SelectedArchimedeanDenseOrderedFieldExtension.DenselyOrderedFieldModel)
    where
  IntegerLedger : SystemLedger SelectedIntegerModel.Carrier
  RationalLedger :
    SystemLedger
      SelectedArchimedeanDenseOrderedFieldExtension.DenselyOrderedFieldModel.Carrier
  RealLedger : SystemLedger SelectedCofinalRealExtension.RealModel.Carrier
  IntegerToRationalLedger :
    CanonicalMapLedger
      SelectedArchimedeanDenseOrderedFieldExtension.IntegerEmbedding.ToField
  RationalToRealLedger :
    CanonicalMapLedger
      SelectedCofinalRealExtension.DenseOrderedFieldEmbedding.ToReal
```
-/
structure ZQRComparisonMatrix
    (SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel)
    (SelectedArchimedeanDenseOrderedFieldExtension :
      ArchimedeanDenseOrderedFieldExtension SelectedIntegerModel)
    (SelectedCofinalRealExtension :
      CofinalRealExtension
        SelectedArchimedeanDenseOrderedFieldExtension.DenselyOrderedFieldModel)
    where
  IntegerLedger : SystemLedger SelectedIntegerModel.Carrier
  RationalLedger :
    SystemLedger
      SelectedArchimedeanDenseOrderedFieldExtension.DenselyOrderedFieldModel.Carrier
  RealLedger : SystemLedger SelectedCofinalRealExtension.RealModel.Carrier
  IntegerToRationalLedger :
    CanonicalMapLedger
      SelectedArchimedeanDenseOrderedFieldExtension.IntegerEmbedding.ToField
  RationalToRealLedger :
    CanonicalMapLedger
      SelectedCofinalRealExtension.DenseOrderedFieldEmbedding.ToReal
/--
`ComparisonMatrixForZQR` exposes this formal declaration.

Logical form:

```lean
theorem ComparisonMatrixForZQR
    (SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel)
    (SelectedArchimedeanDenseOrderedFieldExtension : ArchimedeanDenseOrderedFieldExtension SelectedIntegerModel)
    (SelectedCofinalRealExtension : CofinalRealExtension SelectedArchimedeanDenseOrderedFieldExtension.DenselyOrderedFieldModel) :
    Nonempty
      (ZQRComparisonMatrix
        SelectedIntegerModel
        SelectedArchimedeanDenseOrderedFieldExtension
        SelectedCofinalRealExtension)
```
-/

theorem ComparisonMatrixForZQR
    (SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel)
    (SelectedArchimedeanDenseOrderedFieldExtension : ArchimedeanDenseOrderedFieldExtension SelectedIntegerModel)
    (SelectedCofinalRealExtension : CofinalRealExtension SelectedArchimedeanDenseOrderedFieldExtension.DenselyOrderedFieldModel) :
    Nonempty
      (ZQRComparisonMatrix
        SelectedIntegerModel
        SelectedArchimedeanDenseOrderedFieldExtension
        SelectedCofinalRealExtension) := by
  sorry

end LRA.NumberSystems.Models.ComparisonMatrix
