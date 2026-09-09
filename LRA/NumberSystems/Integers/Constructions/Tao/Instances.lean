
import LRA.NumberSystems.Integers.Constructions.Tao.Behavior
import LRA.NumberSystems.Integers.Interface.Definition

namespace LRA.NumberSystems.Integers.Tao

/--
`TaoIntegersFormDiscretelyOrderedIntegralDomain` TODO

Predicate logic:

  ∀ (wholeData : LRA.NumberSystems.Integers.Tao.WholeNumberArithmeticForTaoFormalDifferences), Exists fun model => model.Carrier = LRA.NumberSystems.Integers.Tao.Carrier wholeData

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    wholeData : WholeNumberArithmeticForTaoFormalDifferences
  Prove
    Exists fun model => model.1 = Quot (LRA.NumberSystems.Integers.Tao.setoid wholeData).1

Logical form (Lean):

```lean
theorem TaoIntegersFormDiscretelyOrderedIntegralDomain
    (wholeData : WholeNumberArithmeticForTaoFormalDifferences) :
    ∃ model : LRA.NumberSystems.Integers.Interface.ModelTheory.IntegerModel,
      model.Carrier = Carrier wholeData
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
theorem TaoIntegersFormDiscretelyOrderedIntegralDomain
    (wholeData : WholeNumberArithmeticForTaoFormalDifferences) :
    ∃ model : LRA.NumberSystems.Integers.Interface.ModelTheory.IntegerModel,
      model.Carrier = Carrier wholeData := by
  sorry
/--
`TaoRealizesIntegerNumberSystem` TODO

Predicate logic:

  ∀ (wholeData : LRA.NumberSystems.Integers.Tao.WholeNumberArithmeticForTaoFormalDifferences), Exists fun integerSystem => integerSystem.Model.Carrier = LRA.NumberSystems.Integers.Tao.Carrier wholeData

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    wholeData : WholeNumberArithmeticForTaoFormalDifferences
  Prove
    Exists fun integerSystem => integerSystem.Model.1 = Quot (LRA.NumberSystems.Integers.Tao.setoid wholeData).1

Logical form (Lean):

```lean
theorem TaoRealizesIntegerNumberSystem
    (wholeData : WholeNumberArithmeticForTaoFormalDifferences) :
    ∃ integerSystem : LRA.NumberSystems.Integers.IntegerNumberSystem,
      integerSystem.Model.Carrier = Carrier wholeData
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
theorem TaoRealizesIntegerNumberSystem
    (wholeData : WholeNumberArithmeticForTaoFormalDifferences) :
    ∃ integerSystem : LRA.NumberSystems.Integers.IntegerNumberSystem,
      integerSystem.Model.Carrier = Carrier wholeData := by
  sorry
end LRA.NumberSystems.Integers.Tao
