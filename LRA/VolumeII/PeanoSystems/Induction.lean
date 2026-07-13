-- LRA/VolumeII/PeanoSystems/Induction.lean
--
-- Induction principles for abstract Peano systems.
-- No Mathlib.

import LRA.VolumeII.PeanoSystems.PeanoSystem

namespace Peano

/--
**[Theorem — Induction Principle for a Peano System]**

If a predicate holds at the distinguished element and is preserved
by successor, then it holds for every element of the Peano system.

*Dependencies:* `PeanoSystem.induction`

*Sources:*
  Landau, *Foundations of Analysis*, §1
  Feferman, *The Number Systems*, §3.1

*Notes cross-ref:* §1.1 [#theorem-induction-principle-for-a-peano-system](../notes/section_1_1_main.md#theorem-induction-principle-for-a-peano-system)
-/
theorem induction_principle
    (ps : PeanoSystem)
    (predicate : LRA.Foundation.LRASet ps.carrier)
    (base_case : predicate ps.one)
    (successor_step :
      ∀ element : ps.carrier,
        predicate element →
        predicate (ps.successor element)) :
    ∀ element : ps.carrier,
      predicate element :=
  ps.induction predicate base_case successor_step

/--
**[Theorem — Subset-Based Induction Principle for a Peano System]**

Every inductive subset of a Peano system contains every element
of the carrier.

*Dependencies:* `inductive_subset`, `induction_principle`

*Sources:*
  Landau, *Foundations of Analysis*, §1
  Feferman, *The Number Systems*, §3.1

*Notes cross-ref:* §1.1 [#theorem-subset-based-induction-principle-for-a-peano-system](../notes/section_1_1_main.md#theorem-subset-based-induction-principle-for-a-peano-system)
-/
theorem subset_based_induction_principle
    (ps : PeanoSystem)
    (subset : LRA.Foundation.LRASet ps.carrier)
    (subset_is_inductive : inductive_subset ps subset) :
    ∀ element : ps.carrier,
      subset element :=
  induction_principle
    ps
    subset
    subset_is_inductive.left
    subset_is_inductive.right


end Peano
