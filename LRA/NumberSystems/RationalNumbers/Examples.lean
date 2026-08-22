import LRA.NumberSystems.Integers.Examples
import LRA.NumberSystems.Integers.Constructions.Tao.Instances
import LRA.NumberSystems.Integers.Constructions.Mendelson.Instances
import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions.Instances

namespace LRA.NumberSystems.RationalNumbers.Examples

open LRA.NumberSystems.Integers
open LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

/-!
Examples showing that `RationalNumberSystem` does not commit the repository to a
single integer construction. Each section supplies quotient-fraction data built
over a different certified `IntegerNumberSystem`.
-/

section MathlibIntegers

/-- A quotient-fraction rational system built over Mathlib's integer number
system.

Logical form:

```lean
noncomputable def MathlibRationalSystem
    (rationalData : IntegerAndPositiveNaturalData)
    (usesMathlibIntegers :
      rationalData.integer_system =
        LRA.NumberSystems.Integers.Examples.MathlibIntegerNumberSystem) :
    RationalNumberSystem
```
-/
noncomputable def MathlibRationalSystem
    (rationalData : IntegerAndPositiveNaturalData)
    (_usesMathlibIntegers :
      rationalData.integer_system =
        LRA.NumberSystems.Integers.Examples.MathlibIntegerNumberSystem) :
    RationalNumberSystem :=
  RationalQuotientFractionsRealizesRationalNumberSystem rationalData

/-- The Mathlib-based rational system records Mathlib's integer number system.

Logical form:

```lean
theorem MathlibRationalSystemUsesMathlibIntegers
    (rationalData : IntegerAndPositiveNaturalData)
    (usesMathlibIntegers :
      rationalData.integer_system =
        LRA.NumberSystems.Integers.Examples.MathlibIntegerNumberSystem) :
    (MathlibRationalSystem rationalData usesMathlibIntegers).IntegerSystem =
      LRA.NumberSystems.Integers.Examples.MathlibIntegerNumberSystem
```
-/
theorem MathlibRationalSystemUsesMathlibIntegers
    (rationalData : IntegerAndPositiveNaturalData)
    (usesMathlibIntegers :
      rationalData.integer_system =
        LRA.NumberSystems.Integers.Examples.MathlibIntegerNumberSystem) :
    (MathlibRationalSystem rationalData usesMathlibIntegers).IntegerSystem =
      LRA.NumberSystems.Integers.Examples.MathlibIntegerNumberSystem := by
  exact usesMathlibIntegers

end MathlibIntegers

section TaoIntegers

/-- Choose the integer number system realized by Tao's formal-difference
construction. This extracts one witness from one existence theorem; it is not a
use of the general Axiom of Choice over a family of nonempty sets.

Logical form:

```lean
noncomputable def TaoIntegerNumberSystem
    (wholeData : Tao.WholeNumberArithmeticForTaoFormalDifferences) :
    IntegerNumberSystem
```
-/
noncomputable def TaoIntegerNumberSystem
    (wholeData : Tao.WholeNumberArithmeticForTaoFormalDifferences) :
    IntegerNumberSystem :=
  Classical.choose (Tao.TaoRealizesIntegerNumberSystem wholeData)

/-- A quotient-fraction rational system built over Tao's integer number system.

Logical form:

```lean
noncomputable def TaoRationalSystem
    (wholeData : Tao.WholeNumberArithmeticForTaoFormalDifferences)
    (rationalData : IntegerAndPositiveNaturalData)
    (usesTaoIntegers :
      rationalData.integer_system = TaoIntegerNumberSystem wholeData) :
    RationalNumberSystem
```
-/
noncomputable def TaoRationalSystem
    (wholeData : Tao.WholeNumberArithmeticForTaoFormalDifferences)
    (rationalData : IntegerAndPositiveNaturalData)
    (_usesTaoIntegers :
      rationalData.integer_system = TaoIntegerNumberSystem wholeData) :
    RationalNumberSystem :=
  RationalQuotientFractionsRealizesRationalNumberSystem rationalData

/-- The Tao-based rational system records the Tao integer number system used to
construct its fractions.

Logical form:

```lean
theorem TaoRationalSystemUsesTaoIntegers
    (wholeData : Tao.WholeNumberArithmeticForTaoFormalDifferences)
    (rationalData : IntegerAndPositiveNaturalData)
    (usesTaoIntegers :
      rationalData.integer_system = TaoIntegerNumberSystem wholeData) :
    (TaoRationalSystem wholeData rationalData usesTaoIntegers).IntegerSystem =
      TaoIntegerNumberSystem wholeData
```
-/
theorem TaoRationalSystemUsesTaoIntegers
    (wholeData : Tao.WholeNumberArithmeticForTaoFormalDifferences)
    (rationalData : IntegerAndPositiveNaturalData)
    (usesTaoIntegers :
      rationalData.integer_system = TaoIntegerNumberSystem wholeData) :
    (TaoRationalSystem wholeData rationalData usesTaoIntegers).IntegerSystem =
      TaoIntegerNumberSystem wholeData := by
  exact usesTaoIntegers

end TaoIntegers

section MendelsonIntegers

/-- Choose the integer number system realized by Mendelson's ordered-pair
construction.

Logical form:

```lean
noncomputable def MendelsonIntegerNumberSystem
    (positiveData : Mendelson.PositiveNaturalPairData) : IntegerNumberSystem
```
-/
noncomputable def MendelsonIntegerNumberSystem
    (positiveData : Mendelson.PositiveNaturalPairData) : IntegerNumberSystem :=
  Classical.choose (Mendelson.MendelsonRealizesIntegerNumberSystem positiveData)

/-- A quotient-fraction rational system built over Mendelson's integer number
system.

Logical form:

```lean
noncomputable def MendelsonRationalSystem
    (positiveData : Mendelson.PositiveNaturalPairData)
    (rationalData : IntegerAndPositiveNaturalData)
    (usesMendelsonIntegers :
      rationalData.integer_system = MendelsonIntegerNumberSystem positiveData) :
    RationalNumberSystem
```
-/
noncomputable def MendelsonRationalSystem
    (positiveData : Mendelson.PositiveNaturalPairData)
    (rationalData : IntegerAndPositiveNaturalData)
    (_usesMendelsonIntegers :
      rationalData.integer_system = MendelsonIntegerNumberSystem positiveData) :
    RationalNumberSystem :=
  RationalQuotientFractionsRealizesRationalNumberSystem rationalData

/-- The Mendelson-based rational system records the Mendelson integer number
system used to construct its fractions.

Logical form:

```lean
theorem MendelsonRationalSystemUsesMendelsonIntegers
    (positiveData : Mendelson.PositiveNaturalPairData)
    (rationalData : IntegerAndPositiveNaturalData)
    (usesMendelsonIntegers :
      rationalData.integer_system = MendelsonIntegerNumberSystem positiveData) :
    (MendelsonRationalSystem positiveData rationalData
      usesMendelsonIntegers).IntegerSystem =
        MendelsonIntegerNumberSystem positiveData
```
-/
theorem MendelsonRationalSystemUsesMendelsonIntegers
    (positiveData : Mendelson.PositiveNaturalPairData)
    (rationalData : IntegerAndPositiveNaturalData)
    (usesMendelsonIntegers :
      rationalData.integer_system = MendelsonIntegerNumberSystem positiveData) :
    (MendelsonRationalSystem positiveData rationalData
      usesMendelsonIntegers).IntegerSystem =
        MendelsonIntegerNumberSystem positiveData := by
  exact usesMendelsonIntegers

end MendelsonIntegers

end LRA.NumberSystems.RationalNumbers.Examples
