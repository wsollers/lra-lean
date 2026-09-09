import LRA.NumberSystems.Integers.Interface.Definition

namespace LRA.NumberSystems.Integers.Examples

open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.Integers

/--
`mathlib_every_element_is_integer_numeral` TODO

Predicate logic:

  ∀ (value : LRA.NumberSystems.Integers.Interface.ModelTheory.mathlibIntegerModel.Carrier), Exists fun integer => LRA.NumberSystems.Integers.IntegerNumeral LRA.NumberSystems.Integers.Interface.ModelTheory.mathlibIntegerModel integer = value

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun integer => Int.rec (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.NaturalNumeral LRA.NumberSystems.Integers.Interface.ModelTheory.mathlibIntegerModel n) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Interface.ModelTheory.mathlibIntegerModel.4.neg (LRA.NumberSystems.Integers.NaturalNumeral LRA.NumberSystems.Integers.Interface.ModelTheory.mathlibIntegerModel ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1))) a) a) integer = value

Logical form (Lean):

```lean
theorem mathlib_every_element_is_integer_numeral :
    ∀ value : mathlibIntegerModel.Carrier,
      ∃ integer : Int, IntegerNumeral mathlibIntegerModel integer = value
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
    ∀ value : mathlibIntegerModel.Carrier,
      ∃ integer : Int, IntegerNumeral mathlibIntegerModel integer = value := by
  sorry
/--
`MathlibIntegerNumberSystem` TODO

Predicate logic:

  noncomputable def MathlibIntegerNumberSystem : IntegerNumberSystem where
    Model := mathlibIntegerModel
    EveryElementIsIntegerNumeral := mathlib_every_element_is_integer_numeral

Predicate logic (unfolded):

  noncomputable def MathlibIntegerNumberSystem : IntegerNumberSystem where
    Model := mathlibIntegerModel
    EveryElementIsIntegerNumeral := mathlib_every_element_is_integer_numeral (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def MathlibIntegerNumberSystem : IntegerNumberSystem where
  Model := mathlibIntegerModel
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
  Model := mathlibIntegerModel
  EveryElementIsIntegerNumeral := mathlib_every_element_is_integer_numeral

end LRA.NumberSystems.Integers.Examples
