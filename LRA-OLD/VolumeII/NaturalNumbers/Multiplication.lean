-- LRA/VolumeII/NaturalNumbers/Multiplication.lean
--
-- Multiplication on an abstract Peano system.
--
-- Sources:
--   Landau,    Foundations of Analysis, §3
--   Feferman,  The Number Systems, §3.4 (Theorem 3.4 applied)
--   Mendelson, Number Systems, §2.4
--
-- Architecture:
--   mul is defined by one application of iter.
--   The step rule (fun prev => plus ps prev left_input) uses
--   addition, so Addition.lean must be imported.
--
-- Running table of contents:
--
--   Definition | mul             | Multiplication on a Peano system
--   Theorem    | mul_base        | mul ps x one = x
--   Theorem    | mul_step        | mul ps x (S y) = plus ps (mul ps x y) x
--   Theorem    | mul_unique      | uniqueness via iterator_function_unique
--   Theorem    | mul_one_left    | mul ps one x = x                (stub)
--   Theorem    | mul_associative | (x·y)·z = x·(y·z)              (stub)
--   Theorem    | mul_distrib_add | x·(y+z) = x·y + x·z            (stub)
--   Theorem    | mul_commutative | x·y = y·x                      (stub)

import LRA.VolumeII.NaturalNumbers.Addition

namespace LRA
namespace VolumeII
namespace NaturalNumbers

open LRA.VolumeII.PeanoSystems


/--
**[Definition — Multiplication on a Peano System]**

For each fixed left input, multiplication is the iterator-generated
function with initial value equal to the left input and step rule
equal to adding the left input.

*Iterator configuration:*
  W = ps.carrier
  c = left_input
  g = fun prev => plus ps prev left_input

*Dependencies:* `iter`, `plus`

*Sources:*
  Landau,    *Foundations of Analysis*, §3
  Feferman,  *The Number Systems*, §3.4
  Mendelson, *Number Systems*, §2.4

*Notes cross-ref:* §1.3 [def:multiplication-on-a-peano-system](../notes/section_1_3_main.md)
-/
noncomputable def mul
    (ps : PeanoSystem) :
    LRA.Foundation.BinaryOperation ps.carrier :=
  fun left_input right_input =>
  iter
    ps ps.carrier
    left_input
    (fun prev => plus ps prev left_input)
    right_input

/--
**[Theorem — Multiplication Base Clause]**

`mul ps x one = x`

*Dependencies:* `mul`, `iter_base`

*Sources:* Landau, *Foundations of Analysis*, §3

*Notes cross-ref:* §1.3 [thm:multiplication-base-clause](../notes/section_1_3_main.md)
-/
theorem mul_base
    (ps : PeanoSystem)
    (left_input : ps.carrier) :
    mul ps left_input ps.one = left_input :=
  iter_base ps ps.carrier left_input
    (fun prev => plus ps prev left_input)

/--
**[Theorem — Multiplication Successor Clause]**

`mul ps x (S y) = plus ps (mul ps x y) x`

*Dependencies:* `mul`, `iter_step`

*Sources:* Landau, *Foundations of Analysis*, §3

*Notes cross-ref:* §1.3 [thm:multiplication-successor-clause](../notes/section_1_3_main.md)
-/
theorem mul_step
    (ps : PeanoSystem)
    (left_input right_input : ps.carrier) :
    mul ps left_input (ps.successor right_input) =
      plus ps (mul ps left_input right_input) left_input :=
  iter_step ps ps.carrier left_input
    (fun prev => plus ps prev left_input)
    right_input

/--
**[Theorem — Multiplication Is Unique]**

Any two functions satisfying the multiplication clauses agree everywhere.

*Dependencies:* `iterator_function_unique`

*Sources:*
  Thurston, *The Number System*, Ch.A Theorem 3
  Landau,   *Foundations of Analysis*, §3 Theorem 11

*Notes cross-ref:* §1.3 [thm:multiplication-is-unique](../notes/section_1_3_main.md)
-/
theorem mul_unique
    (ps : PeanoSystem)
    (left_input : ps.carrier)
    (f g : LRA.Foundation.UnaryOperation ps.carrier)
    (hf : satisfies_iterator_clauses
            ps ps.carrier left_input
            (fun prev => plus ps prev left_input) f)
    (hg : satisfies_iterator_clauses
            ps ps.carrier left_input
            (fun prev => plus ps prev left_input) g) :
    ∀ n : ps.carrier, f n = g n :=
  iterator_function_unique
    ps ps.carrier left_input
    (fun prev => plus ps prev left_input) f g hf hg

-- Algebraic laws — stubs, proved in subsequent session

/--
**[Theorem — One Is a Left Identity for Multiplication]**

`mul ps one x = x`

*Dependencies:* `mul_base`, `mul_step`, `plus_base`, `induction_principle`
*Sources:* Landau, *Foundations of Analysis*, §3 Theorem 12
*Notes cross-ref:* §1.3 [thm:mul-one-left](../notes/section_1_3_main.md)
-/
theorem mul_one_left
    (ps : PeanoSystem) (right_input : ps.carrier) :
    mul ps ps.one right_input = right_input := by
  sorry

/--
**[Theorem — Multiplication Is Associative]**

`mul ps (mul ps x y) z = mul ps x (mul ps y z)`

*Dependencies:* `mul_base`, `mul_step`, `induction_principle`
*Sources:* Landau, *Foundations of Analysis*, §3 Theorem 13
*Notes cross-ref:* §1.3 [thm:multiplication-is-associative](../notes/section_1_3_main.md)
-/
theorem mul_associative
    (ps : PeanoSystem) (x y z : ps.carrier) :
    mul ps (mul ps x y) z = mul ps x (mul ps y z) := by
  sorry

/--
**[Theorem — Multiplication Distributes Over Addition]**

`mul ps x (plus ps y z) = plus ps (mul ps x y) (mul ps x z)`

*Dependencies:* `mul_base`, `mul_step`, `plus_base`, `plus_step`,
`induction_principle`
*Sources:* Landau, *Foundations of Analysis*, §3 Theorem 14
*Notes cross-ref:* §1.3 [thm:mul-distrib-add](../notes/section_1_3_main.md)
-/
theorem mul_distrib_add
    (ps : PeanoSystem) (x y z : ps.carrier) :
    mul ps x (plus ps y z) =
      plus ps (mul ps x y) (mul ps x z) := by
  sorry

/--
**[Theorem — Multiplication Is Commutative]**

`mul ps x y = mul ps y x`

*Dependencies:* `mul_base`, `mul_step`, `mul_distrib_add`,
`mul_one_left`, `induction_principle`
*Sources:* Landau, *Foundations of Analysis*, §3 Theorem 15
*Notes cross-ref:* §1.3 [thm:multiplication-is-commutative](../notes/section_1_3_main.md)
-/
theorem mul_commutative
    (ps : PeanoSystem) (x y : ps.carrier) :
    mul ps x y = mul ps y x := by
  sorry

end NaturalNumbers
end VolumeII
end LRA
