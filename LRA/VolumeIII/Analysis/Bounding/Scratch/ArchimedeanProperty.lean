/-
SCRATCH FILE — not wired into the lra-lean project.
Imports only this pass's own scratch files and Mathlib — nothing from the
real `LRA.VolumeIII.Analysis.Bounding.Bounds`, so this can be freely
refactored or discarded without touching the working project.
Source: volume-iii/book-analysis-i/bounding/notes/completeness/notes-archimedean-property.tex
Fifth file of `completeness` (installment 5 of 6 for this chapter). Its
duplicated-Failure-modes structural bug (8 pairs) was already fixed in the
earlier corpus-wide batch pass; this is the first full math-content audit.

All 8 theorem-environment statements (the boxed def/lemma/theorem/corollary
content itself) are CORRECT — standard Archimedean-property package:
n·x > y for positive x,y; reciprocal form 1/n < ε; 1/n -> 0; existence of
an integer/floor part for x >= 0; the general (all-x) floor; the ceiling;
"some natural number exceeds x"; "a unit-length closed interval [x,x+1]
always contains an integer". Formalized below unchanged from what the
theorem/lemma/corollary boxes actually state.

The opening (unlabeled) `[Interpretation]` remark's own inline proof
sketch of why the Archimedean property needs completeness (not just
ordered-field axioms) is correct: if N were bounded above, LUB gives a
sup `alpha`; `alpha - 1` isn't an upper bound, so some `n > alpha - 1`,
giving `n+1 > alpha`, contradiction. Standard, correct.

HOWEVER: unlike every prior file in this chapter, the block-enhancement
remarks here (Standard quantified statement / Predicate reading / Negated
quantified statement / Negation predicate reading / Failure modes) go
wrong in several places — not the duplicated-block structural bug already
fixed, but genuine CONTENT mismatches between what each node's remarks
formalize and what its own theorem-environment box actually states.
**All reported here, none auto-fixed** (content authoring, not mechanical
dedup, so out of scope for this pass's auto-fix exception):

  1. `thm:archimedean-property` — theorem box states the two-variable
     form `x,y > 0 -> exists n, n x > y`; every remark instead formalizes
     only the `x = 1` special case `forall x exists n, n > x`. True and
     implied by the theorem, but not literally what the theorem states —
     mild narrowing, consistent with a pattern seen elsewhere in this
     chapter.

  2. `cor:archimedean-reciprocal-form` (`0 < 1/n < eps`) — remarks match
     correctly. Clean.

  3. `cor:archimedean-reciprocal` ("The Reciprocal Sequence Converges to
     Zero", i.e. `lim 1/n = 0`) — **SERIOUS MISMATCH**. Every single
     remark block (Standard/Predicate/Negated/Negation-predicate/Failure
     modes/Interpretation) instead restates the GENERAL Archimedean
     property `x > 0 -> exists n, n x > y` — content that belongs to node
     1, not to a statement about `1/n -> 0` at all. Nothing about epsilon,
     N, or the limit appears anywhere in this node's remark suite. Looks
     like the same "wrong content carried over from a neighboring node"
     corruption pattern seen earlier in this chapter (e.g. the
     `notes-suprema-infima.tex` leftover-formula bug), just not caught by
     the mechanical duplicate-block scanner because the two copies aren't
     textually identical to a *different* node's remarks in a way that
     scan was built to detect. Needs new remark content authored from
     scratch (an epsilon-N unpacking of `lim 1/n = 0`), not a mechanical
     fix.

  4. `lem:integer-part-lemma` (`x >= 0 -> exists! n in N_0, n <= x < n+1`)
     — remarks state the fully GENERAL floor fact `forall x in R, exists
     m in Z, m <= x < m+1` (no `x >= 0` restriction, `Z` not `N_0`) —
     that's actually what node 5 (`lem:archimedean-integer-part-lemma`)
     proves. Foreshadowing/scope mismatch, not wrong math on its own.

  5. `lem:archimedean-integer-part-lemma` (`forall x, exists! m in Z, m
     <= x < m+1`) — remarks instead use a shifted variable convention
     (`m - 1 <= x < m`, i.e. describing `floor(x) + 1`, per the remark's
     own Predicate-reading line `m = floor(x) + 1`), not the theorem's
     own `m` (`= floor(x)`, satisfying `m <= x < m+1`). Self-consistent
     internally but doesn't match its own theorem box.

  6. `lem:integer-ceiling-lemma` (`forall x, exists! m in Z, m-1 < x <=
     m`) — **GENUINE MATH ERROR**, not just scope mismatch: the remarks
     state `x < m <= x+1` instead. These are NOT equivalent — they
     disagree exactly when `x` is an integer: the theorem's own `m-1 < x
     <= m` correctly gives `m = x` (ceiling of an integer is itself), but
     the remark's `x < m <= x+1` forces `m = x+1` (since `x < m` is now
     *strict*, excluding `m = x`), which is the WRONG ceiling value for
     integer inputs. Worth a real correction pass later; not fixed here.

  7. `lem:integer-above-lemma` (`forall x, exists n in N, x < n`) —
     remarks use `exists m in Z` instead of `exists n in N`. Mild
     (true either way since N is itself unbounded above, but not a
     literal match to what the lemma states).

  8. `lem:unit-length-interval-contains-integer` (`forall x, exists m in
     Z, x <= m <= x+1`) — remarks instead state a DIFFERENT, though also
     true, related fact: "any open interval of length > 1 contains an
     integer" (`beta - alpha > 1 -> exists m in Z, alpha < m < beta`).
     Valid on its own, but not what this lemma's box states — content
     mismatch, likely misplaced from a nearby (currently absent) lemma
     about long intervals rather than the specific unit interval
     `[x, x+1]`.

Formalized below strictly from the theorem-environment statements
themselves (the correct content), not from the flawed remark boxes.
`Nat`-vs-`Int` domains kept exactly as each theorem box states them (`N`
for nodes 1/2/3/4/7, `N_0` modeled as `n : N` directly with `0 <= (n:R)`
implicit, `Z` for nodes 5/6/8).
-/

import Mathlib.Algebra.Order.Archimedean.Basic
import Mathlib.Algebra.Order.Field.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Order.Filter.AtTopBot.Basic

namespace LRA
namespace VolumeIII
namespace Analysis
namespace Bounding
namespace Scratch

/-- `thm:archimedean-property`. -/
theorem archimedean_property {x y : ℝ} (hx : x > 0) (hy : y > 0) :
    ∃ n : ℕ, (n : ℝ) * x > y := by
  sorry

/-- `cor:archimedean-reciprocal-form`. -/
theorem archimedean_reciprocal_form {ε : ℝ} (hε : ε > 0) :
    ∃ n : ℕ, 0 < 1 / (n : ℝ) ∧ 1 / (n : ℝ) < ε := by
  sorry

/-- `cor:archimedean-reciprocal`. The actual corollary content (`lim 1/n =
0`) — NOT the mismatched remark-box content described in the audit note
above, which accidentally restates `archimedean_property` instead. -/
theorem archimedean_reciprocal :
    Filter.Tendsto (fun n : ℕ => 1 / (n : ℝ)) Filter.atTop (nhds 0) := by
  sorry

/-- `lem:integer-part-lemma`. Restricted to `x ≥ 0`, target `n : ℕ`
(playing the role of `N_0`), matching the theorem box exactly — NOT the
broader all-of-`ℝ`/`ℤ` remark-box version described in the audit note. -/
theorem integer_part_lemma {x : ℝ} (hx : x ≥ 0) :
    ∃! n : ℕ, (n : ℝ) ≤ x ∧ x < n + 1 := by
  sorry

/-- `lem:archimedean-integer-part-lemma`. The genuinely general (all `x`)
floor lemma, `m ≤ x < m + 1` with `m` itself (not the remark box's shifted
`floor x + 1` convention — see audit note above). -/
theorem archimedean_integer_part_lemma (x : ℝ) :
    ∃! m : ℤ, (m : ℝ) ≤ x ∧ x < m + 1 := by
  sorry

/-- `lem:integer-ceiling-lemma`. The theorem box's own correct convention
`m - 1 < x ≤ m` — NOT the remark box's `x < m ≤ x + 1`, which is a
genuine math error (wrong at integer `x`; see audit note above). -/
theorem integer_ceiling_lemma (x : ℝ) :
    ∃! m : ℤ, (m : ℝ) - 1 < x ∧ x ≤ m := by
  sorry

/-- `lem:integer-above-lemma`. -/
theorem integer_above_lemma (x : ℝ) : ∃ n : ℕ, x < n := by
  sorry

/-- `lem:unit-length-interval-contains-integer`. The theorem box's own
`x ≤ m ≤ x + 1` — NOT the remark box's "open interval of length > 1"
statement, which is a different (also true) fact; see audit note above. -/
theorem unit_length_interval_contains_integer (x : ℝ) :
    ∃ m : ℤ, x ≤ (m : ℝ) ∧ (m : ℝ) ≤ x + 1 := by
  sorry

end Scratch
end Bounding
end Analysis
end VolumeIII
end LRA
