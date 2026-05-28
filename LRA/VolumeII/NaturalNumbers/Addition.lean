-- LRA/VolumeII/NaturalNumbers/Addition.lean
--
-- Addition on an abstract Peano system.
--
-- Sources:
--   Landau, Foundations of Analysis, §2
--   Feferman, The Number Systems, §3.4
--   Mendelson, Number Systems, §2.3
--
-- Architecture:
--   Addition is defined by one application of the abstract iterator
--   function from PeanoSystems/Recursion.lean.
--
-- Running table of contents:
--
--   Definition  | plus       | Addition on a Peano system
--   Theorem     | plus_base  | plus ps x one = successor x

import LRA.VolumeII.PeanoSystems.Recursion

namespace Peano


/--
**[Definition — Addition on a Peano System]**

For each fixed left input, addition is the iterator-generated
function with initial value equal to the successor of the left input
and step rule equal to the successor operation.

*Iterator configuration:*
  W = ps.carrier
  c = ps.successor left_input
  g = ps.successor

*Dependencies:* `iter`

*Sources:*
  Landau, *Foundations of Analysis*, §2
  Feferman, *The Number Systems*, §3.4
  Mendelson, *Number Systems*, §2.3

*Notes cross-ref:* §1.2 [#definition-addition-on-a-peano-system](../notes/section_1_2_main.md#definition-addition-on-a-peano-system)
-/
noncomputable def plus
    (ps : PeanoSystem)
    (left_input right_input : ps.carrier) :
    ps.carrier :=
  iter
    ps
    ps.carrier
    (ps.successor left_input)
    ps.successor
    right_input

/--
**[Theorem — Addition Base Clause]**

Adding the distinguished element on the right gives the successor
of the left input.

*Dependencies:* `plus`, `iter_base`

*Sources:*
  Landau, *Foundations of Analysis*, §2
  Feferman, *The Number Systems*, §3.4
  Mendelson, *Number Systems*, §2.3

*Notes cross-ref:* §1.2 [#theorem-addition-base-clause](../notes/section_1_2_main.md#theorem-addition-base-clause)
-/
theorem plus_base
    (ps : PeanoSystem)
    (left_input : ps.carrier) :
    plus ps left_input ps.one =
      ps.successor left_input :=
  iter_base
    ps
    ps.carrier
    (ps.successor left_input)
    ps.successor


/--
**[Theorem — Addition Is Associative]**

Addition on a Peano system is associative.

*Dependencies:* `plus`, `plus_base`, `plus_step`

*Sources:*
  Landau, *Foundations of Analysis*, §2 Theorem 5

*Notes cross-ref:* §1.2 [#theorem-addition-is-associative](../notes/section_1_2_main.md#theorem-addition-is-associative)
-/
theorem addition_is_associative
    (ps : PeanoSystem)
    (left_input middle_input right_input : ps.carrier) :
    plus ps (plus ps left_input middle_input) right_input =
      plus ps left_input (plus ps middle_input right_input) := by

  -- Landau fixes the first two inputs and inducts on the right input.
  -- Predicate:
  --   P(z) := (x + y) + z = x + (y + z)
  apply induction_principle ps

  · -- Base case:
    -- Show `(x + y) + one = x + (y + one)`.
    -- Use the addition base clause on both sides.
    sorry

  · -- Successor step:
    -- Assume the associativity statement holds for `right_input`.
    -- Show it holds for `successor right_input`.
    intro current_right_input induction_hypothesis

    -- Goal:
    --   (x + y) + S(current_right_input)
    --     =
    --   x + (y + S(current_right_input))
    --
    -- Use `plus_step` to rewrite both successor additions,
    -- then use the induction hypothesis.
    sorry



end Peano
