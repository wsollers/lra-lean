import LRA.NumberSystems.Integers.Examples.NumberSystems
import LRA.NumberSystems.Integers.Constructions.Tao.Instances
import LRA.NumberSystems.Integers.Constructions.Mendelson.Instances
import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions.Instances

namespace LRA.NumberSystems.RationalNumbers.Examples

open LRA.NumberSystems.Integers
open LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

section MathlibIntegers

/--
`MathlibRationalSystem` TODO

Predicate logic:

  noncomputable def MathlibRationalSystem
    (rationalData : IntegerAndPositiveNaturalData)
    (_usesMathlibIntegers :
      rationalData.integer_system =
        LRA.NumberSystems.Integers.Examples.MathlibIntegerNumberSystem) :
    RationalNumberSystem :=
  RationalQuotientFractionsRealizesRationalNumberSystem rationalData

Predicate logic (unfolded):

  noncomputable def MathlibRationalSystem
    (rationalData : IntegerAndPositiveNaturalData)
    (_usesMathlibIntegers :
      rationalData.integer_system =
        LRA.NumberSystems.Integers.Examples.MathlibIntegerNumberSystem) :
    RationalNumberSystem :=
  RationalQuotientFractionsRealizesRationalNumberSystem rationalData (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def MathlibRationalSystem
    (rationalData : IntegerAndPositiveNaturalData)
    (_usesMathlibIntegers :
      rationalData.integer_system =
        LRA.NumberSystems.Integers.Examples.MathlibIntegerNumberSystem) :
    RationalNumberSystem :=
  RationalQuotientFractionsRealizesRationalNumberSystem rationalData
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
noncomputable def MathlibRationalSystem
    (rationalData : IntegerAndPositiveNaturalData)
    (_usesMathlibIntegers :
      rationalData.integer_system =
        LRA.NumberSystems.Integers.Examples.MathlibIntegerNumberSystem) :
    RationalNumberSystem :=
  RationalQuotientFractionsRealizesRationalNumberSystem rationalData

/--
`MathlibRationalSystemUsesMathlibIntegers` TODO

Predicate logic:

  (∀ rationalData ∈ IntegerAndPositiveNaturalData), (rationalData.integer_system = LRA.NumberSystems.Integers.Examples.MathlibIntegerNumberSystem) → (MathlibRationalSystem rationalData usesMathlibIntegers).IntegerSystem = LRA.NumberSystems.Integers.Examples.MathlibIntegerNumberSystem

Predicate logic (unfolded):

  ∀ (rationalData : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData) (usesMathlibIntegers : rationalData.1 = LRA.NumberSystems.Integers.Examples.MathlibIntegerNumberSystem), LRA.NumberSystems.RationalNumbers.Examples.MathlibRationalSystem rationalData usesMathlibIntegers = .1 LRA.NumberSystems.Integers.Examples.MathlibIntegerNumberSystem

Logical form (Lean):

```lean
theorem MathlibRationalSystemUsesMathlibIntegers
    (rationalData : IntegerAndPositiveNaturalData)
    (usesMathlibIntegers :
      rationalData.integer_system =
        LRA.NumberSystems.Integers.Examples.MathlibIntegerNumberSystem) :
    (MathlibRationalSystem rationalData usesMathlibIntegers).IntegerSystem =
      LRA.NumberSystems.Integers.Examples.MathlibIntegerNumberSystem
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
theorem MathlibRationalSystemUsesMathlibIntegers
    (rationalData : IntegerAndPositiveNaturalData)
    (usesMathlibIntegers :
      rationalData.integer_system =
        LRA.NumberSystems.Integers.Examples.MathlibIntegerNumberSystem) :
    (MathlibRationalSystem rationalData usesMathlibIntegers).IntegerSystem =
      LRA.NumberSystems.Integers.Examples.MathlibIntegerNumberSystem := by

  sorry

end MathlibIntegers

section TaoIntegers

/--
`TaoIntegerNumberSystem` TODO

Predicate logic:

  noncomputable def TaoIntegerNumberSystem
    (wholeData : Tao.WholeNumberArithmeticForTaoFormalDifferences) :
    IntegerNumberSystem :=
  Classical.choose (Tao.TaoRealizesIntegerNumberSystem wholeData)

Predicate logic (unfolded):

  noncomputable def TaoIntegerNumberSystem
    (wholeData : Tao.WholeNumberArithmeticForTaoFormalDifferences) :
    IntegerNumberSystem :=
  Classical.choose (Tao.TaoRealizesIntegerNumberSystem wholeData) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TaoIntegerNumberSystem
    (wholeData : Tao.WholeNumberArithmeticForTaoFormalDifferences) :
    IntegerNumberSystem :=
  Classical.choose (Tao.TaoRealizesIntegerNumberSystem wholeData)
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
noncomputable def TaoIntegerNumberSystem
    (wholeData : Tao.WholeNumberArithmeticForTaoFormalDifferences) :
    IntegerNumberSystem :=
  Classical.choose (Tao.TaoRealizesIntegerNumberSystem wholeData)

/--
`TaoRationalSystem` TODO

Predicate logic:

  noncomputable def TaoRationalSystem
    (wholeData : Tao.WholeNumberArithmeticForTaoFormalDifferences)
    (rationalData : IntegerAndPositiveNaturalData)
    (_usesTaoIntegers :
      rationalData.integer_system = TaoIntegerNumberSystem wholeData) :
    RationalNumberSystem :=
  RationalQuotientFractionsRealizesRationalNumberSystem rationalData

Predicate logic (unfolded):

  noncomputable def TaoRationalSystem
    (wholeData : Tao.WholeNumberArithmeticForTaoFormalDifferences)
    (rationalData : IntegerAndPositiveNaturalData)
    (_usesTaoIntegers :
      rationalData.integer_system = TaoIntegerNumberSystem wholeData) :
    RationalNumberSystem :=
  RationalQuotientFractionsRealizesRationalNumberSystem rationalData (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TaoRationalSystem
    (wholeData : Tao.WholeNumberArithmeticForTaoFormalDifferences)
    (rationalData : IntegerAndPositiveNaturalData)
    (_usesTaoIntegers :
      rationalData.integer_system = TaoIntegerNumberSystem wholeData) :
    RationalNumberSystem :=
  RationalQuotientFractionsRealizesRationalNumberSystem rationalData
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
noncomputable def TaoRationalSystem
    (wholeData : Tao.WholeNumberArithmeticForTaoFormalDifferences)
    (rationalData : IntegerAndPositiveNaturalData)
    (_usesTaoIntegers :
      rationalData.integer_system = TaoIntegerNumberSystem wholeData) :
    RationalNumberSystem :=
  RationalQuotientFractionsRealizesRationalNumberSystem rationalData

/--
`TaoRationalSystemUsesTaoIntegers` TODO

Predicate logic:

  (∀ wholeData ∈ Tao.WholeNumberArithmeticForTaoFormalDifferences ∀ rationalData ∈ IntegerAndPositiveNaturalData), (rationalData.integer_system = TaoIntegerNumberSystem wholeData) → (TaoRationalSystem wholeData rationalData usesTaoIntegers).IntegerSystem = TaoIntegerNumberSystem wholeData

Predicate logic (unfolded):

  ∀ (wholeData : LRA.NumberSystems.Integers.Tao.WholeNumberArithmeticForTaoFormalDifferences) (rationalData : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData) (usesTaoIntegers : rationalData.1 = Classical.indefiniteDescription (fun x => x.Model.Carrier = LRA.NumberSystems.Integers.Tao.Carrier wholeData) ⋯.1), LRA.NumberSystems.RationalNumbers.Examples.TaoRationalSystem wholeData rationalData usesTaoIntegers = .1 (Classical.indefiniteDescription (fun x => x.Model.Carrier = LRA.NumberSystems.Integers.Tao.Carrier wholeData) ⋯).1

Logical form (Lean):

```lean
theorem TaoRationalSystemUsesTaoIntegers
    (wholeData : Tao.WholeNumberArithmeticForTaoFormalDifferences)
    (rationalData : IntegerAndPositiveNaturalData)
    (usesTaoIntegers :
      rationalData.integer_system = TaoIntegerNumberSystem wholeData) :
    (TaoRationalSystem wholeData rationalData usesTaoIntegers).IntegerSystem =
      TaoIntegerNumberSystem wholeData
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
theorem TaoRationalSystemUsesTaoIntegers
    (wholeData : Tao.WholeNumberArithmeticForTaoFormalDifferences)
    (rationalData : IntegerAndPositiveNaturalData)
    (usesTaoIntegers :
      rationalData.integer_system = TaoIntegerNumberSystem wholeData) :
    (TaoRationalSystem wholeData rationalData usesTaoIntegers).IntegerSystem =
      TaoIntegerNumberSystem wholeData := by

  sorry

end TaoIntegers

section MendelsonIntegers

/--
`MendelsonIntegerNumberSystem` TODO

Predicate logic:

  noncomputable def MendelsonIntegerNumberSystem
    (positiveData : Mendelson.PositiveNaturalPairData) : IntegerNumberSystem :=
  Classical.choose (Mendelson.MendelsonRealizesIntegerNumberSystem positiveData)

Predicate logic (unfolded):

  noncomputable def MendelsonIntegerNumberSystem
    (positiveData : Mendelson.PositiveNaturalPairData) : IntegerNumberSystem :=
  Classical.choose (Mendelson.MendelsonRealizesIntegerNumberSystem positiveData) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def MendelsonIntegerNumberSystem
    (positiveData : Mendelson.PositiveNaturalPairData) : IntegerNumberSystem :=
  Classical.choose (Mendelson.MendelsonRealizesIntegerNumberSystem positiveData)
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
noncomputable def MendelsonIntegerNumberSystem
    (positiveData : Mendelson.PositiveNaturalPairData) : IntegerNumberSystem :=
  Classical.choose (Mendelson.MendelsonRealizesIntegerNumberSystem positiveData)

/--
`MendelsonRationalSystem` TODO

Predicate logic:

  noncomputable def MendelsonRationalSystem
    (positiveData : Mendelson.PositiveNaturalPairData)
    (rationalData : IntegerAndPositiveNaturalData)
    (_usesMendelsonIntegers :
      rationalData.integer_system = MendelsonIntegerNumberSystem positiveData) :
    RationalNumberSystem :=
  RationalQuotientFractionsRealizesRationalNumberSystem rationalData

Predicate logic (unfolded):

  noncomputable def MendelsonRationalSystem
    (positiveData : Mendelson.PositiveNaturalPairData)
    (rationalData : IntegerAndPositiveNaturalData)
    (_usesMendelsonIntegers :
      rationalData.integer_system = MendelsonIntegerNumberSystem positiveData) :
    RationalNumberSystem :=
  RationalQuotientFractionsRealizesRationalNumberSystem rationalData (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def MendelsonRationalSystem
    (positiveData : Mendelson.PositiveNaturalPairData)
    (rationalData : IntegerAndPositiveNaturalData)
    (_usesMendelsonIntegers :
      rationalData.integer_system = MendelsonIntegerNumberSystem positiveData) :
    RationalNumberSystem :=
  RationalQuotientFractionsRealizesRationalNumberSystem rationalData
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
noncomputable def MendelsonRationalSystem
    (positiveData : Mendelson.PositiveNaturalPairData)
    (rationalData : IntegerAndPositiveNaturalData)
    (_usesMendelsonIntegers :
      rationalData.integer_system = MendelsonIntegerNumberSystem positiveData) :
    RationalNumberSystem :=
  RationalQuotientFractionsRealizesRationalNumberSystem rationalData

/--
`MendelsonRationalSystemUsesMendelsonIntegers` TODO

Predicate logic:

  (∀ positiveData ∈ Mendelson.PositiveNaturalPairData ∀ rationalData ∈ IntegerAndPositiveNaturalData), (rationalData.integer_system = MendelsonIntegerNumberSystem positiveData) → (MendelsonRationalSystem positiveData rationalData usesMendelsonIntegers).IntegerSystem = MendelsonIntegerNumberSystem positiveData

Predicate logic (unfolded):

  ∀ (positiveData : LRA.NumberSystems.Integers.Mendelson.PositiveNaturalPairData) (rationalData : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData) (usesMendelsonIntegers : rationalData.1 = Classical.indefiniteDescription (fun x => x.Model.Carrier = LRA.NumberSystems.Integers.Mendelson.Carrier positiveData) ⋯.1), LRA.NumberSystems.RationalNumbers.Examples.MendelsonRationalSystem positiveData rationalData usesMendelsonIntegers = .1 (Classical.indefiniteDescription (fun x => x.Model.Carrier = LRA.NumberSystems.Integers.Mendelson.Carrier positiveData) ⋯).1

Logical form (Lean):

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
theorem MendelsonRationalSystemUsesMendelsonIntegers
    (positiveData : Mendelson.PositiveNaturalPairData)
    (rationalData : IntegerAndPositiveNaturalData)
    (usesMendelsonIntegers :
      rationalData.integer_system = MendelsonIntegerNumberSystem positiveData) :
    (MendelsonRationalSystem positiveData rationalData
      usesMendelsonIntegers).IntegerSystem =
        MendelsonIntegerNumberSystem positiveData := by

  sorry

end MendelsonIntegers

end LRA.NumberSystems.RationalNumbers.Examples
