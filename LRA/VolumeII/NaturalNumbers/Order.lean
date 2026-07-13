-- LRA/VolumeII/NaturalNumbers/Order.lean
--
-- Order on an abstract Peano system.
--
-- Sources:
--   Landau,    Foundations of Analysis, §4–§5
--   Feferman,  The Number Systems, §3.6
--   Mendelson, Number Systems, §2.5
--
-- Architecture:
--   Less-than is defined via addition:
--     lt ps x y  iff  ∃ k, y = plus ps x k
--   Less-than-or-equal follows:
--     le ps x y  iff  lt ps x y ∨ x = y
--   Well-ordering: every non-empty subset has a minimum.
--   All laws after lt/le are stubs, proved in subsequent session.
--
-- Running table of contents:
--
--   Definition | lt              | x < y iff ∃ k, y = x + k
--   Definition | le              | x ≤ y iff x < y ∨ x = y
--   Theorem    | lt_irrefl       | ¬ x < x                        (stub)
--   Theorem    | lt_trans        | x < y → y < z → x < z         (stub)
--   Theorem    | lt_asymm        | x < y → ¬ y < x               (stub)
--   Theorem    | lt_trichotomy   | x < y ∨ x = y ∨ y < x         (stub)
--   Theorem    | lt_succ         | x < S x                        (stub)
--   Theorem    | le_antisymm     | x ≤ y → y ≤ x → x = y         (stub)
--   Theorem    | well_ordering   | non-empty subset has minimum    (stub)

import LRA.VolumeII.NaturalNumbers.Addition

namespace Peano

-- ============================================================
-- Definitions
-- ============================================================

/--
**[Definition — Less-Than on a Peano System]**

`lt ps x y` holds exactly when there exists an element `k` such
that `y = plus ps x k`. The witness `k` is the "gap" between `x`
and `y`.

*Dependencies:* `plus`

*Sources:*
  Landau,    *Foundations of Analysis*, §4
  Feferman,  *The Number Systems*, §3.6
  Mendelson, *Number Systems*, §2.5

*Notes cross-ref:* §1.4 [def:lt-on-a-peano-system](../notes/section_1_4_main.md)
-/
def lt
    (ps : PeanoSystem) :
    LRA.Foundation.Endorelation ps.carrier :=
  fun x y =>
  ∃ k : ps.carrier, y = plus ps x k

/--
**[Definition — Less-Than-Or-Equal on a Peano System]**

`le ps x y` holds exactly when `x < y` or `x = y`.

*Dependencies:* `lt`

*Sources:*
  Landau,    *Foundations of Analysis*, §4
  Mendelson, *Number Systems*, §2.5

*Notes cross-ref:* §1.4 [def:le-on-a-peano-system](../notes/section_1_4_main.md)
-/
def le
    (ps : PeanoSystem) :
    LRA.Foundation.Endorelation ps.carrier :=
  fun x y =>
  lt ps x y ∨ x = y

-- ============================================================
-- Order laws — stubs
-- ============================================================

/--
**[Theorem — Less-Than Is Irreflexive]**

`¬ lt ps x x`

*Dependencies:* `lt`, `add_ne_self`
*Sources:* Landau, *Foundations of Analysis*, §4 Theorem 16
*Notes cross-ref:* §1.4 [thm:lt-irrefl](../notes/section_1_4_main.md)
-/
theorem lt_irrefl
    (ps : PeanoSystem) (x : ps.carrier) :
    ¬ lt ps x x := by
  sorry

/--
**[Theorem — Less-Than Is Transitive]**

`lt ps x y → lt ps y z → lt ps x z`

*Dependencies:* `lt`, `addition_is_associative`
*Sources:* Landau, *Foundations of Analysis*, §4 Theorem 17
*Notes cross-ref:* §1.4 [thm:lt-trans](../notes/section_1_4_main.md)
-/
theorem lt_trans
    (ps : PeanoSystem) (x y z : ps.carrier) :
    lt ps x y → lt ps y z → lt ps x z := by
  sorry

/--
**[Theorem — Less-Than Is Asymmetric]**

`lt ps x y → ¬ lt ps y x`

*Dependencies:* `lt_irrefl`, `lt_trans`
*Sources:* Landau, *Foundations of Analysis*, §4 Theorem 18
*Notes cross-ref:* §1.4 [thm:lt-asymm](../notes/section_1_4_main.md)
-/
theorem lt_asymm
    (ps : PeanoSystem) (x y : ps.carrier) :
    lt ps x y → ¬ lt ps y x := by
  sorry

/--
**[Theorem — Trichotomy]**

For all `x y`, exactly one of `x < y`, `x = y`, `y < x` holds.

*Dependencies:* `lt`, `induction_principle`
*Sources:* Landau, *Foundations of Analysis*, §4 Theorem 19
*Notes cross-ref:* §1.4 [thm:lt-trichotomy](../notes/section_1_4_main.md)
-/
theorem lt_trichotomy
    (ps : PeanoSystem) (x y : ps.carrier) :
    lt ps x y ∨ x = y ∨ lt ps y x := by
  sorry

/--
**[Theorem — Every Element Is Less Than Its Successor]**

`lt ps x (ps.successor x)`

*Dependencies:* `lt`, `plus_base`
*Sources:* Landau, *Foundations of Analysis*, §4
*Notes cross-ref:* §1.4 [thm:lt-succ](../notes/section_1_4_main.md)
-/
theorem lt_succ
    (ps : PeanoSystem) (x : ps.carrier) :
    lt ps x (ps.successor x) := by
  sorry

/--
**[Theorem — Less-Than-Or-Equal Is Antisymmetric]**

`le ps x y → le ps y x → x = y`

*Dependencies:* `le`, `lt_asymm`
*Sources:* Landau, *Foundations of Analysis*, §4
*Notes cross-ref:* §1.4 [thm:le-antisymm](../notes/section_1_4_main.md)
-/
theorem le_antisymm
    (ps : PeanoSystem) (x y : ps.carrier) :
    le ps x y → le ps y x → x = y := by
  sorry

-- ============================================================
-- Well-ordering principle
-- ============================================================

/--
**[Definition — Minimum Element of a Subset]**

`m` is a minimum element of `P` with respect to `lt` exactly when
`m` is in `P` and no element of `P` is less than `m`.

*Dependencies:* `lt`

*Notes cross-ref:* §1.4 [def:minimum-element](../notes/section_1_4_main.md)
-/
def is_minimum
    (ps : PeanoSystem)
    (P : LRA.Foundation.LRASet ps.carrier)
    (m : ps.carrier) : Prop :=
  LRA.Foundation.LRASet.member m P ∧
    ∀ k : ps.carrier, LRA.Foundation.LRASet.member k P → ¬ lt ps k m

/--
**[Theorem — Well-Ordering Principle]**

Every non-empty subset of a Peano system has a minimum element
with respect to `lt`.

This is the well-ordering principle for the Peano natural numbers.
It is the key property that distinguishes N from Z and Q.

*Dependencies:* `lt`, `is_minimum`, `lt_trichotomy`, `induction_principle`

*Sources:*
  Landau,   *Foundations of Analysis*, §5
  Feferman, *The Number Systems*, §3.6

*Notes cross-ref:* §1.4 [thm:well-ordering-principle](../notes/section_1_4_main.md)
-/
theorem well_ordering
    (ps : PeanoSystem)
    (P : LRA.Foundation.LRASet ps.carrier)
    (P_nonempty : LRA.Foundation.LRASet.nonempty P) :
    ∃ minimum : ps.carrier, is_minimum ps P minimum := by
  sorry

end Peano
