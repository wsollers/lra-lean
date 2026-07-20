-- LRA/VolumeII/NaturalNumbers/Utilities.lean
--
-- Iterator examples showing W can be any type.
--
-- Sources:
--   Feferman, The Number Systems, §3.4 (iterator theorem, arbitrary W)
--   Section 1.2.1 of the LRA notes (arity examples)
--
-- Architecture:
--   Each definition here uses iter with a non-numeric target type W.
--   is_odd and is_even use W = Bool.
--   string_rep uses W = List Char (strings).
--   This file has no dependency on Multiplication or Order.
--
-- Running table of contents:
--
--   Definition | is_odd              | parity via Bool iterator
--   Definition | is_even             | parity via Bool iterator
--   Theorem    | is_odd_base         | is_odd ps one = true
--   Theorem    | is_odd_step         | is_odd ps (S n) = !is_odd ps n
--   Theorem    | is_even_base        | is_even ps one = false
--   Theorem    | is_even_step        | is_even ps (S n) = !is_even ps n
--   Theorem    | is_even_complement  | is_even ps n = !is_odd ps n   (stub)
--   Definition | string_rep          | string repetition via List Char iterator
--   Theorem    | string_rep_base     | string_rep ps s one = s
--   Theorem    | string_rep_step     | string_rep ps s (S n) = string_rep ps s n ++ s

import LRA.VolumeII.PeanoSystems.Recursion

namespace LRA
namespace VolumeII
namespace NaturalNumbers

open LRA.VolumeII.PeanoSystems


-- ============================================================
-- Parity: W = Bool
-- ============================================================

/--
**[Definition — isOdd on a Peano System]**

`is_odd ps n` is `true` when `n` is odd and `false` when `n` is even.

This is the iterator with W = Bool, c = true, g = Bool.not.
It demonstrates that the iterator theorem works for any set W,
not only for the carrier of a Peano system.

*Iterator configuration:*
  W = Bool
  c = true
  g = Bool.not

*Dependencies:* `iter`

*Sources:*
  Feferman, *The Number Systems*, §3.4 (arbitrary W)

*Notes cross-ref:* §1.2 [def:is-odd-on-a-peano-system](../notes/section_1_2_main.md)
-/
noncomputable def is_odd (ps : PeanoSystem) (n : ps.carrier) : Bool :=
  iter ps Bool true Bool.not n

/--
**[Definition — isEven on a Peano System]**

`is_even ps n` is `true` when `n` is even and `false` when `n` is odd.

*Iterator configuration:*
  W = Bool
  c = false
  g = Bool.not

*Dependencies:* `iter`

*Sources:*
  Feferman, *The Number Systems*, §3.4 (arbitrary W)

*Notes cross-ref:* §1.2 [def:is-even-on-a-peano-system](../notes/section_1_2_main.md)
-/
noncomputable def is_even (ps : PeanoSystem) (n : ps.carrier) : Bool :=
  iter ps Bool false Bool.not n

/--
**[Theorem — isOdd Base Clause]**

`is_odd ps one = true`

*Dependencies:* `is_odd`, `iter_base`
*Notes cross-ref:* §1.2 [thm:is-odd-base-clause](../notes/section_1_2_main.md)
-/
theorem is_odd_base (ps : PeanoSystem) :
    is_odd ps ps.one = true :=
  iter_base ps Bool true Bool.not

/--
**[Theorem — isOdd Successor Clause]**

`is_odd ps (S n) = !is_odd ps n`

*Dependencies:* `is_odd`, `iter_step`
*Notes cross-ref:* §1.2 [thm:is-odd-successor-clause](../notes/section_1_2_main.md)
-/
theorem is_odd_step (ps : PeanoSystem) (n : ps.carrier) :
    is_odd ps (ps.successor n) = Bool.not (is_odd ps n) :=
  iter_step ps Bool true Bool.not n

/--
**[Theorem — isEven Base Clause]**

`is_even ps one = false`

*Dependencies:* `is_even`, `iter_base`
*Notes cross-ref:* §1.2 [thm:is-even-base-clause](../notes/section_1_2_main.md)
-/
theorem is_even_base (ps : PeanoSystem) :
    is_even ps ps.one = false :=
  iter_base ps Bool false Bool.not

/--
**[Theorem — isEven Successor Clause]**

`is_even ps (S n) = !is_even ps n`

*Dependencies:* `is_even`, `iter_step`
*Notes cross-ref:* §1.2 [thm:is-even-successor-clause](../notes/section_1_2_main.md)
-/
theorem is_even_step (ps : PeanoSystem) (n : ps.carrier) :
    is_even ps (ps.successor n) = Bool.not (is_even ps n) :=
  iter_step ps Bool false Bool.not n

/--
**[Theorem — isEven Is the Complement of isOdd]**

`is_even ps n = !is_odd ps n` for all n.

This is the first algebraic identity in the Utilities layer:
parity functions are Boolean complements of each other.

*Dependencies:* `is_even_base`, `is_even_step`, `is_odd_base`,
`is_odd_step`, `induction_principle`

*Notes cross-ref:* §1.2 [thm:is-even-complement](../notes/section_1_2_main.md)
-/
theorem is_even_complement (ps : PeanoSystem) (n : ps.carrier) :
    is_even ps n = Bool.not (is_odd ps n) := by
  sorry

-- ============================================================
-- String repetition: W = List Char
-- ============================================================

/--
**[Definition — String Repetition on a Peano System]**

`string_rep ps s n` is the string `s` repeated `n` times.

This example uses W = List Char (a string as a list of characters),
demonstrating that the iterator theorem works for completely
non-arithmetic target types.

*Iterator configuration:*
  W = List Char
  c = s
  g = fun prev => prev ++ s

*Dependencies:* `iter`

*Sources:*
  Feferman, *The Number Systems*, §3.4 (arbitrary W)
  LRA notes, §1.2.1 (non-arithmetic iterator example)

*Notes cross-ref:* §1.2 [def:string-repetition](../notes/section_1_2_main.md)
-/
noncomputable def string_rep
    (ps : PeanoSystem)
    (s : List Char)
    (n : ps.carrier) : List Char :=
  iter ps (List Char) s (fun prev => prev ++ s) n

/--
**[Theorem — String Repetition Base Clause]**

`string_rep ps s one = s`

*Dependencies:* `string_rep`, `iter_base`
*Notes cross-ref:* §1.2 [thm:string-rep-base-clause](../notes/section_1_2_main.md)
-/
theorem string_rep_base (ps : PeanoSystem) (s : List Char) :
    string_rep ps s ps.one = s :=
  iter_base ps (List Char) s (fun prev => prev ++ s)

/--
**[Theorem — String Repetition Successor Clause]**

`string_rep ps s (S n) = string_rep ps s n ++ s`

*Dependencies:* `string_rep`, `iter_step`
*Notes cross-ref:* §1.2 [thm:string-rep-successor-clause](../notes/section_1_2_main.md)
-/
theorem string_rep_step
    (ps : PeanoSystem) (s : List Char) (n : ps.carrier) :
    string_rep ps s (ps.successor n) = string_rep ps s n ++ s :=
  iter_step ps (List Char) s (fun prev => prev ++ s) n

end NaturalNumbers
end VolumeII
end LRA
