import LRA.NumberSystems.Carriers.Definition
import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.Laws
import LRA.NumberSystems.WholeNumbers.Constructions.Landau
import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs
import LRA.NumberSystems.Integers.Constructions.Tao
import LRA.NumberSystems.Integers.Constructions.Mendelson
import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions
import LRA.NumberSystems.RealNumbers.Constructions.Cantor
import LRA.NumberSystems.RealNumbers.Constructions.Dedekind
import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals
import LRA.NumberSystems.RealNumbers.Constructions.EffectiveCauchy
import LRA.NumberSystems.RealNumbers.Constructions.Cauchy
import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

namespace LRA.NumberSystems.Carriers

open LRA.NumberSystems.NaturalNumbers.Constructions.Landau
open LRA.Set
open LRA.Set.Constructions

/--
`landauNaturalArithmeticForWholeNumbers` TODO

Predicate logic:

  noncomputable def landauNaturalArithmeticForWholeNumbers :
    LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers
      LandauElement (TypeSet LandauElement) where
  model := LandauPeanoSystem
  strictOrder := LandauLessThan LandauPeanoSystem
  strictOrder_trichotomous := LandauLessThanTrichotomous LandauPeanoSystem
  strictOrder_transitive := LandauLessThanTransitive LandauPeanoSystem
  addition_preserves_and_reflects_strictOrder :=
    LandauAdditionPreservesAndReflectsLandauLessThan LandauPeanoSystem
  multiplication_preserves_and_reflects_strictOrder :=
    LandauMultiplicationPreservesAndReflectsLandauLessThan LandauPeanoSystem

Predicate logic (unfolded):

  noncomputable def landauNaturalArithmeticForWholeNumbers :
    LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers
      LandauElement (TypeSet LandauElement) where
  model := LandauPeanoSystem
  strictOrder := LandauLessThan LandauPeanoSystem
  strictOrder_trichotomous := LandauLessThanTrichotomous LandauPeanoSystem
  strictOrder_transitive := LandauLessThanTransitive LandauPeanoSystem
  addition_preserves_and_reflects_strictOrder :=
    LandauAdditionPreservesAndReflectsLandauLessThan LandauPeanoSystem
  multiplication_preserves_and_reflects_strictOrder :=
    LandauMultiplicationPreservesAndReflectsLandauLessThan LandauPeanoSystem (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def landauNaturalArithmeticForWholeNumbers :
    LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers
      LandauElement (TypeSet LandauElement) where
  model := LandauPeanoSystem
  strictOrder := LandauLessThan LandauPeanoSystem
  strictOrder_trichotomous := LandauLessThanTrichotomous LandauPeanoSystem
  strictOrder_transitive := LandauLessThanTransitive LandauPeanoSystem
  addition_preserves_and_reflects_strictOrder :=
    LandauAdditionPreservesAndReflectsLandauLessThan LandauPeanoSystem
  multiplication_preserves_and_reflects_strictOrder :=
    LandauMultiplicationPreservesAndReflectsLandauLessThan LandauPeanoSystem
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
noncomputable def landauNaturalArithmeticForWholeNumbers :
    LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers
      LandauElement (TypeSet LandauElement) where
  model := LandauPeanoSystem
  strictOrder := LandauLessThan LandauPeanoSystem
  strictOrder_trichotomous := LandauLessThanTrichotomous LandauPeanoSystem
  strictOrder_transitive := LandauLessThanTransitive LandauPeanoSystem
  addition_preserves_and_reflects_strictOrder :=
    LandauAdditionPreservesAndReflectsLandauLessThan LandauPeanoSystem
  multiplication_preserves_and_reflects_strictOrder :=
    LandauMultiplicationPreservesAndReflectsLandauLessThan LandauPeanoSystem

/--
`N_0_Landau` TODO

Predicate logic:

  abbrev N_0_Landau :=
  LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier
    landauNaturalArithmeticForWholeNumbers

Predicate logic (unfolded):

  abbrev N_0_Landau :=
  LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier
    landauNaturalArithmeticForWholeNumbers (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev N_0_Landau :=
  LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier
    landauNaturalArithmeticForWholeNumbers
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
abbrev N_0_Landau :=
  LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier
    landauNaturalArithmeticForWholeNumbers

abbrev W_LRA := N_0_Landau

abbrev W := W_LRA

/--
`landauWholeNumberArithmeticForQuotientPairs` TODO

Predicate logic:

  noncomputable def landauWholeNumberArithmeticForQuotientPairs :
    LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs :=
  LRA.NumberSystems.WholeNumbers.Constructions.Landau.quotientOrderedPairsInput
    landauNaturalArithmeticForWholeNumbers

Predicate logic (unfolded):

  noncomputable def landauWholeNumberArithmeticForQuotientPairs :
    LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs :=
  LRA.NumberSystems.WholeNumbers.Constructions.Landau.quotientOrderedPairsInput
    landauNaturalArithmeticForWholeNumbers (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def landauWholeNumberArithmeticForQuotientPairs :
    LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs :=
  LRA.NumberSystems.WholeNumbers.Constructions.Landau.quotientOrderedPairsInput
    landauNaturalArithmeticForWholeNumbers
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
noncomputable def landauWholeNumberArithmeticForQuotientPairs :
    LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs :=
  LRA.NumberSystems.WholeNumbers.Constructions.Landau.quotientOrderedPairsInput
    landauNaturalArithmeticForWholeNumbers

/--
`Z_QuotientOrderedPairs` TODO

Predicate logic:

  abbrev Z_QuotientOrderedPairs :=
  LRA.NumberSystems.Integers.QuotientOrderedPairs.Carrier
    landauWholeNumberArithmeticForQuotientPairs

Predicate logic (unfolded):

  abbrev Z_QuotientOrderedPairs :=
  LRA.NumberSystems.Integers.QuotientOrderedPairs.Carrier
    landauWholeNumberArithmeticForQuotientPairs (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Z_QuotientOrderedPairs :=
  LRA.NumberSystems.Integers.QuotientOrderedPairs.Carrier
    landauWholeNumberArithmeticForQuotientPairs
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
abbrev Z_QuotientOrderedPairs :=
  LRA.NumberSystems.Integers.QuotientOrderedPairs.Carrier
    landauWholeNumberArithmeticForQuotientPairs

/-!
`Tao.WholeNumberArithmeticForTaoFormalDifferences` and
`Mendelson.PositiveNaturalPairData` are both plain `abbrev`s for
`QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs`
(see `Integers/Constructions/Tao/Carrier.lean` and
`Integers/Constructions/Mendelson/Carrier.lean`), so the same
`landauWholeNumberArithmeticForQuotientPairs` witness grounds them too.
-/

/--
`Z_Tao` TODO

Predicate logic:

  abbrev Z_Tao :=
  LRA.NumberSystems.Integers.Tao.Carrier
    landauWholeNumberArithmeticForQuotientPairs

Predicate logic (unfolded):

  abbrev Z_Tao :=
  LRA.NumberSystems.Integers.Tao.Carrier
    landauWholeNumberArithmeticForQuotientPairs (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Z_Tao :=
  LRA.NumberSystems.Integers.Tao.Carrier
    landauWholeNumberArithmeticForQuotientPairs
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
abbrev Z_Tao :=
  LRA.NumberSystems.Integers.Tao.Carrier
    landauWholeNumberArithmeticForQuotientPairs

/--
`Z_Mendelson` TODO

Predicate logic:

  abbrev Z_Mendelson :=
  LRA.NumberSystems.Integers.Mendelson.Carrier
    landauWholeNumberArithmeticForQuotientPairs

Predicate logic (unfolded):

  abbrev Z_Mendelson :=
  LRA.NumberSystems.Integers.Mendelson.Carrier
    landauWholeNumberArithmeticForQuotientPairs (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Z_Mendelson :=
  LRA.NumberSystems.Integers.Mendelson.Carrier
    landauWholeNumberArithmeticForQuotientPairs
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
abbrev Z_Mendelson :=
  LRA.NumberSystems.Integers.Mendelson.Carrier
    landauWholeNumberArithmeticForQuotientPairs

/-!
`RationalQuotientFractions` needs an `IntegerNumberSystem`, not just a bare
`DiscretelyOrderedIntegralDomainModel` — the extra field is
`EveryElementIsIntegerNumeral`. `QuotientOrderedPairs/Instances.lean`
already had a concrete (non-`Classical.choose`) model builder
(`QuotientOrderedPairsRealizesIntegerModel`); it only needed that one
extra field wrapped around it, added there as
`QuotientOrderedPairsRealizesIntegerNumberSystem`. (`Tao` and `Mendelson`
only have *existence* theorems for `IntegerNumberSystem`
(`TaoRealizesIntegerNumberSystem`/`MendelsonRealizesIntegerNumberSystem`),
so a concrete natural-number embedding into their `Classical.choose`d,
opaque model isn't expressible — `QuotientOrderedPairs` is the only ℤ
construction usable here.)
-/

/--
`landauIntegerNumberSystem` TODO

Predicate logic:

  noncomputable def landauIntegerNumberSystem :
    LRA.NumberSystems.Integers.IntegerNumberSystem :=
  LRA.NumberSystems.Integers.QuotientOrderedPairs.QuotientOrderedPairsRealizesIntegerNumberSystem
    landauWholeNumberArithmeticForQuotientPairs

Predicate logic (unfolded):

  noncomputable def landauIntegerNumberSystem :
    LRA.NumberSystems.Integers.IntegerNumberSystem :=
  LRA.NumberSystems.Integers.QuotientOrderedPairs.QuotientOrderedPairsRealizesIntegerNumberSystem
    landauWholeNumberArithmeticForQuotientPairs (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def landauIntegerNumberSystem :
    LRA.NumberSystems.Integers.IntegerNumberSystem :=
  LRA.NumberSystems.Integers.QuotientOrderedPairs.QuotientOrderedPairsRealizesIntegerNumberSystem
    landauWholeNumberArithmeticForQuotientPairs
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
noncomputable def landauIntegerNumberSystem :
    LRA.NumberSystems.Integers.IntegerNumberSystem :=
  LRA.NumberSystems.Integers.QuotientOrderedPairs.QuotientOrderedPairsRealizesIntegerNumberSystem
    landauWholeNumberArithmeticForQuotientPairs

/--
`landauNaturalToInteger` TODO

Predicate logic:

  noncomputable def landauNaturalToInteger (value : LandauElement) :
    landauIntegerNumberSystem.Model.Carrier :=
  LRA.NumberSystems.Integers.QuotientOrderedPairs.embed
    landauWholeNumberArithmeticForQuotientPairs
    (LRA.NumberSystems.WholeNumbers.Constructions.Landau.naturalEmbedding
      landauNaturalArithmeticForWholeNumbers value)

Predicate logic (unfolded):

  noncomputable def landauNaturalToInteger (value : LandauElement) :
    landauIntegerNumberSystem.Model.Carrier :=
  LRA.NumberSystems.Integers.QuotientOrderedPairs.embed
    landauWholeNumberArithmeticForQuotientPairs
    (LRA.NumberSystems.WholeNumbers.Constructions.Landau.naturalEmbedding
      landauNaturalArithmeticForWholeNumbers value) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def landauNaturalToInteger (value : LandauElement) :
    landauIntegerNumberSystem.Model.Carrier :=
  LRA.NumberSystems.Integers.QuotientOrderedPairs.embed
    landauWholeNumberArithmeticForQuotientPairs
    (LRA.NumberSystems.WholeNumbers.Constructions.Landau.naturalEmbedding
      landauNaturalArithmeticForWholeNumbers value)
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
noncomputable def landauNaturalToInteger (value : LandauElement) :
    landauIntegerNumberSystem.Model.Carrier :=
  LRA.NumberSystems.Integers.QuotientOrderedPairs.embed
    landauWholeNumberArithmeticForQuotientPairs
    (LRA.NumberSystems.WholeNumbers.Constructions.Landau.naturalEmbedding
      landauNaturalArithmeticForWholeNumbers value)

/--
`landauNaturalToIntegerIsPositive` TODO

Predicate logic:

  ∀ denominator : LandauElement, 0 < landauNaturalToInteger denominator

Predicate logic (unfolded):

  ∀ (denominator : LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauElement), LRA.NumberSystems.Carriers.landauIntegerNumberSystem.Model.ltInst.1 LRA.NumberSystems.Carriers.landauIntegerNumberSystem.Model.zeroInst.1 (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid LRA.NumberSystems.Carriers.landauWholeNumberArithmeticForQuotientPairs).1 { positive_coordinate := Option.some denominator, negative_coordinate := LRA.NumberSystems.Carriers.landauWholeNumberArithmeticForQuotientPairs.2 })

Logical form (Lean):

```lean
theorem landauNaturalToIntegerIsPositive :
    ∀ denominator : LandauElement,
      0 < landauNaturalToInteger denominator
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem landauNaturalToIntegerIsPositive :
    ∀ denominator : LandauElement,
      0 < landauNaturalToInteger denominator := by
  sorry

/--
`landauEveryPositiveIntegerHasLandauDenominator` TODO

Predicate logic:

  ∀ integer : landauIntegerNumberSystem.Model.Carrier, 0 < integer → ∃ denominator ∈ LandauElement, landauNaturalToInteger denominator = integer

Predicate logic (unfolded):

  ∀ (integer : LRA.NumberSystems.Carriers.landauIntegerNumberSystem.Model.1), LRA.NumberSystems.Carriers.landauIntegerNumberSystem.Model.ltInst.1 LRA.NumberSystems.Carriers.landauIntegerNumberSystem.Model.zeroInst.1 integer → Exists fun denominator => Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid LRA.NumberSystems.Carriers.landauWholeNumberArithmeticForQuotientPairs).1 { positive_coordinate := Option.some denominator, negative_coordinate := LRA.NumberSystems.Carriers.landauWholeNumberArithmeticForQuotientPairs.2 } = integer

Logical form (Lean):

```lean
theorem landauEveryPositiveIntegerHasLandauDenominator :
    ∀ integer : landauIntegerNumberSystem.Model.Carrier,
      0 < integer →
      ∃ denominator : LandauElement,
        landauNaturalToInteger denominator = integer
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem landauEveryPositiveIntegerHasLandauDenominator :
    ∀ integer : landauIntegerNumberSystem.Model.Carrier,
      0 < integer →
      ∃ denominator : LandauElement,
        landauNaturalToInteger denominator = integer := by
  sorry

/--
`landauNaturalToIntegerOneMapsToOne` TODO

Predicate logic:

  landauNaturalToInteger LandauPeanoSystem.base = 1

Predicate logic (unfolded):

  Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid LRA.NumberSystems.Carriers.landauWholeNumberArithmeticForQuotientPairs).1 { positive_coordinate := Option.some LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauPeanoSystem.1, negative_coordinate := LRA.NumberSystems.Carriers.landauWholeNumberArithmeticForQuotientPairs.2 } = LRA.NumberSystems.Carriers.landauIntegerNumberSystem.Model.oneInst.1

Logical form (Lean):

```lean
theorem landauNaturalToIntegerOneMapsToOne :
    landauNaturalToInteger LandauPeanoSystem.base = 1
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
theorem landauNaturalToIntegerOneMapsToOne :
    landauNaturalToInteger LandauPeanoSystem.base = 1 := by
  sorry

/--
`landauNaturalToIntegerPreservesMultiplication` TODO

Predicate logic:

  ∀ first second : LandauElement, landauNaturalToInteger (LandauMultiplication LandauPeanoSystem first second) = landauNaturalToInteger first * landauNaturalToInteger second

Predicate logic (unfolded):

  ∀ (first second : LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauElement), Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid LRA.NumberSystems.Carriers.landauWholeNumberArithmeticForQuotientPairs).1 { positive_coordinate := Option.some ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauPeanoSystem LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauElement LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauElement (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauPeanoSystem value left) ⋯).val first second), negative_coordinate := LRA.NumberSystems.Carriers.landauWholeNumberArithmeticForQuotientPairs.2 } = instHMul.1 (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid LRA.NumberSystems.Carriers.landauWholeNumberArithmeticForQuotientPairs).1 { positive_coordinate := Option.some first, negative_coordinate := LRA.NumberSystems.Carriers.landauWholeNumberArithmeticForQuotientPairs.2 }) (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid LRA.NumberSystems.Carriers.landauWholeNumberArithmeticForQuotientPairs).1 { positive_coordinate := Option.some second, negative_coordinate := LRA.NumberSystems.Carriers.landauWholeNumberArithmeticForQuotientPairs.2 })

Logical form (Lean):

```lean
theorem landauNaturalToIntegerPreservesMultiplication :
    ∀ first second : LandauElement,
      landauNaturalToInteger (LandauMultiplication LandauPeanoSystem first second) =
        landauNaturalToInteger first * landauNaturalToInteger second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem landauNaturalToIntegerPreservesMultiplication :
    ∀ first second : LandauElement,
      landauNaturalToInteger (LandauMultiplication LandauPeanoSystem first second) =
        landauNaturalToInteger first * landauNaturalToInteger second := by
  sorry

/--
`landauIntegerAndPositiveNaturalData` TODO

Predicate logic:

  noncomputable def landauIntegerAndPositiveNaturalData :
    LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData where
  integer_system := landauIntegerNumberSystem
  natural_carrier := LandauElement
  one := LandauPeanoSystem.base
  multiplication := LandauMultiplication LandauPeanoSystem
  to_integer := landauNaturalToInteger
  denominator_is_positive := landauNaturalToIntegerIsPositive
  every_positive_integer_has_denominator := landauEveryPositiveIntegerHasLandauDenominator
  one_maps_to_one := landauNaturalToIntegerOneMapsToOne
  multiplication_is_preserved := landauNaturalToIntegerPreservesMultiplication

Predicate logic (unfolded):

  noncomputable def landauIntegerAndPositiveNaturalData :
    LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData where
  integer_system := landauIntegerNumberSystem
  natural_carrier := LandauElement
  one := LandauPeanoSystem.base
  multiplication := LandauMultiplication LandauPeanoSystem
  to_integer := landauNaturalToInteger
  denominator_is_positive := landauNaturalToIntegerIsPositive
  every_positive_integer_has_denominator := landauEveryPositiveIntegerHasLandauDenominator
  one_maps_to_one := landauNaturalToIntegerOneMapsToOne
  multiplication_is_preserved := landauNaturalToIntegerPreservesMultiplication (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def landauIntegerAndPositiveNaturalData :
    LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData where
  integer_system := landauIntegerNumberSystem
  natural_carrier := LandauElement
  one := LandauPeanoSystem.base
  multiplication := LandauMultiplication LandauPeanoSystem
  to_integer := landauNaturalToInteger
  denominator_is_positive := landauNaturalToIntegerIsPositive
  every_positive_integer_has_denominator := landauEveryPositiveIntegerHasLandauDenominator
  one_maps_to_one := landauNaturalToIntegerOneMapsToOne
  multiplication_is_preserved := landauNaturalToIntegerPreservesMultiplication
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
noncomputable def landauIntegerAndPositiveNaturalData :
    LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData where
  integer_system := landauIntegerNumberSystem
  natural_carrier := LandauElement
  one := LandauPeanoSystem.base
  multiplication := LandauMultiplication LandauPeanoSystem
  to_integer := landauNaturalToInteger
  denominator_is_positive := landauNaturalToIntegerIsPositive
  every_positive_integer_has_denominator := landauEveryPositiveIntegerHasLandauDenominator
  one_maps_to_one := landauNaturalToIntegerOneMapsToOne
  multiplication_is_preserved := landauNaturalToIntegerPreservesMultiplication

/--
`Q_RationalQuotientFractions` TODO

Predicate logic:

  abbrev Q_RationalQuotientFractions :=
  LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Carrier
    landauIntegerAndPositiveNaturalData

Predicate logic (unfolded):

  abbrev Q_RationalQuotientFractions :=
  LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Carrier
    landauIntegerAndPositiveNaturalData (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Q_RationalQuotientFractions :=
  LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Carrier
    landauIntegerAndPositiveNaturalData
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
abbrev Q_RationalQuotientFractions :=
  LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Carrier
    landauIntegerAndPositiveNaturalData

/--
`Q` TODO

Predicate logic:

  abbrev Q := Q_RationalQuotientFractions

Predicate logic (unfolded):

  abbrev Q := Q_RationalQuotientFractions (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Q := Q_RationalQuotientFractions
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
abbrev Q := Q_RationalQuotientFractions

abbrev Q_LRA := Q

/-!
Three of `RealNumbers`'s six constructions (`Cantor`, `Dedekind`,
`PrimitiveIntervals`) need nothing beyond a bare
`DenselyOrderedFieldModel` — no separate `RationalMetricData`/
`RationalDyadicApproximationData`-style extra witness. That model is
exactly what `RationalQuotientFractions/Instances.lean` already builds
generically from any `IntegerAndPositiveNaturalData`, so
`landauIntegerAndPositiveNaturalData` grounds all three directly.
(`Cauchy` and `EffectiveCauchy` need a bit more — see below. `Dyadic`
needs a fully realized `RationalRealExtension` on top of that and is
deferred — see the audit doc.)
-/

/--
`landauDenselyOrderedFieldModel` TODO

Predicate logic:

  noncomputable def landauDenselyOrderedFieldModel :
    LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel :=
  LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.RationalQuotientFractionsRealizesRationalModel
    landauIntegerAndPositiveNaturalData

Predicate logic (unfolded):

  noncomputable def landauDenselyOrderedFieldModel :
    LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel :=
  LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.RationalQuotientFractionsRealizesRationalModel
    landauIntegerAndPositiveNaturalData (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def landauDenselyOrderedFieldModel :
    LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel :=
  LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.RationalQuotientFractionsRealizesRationalModel
    landauIntegerAndPositiveNaturalData
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
noncomputable def landauDenselyOrderedFieldModel :
    LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel :=
  LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.RationalQuotientFractionsRealizesRationalModel
    landauIntegerAndPositiveNaturalData

/--
`R_Cantor` TODO

Predicate logic:

  abbrev R_Cantor :=
  LRA.NumberSystems.RealNumbers.Cantor.Carrier landauDenselyOrderedFieldModel

Predicate logic (unfolded):

  abbrev R_Cantor :=
  LRA.NumberSystems.RealNumbers.Cantor.Carrier landauDenselyOrderedFieldModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev R_Cantor :=
  LRA.NumberSystems.RealNumbers.Cantor.Carrier landauDenselyOrderedFieldModel
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
abbrev R_Cantor :=
  LRA.NumberSystems.RealNumbers.Cantor.Carrier landauDenselyOrderedFieldModel

/--
`landauCantorRealModel` TODO

Predicate logic:

  noncomputable def landauCantorRealModel :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  LRA.NumberSystems.RealNumbers.Cantor.CantorRealizesRealModel landauDenselyOrderedFieldModel

Predicate logic (unfolded):

  noncomputable def landauCantorRealModel :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  LRA.NumberSystems.RealNumbers.Cantor.CantorRealizesRealModel landauDenselyOrderedFieldModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def landauCantorRealModel :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  LRA.NumberSystems.RealNumbers.Cantor.CantorRealizesRealModel landauDenselyOrderedFieldModel
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
noncomputable def landauCantorRealModel :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  LRA.NumberSystems.RealNumbers.Cantor.CantorRealizesRealModel landauDenselyOrderedFieldModel

/--
`R_Dedekind` TODO

Predicate logic:

  abbrev R_Dedekind :=
  LRA.NumberSystems.RealNumbers.Dedekind.Cut landauDenselyOrderedFieldModel

Predicate logic (unfolded):

  abbrev R_Dedekind :=
  LRA.NumberSystems.RealNumbers.Dedekind.Cut landauDenselyOrderedFieldModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev R_Dedekind :=
  LRA.NumberSystems.RealNumbers.Dedekind.Cut landauDenselyOrderedFieldModel
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
abbrev R_Dedekind :=
  LRA.NumberSystems.RealNumbers.Dedekind.Cut landauDenselyOrderedFieldModel

/--
`landauDedekindRealModel` TODO

Predicate logic:

  noncomputable def landauDedekindRealModel :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  LRA.NumberSystems.RealNumbers.Dedekind.DedekindRealizesRealModel landauDenselyOrderedFieldModel

Predicate logic (unfolded):

  noncomputable def landauDedekindRealModel :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  LRA.NumberSystems.RealNumbers.Dedekind.DedekindRealizesRealModel landauDenselyOrderedFieldModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def landauDedekindRealModel :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  LRA.NumberSystems.RealNumbers.Dedekind.DedekindRealizesRealModel landauDenselyOrderedFieldModel
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
noncomputable def landauDedekindRealModel :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  LRA.NumberSystems.RealNumbers.Dedekind.DedekindRealizesRealModel landauDenselyOrderedFieldModel

/--
`R_PrimitiveIntervals` TODO

Predicate logic:

  abbrev R_PrimitiveIntervals :=
  LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Carrier landauDenselyOrderedFieldModel

Predicate logic (unfolded):

  abbrev R_PrimitiveIntervals :=
  LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Carrier landauDenselyOrderedFieldModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev R_PrimitiveIntervals :=
  LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Carrier landauDenselyOrderedFieldModel
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
abbrev R_PrimitiveIntervals :=
  LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Carrier landauDenselyOrderedFieldModel

/--
`landauPrimitiveIntervalsRealModel` TODO

Predicate logic:

  noncomputable def landauPrimitiveIntervalsRealModel :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  LRA.NumberSystems.RealNumbers.PrimitiveIntervals.PrimitiveIntervalsRealizesRealModel
    landauDenselyOrderedFieldModel

Predicate logic (unfolded):

  noncomputable def landauPrimitiveIntervalsRealModel :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  LRA.NumberSystems.RealNumbers.PrimitiveIntervals.PrimitiveIntervalsRealizesRealModel
    landauDenselyOrderedFieldModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def landauPrimitiveIntervalsRealModel :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  LRA.NumberSystems.RealNumbers.PrimitiveIntervals.PrimitiveIntervalsRealizesRealModel
    landauDenselyOrderedFieldModel
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
noncomputable def landauPrimitiveIntervalsRealModel :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  LRA.NumberSystems.RealNumbers.PrimitiveIntervals.PrimitiveIntervalsRealizesRealModel
    landauDenselyOrderedFieldModel

/-!
`EffectiveCauchy` needs only a bare `RationalNumberSystem` (no extra
metric/embedding data), which `RationalQuotientFractionsRealizesRationalNumberSystem`
already builds generically.
-/

/--
`landauRationalNumberSystem` TODO

Predicate logic:

  noncomputable def landauRationalNumberSystem :
    LRA.NumberSystems.RationalNumbers.RationalNumberSystem :=
  LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.RationalQuotientFractionsRealizesRationalNumberSystem
    landauIntegerAndPositiveNaturalData

Predicate logic (unfolded):

  noncomputable def landauRationalNumberSystem :
    LRA.NumberSystems.RationalNumbers.RationalNumberSystem :=
  LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.RationalQuotientFractionsRealizesRationalNumberSystem
    landauIntegerAndPositiveNaturalData (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def landauRationalNumberSystem :
    LRA.NumberSystems.RationalNumbers.RationalNumberSystem :=
  LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.RationalQuotientFractionsRealizesRationalNumberSystem
    landauIntegerAndPositiveNaturalData
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
noncomputable def landauRationalNumberSystem :
    LRA.NumberSystems.RationalNumbers.RationalNumberSystem :=
  LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.RationalQuotientFractionsRealizesRationalNumberSystem
    landauIntegerAndPositiveNaturalData

/--
`R_EffectiveCauchy` TODO

Predicate logic:

  abbrev R_EffectiveCauchy :=
  LRA.NumberSystems.RealNumbers.EffectiveCauchy.EffectiveCauchyReal
    landauRationalNumberSystem

Predicate logic (unfolded):

  abbrev R_EffectiveCauchy :=
  LRA.NumberSystems.RealNumbers.EffectiveCauchy.EffectiveCauchyReal
    landauRationalNumberSystem (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev R_EffectiveCauchy :=
  LRA.NumberSystems.RealNumbers.EffectiveCauchy.EffectiveCauchyReal
    landauRationalNumberSystem
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
abbrev R_EffectiveCauchy :=
  LRA.NumberSystems.RealNumbers.EffectiveCauchy.EffectiveCauchyReal
    landauRationalNumberSystem

/--
`landauEffectiveCauchyRealModel` TODO

Predicate logic:

  noncomputable def landauEffectiveCauchyRealModel :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  LRA.NumberSystems.RealNumbers.EffectiveCauchy.EffectiveCauchyRealizesRealModel
    landauRationalNumberSystem

Predicate logic (unfolded):

  noncomputable def landauEffectiveCauchyRealModel :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  LRA.NumberSystems.RealNumbers.EffectiveCauchy.EffectiveCauchyRealizesRealModel
    landauRationalNumberSystem (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def landauEffectiveCauchyRealModel :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  LRA.NumberSystems.RealNumbers.EffectiveCauchy.EffectiveCauchyRealizesRealModel
    landauRationalNumberSystem
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
noncomputable def landauEffectiveCauchyRealModel :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  LRA.NumberSystems.RealNumbers.EffectiveCauchy.EffectiveCauchyRealizesRealModel
    landauRationalNumberSystem

/-!
`Cauchy` additionally needs a `RationalMetricData` witness — an absolute
value on the rational field plus its standard properties. Define
`landauRationalAbsoluteValue` as the usual `if 0 ≤ x then x else -x` (via
classical choice for decidability, matching this repo's existing use of
`Classical.choose`/`classical` elsewhere) and leave the nine standard
absolute-value facts `sorry`'d, consistent with every other law
certificate grounded so far — none of them are new mathematical claims,
just the textbook properties of `|·|` on an ordered field.
-/

open Classical in

/--
`landauRationalAbsoluteValue` TODO

Predicate logic:

  noncomputable def landauRationalAbsoluteValue
    (value : landauRationalNumberSystem.FieldModel.signature.carrier) :
    landauRationalNumberSystem.FieldModel.signature.carrier :=
  if landauRationalNumberSystem.FieldModel.signature.le
      landauRationalNumberSystem.FieldModel.signature.zero value
  then value
  else landauRationalNumberSystem.FieldModel.signature.neg value

Predicate logic (unfolded):

  noncomputable def landauRationalAbsoluteValue
    (value : landauRationalNumberSystem.FieldModel.signature.carrier) :
    landauRationalNumberSystem.FieldModel.signature.carrier :=
  if landauRationalNumberSystem.FieldModel.signature.le
      landauRationalNumberSystem.FieldModel.signature.zero value
  then value
  else landauRationalNumberSystem.FieldModel.signature.neg value (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def landauRationalAbsoluteValue
    (value : landauRationalNumberSystem.FieldModel.signature.carrier) :
    landauRationalNumberSystem.FieldModel.signature.carrier :=
  if landauRationalNumberSystem.FieldModel.signature.le
      landauRationalNumberSystem.FieldModel.signature.zero value
  then value
  else landauRationalNumberSystem.FieldModel.signature.neg value
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
noncomputable def landauRationalAbsoluteValue
    (value : landauRationalNumberSystem.FieldModel.signature.carrier) :
    landauRationalNumberSystem.FieldModel.signature.carrier :=
  if landauRationalNumberSystem.FieldModel.signature.le
      landauRationalNumberSystem.FieldModel.signature.zero value
  then value
  else landauRationalNumberSystem.FieldModel.signature.neg value

/--
`landauRationalAbsoluteValueZero` TODO

Predicate logic:

  landauRationalAbsoluteValue landauRationalNumberSystem.FieldModel.signature.zero = landauRationalNumberSystem.FieldModel.signature.zero

Predicate logic (unfolded):

  Decidable.rec (fun h => (fun x => LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toRingConceptSignature.2 LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toZeroOneBundle.2) h) (fun h => (fun x => LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toZeroOneBundle.2) h) (Classical.choice ⋯) = LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toZeroOneBundle.2

Logical form (Lean):

```lean
theorem landauRationalAbsoluteValueZero :
    landauRationalAbsoluteValue landauRationalNumberSystem.FieldModel.signature.zero =
      landauRationalNumberSystem.FieldModel.signature.zero
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
theorem landauRationalAbsoluteValueZero :
    landauRationalAbsoluteValue landauRationalNumberSystem.FieldModel.signature.zero =
      landauRationalNumberSystem.FieldModel.signature.zero := by
  sorry

/--
`landauRationalAbsoluteValueNegation` TODO

Predicate logic:

  ∀ value : landauRationalNumberSystem.FieldModel.signature.carrier, landauRationalAbsoluteValue (landauRationalNumberSystem.FieldModel.signature.neg value) = landauRationalAbsoluteValue value

Predicate logic (unfolded):

  ∀ (value : LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toCarrierBundle.1), Decidable.rec (fun h => (fun x => LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toRingConceptSignature.2 (LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toRingConceptSignature.2 value)) h) (fun h => (fun x => LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toRingConceptSignature.2 value) h) (Classical.choice ⋯) = Decidable.rec (fun h => (fun x => LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toRingConceptSignature.2 value) h) (fun h => (fun x => value) h) (Classical.choice ⋯)

Logical form (Lean):

```lean
theorem landauRationalAbsoluteValueNegation :
    ∀ value : landauRationalNumberSystem.FieldModel.signature.carrier,
      landauRationalAbsoluteValue
          (landauRationalNumberSystem.FieldModel.signature.neg value) =
        landauRationalAbsoluteValue value
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem landauRationalAbsoluteValueNegation :
    ∀ value : landauRationalNumberSystem.FieldModel.signature.carrier,
      landauRationalAbsoluteValue
          (landauRationalNumberSystem.FieldModel.signature.neg value) =
        landauRationalAbsoluteValue value := by
  sorry

/--
`landauRationalTriangleInequality` TODO

Predicate logic:

  ∀ first second : landauRationalNumberSystem.FieldModel.signature.carrier, landauRationalNumberSystem.FieldModel.signature.le (landauRationalAbsoluteValue (landauRationalNumberSystem.FieldModel.signature.add first second)) (landauRationalNumberSystem.FieldModel.signature.add (landauRationalAbsoluteValue first) (landauRationalAbsoluteValue second))

Predicate logic (unfolded):

  ∀ (first second : LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toCarrierBundle.1), LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toOrderedRingConceptSignature.2 (Decidable.rec (fun h => (fun x => LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toRingConceptSignature.2 (LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toBooleanRingOperationBundle.2 first second)) h) (fun h => (fun x => LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toBooleanRingOperationBundle.2 first second) h) (Classical.choice ⋯)) (LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (Decidable.rec (fun h => (fun x => LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toRingConceptSignature.2 first) h) (fun h => (fun x => first) h) (Classical.choice ⋯)) (Decidable.rec (fun h => (fun x => LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toRingConceptSignature.2 second) h) (fun h => (fun x => second) h) (Classical.choice ⋯)))

Logical form (Lean):

```lean
theorem landauRationalTriangleInequality :
    ∀ first second : landauRationalNumberSystem.FieldModel.signature.carrier,
      landauRationalNumberSystem.FieldModel.signature.le
        (landauRationalAbsoluteValue
          (landauRationalNumberSystem.FieldModel.signature.add first second))
        (landauRationalNumberSystem.FieldModel.signature.add
          (landauRationalAbsoluteValue first)
          (landauRationalAbsoluteValue second))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem landauRationalTriangleInequality :
    ∀ first second : landauRationalNumberSystem.FieldModel.signature.carrier,
      landauRationalNumberSystem.FieldModel.signature.le
        (landauRationalAbsoluteValue
          (landauRationalNumberSystem.FieldModel.signature.add first second))
        (landauRationalNumberSystem.FieldModel.signature.add
          (landauRationalAbsoluteValue first)
          (landauRationalAbsoluteValue second)) := by
  sorry

/--
`landauRationalAbsoluteValueNonnegative` TODO

Predicate logic:

  ∀ value : landauRationalNumberSystem.FieldModel.signature.carrier, landauRationalNumberSystem.FieldModel.signature.le landauRationalNumberSystem.FieldModel.signature.zero (landauRationalAbsoluteValue value)

Predicate logic (unfolded):

  ∀ (value : LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toCarrierBundle.1), LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toOrderedRingConceptSignature.2 LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toZeroOneBundle.2 (Decidable.rec (fun h => (fun x => LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toRingConceptSignature.2 value) h) (fun h => (fun x => value) h) (Classical.choice ⋯))

Logical form (Lean):

```lean
theorem landauRationalAbsoluteValueNonnegative :
    ∀ value : landauRationalNumberSystem.FieldModel.signature.carrier,
      landauRationalNumberSystem.FieldModel.signature.le
        landauRationalNumberSystem.FieldModel.signature.zero
        (landauRationalAbsoluteValue value)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem landauRationalAbsoluteValueNonnegative :
    ∀ value : landauRationalNumberSystem.FieldModel.signature.carrier,
      landauRationalNumberSystem.FieldModel.signature.le
        landauRationalNumberSystem.FieldModel.signature.zero
        (landauRationalAbsoluteValue value) := by
  sorry

/--
`landauRationalAbsoluteValueEqZeroIff` TODO

Predicate logic:

  ∀ value : landauRationalNumberSystem.FieldModel.signature.carrier, landauRationalAbsoluteValue value = landauRationalNumberSystem.FieldModel.signature.zero ↔ value = landauRationalNumberSystem.FieldModel.signature.zero

Predicate logic (unfolded):

  ∀ (value : LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toCarrierBundle.1), Decidable.rec (fun h => (fun x => LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toRingConceptSignature.2 value) h) (fun h => (fun x => value) h) (Classical.choice ⋯) = LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toZeroOneBundle.2 ↔ value = LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toZeroOneBundle.2

Logical form (Lean):

```lean
theorem landauRationalAbsoluteValueEqZeroIff :
    ∀ value : landauRationalNumberSystem.FieldModel.signature.carrier,
      landauRationalAbsoluteValue value =
          landauRationalNumberSystem.FieldModel.signature.zero ↔
        value = landauRationalNumberSystem.FieldModel.signature.zero
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem landauRationalAbsoluteValueEqZeroIff :
    ∀ value : landauRationalNumberSystem.FieldModel.signature.carrier,
      landauRationalAbsoluteValue value =
          landauRationalNumberSystem.FieldModel.signature.zero ↔
        value = landauRationalNumberSystem.FieldModel.signature.zero := by
  sorry

/--
`landauRationalAbsoluteValueMultiplication` TODO

Predicate logic:

  ∀ first second : landauRationalNumberSystem.FieldModel.signature.carrier, landauRationalAbsoluteValue (landauRationalNumberSystem.FieldModel.signature.multiply first second) = landauRationalNumberSystem.FieldModel.signature.multiply (landauRationalAbsoluteValue first) (landauRationalAbsoluteValue second)

Predicate logic (unfolded):

  ∀ (first second : LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toCarrierBundle.1), Decidable.rec (fun h => (fun x => LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toRingConceptSignature.2 (LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toBooleanRingOperationBundle.3 first second)) h) (fun h => (fun x => LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toBooleanRingOperationBundle.3 first second) h) (Classical.choice ⋯) = LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toBooleanRingOperationBundle.3 (Decidable.rec (fun h => (fun x => LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toRingConceptSignature.2 first) h) (fun h => (fun x => first) h) (Classical.choice ⋯)) (Decidable.rec (fun h => (fun x => LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toRingConceptSignature.2 second) h) (fun h => (fun x => second) h) (Classical.choice ⋯))

Logical form (Lean):

```lean
theorem landauRationalAbsoluteValueMultiplication :
    ∀ first second : landauRationalNumberSystem.FieldModel.signature.carrier,
      landauRationalAbsoluteValue
          (landauRationalNumberSystem.FieldModel.signature.multiply first second) =
        landauRationalNumberSystem.FieldModel.signature.multiply
          (landauRationalAbsoluteValue first)
          (landauRationalAbsoluteValue second)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem landauRationalAbsoluteValueMultiplication :
    ∀ first second : landauRationalNumberSystem.FieldModel.signature.carrier,
      landauRationalAbsoluteValue
          (landauRationalNumberSystem.FieldModel.signature.multiply first second) =
        landauRationalNumberSystem.FieldModel.signature.multiply
          (landauRationalAbsoluteValue first)
          (landauRationalAbsoluteValue second) := by
  sorry

/--
`landauRationalAbsoluteValueSelfOrNeg` TODO

Predicate logic:

  ∀ value : landauRationalNumberSystem.FieldModel.signature.carrier, landauRationalAbsoluteValue value = value ∨ landauRationalAbsoluteValue value = landauRationalNumberSystem.FieldModel.signature.neg value

Predicate logic (unfolded):

  ∀ (value : LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toCarrierBundle.1), Or (Decidable.rec (fun h => (fun x => LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toRingConceptSignature.2 value) h) (fun h => (fun x => value) h) (Classical.choice ⋯) = value) (Decidable.rec (fun h => (fun x => LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toRingConceptSignature.2 value) h) (fun h => (fun x => value) h) (Classical.choice ⋯) = LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toRingConceptSignature.2 value)

Logical form (Lean):

```lean
theorem landauRationalAbsoluteValueSelfOrNeg :
    ∀ value : landauRationalNumberSystem.FieldModel.signature.carrier,
      landauRationalAbsoluteValue value = value ∨
        landauRationalAbsoluteValue value =
          landauRationalNumberSystem.FieldModel.signature.neg value
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases

-/
theorem landauRationalAbsoluteValueSelfOrNeg :
    ∀ value : landauRationalNumberSystem.FieldModel.signature.carrier,
      landauRationalAbsoluteValue value = value ∨
        landauRationalAbsoluteValue value =
          landauRationalNumberSystem.FieldModel.signature.neg value := by
  sorry

/--
`landauRationalEpsilonSplit` TODO

Predicate logic:

  ∀ epsilon : landauRationalNumberSystem.FieldModel.signature.carrier, landauRationalNumberSystem.FieldModel.signature.StrictOrder landauRationalNumberSystem.FieldModel.signature.zero epsilon → ∃ smaller, landauRationalNumberSystem.FieldModel.signature.StrictOrder landauRationalNumberSystem.FieldModel.signature.zero smaller ∧ landauRationalNumberSystem.FieldModel.signature.le (landauRationalNumberSystem.FieldModel.signature.add smaller smaller) epsilon

Predicate logic (unfolded):

  ∀ (epsilon : LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toCarrierBundle.1), LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toOrderedRingSignature.2 LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toZeroOneBundle.2 epsilon → Exists fun smaller => (LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toOrderedRingSignature.2 LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toZeroOneBundle.2 smaller ∧ LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toOrderedRingConceptSignature.2 (LRA.NumberSystems.Carriers.landauRationalNumberSystem.FieldModel.signature.toBooleanRingOperationBundle.2 smaller smaller) epsilon)

Logical form (Lean):

```lean
theorem landauRationalEpsilonSplit :
    ∀ epsilon : landauRationalNumberSystem.FieldModel.signature.carrier,
      landauRationalNumberSystem.FieldModel.signature.StrictOrder
        landauRationalNumberSystem.FieldModel.signature.zero epsilon →
      ∃ smaller,
        landauRationalNumberSystem.FieldModel.signature.StrictOrder
          landauRationalNumberSystem.FieldModel.signature.zero smaller ∧
        landauRationalNumberSystem.FieldModel.signature.le
          (landauRationalNumberSystem.FieldModel.signature.add smaller smaller)
          epsilon
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem landauRationalEpsilonSplit :
    ∀ epsilon : landauRationalNumberSystem.FieldModel.signature.carrier,
      landauRationalNumberSystem.FieldModel.signature.StrictOrder
        landauRationalNumberSystem.FieldModel.signature.zero epsilon →
      ∃ smaller,
        landauRationalNumberSystem.FieldModel.signature.StrictOrder
          landauRationalNumberSystem.FieldModel.signature.zero smaller ∧
        landauRationalNumberSystem.FieldModel.signature.le
          (landauRationalNumberSystem.FieldModel.signature.add smaller smaller)
          epsilon := by
  sorry

/--
`landauRationalMetricData` TODO

Predicate logic:

  noncomputable def landauRationalMetricData :
    LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData landauRationalNumberSystem where
  absolute_value := landauRationalAbsoluteValue
  absolute_value_zero := landauRationalAbsoluteValueZero
  absolute_value_negation := landauRationalAbsoluteValueNegation
  triangle_inequality := landauRationalTriangleInequality
  absolute_value_nonnegative := landauRationalAbsoluteValueNonnegative
  absolute_value_eq_zero_iff := landauRationalAbsoluteValueEqZeroIff
  absolute_value_multiplication := landauRationalAbsoluteValueMultiplication
  absolute_value_self_or_neg := landauRationalAbsoluteValueSelfOrNeg
  epsilon_split := landauRationalEpsilonSplit

Predicate logic (unfolded):

  noncomputable def landauRationalMetricData :
    LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData landauRationalNumberSystem where
  absolute_value := landauRationalAbsoluteValue
  absolute_value_zero := landauRationalAbsoluteValueZero
  absolute_value_negation := landauRationalAbsoluteValueNegation
  triangle_inequality := landauRationalTriangleInequality
  absolute_value_nonnegative := landauRationalAbsoluteValueNonnegative
  absolute_value_eq_zero_iff := landauRationalAbsoluteValueEqZeroIff
  absolute_value_multiplication := landauRationalAbsoluteValueMultiplication
  absolute_value_self_or_neg := landauRationalAbsoluteValueSelfOrNeg
  epsilon_split := landauRationalEpsilonSplit (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def landauRationalMetricData :
    LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData landauRationalNumberSystem where
  absolute_value := landauRationalAbsoluteValue
  absolute_value_zero := landauRationalAbsoluteValueZero
  absolute_value_negation := landauRationalAbsoluteValueNegation
  triangle_inequality := landauRationalTriangleInequality
  absolute_value_nonnegative := landauRationalAbsoluteValueNonnegative
  absolute_value_eq_zero_iff := landauRationalAbsoluteValueEqZeroIff
  absolute_value_multiplication := landauRationalAbsoluteValueMultiplication
  absolute_value_self_or_neg := landauRationalAbsoluteValueSelfOrNeg
  epsilon_split := landauRationalEpsilonSplit
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
noncomputable def landauRationalMetricData :
    LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData landauRationalNumberSystem where
  absolute_value := landauRationalAbsoluteValue
  absolute_value_zero := landauRationalAbsoluteValueZero
  absolute_value_negation := landauRationalAbsoluteValueNegation
  triangle_inequality := landauRationalTriangleInequality
  absolute_value_nonnegative := landauRationalAbsoluteValueNonnegative
  absolute_value_eq_zero_iff := landauRationalAbsoluteValueEqZeroIff
  absolute_value_multiplication := landauRationalAbsoluteValueMultiplication
  absolute_value_self_or_neg := landauRationalAbsoluteValueSelfOrNeg
  epsilon_split := landauRationalEpsilonSplit

/--
`R_Cauchy` TODO

Predicate logic:

  abbrev R_Cauchy :=
  LRA.NumberSystems.RealNumbers.Cauchy.Carrier
    landauRationalNumberSystem landauRationalMetricData

Predicate logic (unfolded):

  abbrev R_Cauchy :=
  LRA.NumberSystems.RealNumbers.Cauchy.Carrier
    landauRationalNumberSystem landauRationalMetricData (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev R_Cauchy :=
  LRA.NumberSystems.RealNumbers.Cauchy.Carrier
    landauRationalNumberSystem landauRationalMetricData
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
abbrev R_Cauchy :=
  LRA.NumberSystems.RealNumbers.Cauchy.Carrier
    landauRationalNumberSystem landauRationalMetricData

/--
`landauCauchyRealModel` TODO

Predicate logic:

  noncomputable def landauCauchyRealModel :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  LRA.NumberSystems.RealNumbers.Cauchy.CauchyRealizesRealModel
    landauRationalNumberSystem landauRationalMetricData

Predicate logic (unfolded):

  noncomputable def landauCauchyRealModel :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  LRA.NumberSystems.RealNumbers.Cauchy.CauchyRealizesRealModel
    landauRationalNumberSystem landauRationalMetricData (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def landauCauchyRealModel :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  LRA.NumberSystems.RealNumbers.Cauchy.CauchyRealizesRealModel
    landauRationalNumberSystem landauRationalMetricData
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
noncomputable def landauCauchyRealModel :
    LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel :=
  LRA.NumberSystems.RealNumbers.Cauchy.CauchyRealizesRealModel
    landauRationalNumberSystem landauRationalMetricData

/--
`R` TODO

Predicate logic:

  abbrev R := R_Cauchy

Predicate logic (unfolded):

  abbrev R := R_Cauchy (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev R := R_Cauchy
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
abbrev R := R_Cauchy

abbrev R_LRA := R

abbrev C_LRA := C R_LRA

/-!
`Cauchy` now has a full concrete `RealModel` (arithmetic instances, order,
and law certificates — all `sorry`'d, but present) and a concrete
embedding of ℚ into it, so the `RationalDyadicApproximationData` witness
`Dyadic` needed (§22, §24) — genuinely blocked at the time, since no
`RealNumbers` construction had any of this — is buildable now.
-/

/--
`landauRationalRealExtension` TODO

Predicate logic:

  noncomputable def landauRationalRealExtension :
    LRA.NumberSystems.RealNumbers.RationalRealExtension landauRationalNumberSystem :=
  LRA.NumberSystems.RealNumbers.Cauchy.CauchyRationalRealExtension
    landauRationalNumberSystem landauRationalMetricData

Predicate logic (unfolded):

  noncomputable def landauRationalRealExtension :
    LRA.NumberSystems.RealNumbers.RationalRealExtension landauRationalNumberSystem :=
  LRA.NumberSystems.RealNumbers.Cauchy.CauchyRationalRealExtension
    landauRationalNumberSystem landauRationalMetricData (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def landauRationalRealExtension :
    LRA.NumberSystems.RealNumbers.RationalRealExtension landauRationalNumberSystem :=
  LRA.NumberSystems.RealNumbers.Cauchy.CauchyRationalRealExtension
    landauRationalNumberSystem landauRationalMetricData
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
noncomputable def landauRationalRealExtension :
    LRA.NumberSystems.RealNumbers.RationalRealExtension landauRationalNumberSystem :=
  LRA.NumberSystems.RealNumbers.Cauchy.CauchyRationalRealExtension
    landauRationalNumberSystem landauRationalMetricData

/--
`landauCauchyCarrierEq` TODO

Predicate logic:

  landauRationalRealExtension.RealModel.Carrier = R_Cauchy

Predicate logic (unfolded):

  LRA.NumberSystems.Carriers.landauRationalRealExtension.RealModel.toDenselyOrderedFieldModel.1 = LRA.NumberSystems.Carriers.R_Cauchy

Logical form (Lean):

```lean
theorem landauCauchyCarrierEq :
    landauRationalRealExtension.RealModel.Carrier = R_Cauchy
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
theorem landauCauchyCarrierEq :
    landauRationalRealExtension.RealModel.Carrier = R_Cauchy :=
  sorry
