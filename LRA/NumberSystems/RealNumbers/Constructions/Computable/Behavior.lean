-- LRA/NumberSystems/RealNumbers/Constructions/Computable/Behavior.lean
-- Closure of computable reals under arithmetic, and their countability.

import LRA.NumberSystems.RealNumbers.Constructions.Computable.Laws

namespace LRA.NumberSystems.RealNumbers.Computable
open LRA.NumberSystems.Models

/--
**[Theorem — computable_reals_closed_under_arithmetic]**

Mathematical statement (Lean): `theorem computable_reals_closed_under_arithmetic (rational_model : RationalModel) : ∃ add mul neg : ComputableReal rational_model → ComputableReal rational_model → ComputableReal rational_model, ∀ first second, equivalent (add first second).approximation (a...`.

*Proof status:* proof pending


Logical form:

```lean
theorem computable_reals_closed_under_arithmetic
    (rational_model : RationalModel) :
    ∃ add mul neg :
      ComputableReal rational_model → ComputableReal rational_model → ComputableReal rational_model,
      ∀ first second, equivalent (add first second).approximation (add first second).approximation ∧
        equivalent (mul first second).approximation (mul first second).approximation ∧
        equivalent (neg first second).approximation (neg first second).approximation
```
-/
theorem computable_reals_closed_under_arithmetic
    (rational_model : RationalModel) :
    ∃ add mul neg :
      ComputableReal rational_model → ComputableReal rational_model → ComputableReal rational_model,
      ∀ first second, equivalent (add first second).approximation (add first second).approximation ∧
        equivalent (mul first second).approximation (mul first second).approximation ∧
        equivalent (neg first second).approximation (neg first second).approximation := by
  sorry

/--
**[Theorem — computable_reals_are_countable]**

Mathematical statement (Lean): `theorem computable_reals_are_countable (rational_model : RationalModel) : ∃ enumerate : Nat → ComputableReal rational_model, ∀ value : ComputableReal rational_model, ∃ index : Nat, enumerate index = value`.

*Proof status:* proof pending


Logical form:

```lean
theorem computable_reals_are_countable
    (rational_model : RationalModel) :
    ∃ enumerate : Nat → ComputableReal rational_model,
      ∀ value : ComputableReal rational_model,
        ∃ index : Nat, enumerate index = value
```
-/
theorem computable_reals_are_countable
    (rational_model : RationalModel) :
    ∃ enumerate : Nat → ComputableReal rational_model,
      ∀ value : ComputableReal rational_model,
        ∃ index : Nat, enumerate index = value := by
  sorry

end LRA.NumberSystems.RealNumbers.Computable
