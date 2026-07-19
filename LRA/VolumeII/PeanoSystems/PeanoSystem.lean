-- LRA/VolumeII/PeanoSystems/PeanoSystem.lean
--
-- Abstract Peano systems — foundational structure for Volume II.
-- No Mathlib.

import LRA.Foundation

namespace LRA
namespace VolumeII
namespace PeanoSystems



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
  carrier : LRA.Foundation.LRACarrier
  one : carrier
  successor : LRA.Foundation.UnaryOperation carrier
  one_not_successor :
    ∀ element : carrier,
      successor element ≠ one
  successor_injective :
    ∀ first_element second_element : carrier,
      successor first_element = successor second_element →
      first_element = second_element
  induction :
    ∀ predicate : LRA.Foundation.LRASet carrier,
      predicate one →
      (∀ element : carrier,
        predicate element →
        predicate (successor element)) →
      ∀ element : carrier,
        predicate element



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
    (subset : LRA.Foundation.LRASet ps.carrier) : Prop :=
  ∀ element : ps.carrier,
    LRA.Foundation.LRASet.member element subset →
    LRA.Foundation.LRASet.member (ps.successor element) subset

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
    (subset : LRA.Foundation.LRASet ps.carrier) : Prop :=
  LRA.Foundation.LRASet.member ps.one subset ∧
    successor_closed_subset ps subset



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

end PeanoSystems
end VolumeII
end LRA
-- ============================================================
