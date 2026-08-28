import LRA.NumberSystems.Integers.Interface.Definition
import LRA.NumberSystems.Interface.ModelTheory.Model

namespace LRA.NumberSystems.Integers.Examples

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.Integers

/--
`mathlib_every_element_is_integer_numeral` TODO

Predicate logic:

  ∀ value : mathlibDiscretelyOrderedIntegralDomainModel.Carrier, ∃ integer ∈ Int, IntegerNumeral mathlibDiscretelyOrderedIntegralDomainModel integer = value

Predicate logic (unfolded):

  ∀ (value : LRA.NumberSystems.Interface.ModelTheory.mathlibDiscretelyOrderedIntegralDomainModel.1), Exists fun integer => Int.rec (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.NaturalNumeral LRA.NumberSystems.Interface.ModelTheory.mathlibDiscretelyOrderedIntegralDomainModel n) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Interface.ModelTheory.mathlibDiscretelyOrderedIntegralDomainModel.negInst.1 (LRA.NumberSystems.Integers.NaturalNumeral LRA.NumberSystems.Interface.ModelTheory.mathlibDiscretelyOrderedIntegralDomainModel (instHAdd.1 n (instOfNatNat 1).1))) a) a) integer = value

Logical form (Lean):

```lean
theorem mathlib_every_element_is_integer_numeral :
    ∀ value : mathlibDiscretelyOrderedIntegralDomainModel.Carrier,
      ∃ integer : Int, IntegerNumeral mathlibDiscretelyOrderedIntegralDomainModel integer = value
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
theorem mathlib_every_element_is_integer_numeral :
    ∀ value : mathlibDiscretelyOrderedIntegralDomainModel.Carrier,
      ∃ integer : Int, IntegerNumeral mathlibDiscretelyOrderedIntegralDomainModel integer = value := by
  sorry

/--
`MathlibIntegerNumberSystem` TODO

Predicate logic:

  noncomputable def MathlibIntegerNumberSystem : IntegerNumberSystem where
  Model := mathlibDiscretelyOrderedIntegralDomainModel
  EveryElementIsIntegerNumeral := mathlib_every_element_is_integer_numeral

Predicate logic (unfolded):

  noncomputable def MathlibIntegerNumberSystem : IntegerNumberSystem where
  Model := mathlibDiscretelyOrderedIntegralDomainModel
  EveryElementIsIntegerNumeral := mathlib_every_element_is_integer_numeral (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def MathlibIntegerNumberSystem : IntegerNumberSystem where
  Model := mathlibDiscretelyOrderedIntegralDomainModel
  EveryElementIsIntegerNumeral := mathlib_every_element_is_integer_numeral
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
noncomputable def MathlibIntegerNumberSystem : IntegerNumberSystem where
  Model := mathlibDiscretelyOrderedIntegralDomainModel
  EveryElementIsIntegerNumeral := mathlib_every_element_is_integer_numeral

end LRA.NumberSystems.Integers.Examples
