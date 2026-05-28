-- LRA/VolumeII/PeanoSystems/PeanoSystem.lean
--
-- Abstract Peano systems — foundational structure for Volume II.
-- No Mathlib. No imports.

namespace Peano

-- ============================================================
-- Peano systems
-- ============================================================

/--
**[Definition — Peano System]**

A Peano system is a type equipped with a distinguished element,
a successor operation, and the Peano axioms.

*Dependencies:* none

*Sources:*
  Landau, *Foundations of Analysis*, §1
  Feferman, *The Number Systems*, §3.1

*Notes cross-ref:* §1.1 [#definition-peano-system](../notes/section_1_1_main.md#definition-peano-system)
-/
structure PeanoSystem where
  carrier : Type
  one : carrier
  successor : carrier → carrier
  one_not_successor :
    ∀ element : carrier,
      successor element ≠ one
  successor_injective :
    ∀ first_element second_element : carrier,
      successor first_element = successor second_element →
      first_element = second_element
  induction :
    ∀ predicate : carrier → Prop,
      predicate one →
      (∀ element : carrier,
        predicate element →
        predicate (successor element)) →
      ∀ element : carrier,
        predicate element

-- ============================================================
-- Induction
-- ============================================================

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
    (predicate : ps.carrier → Prop)
    (base_case : predicate ps.one)
    (successor_step :
      ∀ element : ps.carrier,
        predicate element →
        predicate (ps.successor element)) :
    ∀ element : ps.carrier,
      predicate element :=
  ps.induction predicate base_case successor_step

-- ============================================================
-- Successor-closed subsets
-- ============================================================

/--
**[Definition — Successor-Closed Subset of a Peano System]**

A subset of a Peano system is successor-closed exactly when
membership is preserved by the successor operation.

*Dependencies:* `PeanoSystem`

*Sources:*
  Landau, *Foundations of Analysis*, §1

*Notes cross-ref:* §1.1 [#definition-successor-closed-subset-of-a-peano-system](../notes/section_1_1_main.md#definition-successor-closed-subset-of-a-peano-system)
-/
def successor_closed_subset
    (ps : PeanoSystem)
    (subset : ps.carrier → Prop) : Prop :=
  ∀ element : ps.carrier,
    subset element →
    subset (ps.successor element)

/--
**[Definition — Inductive Subset of a Peano System]**

A subset is inductive exactly when it contains the distinguished
element and is successor-closed.

*Dependencies:* `successor_closed_subset`

*Sources:*
  Landau, *Foundations of Analysis*, §1

*Notes cross-ref:* §1.1 [#definition-inductive-subset-of-a-peano-system](../notes/section_1_1_main.md#definition-inductive-subset-of-a-peano-system)
-/
def inductive_subset
    (ps : PeanoSystem)
    (subset : ps.carrier → Prop) : Prop :=
  subset ps.one ∧
    successor_closed_subset ps subset

/--
**[Theorem — Subset-Based Induction Principle for a Peano System]**

Every inductive subset contains every element of the carrier.

*Dependencies:* `inductive_subset`, `induction_principle`

*Sources:*
  Landau, *Foundations of Analysis*, §1

*Notes cross-ref:* §1.1 [#theorem-subset-based-induction-principle-for-a-peano-system](../notes/section_1_1_main.md#theorem-subset-based-induction-principle-for-a-peano-system)
-/
theorem inductive_subset_eq_all
    (ps : PeanoSystem)
    (subset : ps.carrier → Prop)
    (subset_is_inductive :
      inductive_subset ps subset) :
    ∀ element : ps.carrier,
      subset element :=
  induction_principle
    ps
    subset
    subset_is_inductive.left
    subset_is_inductive.right

-- ============================================================
-- Predecessors
-- ============================================================

/--
**[Definition — Predecessor in a Peano System]**

An element is a predecessor of another element exactly when its
successor equals that element.

*Dependencies:* `PeanoSystem`

*Sources:*
  Landau, *Foundations of Analysis*, §1

*Notes cross-ref:* §1.1 [#definition-predecessor-in-a-peano-system](../notes/section_1_1_main.md#definition-predecessor-in-a-peano-system)
-/
def is_predecessor
    (ps : PeanoSystem)
    (predecessor element : ps.carrier) : Prop :=
  ps.successor predecessor = element

end Peano
-- ============================================================
