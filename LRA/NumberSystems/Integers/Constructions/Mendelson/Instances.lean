
import LRA.NumberSystems.Integers.Constructions.Mendelson.Behavior
import LRA.NumberSystems.Integers.Interface.Definition
import LRA.NumberSystems.PeanoSystem.Definition

namespace LRA.NumberSystems.Integers.Mendelson

/--
`PositiveClassesRecoverNaturalNumberModel` TODO

Predicate logic:

  (∀ positiveData ∈ PositiveNaturalPairData), ∃ Element ∈ Type SetObject ∈ Type _ ∈ Membership Element SetObject _ ∈ LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject, Nonempty Element

Predicate logic (unfolded):

  ∀ (a : LRA.NumberSystems.Integers.Mendelson.PositiveNaturalPairData), Exists fun Element => Exists fun SetObject => Exists fun x => Exists fun x => Nonempty Element

Logical form (Lean):

```lean
theorem PositiveClassesRecoverNaturalNumberModel
    (positiveData : PositiveNaturalPairData) :
    ∃ (Element : Type) (SetObject : Type)
      (_ : Membership Element SetObject)
      (_ : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject),
      Nonempty Element
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem PositiveClassesRecoverNaturalNumberModel
    (positiveData : PositiveNaturalPairData) :
    ∃ (Element : Type) (SetObject : Type)
      (_ : Membership Element SetObject)
      (_ : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject),
      Nonempty Element := by
  sorry
/--
`MendelsonIntegersFormDiscretelyOrderedIntegralDomain` TODO

Predicate logic:

  (∀ positiveData ∈ PositiveNaturalPairData), ∃ model ∈ LRA.NumberSystems.Interface.ModelTheory.DiscretelyOrderedIntegralDomainModel, model.Carrier = Carrier positiveData

Predicate logic (unfolded):

  ∀ (positiveData : LRA.NumberSystems.Integers.Mendelson.PositiveNaturalPairData), Exists fun model => model.1 = Quot (LRA.NumberSystems.Integers.Mendelson.setoid positiveData).1

Logical form (Lean):

```lean
theorem MendelsonIntegersFormDiscretelyOrderedIntegralDomain
    (positiveData : PositiveNaturalPairData) :
    ∃ model : LRA.NumberSystems.Interface.ModelTheory.DiscretelyOrderedIntegralDomainModel,
      model.Carrier = Carrier positiveData
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem MendelsonIntegersFormDiscretelyOrderedIntegralDomain
    (positiveData : PositiveNaturalPairData) :
    ∃ model : LRA.NumberSystems.Integers.Interface.ModelTheory.IntegerModel,
      model.Carrier = Carrier positiveData := by
  sorry
/--
`MendelsonRealizesIntegerNumberSystem` TODO

Predicate logic:

  (∀ positiveData ∈ PositiveNaturalPairData), ∃ integerSystem ∈ LRA.NumberSystems.Integers.IntegerNumberSystem, integerSystem.Model.Carrier = Carrier positiveData

Predicate logic (unfolded):

  ∀ (positiveData : LRA.NumberSystems.Integers.Mendelson.PositiveNaturalPairData), Exists fun integerSystem => integerSystem.Model.1 = Quot (LRA.NumberSystems.Integers.Mendelson.setoid positiveData).1

Logical form (Lean):

```lean
theorem MendelsonRealizesIntegerNumberSystem
    (positiveData : PositiveNaturalPairData) :
    ∃ integerSystem : LRA.NumberSystems.Integers.IntegerNumberSystem,
      integerSystem.Model.Carrier = Carrier positiveData
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem MendelsonRealizesIntegerNumberSystem
    (positiveData : PositiveNaturalPairData) :
    ∃ integerSystem : LRA.NumberSystems.Integers.IntegerNumberSystem,
      integerSystem.Model.Carrier = Carrier positiveData := by
  sorry
end LRA.NumberSystems.Integers.Mendelson
