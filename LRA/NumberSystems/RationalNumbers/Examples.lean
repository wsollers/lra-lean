import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions.Instances
import LRA.NumberSystems.Integers.Constructions.Tao.Instances
import LRA.NumberSystems.Integers.Constructions.Mendelson.Instances

namespace LRA.NumberSystems.RationalNumbers.Examples

open LRA.NumberSystems.Models
open LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

/-!
Examples showing that `RationalNumberSystem` does not commit the repository to a
single implementation of the integers. Each section chooses or supplies a
different `DiscretelyOrderedIntegralDomainModel`, supplies quotient-fraction data built over that model,
and obtains a rational number system recording that integer choice.
-/

section MathlibIntegers

/-- A quotient-fraction rational system built over Mathlib's integer model.

The equality hypothesis records that the denominator/numerator construction
data was prepared over `mathlibDiscretelyOrderedIntegralDomainModel`; the resulting rational system then
remembers exactly that choice.

Logical form:

```lean
noncomputable def MathlibRationalSystem
    (rational_data : IntegerAndPositiveNaturalData)
    (usesMathlibIntegers :
      rational_data.integer_model = mathlibDiscretelyOrderedIntegralDomainModel) :
    RationalNumberSystem
```
-/
noncomputable def MathlibRationalSystem
    (rational_data : IntegerAndPositiveNaturalData)
    (_usesMathlibIntegers :
      rational_data.integer_model = mathlibDiscretelyOrderedIntegralDomainModel) :
    RationalNumberSystem :=
  RationalQuotientFractionsRealizesRationalNumberSystem rational_data

/-- The Mathlib-based rational system records Mathlib's integers as its selected
integer model.

Logical form:

```lean
theorem MathlibRationalSystemUsesMathlibIntegers
    (rational_data : IntegerAndPositiveNaturalData)
    (usesMathlibIntegers :
      rational_data.integer_model = mathlibDiscretelyOrderedIntegralDomainModel) :
    (MathlibRationalSystem rational_data usesMathlibIntegers).DiscretelyOrderedIntegralDomainModel =
      mathlibDiscretelyOrderedIntegralDomainModel
```
-/
theorem MathlibRationalSystemUsesMathlibIntegers
    (rational_data : IntegerAndPositiveNaturalData)
    (usesMathlibIntegers :
      rational_data.integer_model = mathlibDiscretelyOrderedIntegralDomainModel) :
    (MathlibRationalSystem rational_data usesMathlibIntegers).DiscretelyOrderedIntegralDomainModel =
      mathlibDiscretelyOrderedIntegralDomainModel := by
  exact usesMathlibIntegers

end MathlibIntegers

section TaoIntegers

open LRA.NumberSystems.Integers

/-- Choose the `DiscretelyOrderedIntegralDomainModel` realized by Tao's formal-difference construction.
This is extraction of one already-proved existential witness, not an invocation
of the Axiom of Choice.

Logical form:

```lean
noncomputable def TaoIntegerModel
    (whole_data : Tao.WholeNumberArithmeticForTaoFormalDifferences) :
    DiscretelyOrderedIntegralDomainModel
```
-/
noncomputable def TaoIntegerModel
    (whole_data : Tao.WholeNumberArithmeticForTaoFormalDifferences) :
    DiscretelyOrderedIntegralDomainModel :=
  Classical.choose (Tao.tao_integers_form_ordered_ring whole_data)

/-- A quotient-fraction rational system built over the integer model realized by
Tao's construction.

Logical form:

```lean
noncomputable def TaoRationalSystem
    (whole_data : Tao.WholeNumberArithmeticForTaoFormalDifferences)
    (rational_data : IntegerAndPositiveNaturalData)
    (usesTaoIntegers :
      rational_data.integer_model = TaoIntegerModel whole_data) :
    RationalNumberSystem
```
-/
noncomputable def TaoRationalSystem
    (whole_data : Tao.WholeNumberArithmeticForTaoFormalDifferences)
    (rational_data : IntegerAndPositiveNaturalData)
    (_usesTaoIntegers :
      rational_data.integer_model = TaoIntegerModel whole_data) :
    RationalNumberSystem :=
  RationalQuotientFractionsRealizesRationalNumberSystem rational_data

/-- The Tao-based rational system records the Tao integer realization used to
construct its fractions.

Logical form:

```lean
theorem TaoRationalSystemUsesTaoIntegers
    (whole_data : Tao.WholeNumberArithmeticForTaoFormalDifferences)
    (rational_data : IntegerAndPositiveNaturalData)
    (usesTaoIntegers :
      rational_data.integer_model = TaoIntegerModel whole_data) :
    (TaoRationalSystem whole_data rational_data usesTaoIntegers).DiscretelyOrderedIntegralDomainModel =
      TaoIntegerModel whole_data
```
-/
theorem TaoRationalSystemUsesTaoIntegers
    (whole_data : Tao.WholeNumberArithmeticForTaoFormalDifferences)
    (rational_data : IntegerAndPositiveNaturalData)
    (usesTaoIntegers :
      rational_data.integer_model = TaoIntegerModel whole_data) :
    (TaoRationalSystem whole_data rational_data usesTaoIntegers).DiscretelyOrderedIntegralDomainModel =
      TaoIntegerModel whole_data := by
  exact usesTaoIntegers

end TaoIntegers

section MendelsonIntegers

open LRA.NumberSystems.Integers

/-- Choose the `DiscretelyOrderedIntegralDomainModel` realized by Mendelson's ordered-pair construction.

Logical form:

```lean
noncomputable def MendelsonIntegerModel
    (positive_data : Mendelson.PositiveNaturalPairData) :
    DiscretelyOrderedIntegralDomainModel
```
-/
noncomputable def MendelsonIntegerModel
    (positive_data : Mendelson.PositiveNaturalPairData) :
    DiscretelyOrderedIntegralDomainModel :=
  Classical.choose
    (Mendelson.mendelson_integers_form_ordered_ring positive_data)

/-- A quotient-fraction rational system built over the integer model realized by
Mendelson's construction.

Logical form:

```lean
noncomputable def MendelsonRationalSystem
    (positive_data : Mendelson.PositiveNaturalPairData)
    (rational_data : IntegerAndPositiveNaturalData)
    (usesMendelsonIntegers :
      rational_data.integer_model = MendelsonIntegerModel positive_data) :
    RationalNumberSystem
```
-/
noncomputable def MendelsonRationalSystem
    (positive_data : Mendelson.PositiveNaturalPairData)
    (rational_data : IntegerAndPositiveNaturalData)
    (_usesMendelsonIntegers :
      rational_data.integer_model = MendelsonIntegerModel positive_data) :
    RationalNumberSystem :=
  RationalQuotientFractionsRealizesRationalNumberSystem rational_data

/-- The Mendelson-based rational system records the Mendelson integer
realization used to construct its fractions.

Logical form:

```lean
theorem MendelsonRationalSystemUsesMendelsonIntegers
    (positive_data : Mendelson.PositiveNaturalPairData)
    (rational_data : IntegerAndPositiveNaturalData)
    (usesMendelsonIntegers :
      rational_data.integer_model = MendelsonIntegerModel positive_data) :
    (MendelsonRationalSystem positive_data rational_data
      usesMendelsonIntegers).DiscretelyOrderedIntegralDomainModel =
        MendelsonIntegerModel positive_data
```
-/
theorem MendelsonRationalSystemUsesMendelsonIntegers
    (positive_data : Mendelson.PositiveNaturalPairData)
    (rational_data : IntegerAndPositiveNaturalData)
    (usesMendelsonIntegers :
      rational_data.integer_model = MendelsonIntegerModel positive_data) :
    (MendelsonRationalSystem positive_data rational_data
      usesMendelsonIntegers).DiscretelyOrderedIntegralDomainModel =
        MendelsonIntegerModel positive_data := by
  exact usesMendelsonIntegers

end MendelsonIntegers

end LRA.NumberSystems.RationalNumbers.Examples
